# encoding: UTF-8
# Shared helper: applies a DICT of {english_pokedex_text => spanish_translation}
# to messages_es_game.dat and messages_game.dat, category 3 (POKEDEX_ENTRIES).
# Adds the key if missing (same pattern used for item names).
def apply_dex_dict(dict)
  ["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
    data = File.open(path, "rb") { |f| Marshal.load(f) }
    cat3 = (data[3] ||= {})
    added = 0
    updated = 0
    dict.each do |k, v|
      if cat3.key?(k)
        updated += 1
      else
        added += 1
      end
      cat3[k] = v
    end
    File.open(path, "wb") { |f| Marshal.dump(data, f) }
    puts "#{path}: nuevas=#{added} actualizadas=#{updated} total_cat3=#{cat3.size}"
  end
end
