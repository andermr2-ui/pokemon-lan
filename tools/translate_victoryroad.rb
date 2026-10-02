# encoding: UTF-8
require_relative "rpg_stubs"

def apply(path, dict, choices = {})
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
          next unless dict.key?(full)
          cmd.parameters[0] = dict[full]
          ((i + 1)...j).each { |k| list[k].parameters[0] = "" }
          count += 1
        elsif cmd.code == 102
          opts = cmd.parameters[0]
          next unless opts.is_a?(Array)
          joined = opts.map { |o| o.dup.force_encoding("UTF-8") }.join("|")
          if choices.key?(joined)
            cmd.parameters[0] = choices[joined].split("|")
            count += 1
          end
        end
      end
    end
  end
  File.open(path, "wb") { |f| Marshal.dump(map, f) }
  puts "#{path}: #{count} reemplazos"
end

DICT_235 = {
  "SCANNING FOR BADGES..." => "ESCANEANDO MEDALLAS...",
  "MEADOW BADGE DETECTED" => "MEDALLA PRADERA DETECTADA",
  "SOLAR BADGE DETECTED" => "MEDALLA SOLAR DETECTADA",
  "POOL BADGE DETECTED" => "MEDALLA PISCINA DETECTADA",
  "EVOLUTION BADGE DETECTED" => "MEDALLA EVOLUCIÓN DETECTADA",
  "VOLT BADGE DETECTED" => "MEDALLA VOLTIO DETECTADA",
  "ARACHNO BADGE DETECTED" => "MEDALLA ARACNO DETECTADA",
  "STANDARD BADGE DETECTED" => "MEDALLA ESTÁNDAR DETECTADA",
  "MAGNET BADGE DETECTED" => "MEDALLA MAGNETO DETECTADA",
  "MISSING BADGES DETECTED..." => "FALTAN MEDALLAS...",
  "ACCESS DENIED!" => "¡ACCESO DENEGADO!",
  "ALL BADGES DETECTED..." => "TODAS LAS MEDALLAS DETECTADAS...",
  "ACCESS GRANTED!" => "¡ACCESO CONCEDIDO!",
}

DICT_239 = {
  "\\bIt´s time for an experiment!" => "\\b¡Es hora de un experimento!",
  "\\bFrom here on out, the trainers will only get stronger. I hope you´ve brought enough potions." => "\\bDe acá en más, los entrenadores solo se van a poner más fuertes. Espero que hayas traído suficientes pociones.",
  "\\bMy Pokémon will obey, no matter what, so you stand no chance!" => "\\b¡Mis Pokémon me van a obedecer pase lo que pase, así que no tenés ninguna chance!",
  "\\bLooks like I should bond with my Pokémon more..." => "\\bParece que debería vincularme más con mis Pokémon...",
  "\\bPlay time´s over, this is Victory Road!" => "\\b¡Se acabó el jueguito, esto es la Avenida Victoriosa!",
  "\\bSeems like you´re off to a great start! But don´t underestimate the trainers on Victory Road, they´re as determined as you." => "\\b¡Parece que estás arrancando genial! Pero no subestimes a los entrenadores de la Avenida Victoriosa, son tan decididos como vos.",
  "\\bI need more training if I want to challenge the Pokémon League, so let´s battle!" => "\\bNecesito más entrenamiento si quiero retar a la Liga Pokémon, ¡así que combatamos!",
  "\\bI will challenge the League, but you´ll make it there first." => "\\bVoy a retar a la Liga, pero vos vas a llegar primero.",
}

DICT_240 = {
  "\\bWe would battle you, but with just one Pokémon on your team, this wouldn´t be fair." => "\\bTe combatiríamos, pero con un solo Pokémon en tu equipo, no sería justo.",
  "\\bI hope they´ll allow two Champions, because I want to stay with Rose!" => "\\bEspero que permitan dos Campeones, ¡porque quiero quedarme con Rose!",
  "\\bWe´ll come back stronger, and then we´ll crush the league!" => "\\bVamos a volver más fuertes, ¡y ahí vamos a aplastar a la liga!",
  "\\bI need to become Champion, so I can challenge Diantha, my idol. Let´s train!" => "\\bNecesito convertirme en Campeón, para poder retar a Diantha, mi ídola. ¡Entrenemos!",
  "\\bOne day, I will challenge Diantha, and nothing will stop me!" => "\\bAlgún día, voy a retar a Diantha, ¡y nada me va a detener!",
  "\\bWe´ll challenge the League together, and you´re in our way!" => "\\bVamos a retar a la Liga juntos, ¡y vos estás en nuestro camino!",
  "\\bDon´t think that this will knock us down. We´ll never give up!" => "\\bNo pienses que esto nos va a tirar abajo. ¡Nunca nos vamos a rendir!",
}

