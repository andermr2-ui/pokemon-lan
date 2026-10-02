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

DICT_82 = {
  "\\bRumble Mountain has many strong Pokémon. Let me show you!" => "\\bLa Montaña Calada tiene muchos Pokémon fuertes. ¡Dejame mostrarte!",
  "\\bHave fun in there!" => "\\b¡Divertite ahí adentro!",
  "\\bI train at Rumble Mountain. I´m going to break you." => "\\bEntreno en la Montaña Calada. Te voy a destrozar.",
  "\\bYou can´t be broken. I respect you." => "\\bA vos no se te puede destrozar. Te respeto.",
  "Rumble Mountain" => "Montaña Calada",
}

DICT_90 = {
  "\\bLet´s paint a magical battle." => "\\bPintemos un combate mágico.",
  "\\bDid you know that it always rains on Route 4? But no matter how much it rains, Rumble Lake remains dried-up." => "\\b¿Sabías que en la Ruta 4 siempre llueve? Pero por más que llueva, el Lago Calada sigue seco.",
  "It´s a Pokémon Statue dedicated to Celebi." => "Es una estatua Pokémon dedicada a Celebi.",
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo se iluminó!",
  "Something powerful is approaching!" => "¡Algo poderoso se acerca!",
  "\\bCELEBIII!!!" => "\\b¡¡¡CELEBIII!!!",
  "Celebi disappeared. Will it come back?" => "Celebi desapareció. ¿Volverá?",
  "\\bI´m here to collect the bridge tax. Give me your money!" => "\\bVine a cobrar el peaje del puente. ¡Dame tu dinero!",
  "\\bDon´t tell anyone, but I commit tax evasion." => "\\bNo se lo digas a nadie, pero yo evado impuestos.",
  "\\bRumble Lake was the best place to go fishing..." => "\\bEl Lago Calada era el mejor lugar para pescar...",
  "\\bBut look at this, not even a single puddle in sight. Even with the rain, Rumble Lake will never be the same." => "\\bPero mirá esto, ni un charco a la vista. Aunque llueva, el Lago Calada ya nunca va a ser el mismo.",
  "\\bWell, I guess I should finally get a new hobby. I´ve waited for too long, and I´m done!" => "\\bBueno, supongo que ya es hora de conseguirme un nuevo hobby. Esperé demasiado, ¡y ya fue!",
  "\\bYou can have this, I don´t need it anymore." => "\\bPodés quedarte con esto, ya no lo necesito.",
  "\\bThis won´t help you here, but if you use it at a lake or pond, you might be able to catch something." => "\\bEsto no te va a servir acá, pero si lo usás en un lago o una laguna, quizás puedas pescar algo.",
  "\\bMaybe I should become a hiker, there are enough mountains in the region." => "\\bQuizás debería hacerme excursionista, sobran montañas en la región.",
  "\\bI need to train my Pokémon!" => "\\b¡Necesito entrenar a mis Pokémon!",
  "\\bLooks like my Pokémon need more training." => "\\bParece que mis Pokémon necesitan más entrenamiento.",
}

DICT_99 = {
  "\\bYou wouldn´t decline a challenge from a lady?" => "\\b¿No le negarías un desafío a una dama?",
  "\\bBe careful if you´re headed to the Dark Forest." => "\\bTené cuidado si vas rumbo al Bosque Oscuro.",
  "\\bGet out of my way, I´m trying to catch something!" => "\\bQuitate de mi camino, ¡estoy tratando de pescar algo!",
  "\\bLet me catch something now!" => "\\b¡Dejame pescar algo de una vez!",
}

