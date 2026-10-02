# Version Ruby de convertir_rioplatense.py, para los mapas que la libreria
# Python rubymarshal no puede leer (referencias circulares que su parser no
# resuelve). Usa Marshal.load nativo + tools/rpg_stubs.rb, que si los lee
# bien. Mismo diccionario CONVERSIONS, mas 2 patrones que faltaban ("che"
# como muletilla, "quedate" -> "quedate" con tilde neutra) encontrados via
# reporte del usuario (Map232, "Eh, te ves agotado, che. Toma, quedate con
# esto.").
#
# Uso:
#   ruby tools/convertir_rioplatense_broken_maps.rb [--dry-run]

require "./tools/rpg_stubs"

DRY_RUN = ARGV.include?("--dry-run")

ROCKET_MAPS = [13,47,100,103,113,114,119,121,125,130,145,148,153,155,177,
              187,193,194,202,203,205,206,207,208,213,215,219,222,223,224,
              299,322].to_set rescue [13,47,100,103,113,114,119,121,125,130,145,148,153,155,177,
              187,193,194,202,203,205,206,207,208,213,215,219,222,223,224,
              299,322]

BROKEN_MAPS = [82,171,180,195,196,197,209,213,215,220,230,232,243,244,256,314,316,358,359]

DIALOGUE_CODES = [101, 401, 405]

CONVERSIONS = [
  [/\btenés\b/, 'tienes'], [/\bTenés\b/, 'Tienes'], [/\bTENÉS\b/, 'TIENES'],
  [/\bpodés\b/, 'puedes'], [/\bPodés\b/, 'Puedes'], [/\bPODÉS\b/, 'PUEDES'],
  [/\bquerés\b/, 'quieres'], [/\bQuerés\b/, 'Quieres'],
  [/\bvenís\b/, 'vienes'], [/\bVenís\b/, 'Vienes'],
  [/\bsabés\b/, 'sabes'], [/\bSabés\b/, 'Sabes'],
  [/\bhacés\b/, 'haces'], [/\bHacés\b/, 'Haces'],
  [/\bsalís\b/, 'sales'], [/\bSalís\b/, 'Sales'],
  [/\bvolvé\b/, 'vuelve'], [/\bVolvé\b/, 'Vuelve'],
  [/\bmirá\b/, 'mira'], [/\bMirá\b/, 'Mira'],
  [/\bescuchá\b/, 'escucha'], [/\bEscuchá\b/, 'Escucha'],
  [/\bhablá\b/, 'habla'], [/\bHablá\b/, 'Habla'],
  [/\btomá\b/, 'toma'], [/\bTomá\b/, 'Toma'],
  [/\bseguí\b/, 'sigue'], [/\bSeguí\b/, 'Sigue'],
  [/\bsos\b/, 'eres'], [/\bSos\b/, 'Eres'], [/\bSOS\b/, 'ERES'],
  [/\bacá\b/, 'aquí'], [/\bAcá\b/, 'Aquí'], [/\bACÁ\b/, 'AQUÍ'],
  [/\bquedate\b/, 'quédate'], [/\bQuedate\b/, 'Quédate'],
  [/\bparecés\b/, 'pareces'], [/\bParecés\b/, 'Pareces'],
  [/\bsonás\b/, 'suenas'], [/\bSonás\b/, 'Suenas'],
  [/\besperá\b/, 'espera'], [/\bEsperá\b/, 'Espera'],
  [/\bnecesitás\b/, 'necesitas'], [/\bNecesitás\b/, 'Necesitas'],
  [/\bdisfrutá\b/, 'disfruta'], [/\bDisfrutá\b/, 'Disfruta'],
  [/\bandá\b/, 'anda'], [/\bAndá\b/, 'Anda'],
  [/\brecordá\b/, 'recuerda'], [/\bRecordá\b/, 'Recuerda'],
  [/\bapurate\b/, 'apúrate'], [/\bApurate\b/, 'Apúrate'],
  [/\bretá\b/, 'reta'], [/\bRetá\b/, 'Reta'],
  [/\bretame\b/, 'rétame'], [/\bRetame\b/, 'Rétame'],
  # "vos" es mas dependiente de contexto (tu/ti/contigo); aca solo lo
  # mapeamos al caso mas comun (sujeto) - no hay tantos casos en estos 17
  # mapas como para justificar el analisis de contexto completo del script
  # Python, se revisa a mano si aparece.
]

