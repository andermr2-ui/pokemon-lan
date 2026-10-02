data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
data[24].each { |k,v| puts "#{k.inspect} => #{v.inspect}" if v.to_s.include?("Recibiste") }
