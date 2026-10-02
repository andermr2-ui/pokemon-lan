# encoding: UTF-8
require_relative "_desc_keys"
require_relative "_desc_values"

raise "Tamaños distintos: #{KEYS.size} claves vs #{VALUES.size} valores" if KEYS.size != VALUES.size
DICT = KEYS.zip(VALUES).to_h

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  hash = data[9]
  updated = 0
  missing = []
  DICT.each do |k, v|
    unless hash.key?(k)
      missing << k
      next
    end
    hash[k] = v
    updated += 1
  end
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: actualizadas=#{updated}, no encontradas=#{missing.size}"
  missing.each { |m| puts "  FALTA: #{m}" }
end