def convert_text(text)
  # Los codigos de control al INICIO del texto ("\b" negrita, "\c[1]"
  # color, etc.) quedan pegados sin espacio a la primera palabra real
  # ("\bPodés..."). Como son letras, el limite de palabra "\b" de los
  # patrones de abajo NO dispara ahi (para el regex, "b" y "P" son dos
  # letras seguidas, sin limite entre ellas) y la conversion se saltea en
  # silencio (encontrado via "\bPodés..." en Map196, que nunca se convertia
  # pese a estar "podés" en el diccionario desde el principio). Se saca el
  # prefijo de control antes de convertir y se vuelve a pegar despues.
  prefix = ''
  if text =~ /\A(?:\\[a-zA-Z](?:\[[^\]]*\])?)+/
    prefix = $~[0]
    text = text[prefix.length..-1]
  end
  out = text
  CONVERSIONS.each { |pattern, repl| out = out.gsub(pattern, repl) }
  # "che" (muletilla sin equivalente neutro, encontrada via Map232/Map316):
  # se elimina. Si quedaba pegada justo despues de un ¡/¿ de apertura
  # ("¡Che, mira esto!"), hay que capitalizar lo que sigue - PERO solo ahi,
  # nunca en un ¡/¿ que ya estaba bien en medio de una oracion (ese es el
  # bug que tuvo la primera version de este script: capitalizaba CUALQUIER
  # ¡palabra/¿palabra en todo el texto, rompiendo frases que ya estaban
  # bien, ej. "todo, ¡pero los aplastaste!" no debe tocarse).
  out = out.gsub(/([¡¿])\s*[Cc]he,?\s*(\p{Ll})/) { $1 + $2.upcase }
  out = out.gsub(/,?\s*\bche\b,?/i, '')
  # limpiar dobles espacios/espacios sueltos que puede dejar la eliminacion
  out = out.gsub(/[ \t]{2,}/, ' ').gsub(/\s+([.!?])/, '\1').gsub(/([¡¿])\s+/, '\1')
  prefix + out
end

total_maps = 0
total_changes = 0

BROKEN_MAPS.each do |num|
  next if ROCKET_MAPS.include?(num)
  path = "Data/Map#{num.to_s.rjust(3,'0')}.rxdata"
  next unless File.exist?(path)

  begin
    data = Marshal.load(File.binread(path))
  rescue => e
    puts "Map#{num}: ERROR al leer (#{e.class}: #{e.message}) - omitido"
    next
  end

  changes = []
  data.events.each do |eid, ev|
    ev.pages.each do |page|
      page.list.each do |c|
        next unless DIALOGUE_CODES.include?(c.code)
        params = c.parameters
        next unless params
        params.each_with_index do |param, i|
          next unless param.is_a?(String)
          converted = convert_text(param)
          if converted != param
            changes << [param, converted]
            params[i] = converted unless DRY_RUN
          end
        end
      end
    end
  end

  next if changes.empty?
  total_maps += 1
  total_changes += changes.size
  puts "Map#{num}: #{changes.size} cambio(s)"
  changes.each { |old, new| puts "  #{old.inspect} -> #{new.inspect}" }

  unless DRY_RUN
    File.open(path, "wb") { |f| Marshal.dump(data, f) }
  end
end

label = DRY_RUN ? "DRY-RUN" : "GUARDADO"
puts "\n[#{label}] #{total_maps} mapas, #{total_changes} cambios totales"
