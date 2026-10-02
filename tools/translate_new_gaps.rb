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

DICT_107 = {
  "\\bHello, I´m the Cut Master. I´m willing to give you the HM for the move Cut, which allows you to cut small trees, if you have the Meadow Badge." => "\\bHola, soy el Maestro del Corte. Estoy dispuesto a darte la MO para el movimiento Corte, que te permite cortar árboles pequeños, si tenés la Medalla Pradera.",
  "\\bOh, that looks like the Meadow Badge. Well then, here you go." => "\\bAh, esa parece ser la Medalla Pradera. Bueno, entonces, acá tenés.",
  "\\bOh, you don´t have the badge yet? Then I´m afraid I can´t give you the HM yet. Come back once you defeated Rose." => "\\bAh, ¿todavía no tenés la medalla? Entonces me temo que no puedo darte la MO todavía. Volvé cuando hayas vencido a Rose.",
  "\\bYou will need to teach HMs to your Pokémon, but remember: These moves can´t be forgotten as easily as other moves." => "\\bVas a necesitar enseñarles MOs a tus Pokémon, pero recordá: estos movimientos no se pueden olvidar tan fácilmente como los demás.",
}

DICT_116 = {
  "\\bThe technology used in Pokémon Centers is extremely advanced. I think it´s the best invention since the Pokéball." => "\\bLa tecnología que se usa en los Centros Pokémon es extremadamente avanzada. Creo que es el mejor invento desde la Poké Ball.",
}

DICT_120 = {
  "\\bHello, I´m the Rock Smash Master. I will give you the HM for Rock Smash, if you have the Pool badge." => "\\bHola, soy el Maestro de Golpe Roca. Te voy a dar la MO de Golpe Roca, si tenés la Medalla Piscina.",
  "\\bYup, that´s the Pool Badge right there. Here you go then." => "\\bSip, esa es la Medalla Piscina. Bueno, entonces, acá tenés.",
  "\\bWait, you don´t have that badge yet? Then you´re wasting my time. Come back once you claimed the Pool Badge in Silver Peak." => "\\bEsperá, ¿todavía no tenés esa medalla? Entonces me estás haciendo perder el tiempo. Volvé cuando hayas conseguido la Medalla Piscina en Pico Plata.",
  "\\bSome Pokémon actually learn these HM moves without needing the HM. This can be annoying if you don´t want them to know that move." => "\\bAlgunos Pokémon en realidad aprenden estos movimientos de MO sin necesitar la MO. Esto puede ser molesto si no querés que sepan ese movimiento.",
  "\\bLuckily, there´s a guy in every Pokémon Center that can make them forget it. These guys are the real heroes." => "\\bPor suerte, hay un tipo en cada Centro Pokémon que puede hacer que lo olviden. Esos tipos son los verdaderos héroes.",
}

DICT_121 = {
  "Cobalion is thankful for saving Keldeo. It wants to challenge you!" => "Cobalion está agradecido por haber salvado a Keldeo. ¡Quiere desafiarte!",
  "\\bCOBAAA!!!" => "\\b¡¡¡COBAAA!!!",
  "Cobalion disappeared. Will it come back?" => "Cobalion desapareció. ¿Volverá?",
  "\\bGiovanni: What are you doing here?! You were supposed to guard the entrance!" => "\\bGiovanni: ¡¿Qué estás haciendo acá?! ¡Se suponía que tenías que vigilar la entrada!",
  "\\bWait a minute...\\nIt´s you!" => "\\bEsperá un momento...\\n¡Sos vos!",
  "\\bHow can you be interfering with my plans again? I already showed you that it´s pointless to challenge me." => "\\b¿Cómo podés estar interfiriendo con mis planes otra vez? Ya te demostré que no tiene sentido desafiarme.",
  "\\bI thought you were wise enough to stay away, but now you´re here again. Unbelievable." => "\\bPensé que eras lo suficientemente sabio como para mantenerte alejado, pero acá estás de nuevo. Increíble.",
  "\\bEither way, I have no time for this now. You there, remove him!" => "\\bDe cualquier forma, no tengo tiempo para esto ahora. ¡Vos, sacalo de acá!",
  "\\bGiovanni: Usually this would anger me, but I´m about done here. Don´t follow us." => "\\bGiovanni: Normalmente esto me enojaría, pero ya casi termino acá. No nos sigas.",
  "\\bBoss, is everything going according to plan?" => "\\bJefe, ¿todo está saliendo según lo planeado?",
  "\\bDon´t worry, boss. There was no one around when I left." => "\\bNo se preocupe, jefe. No había nadie cerca cuando me fui.",
  "\\bOh..." => "\\bOh...",
  "\\bYou heard the boss. It´s time for you to leave!" => "\\bYa escuchaste al jefe. ¡Es hora de que te vayas!",
}

