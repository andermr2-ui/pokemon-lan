data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
puts "categorias: #{data.size}"
puts data[7]["Altarianite"]
puts data[8]["Altarianites"]
puts "cat7 total=#{data[7].size} cat8 total=#{data[8].size}"
