# Renombra "Key Items" -> "Objetos Clave" (antes "Objetos Importantes") y
# "Z-Crystals" -> "Cristales-Z" (antes "Cristales Z") en la tabla de
# traduccion compilada. "Mega Stones" ya no hace falta traducirlo aca: el
# texto fuente en Mega Stone Pocket.rb ahora es directamente "Mega Piedras".
DICT = {
  "Key Items" => "Objetos Clave",
  "Z-Crystals" => "Cristales-Z",
}.freeze

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  hash = (data[24] ||= {})
  DICT.each { |key, value| hash[key] = value }
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: actualizado (#{DICT.keys.join(', ')})"
end
