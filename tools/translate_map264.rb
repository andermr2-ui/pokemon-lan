# encoding: UTF-8
require_relative "rpg_stubs"

DICT_264 = {
  "\\bMoving to Riverstone was a great decision. Everything we need is close by, and the battles in the Stadium are a treat for my family." =>
    "\\bMudarnos a Río el Último fue una gran decisión. Tenemos todo lo que necesitamos cerca, y los combates del Estadio son un placer para mi familia.",
  "\\bThis game is super fun. Look, I´m almost at the final level." =>
    "\\bEste juego es súper divertido. Mira, estoy casi en el nivel final.",
  "\\bWhat do you mean, you don´t know what game this is? It´s New Super Mario Bros. for the Nintendo DS! This is a certified hood classic." =>
    "\\b¿Cómo que no sabes qué juego es este? ¡Es New Super Mario Bros. para la Nintendo DS! Esto es un clásico certificado del barrio.",
  "\\bHey kid, listen up. I may look like I´ve made it in life, with my own house and a loving family. But really, I just moved here to be closer to the slot machines." =>
    "\\bOye, chaval, escucha. Puede que parezca que triunfé en la vida, con mi propia casa y una familia que me quiere. Pero en realidad, solo me mudé aquí para estar más cerca de las tragaperras.",
  "\\bMy wife doesn´t know about this, and she thinks I´ve overcome my gambling addiction, but that´s not true." =>
    "\\bMi mujer no sabe nada de esto, y cree que superé mi adicción al juego, pero eso no es verdad.",
  "\\bAnyways, let me tell you about something that has been bothering me. My son is a great kid, a bit lazy but very smart." =>
    "\\bBueno, déjame contarte algo que me ha estado molestando. Mi hijo es un gran chico, un poco vago pero muy listo.",
  "\\bSadly, he can be very ungrateful at times, and he even refused to accept the rare Pokémon that I got for his birthday." =>
    "\\bPor desgracia, a veces puede ser muy desagradecido, e incluso rechazó aceptar el Pokémon raro que le conseguí para su cumpleaños.",
  "\\bI want to teach him a lesson. He tends to change his mind after a while, but this time his gift will already be gone, because I want you to take it." =>
    "\\bQuiero darle una lección. Suele cambiar de opinión después de un tiempo, pero esta vez su regalo ya no estará, porque quiero que tú te lo quedes.",
  "\\bDon´t be shy, my son deserves this. This is called parenting. Here you go." =>
    "\\bNo seas tímido, mi hijo se merece esto. A esto se le llama ser buen padre. Aquí tienes.",
  "There's no more room for Pokémon!" => "¡No hay más espacio para Pokémon!",
  "The Pokémon Boxes are full and can't accept any more!" => "¡Las Cajas Pokémon están llenas y no pueden aceptar más!",
  "\\bWhen my son asks for the gift that he denied, he´ll realize what being ungrateful gets him. I´m a genius!" =>
    "\\bCuando mi hijo pida el regalo que rechazó, se dará cuenta de a dónde lo lleva ser desagradecido. ¡Soy un genio!",
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

apply("Data/Map264.rxdata", DICT_264)
