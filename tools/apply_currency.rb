key = "${1}"
value = "{1}€"
["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  hash = (data[24] ||= {})
  hash[key] = value
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
end
puts "aplicado: #{key.inspect} => #{value.inspect}"
