data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
h = data[9]
pending = h.select { |k,v| k == v }
pending.each_key { |k| puts k }
