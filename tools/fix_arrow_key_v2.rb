correct_key = "Use the Arrow keys to move the main character.\nYou can also use the Arrow keys to select entries and navigate menus."
value = "Usa las teclas de flecha para mover al personaje principal.\n\nTambién puedes usar las flechas para seleccionar opciones y navegar por los menús."

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  hash = data[24]
  hash[correct_key] = value
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "Aplicado en #{path}"
end
