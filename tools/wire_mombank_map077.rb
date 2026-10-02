# encoding: UTF-8
require_relative "rpg_stubs"

map = Marshal.load(File.binread("Data/Map077.rxdata"))
touched = 0

[5, 7].each do |id|
  ev = map.events[id]
  ev.pages.each_with_index do |pg, i|
    idx314 = pg.list.index { |c| c.code == 314 }
    next unless idx314
    # Reemplaza desde el "Recuperar Todo" (314) hasta antes del "0" final
    # (que siempre esta al final de la lista) por una sola llamada a script.
    keep_before = pg.list[0...idx314]
    script_cmd = RPG::EventCommand.new
    script_cmd.code = 355
    script_cmd.indent = 0
    script_cmd.parameters = ["MomBank.talk_to_mom"]
    end_cmd = pg.list.last # code 0
    pg.list = keep_before + [script_cmd, end_cmd]
    touched += 1
    puts "Evento ##{id} pagina #{i}: reemplazado (#{keep_before.size} lineas de flavor conservadas)"
  end
end

File.open("Data/Map077.rxdata", "wb") { |f| Marshal.dump(map, f) }
puts "OK: #{touched} paginas actualizadas en Map077.rxdata"

# Verificacion
map2 = Marshal.load(File.binread("Data/Map077.rxdata"))
[5, 7].each do |id|
  map2.events[id].pages.each_with_index do |pg, i|
    has_call = pg.list.any? { |c| c.code == 355 && c.parameters[0] == "MomBank.talk_to_mom" }
    puts "Evento ##{id} pagina #{i}: tiene la llamada = #{has_call}" if has_call
  end
end
