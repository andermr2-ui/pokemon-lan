# encoding: UTF-8
require_relative "rpg_stubs"

DICT_122 = {
  "\\bThis storm is never ending!" => "\\b¡Esta tormenta no acaba nunca!",
  "\\bYou can find rare Paldean Wooper in this swamp. You´ll notice when you find one." =>
    "\\bPuedes encontrar un Wooper de Paldea raro en este pantano. Lo notarás cuando encuentres uno.",
  "\\bAren´t these the best conditions for a battle?" =>
    "\\b¿A que estas son las mejores condiciones para un combate?",
  "\\bBe careful, or you´ll be struck by lightning." =>
    "\\bTen cuidado, o te caerá un rayo.",
  "\\bThe swamps are talking to us. Can you hear them?" =>
    "\\bLos pantanos nos están hablando. ¿Los oyes?",
  "\\bIf you listen very closely, you will hear them." =>
    "\\bSi escuchas con mucha atención, los oirás.",
}

DICT_277 = {
  "It´s a Pokémon Statue dedicated to Zapdos." =>
    "Es una estatua Pokémon dedicada a Zapdos.",
  "The Delta Stone in your pocket just lit up!" =>
    "¡La Piedra Delta en tu bolsillo acaba de brillar!",
  "Something powerful is approaching!" => "¡Algo poderoso se acerca!",
  "\\bZAAAAAPPP!!!" => "\\b¡¡¡ZAAAAAPPP!!!",
  "Zapdos disappeared. Will it come back?" => "Zapdos desapareció. ¿Volverá?",
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
  puts "#{path}: #{count}/#{dict.size} reemplazos"
end

apply("Data/Map122.rxdata", DICT_122)
apply("Data/Map277.rxdata", DICT_277)
