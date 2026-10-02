require_relative "rpg_stubs"
data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
puts "categorias: #{data.size}"
puts data[20]["Patisserie Alcremie"]
puts data[24]["Welcome to Patisserie Alcremie. How can I help you?"]
m = Marshal.load(File.binread("Data/Map033.rxdata"))
puts "map033 eventos=#{m.events.size}"
