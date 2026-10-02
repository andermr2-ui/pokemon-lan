require_relative "rpg_stubs"
map = File.open("Data/Map001.rxdata", "rb") { |f| Marshal.load(f) }
event = map.events[1]
page = event.pages[0]
cmd = page.list[19]
puts "code=#{cmd.code} params=#{cmd.parameters.inspect}"
