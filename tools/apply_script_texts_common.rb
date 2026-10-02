# encoding: UTF-8
def apply_script_texts_dict(dict)
  ["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
    data = File.open(path, "rb") { |f| Marshal.load(f) }
    cat = (data[24] ||= {})
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
    puts "#{path}: nuevas=#{added} actualizadas=#{updated} total_cat24=#{cat.size}"
  end
end
