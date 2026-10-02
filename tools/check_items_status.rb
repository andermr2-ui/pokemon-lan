data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
[7,8,9].each do |cat|
  hash = data[cat]
  translated = hash.count { |k,v| k != v }
  untranslated = hash.count { |k,v| k == v }
  puts "cat#{cat}: total=#{hash.size} traducidos=#{translated} sin_traducir=#{untranslated}"
end
