# encoding: UTF-8
require_relative "rpg_stubs"

DICT_304 = {
  "\\bRUSH B FOR ***** SAKE!!!" => "\\b¡RUSH B, POR EL AMOR DE *****!!!",
  "\\bMy boyfriend always gets so emotional when he plays these games..." =>
    "\\bMi novio siempre se pone tan emotivo cuando juega a estos juegos...",
  "\\bI think it´s kinda hot..." => "\\bCreo que es un poco sexy...",
}

def apply(path, dict)
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
        next unless dict.key?(full)
        cmd.parameters[0] = dict[full]
        ((i + 1)...j).each { |k| list[k].parameters[0] = "" }
        count += 1
      end
    end
  end
  File.open(path, "wb") { |f| Marshal.dump(map, f) }
  puts "#{path}: #{count} reemplazos"
end

apply("Data/Map304.rxdata", DICT_304)
