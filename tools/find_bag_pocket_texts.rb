data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
data[24].each do |k,v|
  puts "#{k.inspect} => #{v.inspect}" if k.include?("Bag") || k.include?("pocket") || k.include?("put the")
end
