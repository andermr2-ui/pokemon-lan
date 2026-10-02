data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
puts "categorias: #{data.size}"
key = "You obtained a \c[1]{1}\c[0]!"
puts data[24][key].inspect
puts data[24]["You got away safely!"].inspect
key2 = eval(%q{"You found \c[1]{1}\c[0]!"})
puts data[24][key2].inspect
