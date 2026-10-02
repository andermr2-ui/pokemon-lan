require "./tools/rpg_stubs"
data = Marshal.load(File.binread("Data/Map231.rxdata"))
data.events.each do |eid, ev|
  ev.pages.each_with_index do |page, pi|
    page.list.each_with_index do |c, i|
      c.parameters.each do |p|
        if p.is_a?(RPG::MoveRoute)
          puts "event=#{eid} name=#{ev.name.inspect} page=#{pi} cmd_index=#{i} code=#{c.code} param_is_MoveRoute"
        end
      end
    end
  end
end
