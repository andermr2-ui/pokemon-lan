data = File.open("Data/messages_game.dat", "rb") { |f| Marshal.load(f) }
hash = data[24]
untranslated = hash.select { |k,v| k == v }
puts "Total SCRIPT_TEXTS: #{hash.size}"
puts "Sin traducir (k==v): #{untranslated.size}"
untranslated.each_key { |k| puts "  - #{k.inspect}" }
