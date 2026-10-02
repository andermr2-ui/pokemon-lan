data = File.open("Data/messages_game.dat", "rb") { |f| Marshal.load(f) }
hash = data[24]
target = hash.keys.find { |k| k.start_with?("{1} is already holding {2} {3}.") }
raise "clave no encontrada!" unless target
hash[target] = target.sub("{1} is already holding {2} {3}.", "{1} ya lleva {2} {3}.")
File.open("Data/messages_game.dat", "wb") { |f| Marshal.dump(data, f) }
puts "aplicado: #{target.inspect} => #{hash[target].inspect}"
