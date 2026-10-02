data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
h = data[12]
puts "Total: #{h.size}"
h.each { |k,v| puts "#{k.inspect} => #{v.inspect}" }
