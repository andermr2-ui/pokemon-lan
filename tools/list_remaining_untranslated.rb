data = File.open("Data/messages_game.dat", "rb") { |f| Marshal.load(f) }
hash = data[24]
hash.select { |k,v| k == v }.each_key { |k| puts k.inspect }
