data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
key = "A spray-type medicine for treating wounds. It can be used to restore 20 HP to a single Pokémon."
puts data[9].key?(key)
puts data[9][key].inspect
data[9].each_key { |k| puts k.inspect if k.include?("restore 20 HP") }
