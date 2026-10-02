require_relative "rpg_stubs"
m = Marshal.load(File.binread("Data/Map130.rxdata"))
target = "\\bMolly: If he actually managed to catch these legendary Pokémon, you need to hurry!"
m.events.each_value do |ev|
  ev.pages.each do |pg|
    list = pg.list
    list.each_with_index do |cmd, i|
      next unless cmd.code == 101
      t = cmd.parameters[0]
      next unless t
      t2 = t.dup.force_encoding("UTF-8")
      next unless t2.include?("he actually managed")
      j = i+1
      full = t2.dup
      while list[j] && list[j].code == 401
        c2 = list[j].parameters[0]
        full += c2.dup.force_encoding("UTF-8") if c2 && !c2.empty?
        j += 1
      end
      puts "full: #{full.inspect}"
      puts "match?: #{full == target}"
    end
  end
end
