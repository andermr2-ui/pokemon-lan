# encoding: UTF-8
def apply_frontier_dict(cat, dict)
  ["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
    data = File.open(path, "rb") { |f| Marshal.load(f) }
    h = (data[cat] ||= {})
    added = 0
    updated = 0
    dict.each do |k, v|
      h.key?(k) && h[k] != k ? updated += 1 : added += 1
      h[k] = v
    end
    File.open(path, "wb") { |f| Marshal.dump(data, f) }
    puts "#{path}: cat#{cat} nuevas/actualizadas=#{added + updated} total=#{h.size}"
  end
end
