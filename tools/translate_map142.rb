# encoding: UTF-8
require_relative "rpg_stubs"

DICT_142 = {
  "It´s the grave of a Pokémon." => "Es la tumba de un Pokémon.",
  "It´s the grave of a Pokémon called Marshadow." => "Es la tumba de un Pokémon llamado Marshadow.",
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo acaba de brillar!",
  "Something powerful is approaching!" => "¡Algo poderoso se aproxima!",
  "\\bMARSHAAAAA!!!" => "\\b¡MARSHAAAAA!!!",
  "Marshadow disappeared. Will it come back?" => "Marshadow desapareció. ¿Volverá?",
  "\\bOh my little Umbreon, may you rest in peace..." => "\\bOh, mi pequeño Umbreon, descansa en paz...",
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

apply("Data/Map142.rxdata", DICT_142)
