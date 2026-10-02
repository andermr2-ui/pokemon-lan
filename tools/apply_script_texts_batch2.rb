require_relative "translations_script_texts_batch2"

SCRIPT_TEXTS_INDEX = 24
path = "Data/messages_game.dat"

data = File.open(path, "rb") { |f| Marshal.load(f) }
existing = (data[SCRIPT_TEXTS_INDEX] ||= {})

added = 0
updated = 0
missing_keys = []
SCRIPT_TEXTS_ES_2.each do |key, value|
  unless existing.key?(key)
    missing_keys << key
    next
  end
  updated += 1 if existing[key] != value
  existing[key] = value
end

File.open(path, "wb") { |f| Marshal.dump(data, f) }
puts "Actualizadas: #{updated}"
puts "Claves no encontradas en el diccionario existente (revisar): #{missing_keys.size}"
missing_keys.first(10).each { |k| puts "  - #{k.inspect}" }
puts "Total SCRIPT_TEXTS ahora: #{existing.size}"
puts "Sin traducir (clave==valor) que quedan: #{existing.count { |k,v| k == v }}"
