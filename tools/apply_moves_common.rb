# encoding: UTF-8
# Shared helper: applies a DICT of {english_text => spanish_translation}
# to messages_es_game.dat and messages_game.dat, at the given category index.
# category_index: 5 = nombres de movimientos, 6 = descripciones de movimientos.
# Adds the key if missing (same pattern used for pokedex/items).
def apply_moves_dict(category_index, dict)
  ["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
    data = File.open(path, "rb") { |f| Marshal.load(f) }
    cat = (data[category_index] ||= {})
    added = 0
    updated = 0
    dict.each do |k, v|
      if cat.key?(k)
        updated += 1
      else
        added += 1
      end
      cat[k] = v
    end
    File.open(path, "wb") { |f| Marshal.dump(data, f) }
    puts "#{path}: nuevas=#{added} actualizadas=#{updated} total_cat#{category_index}=#{cat.size}"
  end
end
