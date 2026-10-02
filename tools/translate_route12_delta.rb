# encoding: UTF-8
require_relative "rpg_stubs"

DICT_080 = {
  "\\bYou better not be scared of spiders. Here we go!" =>
    "\\bMás vale que no le tengas miedo a las arañas. ¡Aquí vamos!",
  "\\bSpiders rock!" => "\\b¡Las arañas molan!",
  "Meadow Grove" => "Prado Arboleda",
  "\\bLook at my cute partner!" => "\\b¡Mira a mi adorable compañero!",
  "\\bIt´s cute even if it loses." => "\\bEs adorable aunque pierda.",
  "\\bI´m not gonna hold back! My Pokémon is strong." =>
    "\\bNo pienso contenerme. Mi Pokémon es fuerte.",
  "\\bI wish my dad would come back..." => "\\bOjalá mi padre volviera...",
  "It´s a Pokémon Statue dedicated to Shaymin." =>
    "Es una estatua Pokémon dedicada a Shaymin.",
  "The Delta Stone in your pocket just lit up!" =>
    "¡La Piedra Delta en tu bolsillo acaba de brillar!",
  "Something powerful is approaching!" => "¡Algo poderoso se acerca!",
  "\\bMIIIIIIIN!!!" => "\\b¡¡¡MIIIIIIIN!!!",
  "Shaymin disappeared. Will it come back?" =>
    "Shaymin desapareció. ¿Volverá?",
}

DICT_098 = {
  "\\bIsn´t this a pretty lake?" => "\\b¿A que es bonito este lago?",
  "\\bI could spend hours here." => "\\bMe podría pasar horas aquí.",
  "It´s a Pokémon Statue dedicated to Suicune." =>
    "Es una estatua Pokémon dedicada a Suicune.",
  "The Delta Stone in your pocket just lit up!" =>
    "¡La Piedra Delta en tu bolsillo acaba de brillar!",
  "Something powerful is approaching!" => "¡Algo poderoso se acerca!",
  "\\bSUUUUUUIII!!!" => "\\b¡¡¡SUUUUUUIII!!!",
  "Suicune disappeared. Will it come back?" =>
    "Suicune desapareció. ¿Volverá?",
  "Azelf looks worried." => "Azelf parece preocupado.",
  "It wants to battle!" => "¡Quiere combatir!",
  "\\bZEEEEELF!!!" => "\\b¡¡¡ZEEEEELF!!!",
  "Azelf disappeared. Will it come back?" => "Azelf desapareció. ¿Volverá?",
  "\\bYou look strong. Let´s battle!" => "\\bPareces fuerte. ¡Combatamos!",
  "\\bI want to be as strong as you are!" =>
    "\\b¡Quiero ser tan fuerte como tú!",
}

def apply(path, dict)
  map = File.open(path, "rb") { |f| Marshal.load(f) }
  count = 0
  map.events.each_value do |event|
    event.pages.each do |page|
      page.list.each do |cmd|
        next unless cmd.code == 101
        t = cmd.parameters[0]
        next unless t
        t = t.dup.force_encoding("UTF-8")
        if dict.key?(t)
          cmd.parameters[0] = dict[t]
          count += 1
        end
      end
    end
  end
  File.open(path, "wb") { |f| Marshal.dump(map, f) }
  puts "#{path}: #{count}/#{dict.size} reemplazos"
end

apply("Data/Map080.rxdata", DICT_080)
apply("Data/Map098.rxdata", DICT_098)
