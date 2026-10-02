require_relative "rpg_stubs"
map = File.open("Data/Map048.rxdata", "rb") { |f| Marshal.load(f) }
count = 0
map.events.each_value do |event|
  event.pages.each do |page|
    page.list.each do |cmd|
      next unless cmd.code == 102
      opts = cmd.parameters[0]
      if opts == ["Yes", "No"]
        cmd.parameters[0] = ["Sí", "No"]
        count += 1
      end
    end
  end
end
File.open("Data/Map048.rxdata", "wb") { |f| Marshal.dump(map, f) } if count > 0
puts "#{count} menus Yes/No corregidos"
