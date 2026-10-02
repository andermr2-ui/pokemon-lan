data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
puts "categorias: #{data.size}"
puts data[2]["Toxic Monkey"]
puts data[2]["Mimicry"]
puts data[2]["Apple Hydra"]
data2 = File.open("Data/messages_game.dat", "rb") { |f| Marshal.load(f) }
puts "messages_game ok: #{data2[2]["Toxic Monkey"]}"
