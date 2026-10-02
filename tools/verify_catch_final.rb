data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
puts data[24]["Gotcha! {1} was caught!"].inspect
puts data[24]["{1} threw a {2}!"].inspect
puts data[24]["Gah! It was so close, too!"].inspect
