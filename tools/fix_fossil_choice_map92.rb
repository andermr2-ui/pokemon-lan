# encoding: UTF-8
require_relative "rpg_stubs"

def make_cmd(code, indent, params)
  cmd = RPG::EventCommand.new
  cmd.code = code
  cmd.indent = indent
  cmd.parameters = params
  cmd
end

map = Marshal.load(File.binread("Data/Map092.rxdata"))
ev = map.events[6]
pg = ev.pages[0]
list = pg.list

new_list = []
inserted = 0
list.each do |cmd|
  new_list << cmd
  if cmd.code == 355 && cmd.parameters[0] == "pbReceiveItem(:CLAWFOSSIL)"
    new_list << make_cmd(355, cmd.indent, ["$game_variables[90] = 1"])
    inserted += 1
  elsif cmd.code == 355 && cmd.parameters[0] == "pbReceiveItem(:ROOTFOSSIL)"
    new_list << make_cmd(355, cmd.indent, ["$game_variables[90] = 2"])
    inserted += 1
  end
end
raise "se esperaban 2 inserciones, hubo #{inserted}" if inserted != 2
pg.list = new_list

File.open("Data/Map092.rxdata", "wb") { |f| Marshal.dump(map, f) }
puts "OK: #{inserted} lineas insertadas en Map092 evento ##{ev.id}"
