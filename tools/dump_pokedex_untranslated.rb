require_relative "rpg_stubs"

data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
hash = data[3]
untranslated = hash.select { |k, v| k == v }
puts "total cat3: #{hash.size}, untranslated (key==val): #{untranslated.size}"
File.open("tools/_pokedex_untranslated.txt", "wb") do |f|
  untranslated.each_key { |k| f.puts(k.gsub("\n", "\\n")) }
end
puts "escrito tools/_pokedex_untranslated.txt"
