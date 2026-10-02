data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
descs = data[6]
pending = descs.select { |k,v| k == v }
pending.each_key { |k| puts k.inspect }
