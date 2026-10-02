data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
puts "cat7 keys con Scroll:"
data[7].each_key { |k| puts "  #{k.inspect}" if k.include?("Scroll") }
puts "cat8 keys con Scroll:"
data[8].each_key { |k| puts "  #{k.inspect} => #{data[8][k].inspect}" if k.include?("Scroll") }
