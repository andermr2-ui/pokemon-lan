require_relative "rpg_stubs"
m = Marshal.load(File.binread("Data/Map024.rxdata"))
m.events.each_value do |ev|
  ev.pages.each do |pg|
    list = pg.list
    list.each_with_index do |cmd, i|
      next unless cmd.code == 101
      t = cmd.parameters[0]
      next unless t
      t = t.dup.force_encoding("UTF-8")
      next unless t.include?("While infected") || t.include?("All storage box") || t.include?("They correspond") || t.include?("Storage wallpapers are split") || t.include?("Basic wallpapers are always") || t.include?("Special wallpapers start")
      j = i + 1
      full = t.dup
      while list[j] && list[j].code == 401
        c2 = list[j].parameters[0]
        full += c2.dup.force_encoding("UTF-8") if c2
        j += 1
      end
      puts full.inspect
    end
  end
end
