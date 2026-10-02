require_relative "rpg_stubs"
map = File.open("Data/Map077.rxdata", "rb") { |f| Marshal.load(f) }
map.events.each do |eid, event|
  event.pages.each do |page|
    page.list.each do |cmd|
      next unless cmd.code == 101
      text = cmd.parameters[0].dup.force_encoding("UTF-8")
      puts "Evento #{eid}: #{text}" if text.include?("Zeke") || text.include?("Xarly")
    end
  end
end
