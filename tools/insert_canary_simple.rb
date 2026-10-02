# encoding: UTF-8
["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  data[24]["Would you like to rest your Pokémon?"] = "###CANARIO2### quieres curar"
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
end
puts "listo"
