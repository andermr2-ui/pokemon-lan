data = File.open("Data/messages_game.dat", "rb") { |f| Marshal.load(f) }
hash = data[24]
puts "Total entradas: #{hash.size}"
# Cuantas tienen valor identico a la clave (=no traducidas todavia) vs distintas
same = hash.count { |k, v| k == v }
diff = hash.size - same
puts "Iguales a la clave (sin traducir): #{same}"
puts "Distintas de la clave (ya traducidas o generadas por mi ahora): #{diff}"
puts "--- muestra de 15 al azar ---"
hash.to_a.sample(15).each { |k,v| puts "#{k.inspect} => #{v.inspect}" }
