# encoding: UTF-8
require_relative "rpg_stubs"

DICT = {
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo acaba de brillar!",
}

path = "Data/Map147.rxdata"
map = File.open(path, "rb") { |f| Marshal.load(f) }
count = 0
map.events.each_value do |event|
  event.pages.each do |page|
    list = page.list
    list.each_with_index do |cmd, i|
      next unless cmd.code == 101
      t = cmd.parameters[0]
      next unless t
      t = t.dup.force_encoding("UTF-8")
      j = i + 1
      full = t.dup
      while list[j] && list[j].code == 401
        c2 = list[j].parameters[0]
        full += c2.dup.force_encoding("UTF-8") if c2 && !c2.empty?
        j += 1
      end
      next unless DICT.key?(full)
      cmd.parameters[0] = DICT[full]
      ((i + 1)...j).each { |k| list[k].parameters[0] = "" }
      count += 1
    end
  end
end
File.open(path, "wb") { |f| Marshal.dump(map, f) }
puts "#{path}: #{count} reemplazos"
