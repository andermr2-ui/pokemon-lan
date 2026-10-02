data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
data.each_with_index do |cat, idx|
  next unless cat.is_a?(Hash)
  cat.each do |k, v|
    puts "cat#{idx}: #{k.inspect} => #{v.inspect}" if v.to_s.include?("€")
  end
end
