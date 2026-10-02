data = File.open("Data/messages_game.dat", "rb") { |f| Marshal.load(f) }
hash = data[24]
untranslated = hash.select { |k, v| k == v }
File.open("tools/_untranslated_script_texts.txt", "w:UTF-8") do |f|
  untranslated.each_key { |k| f.puts k.inspect }
end
puts "Total sin traducir: #{untranslated.size}"