DICT_211 = {
  "\\bWe would battle you, but with just one Pokémon on your team, this wouldn´t be fair." => "\\bTe combatiríamos, pero con un solo Pokémon en tu equipo, no sería justo.",
  "\\bWe´re freezing out here, but we still want to battle!" => "\\bNos estamos congelando acá afuera, ¡pero igual queremos combatir!",
  "\\bI don´t care about the weather as long as I´m with my girl." => "\\bNo me importa el clima mientras esté con mi chica.",
  "It´s an ancient tomb. A dark aura is filling the air." => "Es una tumba antigua. Un aura oscura llena el aire.",
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo se iluminó!",
  "An ominous creature is coming out of the tomb!" => "¡Una criatura ominosa está saliendo de la tumba!",
  "\\bPAOOOOO!!!" => "\\b¡¡¡PAOOOOO!!!",
  "It´s an ancient tomb." => "Es una tumba antigua.",
  "Chien-Pao returned to its tomb. Will it come out again?" => "Chien-Pao volvió a su tumba. ¿Saldrá de nuevo?",
  "\\bIf we battle now, then we´re all gonna heat up again!" => "\\b¡Si combatimos ahora, todos vamos a entrar en calor de nuevo!",
  "\\bThanks for the battle. We aren´t freezing anymore." => "\\bGracias por el combate. Ya no nos estamos congelando.",
  "\\bTime to freeze!" => "\\b¡Hora de congelarse!",
  "\\bIce-Type Pokémon are rare in the Delta Region. This is one of the only places you can find them." => "\\bLos Pokémon de tipo Hielo son raros en la Región Delta. Este es uno de los pocos lugares donde se los puede encontrar.",
  "Glastrier is staring at you." => "Glastrier te está mirando fijo.",
  "It wants to battle!" => "¡Quiere combatir!",
  "\\bGLAAAS!!!" => "\\b¡¡¡GLAAAS!!!",
  "Glastrier disappeared. Will it come back?" => "Glastrier desapareció. ¿Volverá?",
  "\\bWhat are we, some kinda Arctic Monkeys?" => "\\b¿Qué somos, una especie de Arctic Monkeys?",
  "\\bI should start a band. And I think I already know its name." => "\\bDebería formar una banda. Y creo que ya sé cómo se va a llamar.",
  "\\bWe´re called Cool Trainers for a reason!" => "\\b¡Nos llaman Entrenadores Guay por algo!",
  "\\bTrainers who have mastered these conditions are truly special." => "\\bLos entrenadores que dominaron estas condiciones son realmente especiales.",
  "\\bI´m gonna melt you!" => "\\b¡Te voy a derretir!",
  "\\bThis is not my kind of weather, but my Charizard keeps me warm." => "\\bEste no es mi tipo de clima, pero mi Charizard me mantiene caliente.",
}

DICT_231 = {
  "\\bThis is the perfect place for a battle!" => "\\b¡Este es el lugar perfecto para un combate!",
  "\\bYou´ve almost made it to Granite Heights, but can you win against the Gym Leader?" => "\\bYa casi llegás a Alta Roca, ¿pero podés ganarle al Líder de Gimnasio?",
  "\\bLet me capture the emotions of a trainer in battle!" => "\\b¡Dejame capturar las emociones de un entrenador en combate!",
  "\\bLook at the result, I think I captured your passion quite well." => "\\bMirá el resultado, creo que capturé bastante bien tu pasión.",
  "\\bI only need my mental strength to beat you!" => "\\b¡Solo necesito mi fuerza mental para vencerte!",
  "\\bLooks like you need mental AND physical strength to succeed." => "\\bParece que necesitás fuerza mental Y física para tener éxito.",
  "It´s a shrine dedicated to Thundurus." => "Es un santuario dedicado a Thundurus.",
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo se iluminó!",
  "Something powerful is approaching!" => "¡Algo poderoso se acerca!",
  "\\bTHUUUUUN!!!" => "\\b¡¡¡THUUUUUN!!!",
  "Thundurus disappeared. Will it come back?" => "Thundurus desapareció. ¿Volverá?",
  "\\bI need more money for the casino!" => "\\b¡Necesito más dinero para el casino!",
  "\\bI gambled my life savings away once, so I might as well do it twice." => "\\bYa aposté todos mis ahorros de toda la vida una vez, así que bien podría hacerlo de nuevo.",
}

apply("Data/Map107.rxdata", DICT_107)
apply("Data/Map116.rxdata", DICT_116)
apply("Data/Map120.rxdata", DICT_120)
apply("Data/Map121.rxdata", DICT_121)
apply("Data/Map211.rxdata", DICT_211)
apply("Data/Map231.rxdata", DICT_231)
