# encoding: UTF-8
def apply_items_dict(names, plurals, descs)
  ["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
    data = File.open(path, "rb") { |f| Marshal.load(f) }
    cat_name = (data[7] ||= {})
    cat_plural = (data[8] ||= {})
    cat_desc = (data[9] ||= {})
    n_added = n_upd = p_added = p_upd = d_added = d_upd = 0
    names.each do |k, v|
      cat_name.key?(k) ? n_upd += 1 : n_added += 1
      cat_name[k] = v
    end
    plurals.each do |k, v|
      cat_plural.key?(k) ? p_upd += 1 : p_added += 1
      cat_plural[k] = v
    end
    descs.each do |k, v|
      cat_desc.key?(k) ? d_upd += 1 : d_added += 1
      cat_desc[k] = v
    end
    File.open(path, "wb") { |f| Marshal.dump(data, f) }
    puts "#{path}: nombres(nuevas=#{n_added} act=#{n_upd}) plurales(nuevas=#{p_added} act=#{p_upd}) descs(nuevas=#{d_added} act=#{d_upd})"
  end
end
