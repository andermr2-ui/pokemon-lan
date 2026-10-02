require "./tools/rpg_stubs"
data = Marshal.load(File.binread("Data/Map231.rxdata"))
data.events.each do |eid, ev|
  ev.pages.each_with_index do |page, pi|
    page.list.each_with_index do |c, i|
      c.parameters.each do |p|
        next unless p.is_a?(RPG::MoveRoute) || p.is_a?(RPG::AudioFile)
        puts "event=#{eid} name=#{ev.name.inspect} page=#{pi} cmd=#{i} code=#{c.code} type=#{p.class}"
      end
    end
  end
end
