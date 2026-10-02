data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
[5,6].each do |idx|
  h = data[idx]
  pending = h.count { |k,v| k == v }
  puts "cat#{idx}: #{h.size} total, #{pending} pendientes"
end
