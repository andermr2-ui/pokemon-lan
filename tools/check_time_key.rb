data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
hash = data[24]
puts "'Time' => #{hash["Time"].inspect}"
puts "'Time:' => #{hash["Time:"].inspect}"
