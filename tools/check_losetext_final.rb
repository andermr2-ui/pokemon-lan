data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
h = data[23]
puts "Total: #{h.size}, pendientes: #{h.count { |k,v| k == v }}"
