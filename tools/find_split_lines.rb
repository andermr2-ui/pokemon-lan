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
      next unless t.include?("Little is known") || t.include?("First, you should")
      j = i + 1
      full = t
      while list[j] && list[j].code == 401
        full += list[j].parameters[0].dup.force_encoding("UTF-8")
        j += 1
      end
      puts "idx=#{i} count=#{j-i}"
      puts "FULL: #{full.inspect}"
    end
  end
end
