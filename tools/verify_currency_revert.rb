data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
remaining = 0
data.each do |cat|
  next unless cat.is_a?(Hash)
  cat.each_value { |v| remaining += 1 if v.to_s.include?("€") }
end
puts "categorias: #{data.size}, entradas con € restantes: #{remaining}"
puts data[24]["${1}"]
puts data[24]["I can pay ${1}.\nWould that be OK?"]
