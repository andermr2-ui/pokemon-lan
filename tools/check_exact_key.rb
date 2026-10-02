# encoding: UTF-8
data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
target = eval(%q{"You put the {1} in\nyour Bag's <icon=bagPocket{2}>\c[1]{3}\c[0] pocket."})
found = data[24].key?(target)
puts "clave exacta existe: #{found}"
puts "valor: #{data[24][target].inspect}" if found
# tambien probar en messages_game.dat
data2 = File.open("Data/messages_game.dat", "rb") { |f| Marshal.load(f) }
puts "en messages_game.dat: #{data2[24].key?(target)}"
