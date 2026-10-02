data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
puts data[7]["Scroll of Waters"]
