data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
names_hash = data[10]
pairs = File.readlines("tools/_abilities_pairs.txt", encoding: "UTF-8").map { |l| l.chomp.split("|||") }
remaining = pairs.reject { |name, desc| names_hash[name] && names_hash[name] != name }
puts "Total: #{pairs.size}, ya traducidas: #{pairs.size - remaining.size}, faltan: #{remaining.size}"
File.open("tools/_abilities_remaining.txt", "w:UTF-8") do |out|
  remaining.each { |name, desc| out.puts "#{name}|||#{desc}" }
end
