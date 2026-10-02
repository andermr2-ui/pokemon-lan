data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
key1 = "You obtained a \c[1]{1}\c[0]!"
key2 = "You obtained an \c[1]{1}\c[0]!"
puts "a: #{data[24][key1].inspect}"
puts "an: #{data[24][key2].inspect}"
puts "Altarianite name: #{data[7]["Altarianite"].inspect}"
