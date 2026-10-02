# encoding: UTF-8
require_relative "rpg_stubs"

DICT_145 = {
  "\\bIt´s about to get heavy!" => "\\b¡Esto se va a poner intenso!",
  "\\bWith so many Pokémon living here, some of them must share my music taste." =>
    "\\bCon tantos Pokémon viviendo aquí, seguro que algunos comparten mi gusto musical.",
  "\\bWhat brings you to this crater?" => "\\b¿Qué te trae a este cráter?",
  "\\bRoute 8 has a lot of craters. That´s part of the reason why so many Pokémon live here." =>
    "\\bLa Ruta 8 tiene muchos cráteres. Esa es parte de la razón por la que viven aquí tantos Pokémon.",
  "\\bOi, kiddo! Who allowed you to enter my territory." => "\\b¡Oye, chaval! ¿Quién te dio permiso para entrar en mi territorio?",
  "\\bI´m sorry, boss. I didn´t mean to anger you." => "\\bLo siento, jefe. No quería enfadarte.",
  "\\bWe would battle you, but with just one Pokémon on your team, this wouldn´t be fair." =>
    "\\bTe combatiríamos, pero con solo un Pokémon en tu equipo, esto no sería justo.",
  "\\bYou´re going to lose! I can read my sisters mind!" => "\\b¡Vas a perder! ¡Puedo leer la mente de mi hermana!",
  "\\bIf I try hard enough, I can see what she thinks." => "\\bSi me esfuerzo lo suficiente, puedo ver qué piensa.",
  "\\bOh, you want to visit my Berry Garden? Then convince me to let you in!" =>
    "\\bOh, ¿quieres visitar mi Jardín de Bayas? ¡Entonces convénceme de dejarte entrar!",
  "\\bMy garden is your garden. Take what you need." => "\\bMi jardín es tu jardín. Toma lo que necesites.",
  "\\bMy sister and I never lose, and we´ll show you!" => "\\b¡Mi hermana y yo nunca perdemos, y te lo demostraremos!",
  "\\bShe thinks she can read my mind, but she just has ADHD." => "\\bCree que puede leer mi mente, pero solo tiene TDAH.",
  "Remina´s Berry Garden" => "Jardín de Bayas de Remina",
}

DICT_146 = {
  "\\bAbove you!" => "\\b¡Encima de ti!",
  "\\bThe birds on Route 8 are really strong. You should catch some of them." =>
    "\\bLas aves de la Ruta 8 son muy fuertes. Deberías atrapar algunas.",
  "\\bHey, you! Look at what I caught!" => "\\b¡Ey, tú! ¡Mira lo que atrapé!",
  "\\bHaving a fishing rod on Route 8 is awesome! There are a ton of Pokémon in these ponds!" =>
    "\\b¡Tener una caña de pescar en la Ruta 8 es genial! ¡Hay un montón de Pokémon en estos estanques!",
  "\\bWAIT!" => "\\b¡ESPERA!",
  "\\bDon´t just go up that hill! Lilligant lives at the top." =>
    "\\bNo subas esa colina así como así. Lilligant vive en la cima.",
  "\\bOh, but this is not a normal Lilligant. This one is from ancient times. Don´t disturbe its peace, you will just anger it!" =>
    "\\bOh, pero esta no es una Lilligant normal. Esta es de tiempos antiguos. No perturbes su paz, ¡solo conseguirás enfadarla!",
  "\\bThis form of Lilligant should be extinct..." => "\\bEsta forma de Lilligant debería estar extinta...",
  "\\bHey! That´s where I was gonna put my tent!" => "\\b¡Ey! ¡Ahí es donde iba a poner mi tienda!",
  "\\bI love camping at this lake." => "\\bMe encanta acampar en este lago.",
}

DICT_147 = {
  "\\bLet´s have a battle in the sandstorm!" => "\\b¡Combatamos en la tormenta de arena!",
  "\\bYou should cover your eyes on this part of Route 8. The sand can be annoying at times." =>
    "\\bDeberías cubrirte los ojos en esta parte de la Ruta 8. La arena puede ser molesta a veces.",
  "\\bThe hot wind is blowing!" => "\\b¡Sopla el viento cálido!",
  "\\bI thrive in this environment." => "\\bProspero en este entorno.",
  "\\bThe sandstorm makes me strong!" => "\\b¡La tormenta de arena me hace fuerte!",
  "\\bSand gets blown into this valley constantly. That´s why the sandstorm never stops." =>
    "\\bLa arena entra constantemente en este valle. Por eso la tormenta de arena nunca cesa.",
  "It´s an ancient tomb. A dark aura is filling the air." => "Es una tumba antigua. Un aura oscura llena el aire.",
  "An ominous creature is coming out of the tomb!" => "¡Una criatura siniestra está saliendo de la tumba!",
  "\\bLUUUUU!!!" => "\\b¡LUUUUU!!!",
  "It´s an ancient tomb." => "Es una tumba antigua.",
  "Ting-Lu returned to its tomb. Will it come out again?" => "Ting-Lu regresó a su tumba. ¿Saldrá de nuevo?",
}