DICT_100 = {
  "\\bI hope you had a good journey, because it ends right here!" => "\\bEspero que hayas tenido un buen viaje, ¡porque termina justo acá!",
  "\\bYou´re mighty impressive. You might be good enough to handle Mega Evolutions..." => "\\bSos bastante impresionante. Quizás estés a la altura de manejar Mega Evoluciones...",
  "It´s an ancient tomb. A dark aura is filling the air." => "Es una tumba antigua. Un aura oscura llena el aire.",
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo se iluminó!",
  "An ominous creature is coming out of the tomb!" => "¡Una criatura ominosa está saliendo de la tumba!",
  "\\bCHIEEEEEEN!!!" => "\\b¡¡¡CHIEEEEEEN!!!",
  "It´s an ancient tomb." => "Es una tumba antigua.",
  "Wo-Chien returned to its tomb. Will it come out again?" => "Wo-Chien volvió a su tumba. ¿Saldrá de nuevo?",
  "\\b???: So this is the Dark Forest? It must be here. It just has to. This time no one will stop me. I will reach my goal, and then the Delta Region is mine!" => "\\b???: ¿Así que este es el Bosque Oscuro? Tiene que estar acá. Tiene que ser acá. Esta vez nadie me va a detener. Voy a alcanzar mi objetivo, ¡y entonces la Región Delta será mía!",
  "\\bOh my, your Pokémon look tired. Let´s give them some rest." => "\\bAy, tus Pokémon se ven cansados. Dejalos descansar un poco.",
  "\\bThere we go. Be careful out there, and thanks for stopping bye!" => "\\bListo. Cuidate ahí afuera, ¡y gracias por pasar!",
  "Zamazenta is staring at you." => "Zamazenta te está mirando fijo.",
  "It wants to battle!" => "¡Quiere combatir!",
  "\\bZAAAAA!!!" => "\\b¡¡¡ZAAAAA!!!",
  "Zamazenta disappeared. Will it come back?" => "Zamazenta desapareció. ¿Volverá?",
  "Dark Forest" => "Bosque Oscuro",
  "\\bIsn´t Hiking a treat?" => "\\b¿No es una delicia el excursionismo?",
  "\\bSomeone told me that a legendary Pokémon lives in the Dark Forest. I don´t know if that´s true though." => "\\bAlguien me dijo que un Pokémon legendario vive en el Bosque Oscuro. Aunque no sé si es verdad.",
}

DICT_104 = {
  "\\bI can´t let you through at the moment. The police is chasing after a fugitive Hypno. Kids like you should stay away from that Pokémon." => "\\bNo puedo dejarte pasar por ahora. La policía está persiguiendo a un Hypno fugitivo. Chicos como vos deberían mantenerse lejos de ese Pokémon.",
  "\\bWe would battle you, but with just one Pokémon on your team, this wouldn´t be fair." => "\\bTe combatiríamos, pero con un solo Pokémon en tu equipo, no sería justo.",
  "\\bPlease, don´t disappoint us. My girlfriend is desperate for a good battle!" => "\\bPor favor, no nos decepciones. ¡Mi novia está desesperada por un buen combate!",
  "\\bThank you. She was starting to go insane..." => "\\bGracias. Estaba empezando a volverse loca...",
  "\\bThe Dark Forest let you out? Mysterious..." => "\\b¿El Bosque Oscuro te dejó salir? Misterioso...",
  "\\bMaybe the Dark Forest respected you?" => "\\b¿Quizás el Bosque Oscuro te respetó?",
  "\\bI´m not a Cue Ball! I´m just a guy that likes bikes!" => "\\b¡No soy una Bola de Billar! ¡Solo soy un tipo al que le gustan las bicis!",
  "\\bMy bike sadly won´t make it to Silver Peak. Not with Iron Mountain in the way." => "\\bLamentablemente mi bici no va a llegar hasta Pico Plata. No con el Monte Hierro en el medio.",
  "\\bWe are craving a good battle. Please, don´t disappoint us." => "\\bTenemos ganas de un buen combate. Por favor, no nos decepciones.",
  "\\bOur needs have been fulfilled." => "\\bNuestras ganas fueron satisfechas.",
}

DICT_106 = {
  "\\bHello Trainer. This is the entrance to Iron Mountain. If you want to get to Silver Peak, this is the only path that leads there." => "\\bHola, Entrenador. Esta es la entrada al Monte Hierro. Si querés llegar a Pico Plata, este es el único camino que lleva ahí.",
  "\\bYou need to be prepared for this journey, as Iron Mountain is inhabitet by Pokémon that are as hard as steel and as mighty as dragons." => "\\bTenés que estar preparado para este viaje, porque el Monte Hierro está habitado por Pokémon tan duros como el acero y tan poderosos como los dragones.",
  "\\bDo you also want to find the ancient ruins of Iron Mountain?" => "\\b¿Vos también querés encontrar las ruinas antiguas del Monte Hierro?",
  "\\bYou should investigate some of the ruins in Iron Mountain. They hold ancient knowledge." => "\\bDeberías investigar algunas de las ruinas del Monte Hierro. Guardan conocimiento antiguo.",
}

DICT_112 = {
  "\\bWhy do these bridges have no guardrail?" => "\\b¿Por qué estos puentes no tienen baranda?",
  "\\bI should add some guardrails to this bridge. This is too dangerous otherwise." => "\\bDebería agregarle barandas a este puente. Si no, es demasiado peligroso.",
}

