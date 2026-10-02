data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
[8, 9].each do |idx|
  h = data[idx]
  pending = h.select { |k,v| k == v }
  puts "cat#{idx}: #{h.size} total, #{pending.size} pendientes"
end
