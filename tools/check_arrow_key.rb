data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
hash = data[24]
target_key = "Use the Arrow keys to move the main character.\n\nYou can also use the Arrow keys to select entries and navigate menus."
puts "Existe la clave exacta?: #{hash.key?(target_key)}"
if hash.key?(target_key)
  puts "Valor: #{hash[target_key].inspect}"
end
# Buscar claves parecidas por si hay un desajuste sutil
similar = hash.keys.select { |k| k.include?("Arrow keys") }
similar.each { |k| puts "Encontrada: #{k.inspect} => #{hash[k].inspect}" }
