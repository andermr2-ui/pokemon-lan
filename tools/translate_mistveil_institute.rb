# encoding: UTF-8
require_relative "rpg_stubs"

DICT = {
  "\\bWelcome to the Mistveil Institute. We´re one of 3 renowned institutes in the Delta Region. Here in Mistveil, we focus on Pokémon fossils." =>
    "\\bBienvenido al Instituto Velo Brumoso. Somos uno de los 3 institutos de renombre de la Región Delta. Aquí en Velo Brumoso, nos centramos en los fósiles Pokémon.",
  "\\bThat´s right, fossils. We are able to bring prehistoric Pokémon back to life with the power of science." =>
    "\\bAsí es, fósiles. Somos capaces de devolver la vida a Pokémon prehistóricos con el poder de la ciencia.",
  "\\bAnd today´s your lucky day:Show me that you have the potential to train such a rare species, and I will gift you a fossil." =>
    "\\bY hoy es tu día de suerte: demuéstrame que tienes el potencial para entrenar una especie tan rara, y te regalaré un fósil.",
  "\\bReady for a time travel?" => "\\b¿Listo para viajar en el tiempo?",
  "\\bVery well. Choose one of these fossils, and it will be yours." =>
    "\\bMuy bien. Elige uno de estos fósiles, y será tuyo.",
  "\\bIf you hand that fossil to my assistant over there, he can bring that Pokémon back to life." =>
    "\\bSi le das ese fósil a mi ayudante de ahí, él puede devolverle la vida a ese Pokémon.",
  "\\bTalk to my assistants if you have fossils. They can bring them back to life." =>
    "\\bHabla con mis ayudantes si tienes fósiles. Ellos pueden devolverles la vida.",
  "\\bOh, hello. I'm a scientist." => "\\bOh, hola. Soy un científico.",
  "\\bI can turn fossils into living, breathing Pokémon!" =>
    "\\b¡Puedo convertir fósiles en Pokémon vivos que respiran!",
  "\\bAiyah! You come again!" => "\\b¡Aiyah! ¡Has vuelto!",
  "\\bDo you have a fossil for me?" => "\\b¿Tienes un fósil para mí?",
  "\\bWhich fossil do you want me to revive?" => "\\b¿Qué fósil quieres que reviva?",
  "\\bLet me know when you want me to revive a fossil for you." =>
    "\\bAvísame cuando quieras que te reviva un fósil.",
  "\\bOkay. I'll see if I can revive your \\v[3]." => "\\bVale. Veré si puedo revivir tu \\v[3].",
  "\\bCome back later." => "\\bVuelve más tarde.",
  "\\bI'll be here if you want my help." => "\\bAquí estaré si quieres mi ayuda.",
  "\\bWhere have you been? I've finished reviving yourfossil." =>
    "\\b¿Dónde has estado? He terminado de revivir tu fósil.",
  "\\bIt was \\v[3] like I thought." => "\\bEra \\v[3], tal como pensaba.",
  "\\bYou have no room left. Make room, then come see me." =>
    "\\bNo te queda espacio. Haz sitio, y luego ven a verme.",
  "\\bI managed to revive your fossil." => "\\bLogré revivir tu fósil.",
  "\\bHowever, what I brought back didn't live long...\\1 fortunately." =>
    "\\bSin embargo, lo que traje de vuelta no vivió mucho tiempo...\\1 por suerte.",
  "\\bSorry." => "\\bLo siento.",
  "\\bI told you, come back later." => "\\bYa te lo dije, vuelve más tarde.",
  "\\bHello, huh! I come from the Galar Region, and I can turn combinations of partial Fossils into living, breathing Pokémon!" =>
    "\\b¡Hola, oye! Vengo de la Región Galar, ¡y puedo convertir combinaciones de Fósiles parciales en Pokémon vivos que respiran!",
  "\\bHm? You've got some Fossils there, huh. Will you show them to me, Carl Ess?" =>
    "\\b¿Hmm? Tienes algunos Fósiles ahí, oye. ¿Se los enseñas a Carl Ess?",
  "\\bWhich of your Fossils do you think stands up to the high standards of Carl Ess?" =>
    "\\b¿Cuál de tus Fósiles crees que está a la altura de los estándares de Carl Ess?",
  "\\bWhich of your Fossils do you think will pique the curiosity of Carl Ess?" =>
    "\\b¿Cuál de tus Fósiles crees que despertará la curiosidad de Carl Ess?",
  "\\bCome see me when you have some interesting Fossils." =>
    "\\bVen a verme cuando tengas Fósiles interesantes.",
  "\\bSo I should restore the Fossilized Bird and the Fossilized Drake together, huh?" =>
    "\\b¿Así que debería restaurar juntos el Fósil de Pájaro y el Fósil de Dragón, oye?",
  "\\bSo I should restore the Fossilized Bird and the Fossilized Dino together, huh?" =>
    "\\b¿Así que debería restaurar juntos el Fósil de Pájaro y el Fósil de Dino, oye?",
  "\\bSo I should restore the Fossilized Fish and the Fossilized Drake together, huh?" =>
    "\\b¿Así que debería restaurar juntos el Fósil de Pez y el Fósil de Dragón, oye?",
  "\\bSo I should restore the Fossilized Fish and the Fossilized Dino together, huh?" =>
    "\\b¿Así que debería restaurar juntos el Fósil de Pez y el Fósil de Dino, oye?",
  "\\bOK. Restoration time. Let's unravel the mystery of these Fossils!" =>
    "\\bVale. Hora de restaurar. ¡Vamos a desentrañar el misterio de estos Fósiles!",
  "\\bAll right, I'll stick 'em together! Here... we... GO!" =>
    "\\b¡Muy bien, los voy a pegar! Allá... vamos... ¡YA!",
  "\\bObjective complete. It seems the restoration was a great success." =>
    "\\bObjetivo completado. Parece que la restauración fue un gran éxito.",
  "\\bYes, I can see it in its eyes. This is a Pokémon that walked the face of Essen in ancient times! Please take and care for this Pokémon, huh." =>
    "\\bSí, lo veo en sus ojos. ¡Este es un Pokémon que caminó sobre la faz de Essen en tiempos antiguos! Por favor, llévate y cuida de este Pokémon, oye.",
  "\\bOh, you don't have space in your party, huh. Make some room and then come back here for your Pokémon." =>
    "\\bOh, no tienes espacio en tu equipo, oye. Haz sitio y luego vuelve aquí a por tu Pokémon.",
  "\\bOh. They don't seem to work together." => "\\bOh. Parece que no funcionan juntos.",
  "\\bMaybe some other time, then." => "\\bQuizá en otro momento, entonces.",
  "\\bHuh, have you made some room for your Pokémon yet?" =>
    "\\bOye, ¿ya le has hecho sitio a tu Pokémon?",
  "\\bYou haven't. Make some room and then come back here." =>
    "\\bNo lo has hecho. Haz sitio y luego vuelve aquí.",
}

