data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
h = data[23]
pending = h.select { |k,v| k == v }.keys
puts "Total: #{pending.size}"
pending.each { |k| puts k }
