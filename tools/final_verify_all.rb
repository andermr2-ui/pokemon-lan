require_relative "rpg_stubs"
data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
key = "You put the {1} in\\nyour Bag's <icon=bagPocket{2}>\\c[1]{3}\\c[0] pocket."
puts "clave existe: #{data[24].key?(key)}"
puts "valor: #{data[24][key].inspect}"
puts "total categorias: #{data.size}"

obtained_key = "You obtained a \\c[1]{1}\\c[0]!"
puts "obtained: #{data[24][obtained_key].inspect}"

data2 = File.open("Data/messages_game.dat", "rb") { |f| Marshal.load(f) }
puts "messages_game tiene la misma clave: #{data2[24][key].inspect}"
