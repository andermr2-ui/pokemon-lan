# encoding: UTF-8
# Esta clave (a diferencia de "You obtained/found...") NUNCA existio en
# forma literal correcta -- solo existia una version con bytes ESC/newline
# reales (bug de un backslash simple de una sesion anterior), que nunca
# coincide con lo que el juego busca. Se agrega ahora como clave NUEVA con
# la forma literal correcta.
key = "You put the {1} in\\nyour Bag's <icon=bagPocket{2}>\\c[1]{3}\\c[0] pocket."
value = "Guardaste {1} en el\\nbolsillo <icon=bagPocket{2}>\\c[1]{3}\\c[0] de tu Mochila."

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  data[24][key] = value
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: clave agregada, total cat24=#{data[24].size}"
end
