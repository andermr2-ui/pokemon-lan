# Vuelca las traducciones de translations/mapNNN.txt de vuelta al
# Data/MapNNN.rxdata correspondiente.
#
# Dos tipos de bloque:
#
# TEXTO [evento|pagina|indice_inicial|cantidad]: ocupaba 1 comando 101 + N
#   continuaciones 401. Se colapsa a UN SOLO comando 101 con el texto completo
#   en español, eliminando los 401 sobrantes (evita adivinar como repartir el
#   texto y evita dejar 401 vacios con render raro).
#
# OPCIONES [evento|pagina|indice|OPCIONES]: comando 102 (Mostrar Opciones),
#   texto separado por "|". Se reemplaza el array de opciones directo, y de
#   paso se sincronizan los comandos 402 (etiqueta de cada rama "when Opcion")
#   que esten en la MISMA pagina, usando su indice numerico de rama
#   (parameters[0]) para saber a que opcion traducida corresponden -- no se
#   comparan strings, se usa el indice, que es robusto.
#
# Uso: ruby reinsert_map_text.rb <numero de mapa, ej 001>

require_relative "rpg_stubs"

map_num = ARGV[0] or abort "Uso: ruby reinsert_map_text.rb <numero de mapa, ej 001>"
map_path = "Data/Map#{map_num}.rxdata"
trans_path = "translations/map#{map_num}.txt"

abort "No existe #{map_path}" unless File.exist?(map_path)
abort "No existe #{trans_path}" unless File.exist?(trans_path)

# --- Parsear el archivo de traduccion ---
blocks = []
lines = File.readlines(trans_path, encoding: "UTF-8")
i = 0
while i < lines.size
  line = lines[i].chomp
  if line =~ /\A\[(\d+)\|(\d+)\|(\d+)\|(\d+|OPCIONES)\]\z/
    event_id, page_num, start_idx, tag = $1.to_i, $2.to_i, $3.to_i, $4
    original_line = lines[i + 1].chomp
    trans_line = lines[i + 2].chomp
    original_text = original_line.sub(/\AORIGINAL: /, "")
    trans_text = trans_line.sub(/\ATRADUCCION: ?/, "")
    blocks << {
      type: (tag == "OPCIONES" ? :choices : :text),
      event_id: event_id, page_index: page_num - 1, start_idx: start_idx,
      count: (tag == "OPCIONES" ? nil : tag.to_i),
      original: original_text, translated: trans_text
    }
    # No asumimos un stride fijo de 4 lineas (bracket+original+traduccion+blanco):
    # avanzamos solo lo que consumimos (bracket+original+traduccion) y dejamos
    # que la proxima vuelta del while se coma cualquier cantidad de lineas en
    # blanco (o ausencia de ellas) con el "i += 1" del else. Esto evita que un
    # archivo con un separador faltante (ej. por un append automatico) desalinee
    # el parseo de todo lo que viene despues.
    i += 3
  else
    i += 1
  end
end

skipped_empty = blocks.select { |b| b[:translated].strip.empty? }
usable = blocks.reject { |b| b[:translated].strip.empty? }

puts "Bloques leidos: #{blocks.size}"
puts "Sin traducir todavia (se dejan en ingles): #{skipped_empty.size}"

# --- Cargar el mapa ---
map = File.open(map_path, "rb") { |f| Marshal.load(f) }

applied = 0
errors = []

usable.group_by { |b| [b[:event_id], b[:page_index]] }.each do |(event_id, page_index), page_blocks|
  event = map.events[event_id]
  unless event
    errors << "Evento #{event_id} no existe en #{map_path}"
    next
  end
  page = event.pages[page_index]
  unless page
    errors << "Evento #{event_id} pagina #{page_index + 1} no existe"
    next
  end
  list = page.list

  # TEXTO y OPCIONES se procesan JUNTOS, de mayor a menor indice_inicial. Si
  # se procesaran por separado (todo el texto primero), colapsar un bloque de
  # texto que este ANTES de un bloque de opciones en la misma pagina corre el
  # indice grabado de ese bloque de opciones, y la aplicacion falla. Procesar
  # en un unico orden descendente evita el problema: cada remocion solo afecta
  # indices mayores, que ya fueron procesados.
  page_blocks.sort_by { |b| -b[:start_idx] }.each do |b|
    start_idx = b[:start_idx]

    if b[:type] == :text
      count = b[:count]
      cmd = list[start_idx]
      if cmd.nil? || cmd.code != 101
        errors << "[#{event_id}|#{page_index + 1}|#{start_idx}|#{count}]: se esperaba code=101 y no coincide (el mapa cambio desde la extraccion?)"
        next
      end
      tail_ok = (1...count).all? { |k| list[start_idx + k] && list[start_idx + k].code == 401 }
      unless tail_ok
        errors << "[#{event_id}|#{page_index + 1}|#{start_idx}|#{count}]: continuaciones 401 no coinciden"
        next
      end

      cmd.parameters = [b[:translated]]
      list.slice!(start_idx + 1, count - 1) if count > 1
      applied += 1
    else # :choices
      cmd = list[start_idx]
      if cmd.nil? || cmd.code != 102
        errors << "[#{event_id}|#{page_index + 1}|#{start_idx}|OPCIONES]: se esperaba code=102 y no coincide (el mapa cambio desde la extraccion?)"
        next
      end
      original_choices = b[:original].split("|")
      new_choices = b[:translated].split("|")
      if new_choices.size != original_choices.size
        errors << "[#{event_id}|#{page_index + 1}|#{start_idx}|OPCIONES]: la traduccion tiene #{new_choices.size} opciones, el original tenia #{original_choices.size} -- no se aplica"
        next
      end

      cmd.parameters[0] = new_choices

      # Sincronizar las ramas "when Opcion" (code 402) de esta misma pagina que
      # correspondan a este comando de opciones, usando el indice de rama
      # (parameters[0]) para saber que opcion traducida les toca.
      list.each do |c|
        next unless c.code == 402
        branch_idx = c.parameters[0]
        next unless branch_idx.is_a?(Integer) && branch_idx < new_choices.size
        if original_choices[branch_idx] && c.parameters[1] == original_choices[branch_idx]
          c.parameters[1] = new_choices[branch_idx]
        end
      end

      applied += 1
    end
  end
end

if errors.any?
  puts "ERRORES (no aplicados, revisar):"
  errors.each { |e| puts "  - #{e}" }
end

puts "Bloques aplicados: #{applied}"

if applied > 0
  File.open(map_path, "wb") { |f| f.write(Marshal.dump(map)) }
  puts "Guardado: #{map_path}"
else
  puts "Nada que guardar."
end
