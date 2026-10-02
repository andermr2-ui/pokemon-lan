# encoding: UTF-8
# El usuario pidio acortar el dialogo de la Enfermera Joy en TODOS los
# Centros Pokemon: dejar solo "Would you like to rest your Pokemon?" (+Si/No),
# las 2 lineas de Pokerus, y "We've restored your Pokemon to full health.".
# El resto de lineas de relleno (bienvenida, "dejame llevarlos", "gracias
# por esperar", "esperamos verte de nuevo" x2) se ELIMINAN por completo del
# evento (no solo se vacia el texto, se borra el comando entero de la lista
# para no dejar cuadros de dialogo vacios).
require_relative "rpg_stubs"

TO_REMOVE = [
  "\\rHello, and welcome to the Pokémon Center.",
  "\\rHola, bienvenido al Centro Pokémon.",
  "\\rOK, I'll take your Pokémon for a few seconds.",
  "\\rDe acuerdo, me llevaré a tus Pokémon unos segundos.",
  "\\rThank you for waiting.",
  "\\rGracias por esperar.",
  "\\rWe hope to see you again!",
  "\\r¡Esperamos volver a verte pronto!",
].freeze

maps = Dir.glob("Data/Map[0-9]*.rxdata").select { |f| f !~ /\.bak/ }

total_files = 0
total_removed = 0
maps.each do |path|
  map = File.open(path, "rb") { |f| Marshal.load(f) }
  removed_here = 0
  map.events.each_value do |event|
    event.pages.each do |page|
      list = page.list
      # Recorrer de atras para adelante para poder borrar sin romper indices.
      i = list.length - 1
      while i >= 0
        cmd = list[i]
        if cmd.code == 101
          t = cmd.parameters[0]
          if t
            t2 = t.dup.force_encoding("UTF-8")
            j = i + 1
            while list[j] && list[j].code == 401
              j += 1
            end
            if TO_REMOVE.include?(t2)
              list.slice!(i...j)
              removed_here += 1
            end
          end
        end
        i -= 1
      end
    end
  end
  next if removed_here == 0
  File.open(path, "wb") { |f| Marshal.dump(map, f) }
  total_files += 1
  total_removed += removed_here
  puts "#{path}: #{removed_here} bloques eliminados"
end

puts "TOTAL: #{total_files} mapas modificados, #{total_removed} bloques eliminados"
