data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
h = data[14]
pending = h.select { |k,v| k == v }.keys
puts "Total pendientes: #{pending.size}"
puts "--- muestra de 40 al azar ---"
pending.sample(40).each { |k| puts k }
