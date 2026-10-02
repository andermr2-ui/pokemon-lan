data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
data[7].each { |k,v| puts "#{k.inspect} => #{v.inspect}" if k.downcase.include?("ball") }
