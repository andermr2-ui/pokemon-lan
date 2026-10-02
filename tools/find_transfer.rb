require_relative "rpg_stubs"
map = File.open("Data/Map001.rxdata", "rb") { |f| Marshal.load(f) }
[1, 3].each do |eid|
  event = map.events[eid]
  event.pages.each_with_index do |page, pidx|
    page.list.each_with_index do |cmd, idx|
      if cmd.code == 201  # Transfer Player
        puts "Evento #{eid} pagina #{pidx+1} idx #{idx}: Transfer Player -> #{cmd.parameters.inspect}"
      end
    end
  end
end
