data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
names = data[10]
descs = data[11]
puts "=== NOMBRES (#{names.size}) ==="
names.each_key { |k| puts k }
puts "=== DESCRIPCIONES (#{descs.size}) ==="
descs.each_key { |k| puts k }
