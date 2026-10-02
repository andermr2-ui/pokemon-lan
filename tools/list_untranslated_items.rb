data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
puts "== cat7 ITEM_NAMES sin traducir =="
data[7].each { |k,v| puts k if k == v }
puts
puts "== cat8 ITEM_NAME_PLURALS sin traducir =="
data[8].each { |k,v| puts k if k == v }
