data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
[14, 23, 13].each do |idx|
  h = data[idx]
  puts "cat#{idx}: #{h.size} entradas totales"
end
puts "Zeke/Xarly: #{data[14]["Zeke"].inspect}"
