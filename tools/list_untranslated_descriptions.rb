data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
data[9].each { |k,v| puts k if k == v }
