data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
real_key = "You put the {1} in\nyour Bag's <icon=bagPocket{2}>\c[1]{3}\c[0] pocket."
puts "existe: #{data[24].key?(real_key)}"
puts "valor: #{data[24][real_key].inspect}"
