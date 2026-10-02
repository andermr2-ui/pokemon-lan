key_literal = "You put the {1} in\nyour Bag's <icon=bagPocket{2}>\c[1]{3}\c[0] pocket."
key_esc = eval(%q{"You put the {1} in\nyour Bag's <icon=bagPocket{2}>\c[1]{3}\c[0] pocket."})
puts "literal bytesize=#{key_literal.bytesize}  esc bytesize=#{key_esc.bytesize}"
puts "iguales?: #{key_literal == key_esc}"
data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
puts "literal => #{data[24][key_literal].inspect}"
puts "esc     => #{data[24][key_esc].inspect}"
