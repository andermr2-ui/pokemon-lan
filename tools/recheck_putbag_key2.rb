data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
target = "You put the {1} in\\nyour Bag's <icon=bagPocket{2}>\\c[1]{3}\\c[0] pocket."
puts target.bytesize
puts data[24].key?(target)
puts data[24][target].inspect

data[24].each_key do |k|
  next unless k.start_with?("You put the")
  puts "candidato: #{k.inspect}  bytesize=#{k.bytesize}"
end
