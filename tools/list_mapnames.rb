data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
hash = data[21]
hash.each_key { |k| puts k }
