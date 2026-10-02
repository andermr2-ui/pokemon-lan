data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
puts data[24]["{1} Pokémon"].inspect
