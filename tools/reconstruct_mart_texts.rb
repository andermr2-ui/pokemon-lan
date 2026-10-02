require_relative "rpg_stubs"
[54, 88].each do |n|
  path = format("Data/Map%03d.rxdata", n)
  m = Marshal.load(File.binread(path))
  puts "=== map#{n} ==="
  m.events.each_value do |ev|
    ev.pages.each do |pg|
      list = pg.list
      list.each_with_index do |cmd, i|
        next unless cmd.code == 101
        t = cmd.parameters[0]
        next unless t && !t.empty?
        t = t.dup.force_encoding("UTF-8")
        j = i + 1
        full = t.dup
        while list[j] && list[j].code == 401
          c2 = list[j].parameters[0]
          full += c2.dup.force_encoding("UTF-8") if c2 && !c2.empty?
          j += 1
        end
        puts full.inspect
      end
    end
  end
end
