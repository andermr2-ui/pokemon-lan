# encoding: UTF-8
require_relative "rpg_stubs"

DICT_166 = {
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo acaba de brillar!",
  "Cresselia is staring at you." => "Cresselia te está mirando fijamente.",
  "It wants to battle!" => "¡Quiere combatir!",
  "\\bSELIAAA!!!" => "\\b¡SELIAAA!!!",
  "It´s a Pokémon Stature dedicated to Latios." => "Es una estatua Pokémon dedicada a Latios.",
  "Cresselia disappeared. Will it come back?" => "Cresselia desapareció. ¿Volverá?",
}

DICT_168 = {
  "\\bLooks like it´s time to break some waves!" => "\\b¡Parece que es hora de romper algunas olas!",
  "\\bThe many rocks in this area turned Crystal Beach into a lagoon. That´s why so many tourists come here." =>
    "\\bLas muchas rocas de esta zona convirtieron a Playa Tushi en una laguna. Por eso vienen aquí tantos turistas.",
  "It´s a Pokémon Statue dedicated to Latios." => "Es una estatua Pokémon dedicada a Latios.",
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo acaba de brillar!",
  "Something powerful is approaching!" => "¡Algo poderoso se aproxima!",
  "\\bTIOOOS!!!" => "\\b¡TIOOOS!!!",
  "Latios disappeared. Will it come back?" => "Latios desapareció. ¿Volverá?",
}

DICT_169 = {
  "It´s a Pokémon Statue dedicated to Latias." => "Es una estatua Pokémon dedicada a Latias.",
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo acaba de brillar!",
  "Something powerful is approaching!" => "¡Algo poderoso se aproxima!",
  "\\bTIAAAS!!!" => "\\b¡TIAAAS!!!",
  "Latias disappeared. Will it come back?" => "Latias desapareció. ¿Volverá?",
}

DICT_170 = {
  "It´s an ancient plate with strange symbols." => "Es una placa antigua con símbolos extraños.",
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo acaba de brillar!",
  "Something powerful is approaching!" => "¡Algo poderoso se aproxima!",
  "\\bFINIIIIII!" => "\\b¡FINIIIIII!",
  "Tapu Fini disappeared. Will it come back?" => "Tapu Fini desapareció. ¿Volverá?",
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

apply("Data/Map166.rxdata", DICT_166)
apply("Data/Map168.rxdata", DICT_168)
apply("Data/Map169.rxdata", DICT_169)
apply("Data/Map170.rxdata", DICT_170)
