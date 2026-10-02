data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
h = data[10]
h.select { |k,v| k == v }.each_key { |k| puts k }
