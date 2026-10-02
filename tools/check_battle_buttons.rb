data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
h = data[24]
["Fight", "Bag", "Pokémon", "Run", "Cancel", "Cheer", "Call", "Launch"].each do |k|
  puts "#{k.inspect} => #{h[k].inspect}"
end