DICT_148 = {
  "Glimmerwood" => "Bosque Lumínico",
  "\\bLILLIGAAAAA!!!" => "\\b¡LILLIGAAAAA!!!",
  "\\bHey hey, you look like you need a good battle!" => "\\b¡Ey, ey, parece que necesitas un buen combate!",
  "\\bIf you go north from here, you´ll get to Route 12." => "\\bSi vas hacia el norte desde aquí, llegarás a la Ruta 12.",
  "\\bWanna see my cool tricks?" => "\\b¿Quieres ver mis trucos geniales?",
  "\\bYou should try to learn my tricks. They won´t help you in battle, but they´re great for parties!" =>
    "\\bDeberías intentar aprender mis trucos. No te ayudarán en combate, ¡pero son geniales para fiestas!",
  "\\bArthur: Be honest with me, \\PN, what´s going on with you and these Team Rocket guys?" =>
    "\\bArthur: Sé sincero conmigo, \\PN, ¿qué está pasando entre tú y esos tipos del Team Rocket?",
  "\\bI didn´t think that they were actually back, but the second that I want to do something about it, you´ve already removed them on your own." =>
    "\\bNo pensé que de verdad habían vuelto, pero en el momento en que quiero hacer algo al respecto, tú ya los has eliminado por tu cuenta.",
  "\\bYou were doing a Champion´s job before you made it to the league, no wonder I lost against you." =>
    "\\bEstabas haciendo el trabajo de un Campeón antes de siquiera llegar a la liga, no me extraña que perdiera contra ti.",
  "\\bWould you mind telling me about everything that happened? Don´t worry, I have time." =>
    "\\b¿Te importaría contarme todo lo que pasó? No te preocupes, tengo tiempo.",
  "\\bWow, you are really brave. You faced a dangerous criminal organisation all on your own, without asking for help?!" =>
    "\\bVaya, de verdad eres valiente. ¿¡Te enfrentaste a una peligrosa organización criminal tú solo, sin pedir ayuda?!",
  "\\bSomething about you frightens me, you know? But now that I´m up to date, let me lend you a hand." =>
    "\\bHay algo en ti que me asusta, ¿sabes? Pero ahora que estoy al día, déjame echarte una mano.",
  "\\bWHAT WAS THAT?!" => "\\b¡¿QUÉ FUE ESO?!",
  "\\bOh, you´re saying that noise was Kyurem?" => "\\bOh, ¿me estás diciendo que ese ruido era Kyurem?",
  "\\bWait, let me put these pieces together real quick." => "\\bEspera, déjame atar cabos rápidamente.",
  "\\bAha! I have a theory, so listen up!" => "\\b¡Ajá! Tengo una teoría, ¡así que escucha!",
  "\\bYou said that you found your Z-Power Ring in Aurora Mountain, the same place where Kyurem was sealed?" =>
    "\\b¿Dijiste que encontraste tu Anillo Z en el Monte Aurora, el mismo lugar donde estaba sellado Kyurem?",
  "\\bAnd that the Icium Z was in that cave as well?" => "\\b¿Y que el Cristal Z Hielo también estaba en esa cueva?",
  "\\bThis Anthony guy must´ve opened the true entrance to the Z-Crystal Cave, then. These Crystals are clearly linked to Kyurem." =>
    "\\bEntonces este tal Anthony debió de abrir la verdadera entrada a la Cueva de los Cristales Z. Estos cristales están claramente vinculados a Kyurem.",
  "\\bAll of this seems to be connected, there is no other way." => "\\bTodo esto parece estar conectado, no hay otra explicación.",
  "\\bKeldeo, Kyurem, the Swords of Justice, Genesect. Anthony knows something that we don´t, and that worries me." =>
    "\\bKeldeo, Kyurem, las Espadas de la Justicia, Genesect. Anthony sabe algo que nosotros no, y eso me preocupa.",
  "\\bOh no, oh nooooooo. Kyurem..." => "\\bOh no, oh nooooooo. Kyurem...",
  "\\bKyurem..." => "\\bKyurem...",
  "\\bIf Kyurem is involved in all of this, then there are two Pokémon that will play a roll in this as well." =>
    "\\bSi Kyurem está involucrado en todo esto, entonces hay dos Pokémon más que también tendrán un papel en esto.",
  "\\bZekrom and Reshiram, the legendary dragons." => "\\bZekrom y Reshiram, los dragones legendarios.",
  "\\bAnthony somehow got hold of Genesect, which was believed to be extinct." =>
    "\\bAnthony de alguna manera se hizo con Genesect, que se creía extinto.",
  "\\bI have a feeling that the true treasure of the Z-Crystal Cave aren´t the Crystals, but something much stronger." =>
    "\\bTengo la sensación de que el verdadero tesoro de la Cueva de los Cristales Z no son los cristales, sino algo mucho más fuerte.",
  "\\bLet me tell you my plan. I have a certain device that could help us in this situation, but you´ll have to catch Kyurem." =>
    "\\bDéjame contarte mi plan. Tengo cierto dispositivo que podría ayudarnos en esta situación, pero tendrás que atrapar a Kyurem.",
  "\\bThe opening of the Z-Crystal Cave must have angered it, but that means you should be able to find it." =>
    "\\bLa apertura de la Cueva de los Cristales Z debió de enfurecerlo, pero eso significa que deberías poder encontrarlo.",
  "\\bI want you to have my only Master Ball, because you need to catch Kyurem. I have a feeling that we need it." =>
    "\\bQuiero que te quedes con mi única Master Ball, porque necesitas atrapar a Kyurem. Tengo el presentimiento de que la necesitamos.",
  "\\bWe´ll meet on Southside Beach. Good luck!" => "\\bNos encontraremos en la Playa del Sur. ¡Buena suerte!",
  "Uxie looks frightened." => "Uxie parece asustado.",
  "It wants to battle!" => "¡Quiere combatir!",
  "\\bXIEEE!!!" => "\\b¡XIEEE!!!",
  "Uxie disappeared. Will it come back?" => "Uxie desapareció. ¿Volverá?",
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

apply("Data/Map145.rxdata", DICT_145)
apply("Data/Map146.rxdata", DICT_146)
apply("Data/Map147.rxdata", DICT_147)
apply("Data/Map148.rxdata", DICT_148)
