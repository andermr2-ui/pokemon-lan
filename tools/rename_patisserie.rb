# encoding: UTF-8
["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  data[20]["Patisserie Alcremie"] = "Pastelería Crema"
  data[24]["Welcome to Patisserie Alcremie. How can I help you?"] = "Bienvenido a la Pastelería Crema. ¿En qué puedo ayudarte?"
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: actualizado"
end
