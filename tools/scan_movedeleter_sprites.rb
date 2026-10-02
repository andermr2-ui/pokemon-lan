require "./tools/rpg_stubs"

maps = [351,325,246,233,216,210,184,157,127,116,93,87,43,12]

maps.each do |n|
  path = "Data/Map#{n.to_s.rjust(3, '0')}.rxdata"
  next unless File.exist?(path)
  data = Marshal.load(File.binread(path))
  data.events.each do |eid, ev|
    next unless ev.name.to_s =~ /move ?deleter/i
    ev.pages.each_with_index do |page, i|
      g = page.graphic
      puts "Map#{n} event=#{eid} page=#{i} char=#{g.character_name.inspect} hue=#{g.character_hue} dir=#{g.direction} pattern=#{g.pattern}"
    end
  end
end
