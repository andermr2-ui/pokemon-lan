# encoding: UTF-8
require_relative "rpg_stubs"

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

DICT_318 = {
  "\\bAnthony: This is even worse than I imagined..." => "\\bAnthony: Esto es incluso peor de lo que imaginaba...",
  "\\bWhy´s a sandstorm here? And look, over there, a thunderstorm!" => "\\b¿Por qué hay una tormenta de arena acá? ¡Y mirá, allá, una tormenta eléctrica!",
  "\\bAlso, because the beach hasn´t been used by people in a while, a bunch of strong Pokémon are wandering around here. We should be very careful." => "\\bAdemás, como la playa no la usa gente hace rato, hay un montón de Pokémon fuertes dando vueltas por acá. Deberíamos tener mucho cuidado.",
  "\\bI´m gonna search the coast for anything suspicious, and you can help me. Anything that looks unnatural could be a clue. Let´s do this!" => "\\bVoy a buscar en la costa cualquier cosa sospechosa, y vos podés ayudarme. Cualquier cosa que se vea antinatural podría ser una pista. ¡Vamos a esto!",
}

DICT_319 = {
  "\\bAnthony: Hm, two identical rocks..." => "\\bAnthony: Mm, dos rocas idénticas...",
  "\\bIs that a Jojo reference?!" => "\\b¿¡Eso es una referencia a Jojo?!",
  "\\bNah, I´m just kidding. Stuff like this could very well signify a hidden entrance, but the wall looks completely normal over here." => "\\bNa, es broma. Cosas así bien podrían significar una entrada oculta, pero la pared se ve completamente normal acá.",
  "\\bI haven´t checked the western side of the beach yet, so why don´t you do that?" => "\\bTodavía no revisé el lado oeste de la playa, ¿por qué no lo hacés vos?",
}

DICT_320 = {
  "The ground suddenly began to shake!" => "¡El suelo de repente empezó a temblar!",
  "Your Z-Power Ring lit up!" => "¡Tu Anillo Z se iluminó!",
  "\\bArthur: So you managed to catch Kyurem. That´s great! But remember, it´s a very powerful Pokémon, so be careful." => "\\bArthur: Así que lograste atrapar a Kyurem. ¡Genial! Pero recordá, es un Pokémon muy poderoso, así que tené cuidado.",
  "\\bI think we´re ready to go. Come on, let´s stop this bastard!" => "\\bCreo que estamos listos para ir. Dale, ¡vamos a detener a este desgraciado!",
  "\\bMh, we shouldn´t go without Kyurem. Please add Kyurem to your team before we go in there." => "\\bMm, no deberíamos ir sin Kyurem. Por favor, agregá a Kyurem a tu equipo antes de que entremos ahí.",
}

apply("Data/Map318.rxdata", DICT_318)
apply("Data/Map319.rxdata", DICT_319)
apply("Data/Map320.rxdata", DICT_320)
