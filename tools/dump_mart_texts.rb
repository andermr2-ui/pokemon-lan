require_relative "rpg_stubs"
maps = [349,117,54,88,158,25,94]
maps.each do |n|
  path = format("Data/Map%03d.rxdata", n)
  m = Marshal.load(File.binread(path))
  puts "=== map#{n} ==="
  m.events.each_value do |ev|
    ev.pages.each do |pg|
      pg.list.each do |cmd|
        next unless cmd.code == 101
        t = cmd.parameters[0]
        next unless t && !t.empty?
        puts t.dup.force_encoding("UTF-8").inspect
      end
    end
  end
end
