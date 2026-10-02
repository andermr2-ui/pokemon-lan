# encoding: UTF-8
["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  data[24]["Def"] = "Def"
  data[24]["Eva"] = "Eva"
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
end
puts "hecho"