DICT_241 = {
  "It´s a Pokémon Statue dedicated to Volcanion." => "Es una estatua Pokémon dedicada a Volcanion.",
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo se iluminó!",
  "Something powerful is approaching!" => "¡Algo poderoso se acerca!",
  "\\bVOLCAAA!!!" => "\\b¡¡¡VOLCAAA!!!",
  "Volcanion disappeared. Will it come back?" => "Volcanion desapareció. ¿Volverá?",
  "\\bCan´t outstall THE WALL!" => "\\b¡No podés superar a EL MURO por resistencia!",
  "\\bYou did it. You actually oustalled THE WALL! But can you outpizza the Hut?" => "\\bLo lograste. ¡De verdad superaste a EL MURO! ¿Pero podés superar a la pizzería?",
  "Solgaleo is staring at you." => "Solgaleo te está mirando fijo.",
  "\\bLEOOO!!!" => "\\b¡¡¡LEOOO!!!",
  "Lunala is staring at you." => "Lunala te está mirando fijo.",
  "\\bLUNAAA!!!" => "\\b¡¡¡LUNAAA!!!",
  "Solgaleo disappeared. Will it come back?" => "Solgaleo desapareció. ¿Volverá?",
  "Lunala disappeared. Will it come back?" => "Lunala desapareció. ¿Volverá?",
  "\\bAre you surprised to see a Bugcatcher on Victory Road? Let me enlighten you then!" => "\\b¿Te sorprende ver a un Cazabichos en la Avenida Victoriosa? ¡Entonces dejame iluminarte!",
  "\\bI already made it this far, so I might as well make it to the end. I don´t care if I get defeated, I will challenge the League for sure!" => "\\bYa llegué hasta acá, así que bien podría llegar hasta el final. No me importa si me derrotan, ¡voy a retar a la Liga seguro!",
  "\\bLet´s get rollin´!" => "\\b¡Arranquemos!",
  "\\bTake a look around, there´re strong Pokémon everywhere!" => "\\bMirá alrededor, ¡hay Pokémon fuertes por todos lados!",
  "\\bStrengthen your mind, for I will bring you to your limit!" => "\\bFortalecé tu mente, ¡porque te voy a llevar al límite!",
  "\\bYou have the right mindset for the Pokémon League. Those trainers are the toughest in the region." => "\\bTenés la mentalidad correcta para la Liga Pokémon. Esos entrenadores son los más duros de la región.",
  "\\bI´m ready for the League, so let me prove it!" => "\\b¡Estoy listo para la Liga, así que dejame demostrarlo!",
  "\\bOkay, maybe you´re stronger, but I will still challenge the League." => "\\bBueno, tal vez seas más fuerte, pero igual voy a retar a la Liga.",
}

DICT_242 = {
  "\\bAre you worthy of challenging the League?" => "\\b¿Sos digno de retar a la Liga?",
  "\\bIt seems like you are worthy. But don´t overestimate your skills." => "\\bParece que sos digno. Pero no sobreestimes tus habilidades.",
  "\\bAccording to my calculations, you´re gonna lose!" => "\\b¡Según mis cálculos, vas a perder!",
  "\\bPractice always beats theory..." => "\\bLa práctica siempre le gana a la teoría...",
  "\\bI might be old, but I don´t want to retire without trying my luck at the Pokémon League!" => "\\bPuede que sea viejo, ¡pero no me quiero retirar sin probar suerte en la Liga Pokémon!",
  "\\bYou caught me off guard, but don´t think I lack the spirit!" => "\\bMe agarraste desprevenido, ¡pero no pienses que me falta el espíritu!",
  "\\bI´ve grown tired of sailing. I want to be Pokémon Champion!" => "\\bYa me cansé de navegar. ¡Quiero ser el Campeón Pokémon!",
  "\\bMaybe I´ll start sailing again, this whole trainer thing can only go so far." => "\\bTal vez vuelva a navegar, esto de ser entrenador tiene un límite.",
}

