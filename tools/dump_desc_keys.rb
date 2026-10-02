data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
keys = data[9].select { |k,v| k == v }.keys
File.open("tools/_desc_keys.rb", "w:UTF-8") do |f|
  f.puts "# encoding: UTF-8"
  f.puts "KEYS = ["
  keys.each { |k| f.puts "  #{k.inspect}," }
  f.puts "]"
end
puts "escritas #{keys.size} claves"
