# encoding: UTF-8
require_relative "rpg_stubs"

map = Marshal.load(File.binread("Data/Map077.rxdata"))
ev = map.events[4]
pg = ev.pages[0]
new_cmd = RPG::EventCommand.new
new_cmd.code = 355
new_cmd.indent = 0
new_cmd.parameters = ["MomBank.check_pc_balance"]
pg.list = [new_cmd] + pg.list
File.open("Data/Map077.rxdata", "wb") { |f| Marshal.dump(map, f) }
puts "OK: PC balance wired"
