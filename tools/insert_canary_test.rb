# encoding: UTF-8
target = eval(%q{"You put the {1} in\nyour Bag's <icon=bagPocket{2}>\c[1]{3}\c[0] pocket."})
canary = "###PRUEBA123### {1} guardado en {3} ###"
["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  raise "clave no encontrada en #{path}!" unless data[24].key?(target)
  data[24][target] = canary
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: marcador de prueba insertado"
end
