data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
h = data[10]
puts "Total keys: #{h.size}"
target = "Stench"
puts "key?(Stench): #{h.key?(target)}"
h.keys.first(5).each { |k| puts "#{k.inspect} enc=#{k.encoding} bytes=#{k.bytes.first(10).inspect}" }
puts "buscando algo con Stench:"
h.keys.select { |k| k.include?("tench") }.each { |k| puts k.inspect }