CHOICES = {
  "Claw Fossil|Root Fossil" => "Fósil Garra|Fósil Raíz",
  "Fossilized Bird|Fossilized Fish|Quit" => "Fósil de Pájaro|Fósil de Pez|Salir",
  "Fossilized Bird|Quit" => "Fósil de Pájaro|Salir",
  "Fossilized Fish|Quit" => "Fósil de Pez|Salir",
  "Fossilized Drake|Fossilized Dino|Quit" => "Fósil de Dragón|Fósil de Dino|Salir",
  "Fossilized Drake|Quit" => "Fósil de Dragón|Salir",
  "Fossilized Dino|Quit" => "Fósil de Dino|Salir",
  "Yes, please|I want to try something else|Quit" =>
    "Sí, por favor|Quiero probar otra cosa|Salir",
}

path = "Data/Map092.rxdata"
map = File.open(path, "rb") { |f| Marshal.load(f) }
count = 0
map.events.each_value do |event|
  event.pages.each do |page|
    list = page.list
    list.each_with_index do |cmd, i|
      if cmd.code == 101
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
      elsif cmd.code == 102
        opts = cmd.parameters[0]
        next unless opts.is_a?(Array)
        joined = opts.join("|")
        if CHOICES.key?(joined)
          cmd.parameters[0] = CHOICES[joined].split("|")
          count += 1
        end
      end
    end
  end
end
File.open(path, "wb") { |f| Marshal.dump(map, f) }
puts "#{path}: #{count} reemplazos"
