data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
names = data[5]
pending = names.select { |k,v| k == v }
puts "Pendientes: #{pending.size}"
pending.each_key { |k| puts k }
