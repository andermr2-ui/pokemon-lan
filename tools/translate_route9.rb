# encoding: UTF-8
require_relative "rpg_stubs"

DICT_167 = {
  "\\bIt´s rock or bust!" => "\\b¡Es rock o nada!",
  "\\bIf you like rock music as much as I do, you need to visit the Roggenrola Festival in Unova. I´ve been there 5 times so far, and I want to go again!" =>
    "\\bSi te gusta el rock tanto como a mí, tenés que visitar el Festival Roggenrola en Unova. Ya fui 5 veces, ¡y quiero volver!",
  "\\bOnly the most talented trainers are allowed to become Pokémon Rangers. Let me show you!" =>
    "\\bSolo a los entrenadores más talentosos se les permite convertirse en Rangers Pokémon. ¡Dejame mostrarte!",
  "\\bIf I had a Pokémon Ranger application form with me, I would give it to you. You have what it takes to become one of us!" =>
    "\\bSi tuviera un formulario de solicitud para Ranger Pokémon conmigo, te lo daría. ¡Tenés lo que hace falta para ser uno de nosotros!",
  "\\bWe have rare Pokémon, and they´re strong!" => "\\b¡Tenemos Pokémon raros, y son fuertes!",
  "\\bThe other Pokémon Rangers also use these rare Pokémon, which are sometimes gifted to young trainers who are starting their journey." =>
    "\\bLos demás Rangers Pokémon también usan estos Pokémon raros, que a veces se les regalan a jóvenes entrenadores que empiezan su viaje.",
  "\\bThese special Pokémon are hard to come across in the wild, but there is a place in the Delta Region where you can find them." =>
    "\\bEstos Pokémon especiales son difíciles de encontrar en estado salvaje, pero hay un lugar en la Región Delta donde podés encontrarlos.",
  "Mesprit looks confused." => "Mesprit parece confundido.",
  "It wants to battle!" => "¡Quiere combatir!",
  "\\bSPRIIIIIIT!!!" => "\\b¡SPRIIIIIIT!!!",
  "Mesprit disappeared. Will it come back?" => "Mesprit desapareció. ¿Volverá?",
}

DICT_171 = {
  "\\bOn your way to the Whispering Woods? Then you gotta get past me first!" =>
    "\\b¿Vas rumbo al Bosque Susurrante? ¡Entonces primero tenés que pasarme a mí!",
  "\\bIf you want to get to Ambergrove, going through the Whispering Woods is the shortest way." =>
    "\\bSi querés llegar a Arboleda Ámbar, pasar por el Bosque Susurrante es el camino más corto.",
  "\\bI´m sorry, but no one is allowed to enter Crystal Harbor at the moment. Pokéwood Studios arefilming for a movie here, and you can´t interrupt them." =>
    "\\bLo siento, pero por el momento nadie puede entrar a Puerto Cristal. Pokéwood Studios está filmando una película acá, y no podés interrumpirlos.",
}

