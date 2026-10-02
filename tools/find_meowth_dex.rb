require_relative "rpg_stubs"

data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
target_fragment = "withdraw their sharp claws"
data.each_with_index do |hash, idx|
  next unless hash.is_a?(Hash)
  hash.each do |k, v|
    if k.is_a?(String) && k.include?(target_fragment)
      puts "FOUND in cat #{idx}"
      puts "  key: #{k.inspect}"
      puts "  val: #{v.inspect}"
    end
  end
end
puts "done scanning messages_es_game.dat"

# Also check the raw species/pokemon data file for dex text
if File.exist?("Data/pokemon.dat")
  pdata = File.open("Data/pokemon.dat", "rb") { |f| Marshal.load(f) }
  puts "pokemon.dat class: #{pdata.class}"
end
