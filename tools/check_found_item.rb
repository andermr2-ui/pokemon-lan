data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
target = eval(%q{"You found a \c[1]{1}\c[0]!"})
puts "existe: #{data[24].key?(target)}"
puts data[24][target].inspect if data[24].key?(target)
