data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
missing = data[24].select { |k,v| k == v }
puts "SCRIPT_TEXTS sin traducir (#{missing.size}):"
missing.each_key { |k| puts "  #{k.inspect}" }
