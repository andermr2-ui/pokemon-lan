# Translation.stringToKey colapsa cualquier corrida de 2+ espacios en blanco
# (incluye \n\n) a un solo espacio ANTES de buscar en el hash. Mi clave
# original tenia el \n\n literal, asi que nunca hacia match. Agrego la MISMA
# clave pero normalizada (como la calcularia el motor) apuntando al mismo
# valor traducido.

def normalize_key(str)
  return str unless str =~ /[\r\n\t]|\A\s+|\s+\z|\s{2,}/
  k = str.dup
  k.sub!(/\A\s+/, "")
  k.sub!(/\s+\z/, "")
  k.gsub!(/\s{2,}/, " ")
  k
end

original_key = "Use the Arrow keys to move the main character.\n\nYou can also use the Arrow keys to select entries and navigate menus."
value = "Usa las teclas de flecha para mover al personaje principal.\n\nTambién puedes usar las flechas para seleccionar opciones y navegar por los menús."
normalized_key = normalize_key(original_key)
puts "Clave normalizada: #{normalized_key.inspect}"

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  hash = data[24]
  hash[normalized_key] = value
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "Aplicado en #{path}"
end
