data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
puts "categorias: #{data.size}"
puts data[2]["Boss"]
puts data[2]["Coin Entity"]
puts data[2]["Tera"]
