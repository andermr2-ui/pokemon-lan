# encoding: UTF-8
DICT = {
  "{1} threw a rock at the {2}!" => "¡{1} le lanzó una roca a {2}!",
}
["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  hash = data[24]
  DICT.each { |k, v| hash[k] = v }
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
end
puts "hecho"
