# encoding: UTF-8
require_relative "rpg_stubs"

map = Marshal.load(File.binread("Data/Map232.rxdata"))
ev = map.events[6]
pg = ev.pages[0]
changed = 0
pg.list.each do |cmd|
  if cmd.code == 355 && cmd.parameters[0] == "pbReceiveItem(:ROOTFOSSIL)"
    cmd.parameters[0] = "StoryFixes.pbGiveOppositeFossil"
    changed += 1
  end
end
raise "se esperaba 1 cambio, hubo #{changed}" if changed != 1

File.open("Data/Map232.rxdata", "wb") { |f| Marshal.dump(map, f) }
puts "OK: #{changed} linea reemplazada en Map232 evento ##{ev.id}"
