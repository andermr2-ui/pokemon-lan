data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
KEYS = ["Hopo Berry","Scroll of Darkness","Scroll of Water","Booster Energy","Health Mochi","Muscle Mochi","Resist Mochi","Genius Mochi","Clever Mochi","Swift Mochi","Fresh-Start Mochi","Mythical Pecha Berry","Z-Ring","Poké Ball"]
puts "== cat7 (singular) =="
KEYS.each { |k| v = data[7][k]; puts "#{k.inspect} => #{v.nil? ? 'NO EXISTE' : v.inspect}" }
