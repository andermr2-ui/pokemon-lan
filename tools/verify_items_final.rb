data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
puts "categorias: #{data.size}"
[7,8].each do |cat|
  hash = data[cat]
  real_untranslated = hash.select { |k,v| k == v && !k.include?("Z") && k != "Poké Ball" && k != "Poké Balls" }
  puts "cat#{cat}: total=#{hash.size}, self-mapped=#{hash.count{|k,v| k==v}}, self-mapped no-Z/no-Poke=#{real_untranslated.size}"
  real_untranslated.each { |k,v| puts "  pendiente real: #{k}" }
end
