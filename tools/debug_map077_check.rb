require_relative "rpg_stubs"
map = File.open("Data/Map077.rxdata", "rb") { |f| Marshal.load(f) }
event = map.events[9]
page = event.pages[0]
page.list.first(3).each_with_index { |cmd, i| puts "idx #{i}: code=#{cmd.code} params=#{cmd.parameters.inspect}" }
puts "---evento 6---"
event6 = map.events[6]
page6 = event6.pages[0]
page6.list.first(3).each_with_index { |cmd, i| puts "idx #{i}: code=#{cmd.code} params=#{cmd.parameters.inspect}" }
