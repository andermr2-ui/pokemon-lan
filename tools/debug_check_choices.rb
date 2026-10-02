require_relative "rpg_stubs"
map = File.open("Data/Map001.rxdata", "rb") { |f| Marshal.load(f) }
[1, 3].each do |eid|
  event = map.events[eid]
  page = event.pages[0]
  page.list.each_with_index do |cmd, idx|
    if cmd.code == 102
      puts "Evento #{eid} idx #{idx}: OPCIONES = #{cmd.parameters[0].inspect}"
    elsif cmd.code == 402
      puts "Evento #{eid} idx #{idx}: rama 402 = #{cmd.parameters.inspect}"
    end
  end
end
