require_relative "rpg_stubs"
map = File.open("Data/Map033.rxdata", "rb") { |f| Marshal.load(f) }
map.events.each do |eid, event|
  event.pages.each_with_index do |page, pidx|
    page.list.each do |cmd|
      if cmd.code == 201
        puts "Evento #{eid} (#{event.name}) pagina #{pidx+1}: Transfer -> #{cmd.parameters.inspect}"
      end
    end
  end
end
