data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
puts "categorias: #{data.size}"
puts data[7]["Exp. Share"].inspect
puts data[8]["Exp. Shares"].inspect