DICT_243 = {
  "\\bOh, what a surprise. I just came across a trainer for the first time in weeks, and now there´s another one." => "\\bAh, qué sorpresa. Me acabo de cruzar con un entrenador por primera vez en semanas, y ahora aparece otro.",
  "\\bI´m the Waterfall Master, and I award those trainers who completed the Gym Challenge with the HM for Waterfall." => "\\bSoy el Maestro de Cascada, y les entrego la MO de Cascada a los entrenadores que completaron el Reto de Gimnasios.",
  "\\bWhile there aren´t that many waterfalls in this region, you do need this move to reach the Pokémon League." => "\\bAunque no hay tantas cascadas en esta región, sí necesitás este movimiento para llegar a la Liga Pokémon.",
  "\\bYou probably want to challenge the League as soon as possible, so I don´t want to hold you up any longer. Here, take this." => "\\bSeguramente querés retar a la Liga lo antes posible, así que no te quiero retener más. Tomá, quedate con esto.",
  "\\bI wish you the best of luck for the Pokémon League. I´m off to Riverstone to play some slots. Bye!" => "\\bTe deseo la mejor de las suertes para la Liga Pokémon. Yo me voy a Río el Último a jugar a las tragamonedas. ¡Chau!",
}

DICT_244 = {
  "Ho-Oh seems to be curious. It looks thankful." => "Ho-Oh parece curioso. Se lo ve agradecido.",
  "It wants to challenge you to a battle!" => "¡Quiere retarte a un combate!",
  "\\bHOOOOOO!!!" => "\\b¡¡¡HOOOOOO!!!",
  "Ho-Oh disappeared. Will it come back?" => "Ho-Oh desapareció. ¿Volverá?",
  "\\bLook, the Pokémon League is just over there! Good thing that dude with the HM for Waterfall was just at the exit of the cave, because we´ll need that now." => "\\bMirá, ¡la Liga Pokémon está justo ahí! Menos mal que ese tipo con la MO de Cascada estaba justo a la salida de la cueva, porque ahora la vamos a necesitar.",
  "\\bI´m Theodor, and I´m about to become Champion. How about one more battle before we challenge the League?" => "\\bSoy Theodor, y estoy a punto de convertirme en Campeón. ¿Qué tal un combate más antes de retar a la Liga?",
  "\\bOur Pokémon might need that extra bit of training, because I don´t plan on losing. Are you ready? Let´s do this!" => "\\bNuestros Pokémon capaz necesitan ese entrenamiento extra, porque no pienso perder. ¿Estás listo? ¡Vamos a esto!",
  "\\bWow, you´re super strong! You´re the stronest trainer I´ve ever battled so far. This isn´t gonna change my approach now." => "\\bGuau, ¡sos superfuerte! Sos el entrenador más fuerte contra el que combatí hasta ahora. Esto no va a cambiar mi enfoque ahora.",
  "\\bI´m just gonna go in first and then I´ll become Champion before you even make it to the League. Haha, I´m a genius!" => "\\bSimplemente voy a entrar primero y me voy a convertir en Campeón antes de que vos siquiera llegues a la Liga. Jaja, ¡soy un genio!",
}

DICT_287 = {
  "It´s a large stature resembling a Pokémon." => "Es una gran estatua que se parece a un Pokémon.",
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo se iluminó!",
  "The stature is coming to life!" => "¡La estatua está cobrando vida!",
  "\\bDRAGOOO!!!" => "\\b¡¡¡DRAGOOO!!!",
  "Regidrago went back into a deep slumber. Will it wake up again?" => "Regidrago volvió a un sueño profundo. ¿Despertará de nuevo?",
}

apply("Data/Map235.rxdata", DICT_235)
apply("Data/Map239.rxdata", DICT_239)
apply("Data/Map240.rxdata", DICT_240)
apply("Data/Map241.rxdata", DICT_241)
apply("Data/Map242.rxdata", DICT_242)
apply("Data/Map243.rxdata", DICT_243)
apply("Data/Map244.rxdata", DICT_244)
apply("Data/Map287.rxdata", DICT_287)
