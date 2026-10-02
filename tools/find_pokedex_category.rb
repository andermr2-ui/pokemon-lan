require_relative "rpg_stubs"

data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
puts "data class: #{data.class}, size: #{data.size}"
data.each_with_index do |hash, idx|
  next unless hash.is_a?(Hash)
  has_long_text = hash.values.any? { |v| v.is_a?(String) && v.length > 100 }
  next unless has_long_text
  sample_key = hash.keys.find { |k| hash[k].is_a?(String) && hash[k].length > 100 }
  puts "cat #{idx}: size=#{hash.size}"
  puts "  sample key: #{sample_key.inspect[0,150]}"
  puts "  sample val: #{hash[sample_key].inspect[0,150]}"
end
