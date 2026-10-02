# encoding: UTF-8
data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
data2 = File.open("Data/messages_game.dat", "rb") { |f| Marshal.load(f) }
target = eval(%q{"You put the {1} in\nyour Bag's <icon=bagPocket{2}>\c[1]{3}\c[0] pocket."})
puts "es_game tiene clave: #{data[24].key?(target)}"
puts "valor es_game: #{data[24][target].inspect}"
puts "game tiene clave: #{data2[24].key?(target)}"
puts "valor game: #{data2[24][target].inspect}"
# buscar "Objectos" con c de mas
data[24].each { |k,v| puts "SOSPECHOSO: #{k.inspect} => #{v.inspect}" if v.to_s.include?("Objectos") }
data[7].each { |k,v| puts "SOSPECHOSO items: #{k.inspect} => #{v.inspect}" if v.to_s.include?("Objectos") }
