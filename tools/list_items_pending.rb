data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
names = data[7]
plurals = data[8]
descs = data[9]
puts "ITEM_NAMES: #{names.size} total"
pending = names.select { |k,v| k == v }
puts "Pendientes: #{pending.size}"
pending.each_key { |k| puts "  #{k}" }