DICT_113 = {
  "\\bI´m sorry, but you can´t use the bridge at the moment. We´re doing necessary repairs to ensure its safety." => "\\bLo siento, pero no podés usar el puente por ahora. Estamos haciendo las reparaciones necesarias para garantizar su seguridad.",
  "\\bWAIT!!!" => "\\b¡¡¡ESPERÁ!!!",
  "\\bAzura: Good thing that you´re still here. I saw some weird looking guys leaving the Iron Shrine, and then I saw you. What happened there?" => "\\bAzura: Qué bueno que todavía estás acá. Vi a unos tipos de aspecto raro saliendo del Santuario de Hierro, y después te vi a vos. ¿Qué pasó ahí?",
  "\\bMh, okay. So there was a guy called Giovanni, a strong looking Pokémon and a guy from a group called Team Rocket?" => "\\bMh, okay. Así que había un tipo llamado Giovanni, un Pokémon de aspecto fuerte y un tipo de un grupo llamado Team Rocket, ¿no?",
  "\\bWait, and you´re saying that this Giovanni was at the Flower Meadow with a Pokémon called Virizion as well?" => "\\bEsperá, ¿y decís que este Giovanni también estuvo en la Pradera Florida con un Pokémon llamado Virizion?",
  "\\bVirizion..." => "\\bVirizion...",
  "\\bWhere have I heard that name before? Hmm..." => "\\b¿Dónde escuché ese nombre antes? Mmm...",
  "\\bAHA! I remember now! Virizion is a legendary Pokémon. The Flower Meadow is a sacred place dedicated to it." => "\\b¡AJÁ! ¡Ya me acuerdo! Virizion es un Pokémon legendario. La Pradera Florida es un lugar sagrado dedicado a él.",
  "\\bAnd, if this Giovanni visited Virizion at the Flower Meadow, then the Pokémon you saw at the Iron Shrine..." => "\\bY si este Giovanni visitó a Virizion en la Pradera Florida, entonces el Pokémon que viste en el Santuario de Hierro...",
  "\\b... is Cobalion! Cobalion is another legendary Pokémon." => "\\b... ¡es Cobalion! Cobalion es otro Pokémon legendario.",
  "\\bI´m not familiar enough with the story of these Pokémon, but I have a bad feeling about this." => "\\bNo conozco lo suficiente la historia de estos Pokémon, pero tengo un mal presentimiento sobre esto.",
  "\\bYou should head over to Riverstone and talk to my grandmother about this. She´s familiar with the story of these legendary Pokémon." => "\\bDeberías ir a Río el Último y hablar con mi abuela sobre esto. Ella conoce bien la historia de estos Pokémon legendarios.",
  "\\bAnd, if you want to continue the Gym Challenge, Riverstone should be your next stop anyways. Okay land-dweller, bye!" => "\\bY si querés seguir con el Reto de Gimnasios, Río el Último debería ser tu próxima parada de todos modos. Bueno, habitante de tierra firme, ¡chau!",
  "\\bLet´s have a battle in this great mountain range." => "\\bTengamos un combate en esta gran cordillera.",
  "\\bAll I want are epic battles." => "\\bLo único que quiero son combates épicos.",
  "It´s a Pokémon Statue dedicated to Zarude." => "Es una estatua Pokémon dedicada a Zarude.",
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo se iluminó!",
  "Something powerful is approaching!" => "¡Algo poderoso se acerca!",
  "\\bZARUUU!!!" => "\\b¡¡¡ZARUUU!!!",
  "Zarude disappeared. Will it come back?" => "Zarude desapareció. ¿Volverá?",
}

DICT_114 = {
  "\\bYou can´t go this way right now. The boss is busy." => "\\bNo podés ir por acá ahora. El jefe está ocupado.",
  "\\bI better go and help my boss. He might need me." => "\\bMejor voy a ayudar a mi jefe. Puede que me necesite.",
}

apply("Data/Map082.rxdata", DICT_82)
apply("Data/Map090.rxdata", DICT_90)
apply("Data/Map099.rxdata", DICT_99)
apply("Data/Map100.rxdata", DICT_100)
apply("Data/Map104.rxdata", DICT_104)
apply("Data/Map106.rxdata", DICT_106)
apply("Data/Map112.rxdata", DICT_112)
apply("Data/Map113.rxdata", DICT_113)
apply("Data/Map114.rxdata", DICT_114)
