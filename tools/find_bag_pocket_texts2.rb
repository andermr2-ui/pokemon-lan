data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
data[24].each do |k,v|
  puts "#{k.inspect} => #{v.inspect}" if k.downcase.include?("put the") || k.downcase.include?("pocket")
end
