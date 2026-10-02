# encoding: UTF-8
DICT = {
  "{1} is about to send out {2}. Will you switch your Pokémon?" =>
    "{1} está a punto de sacar a {2}. ¿Quieres cambiar de Pokémon?",
}
["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  DICT.each { |k, v| data[24][k] = v }
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
end
puts "hecho"