DICT_173 = {
  "\\bTurn around kid, there are weird people in this forest." =>
    "\\bDate la vuelta, chico, hay gente rara en este bosque.",
  "\\bEven though this is the shortest way to Ambergrove, please go the long way. The people here should not be anywhere near kids." =>
    "\\bAunque este es el camino más corto a Arboleda Ámbar, por favor andá por el largo. La gente de acá no debería estar cerca de chicos.",
  "Zacian is staring at you." => "Zacian te está mirando fijo.",
  "It wants to battle!" => "¡Quiere combatir!",
  "\\bZAAAAA!!!" => "\\b¡ZAAAAA!!!",
  "Zacian disappeared. Will it come back?" => "Zacian desapareció. ¿Volverá?",
  "\\bDid you know that in terms of male human and female Pokémon breeding, Vaporeon is the most compatible Pokémon for humans?" =>
    "\\b¿Sabías que, en cuanto a la cría entre humanos machos y Pokémon hembra, Vaporeon es el Pokémon más compatible con los humanos?",
  "\\bDon´t disrespect my authority!" => "\\b¡No le faltes el respeto a mi autoridad!",
  "\\bOh, hi, what is your bodycount?" => "\\bOh, hola, ¿cuál es tu bodycount?",
  "\\bMy body count is 1. But if we inlcude Pokémon..." =>
    "\\bMi bodycount es 1. Pero si incluimos Pokémon...",
  "\\bOh, aren´t you a cute one? " => "\\bOh, ¿no sos lindo/a vos? ",
  "\\bI can show you a secret, but you can´t tell your parents. Are you ready?" =>
    "\\bTe puedo mostrar un secreto, pero no le podés contar a tus padres. ¿Estás listo/a?",
  "\\bAlright, follow me home. I´m gonna make you happy." =>
    "\\bBueno, seguime a casa. Te voy a hacer feliz.",
  "\\bBut I need it..." => "\\bPero lo necesito...",
  "\\bThis is no place for kids." => "\\bEste no es lugar para chicos.",
  "\\bPlease listen to me. Stay away from the freaks that hide in the Whispering Woods." =>
    "\\bPor favor, escuchame. Mantenete alejado de los raros que se esconden en el Bosque Susurrante.",
}

DICT_174 = {
  "\\bHey, what´s a kid doing in this forest? You need to leave!" =>
    "\\bEy, ¿qué hace un chico en este bosque? ¡Tenés que irte!",
  "\\bYou´ve pretty much made it to Ambergrove. Going through the Whispering Woods should not be allowed for kids, there´re too many freaks here." =>
    "\\bPrácticamente ya llegaste a Arboleda Ámbar. No deberían dejar pasar a chicos por el Bosque Susurrante, hay demasiados raros acá.",
  "\\bI´m gonna touch you!" => "\\b¡Te voy a tocar!",
  "\\bWhy are you so shy? Come one, let good ol´ Jared touch you. It won´t hurt, I promise." =>
    "\\b¿Por qué sos tan tímido? Dale, dejá que el buen Jared te toque. No va a doler, te lo prometo.",
  "\\bWe would battle you, but with just one Pokémon on your team, this wouldn´t be fair." =>
    "\\bTe combatiríamos, pero con un solo Pokémon en tu equipo, no sería justo.",
  "\\bThe people in this forest say that we´re mature for our age!" =>
    "\\b¡La gente de este bosque dice que somos maduros para nuestra edad!",
  "\\bSomeone invited us home one day, and he tickled us!" =>
    "\\bAlguien nos invitó a su casa un día, ¡y nos hizo cosquillas!",
  "\\bWe come here every day to look for the guy who invited us. But don´t tell our parents, they say he´s a bad person. But we like him!" =>
    "\\bVenimos acá todos los días a buscar al tipo que nos invitó. Pero no le digas a nuestros padres, dicen que es una mala persona. ¡Pero a nosotros nos cae bien!",
  "\\bMy Pokémon steps on me." => "\\bMi Pokémon me pisa.",
  "\\bPokémon actually understand me. A nerd like me could never get a goth mommy..." =>
    "\\bLos Pokémon en realidad me entienden. Un nerd como yo nunca podría conseguirse una mami gótica...",
}

DICT_278 = {
  "It´s an ancient plate with strange symbols." => "Es una placa antigua con símbolos extraños.",
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo acaba de brillar!",
  "Something powerful is approaching!" => "¡Algo poderoso se aproxima!",
  "\\bLELEEE!!!" => "\\b¡LELEEE!!!",
  "Tapu Lele disappeared. Will it come back?" => "Tapu Lele desapareció. ¿Volverá?",
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

apply("Data/Map167.rxdata", DICT_167)
apply("Data/Map171.rxdata", DICT_171)
apply("Data/Map173.rxdata", DICT_173)
apply("Data/Map174.rxdata", DICT_174)
apply("Data/Map278.rxdata", DICT_278)
