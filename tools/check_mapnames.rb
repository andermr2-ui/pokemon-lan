data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
hash = data[21]
puts "Total MAP_NAMES: #{hash.size}"
["Route 1", "Starter Valley"].each { |k| puts "#{k.inspect}: #{hash.key?(k) ? hash[k].inspect : 'NO EXISTE'}" }
