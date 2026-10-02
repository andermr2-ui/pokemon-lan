# Aplica el diccionario de tools/translations_script_texts.rb dentro de
# Data/messages_game.dat, en el indice 24 (MessageTypes::SCRIPT_TEXTS).
# No toca Scripts.rxdata. Si el juego no encuentra una clave en este hash,
# simplemente muestra el texto en ingles sin romper nada.

require_relative "translations_script_texts"

SCRIPT_TEXTS_INDEX = 24
path = "Data/messages_game.dat"

data = File.exist?(path) ? File.open(path, "rb") { |f| Marshal.load(f) } : []
data = [] unless data.is_a?(Array)
data[SCRIPT_TEXTS_INDEX] ||= {}

existing = data[SCRIPT_TEXTS_INDEX]
added = 0
updated = 0
SCRIPT_TEXTS_ES.each do |key, value|
  if existing.key?(key)
    updated += 1 if existing[key] != value
  else
    added += 1
  end
  existing[key] = value
end

File.open(path, "wb") { |f| Marshal.dump(data, f) }
puts "Entradas nuevas: #{added}, actualizadas: #{updated}, total en SCRIPT_TEXTS: #{existing.size}"
