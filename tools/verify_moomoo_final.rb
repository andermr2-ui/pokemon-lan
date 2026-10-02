data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
puts "categorias: #{data.size}"
puts data[28]["bottle of Moomoo Milk"].inspect
puts data[29]["bottles of Moomoo Milk"].inspect
puts data[7]["Fresh Water"].inspect
