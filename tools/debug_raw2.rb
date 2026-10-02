require_relative "rpg_stubs"
map = File.open("Data/Map001.rxdata", "rb") { |f| Marshal.load(f) }
event = map.events[1]
page = event.pages[0]
page.list.each_with_index do |cmd, idx|
  next unless idx.between?(16, 26)
  params = cmd.parameters.map { |p| p.is_a?(String) ? p.dup.force_encoding("UTF-8") : p }
  puts "#{idx}: code=#{cmd.code} params=#{params.inspect}"
end
