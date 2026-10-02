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

DICT_245 = {
  "\\c[6]???: Be not afraid..." => "\\c[6]???: No temas...",
  "\\c[6]I have been watching over you, child. You have come face to face with the guardians of this realm. Your courage cannot be denied." => "\\c[6]Te he estado observando, niño. Te has enfrentado cara a cara con los guardianes de este reino. Tu valentía no puede negarse.",
  "\\c[6]And now, the time has come. I would like to meet you. I am waiting for you at Ruin Island. " => "\\c[6]Y ahora, ha llegado el momento. Me gustaría conocerte. Te espero en la Isla Reliquia. ",
  "\\c[6]Once we face each other, I want you to give me a demonstration of your courage." => "\\c[6]Una vez que nos enfrentemos, quiero que me des una demostración de tu valentía.",
}

DICT_246 = {
  "\\bTheodor: Oh, it´s you..." => "\\bTheodor: Ah, sos vos...",
  "\\bI´ve decided to give up, and you should too. I just had a battle with the first of the Elite Four, and I stood no chance." => "\\bDecidí rendirme, y vos también deberías. Recién tuve un combate con el primero del Alto Mando, y no tuve ninguna chance.",
  "\\bYou should turn around as well, we´re no match for these guys. It was a fun journey while it lasted, but this is just too much." => "\\bDeberías darte la vuelta también, no somos rivales para estos tipos. Fue un viaje divertido mientras duró, pero esto es demasiado.",
  "\\bI´m off now, I wanna see my mom. Bye!" => "\\bMe voy ya, quiero ver a mi mamá. ¡Chau!",
  "\\bAh, you have made it. And, did you unleash Kubfu´s full power?" => "\\bAh, llegaste. Y decime, ¿desataste todo el poder de Kubfu?",
  "\\bYeah, me neither. Because I forgot something. I had a visit to the Isle of Armor in Galar. That´s where Kubfu is from." => "\\bSí, yo tampoco. Porque me olvidé de algo. Hice una visita a la Isla de la Armadura en Galar. De ahí es de donde viene Kubfu.",
  "\\bI found two scrolls on my visit, and I think they are the answer." => "\\bEncontré dos pergaminos en mi visita, y creo que son la respuesta.",
  "\\bYou chose the Path of Darkness, so you will take the Scroll of Darkness. This should unleash Kubfu´s full power if your training was successful." => "\\bElegiste el Camino de la Oscuridad, así que vas a llevarte el Pergamino Oscuro. Esto debería desatar todo el poder de Kubfu si tu entrenamiento fue exitoso.",
  "\\bYou chose the Path of Water, so you will take the Scroll of Waters. This should unleash Kubfu´s full power if your training was successful." => "\\bElegiste el Camino del Agua, así que vas a llevarte el Pergamino Acuático. Esto debería desatar todo el poder de Kubfu si tu entrenamiento fue exitoso.",
  "\\bGo on, give that scroll to your Kubfu." => "\\bDale, dale ese pergamino a tu Kubfu.",
  "\\bHaha, it worked! I had this theory in my head for a while now, and it looks like I was right." => "\\bJaja, ¡funcionó! Tenía esta teoría dando vueltas en mi cabeza hace rato, y parece que tenía razón.",
  "\\bKubfu can evolve into the Legendary Pokémon Urshifu. We´ve made a great discovery today." => "\\bKubfu puede evolucionar al Pokémon Legendario Urshifu. Hoy hicimos un gran descubrimiento.",
  "\\bSince the other scroll took no effect on the other Kubfu, I think I haven´t trained it enough yet." => "\\bComo el otro pergamino no tuvo efecto en el otro Kubfu, creo que todavía no lo entrené lo suficiente.",
  "\\bDon´t you worry, I´ll get it to evolve eventually. And when that happens, we need to have a battle. I really want to see what Urshifu is capable of." => "\\bNo te preocupes, tarde o temprano lo voy a hacer evolucionar. Y cuando eso pase, tenemos que combatir. Tengo muchas ganas de ver de qué es capaz Urshifu.",
  "\\bI will challenge you to a battle the next time we meet. Come prepared, or I will crush you!" => "\\bTe voy a retar a un combate la próxima vez que nos veamos. Vení preparado, ¡o te voy a aplastar!",
  "\\bGo ahead, you just have to give the scroll to Kubfu." => "\\bDale, nomás tenés que darle el pergamino a Kubfu.",
}

DICT_248 = {
  "\\bWelcome to the Pokémon League! You should be proud of yourself, only a handful of trainers even make it here." => "\\b¡Bienvenido a la Liga Pokémon! Deberías estar orgulloso de vos mismo, solo un puñado de entrenadores llega hasta acá.",
  "\\bI´m Cassian, and I´m the newest member of the Elite Four. The trainer that just came your way had the honor of being my first opponent, and I triumphed!" => "\\bSoy Cassian, y soy el miembro más nuevo del Alto Mando. El entrenador que se te cruzó recién tuvo el honor de ser mi primer oponente, ¡y triunfé!",
  "\\bSince I´m no longer nervous, this one will be even easier, you´ll see. It´s about to get toxic!" => "\\bComo ya no estoy nervioso, este va a ser aún más fácil, ya vas a ver. ¡Se va a poner tóxico!",
  "\\bOh wow, that was mighty impressive. I guess I got my first win and loss as an Elite Four member on the same day. You can go on to the next room." => "\\bAy, guau, eso fue muy impresionante. Supongo que conseguí mi primera victoria y mi primera derrota como miembro del Alto Mando el mismo día. Podés seguir a la próxima sala.",
  "\\bBut don´t overestimate your abilities, Ardenia is stronger than me. Good luck!" => "\\bPero no sobreestimes tus habilidades, Ardenia es más fuerte que yo. ¡Suerte!",
  "\\bIt´s rare to see two challengers on the same day. This certainly is an interesting start to my career as an Elite Four trainer." => "\\bEs raro ver a dos retadores el mismo día. Sin dudas es un comienzo interesante para mi carrera como entrenador del Alto Mando.",
  "\\bWelcome back, Champion! This is your Pokémon League now, and we´re your Elite Four." => "\\b¡Bienvenido de nuevo, Campeón! Esta es tu Liga Pokémon ahora, y nosotros somos tu Alto Mando.",
  "\\bDon´t think that we´re gonna let you through without a rematch though, a Champion always has to defend his title after all." => "\\bPero no pienses que te vamos a dejar pasar sin una revancha, después de todo un Campeón siempre tiene que defender su título.",
  "\\bMy team is even stronger now, so this won´t be easy. Here we go!" => "\\bMi equipo es todavía más fuerte ahora, así que esto no va a ser fácil. ¡Vamos!",
  "\\bThere´s nothing quite like a Pokémon League battle. Watching our Pokémon go to their limit gives me the chills." => "\\bNo hay nada como un combate de la Liga Pokémon. Ver a nuestros Pokémon llegar al límite me da escalofríos.",
  "\\bGood luck for the other battles, you might need it." => "\\bSuerte con los demás combates, la vas a necesitar.",
  "\\bI´ll keep on training my Pokémon, because there´s nothing I want more than winning against you. Prepare yourself for that battle." => "\\bVoy a seguir entrenando a mis Pokémon, porque no hay nada que quiera más que ganarte. Preparate para ese combate.",
  "\\bWelcome back! Are you ready for another round?" => "\\b¡Bienvenido de nuevo! ¿Listo para otra ronda?",
  "\\bThen what are we waiting for? Let´s battle!" => "\\b¿Entonces qué estamos esperando? ¡A combatir!",
  "\\bEven if I stand no chance, battling you is always fun!" => "\\b¡Aunque no tenga ninguna chance, combatir contra vos siempre es divertido!",
  "\\bGood luck for the next battles!" => "\\b¡Suerte con los próximos combates!",
  "\\bYou can visit us whenever you like, we´ll always accept your challenge!" => "\\bPodés visitarnos cuando quieras, ¡siempre vamos a aceptar tu desafío!",
}

DICT_250 = {
  "\\bOh, looks like the new guy already lost. But that´s okay, because I haven´t had a battle in weeks. I´m Ardenia, and I love fossil Pokémon." => "\\bAh, parece que el nuevo ya perdió. Pero está bien, porque no tengo un combate hace semanas. Soy Ardenia, y amo a los Pokémon fósiles.",
  "\\bThese ancient creatures have been with me since my childhood, since my dad runs the Mistveil Institute. " => "\\bEstas criaturas antiguas están conmigo desde mi infancia, ya que mi papá dirige el Instituto Velo Brumoso. ",
  "\\bAs a member of the Elite Four, I want to show the world how strong these Pokémon are! Let´s rock!" => "\\bComo miembro del Alto Mando, ¡quiero mostrarle al mundo lo fuertes que son estos Pokémon! ¡Vamos con todo!",
  "\\bThat was incredible! It´s very rare to see a trainer of your caliber, so this loss doesn´t even hurt that much." => "\\b¡Eso fue increíble! Es muy raro ver a un entrenador de tu calibre, así que esta derrota ni siquiera duele tanto.",
  "\\bYou can now go on to the next room. But heal your Pokémon before you challenge Morgana. I hope you succeed!" => "\\bAhora podés pasar a la próxima sala. Pero curá a tus Pokémon antes de retar a Morgana. ¡Espero que tengas éxito!",
  "\\bI think I´m gonna look for some Galarian fossils. That should give my team the final bit of strength it needs." => "\\bCreo que voy a ir a buscar algunos fósiles de Galar. Eso debería darle a mi equipo el último empujón de fuerza que necesita.",
  "\\bWhat´s up, \\PN? How´s life as the Champ?" => "\\b¿Qué tal, \\PN? ¿Cómo se vive siendo el Campeón?",
  "\\bOne can only imagine how good it feels to be the best trainer out there. And it looks like that trainer is ready for a rematch!" => "\\bUno solo puede imaginarse lo bien que se siente ser el mejor entrenador que existe. ¡Y parece que ese entrenador está listo para una revancha!",
  "\\bI´ve made a strong addition to my team, and my choice might surprise you. Come on, let me show you!" => "\\bLe hice una incorporación importante a mi equipo, y mi elección te puede sorprender. ¡Dale, dejame mostrarte!",
  "\\bHm, so even Arctozolt wasn´t enough to make you flinch. I need to optimize my team even more as it seems." => "\\bMm, así que ni siquiera Arctozolt fue suficiente para hacerte flaquear. Parece que necesito optimizar mi equipo aún más.",
  "\\bThere´s something about the bond between you and your Pokémon that I have never seen anywhere else. What´s your secret?!" => "\\bHay algo en el vínculo entre vos y tus Pokémon que nunca vi en ningún otro lado. ¡¿Cuál es tu secreto?!",
  "\\bNow hurry up and challenge Morgana, she can´t stop talking about your rematch. Apparently she has a new trick up her sleeve, so you should watch out." => "\\bAhora apurate y retá a Morgana, no puede parar de hablar de tu revancha. Aparentemente tiene un nuevo truco bajo la manga, así que andá con cuidado.",
  "\\bMy fossil-based team might have its weaknesses, but once I manage to extract the full power of all of my Pokémon, no one will be able to stop me!" => "\\bMi equipo basado en fósiles puede tener sus debilidades, pero una vez que logre extraer todo el poder de mis Pokémon, ¡nadie va a poder detenerme!",
  "\\bWhat´s up, Champion? I take it you want to have another battle?" => "\\b¿Qué tal, Campeón? ¿Supongo que querés tener otro combate?",
  "\\bThat´s great, ´cause today has been really boring. Here we go!" => "\\bQué bueno, porque hoy estuvo bastante aburrido. ¡Vamos!",
  "\\bEven when I know what´s about to hit me, I´m still baffled every time we batte." => "\\bAunque ya sé lo que se me viene encima, sigo quedando desconcertada cada vez que combatimos.",
  "\\bYou´re really, really good at this. I´ve learned a lot from you, so please challenge me again in the future!" => "\\bSos realmente, realmente bueno en esto. Aprendí mucho de vos, ¡así que por favor retame de nuevo en el futuro!",
  "\\bI´ve grown a lot stronger since our first battle, but nothing compares to your strength." => "\\bMe hice mucho más fuerte desde nuestro primer combate, pero nada se compara con tu fuerza.",
}

DICT_252 = {
  "\\bGreetings, trainer. I´m Morgana, and I use Pokémon of a certain type. Can you guess which one it is?" => "\\bSaludos, entrenador. Soy Morgana, y uso Pokémon de un tipo en particular. ¿Podés adivinar cuál es?",
  "\\bDon´t let the decorations in this room fool you, that stuff is from a now retired Elite Four member. " => "\\bNo dejes que las decoraciones de esta sala te engañen, esas cosas son de un miembro del Alto Mando ya retirado. ",
  "\\bI might be the youngest member in the Elite Four, but that doesn´t mean I´m weak. Show me what you´ve got!" => "\\bPuede que sea la miembro más joven del Alto Mando, pero eso no significa que sea débil. ¡Mostrame de qué estás hecho!",
  "\\bYup, I´m a Dark-Type trainer. These Pokémon get a bad reputation, because a lot of people think that they´re evil. THAT`S WRONG!" => "\\bSip, soy una entrenadora de tipo Siniestro. Estos Pokémon tienen mala reputación, porque mucha gente piensa que son malvados. ¡ESO ESTÁ MAL!",
  "\\bOnce you get to know these Pokémon, they´re actually really kind, which is why I train them." => "\\bUna vez que conocés a estos Pokémon, en realidad son muy amables, y por eso los entreno.",
  "\\bElysio is waiting for you in the next room. He´s the strongest member of the Elite Four, and your last obstacle before facing the Champ." => "\\bElysio te está esperando en la próxima sala. Es el miembro más fuerte del Alto Mando, y tu último obstáculo antes de enfrentar al Campeón.",
  "\\bI hope you´ll make it that far, so good luck!" => "\\bEspero que llegues hasta ahí, ¡así que suerte!",
  "\\bOne day we´ll have a rematch, and then my Dark-Type Pokémon will crush you!" => "\\bAlgún día vamos a tener una revancha, ¡y ahí mis Pokémon de tipo Siniestro te van a aplastar!",
  "\\bGreetings, Champion. I have been looking forward to our rematch, because I think I´ve found your weakness." => "\\bSaludos, Campeón. Tenía muchas ganas de nuestra revancha, porque creo que encontré tu debilidad.",
  "\\bEven if I no longer have the element of surprise on my side, I feel confident that I´ll win this time." => "\\bAunque ya no tenga el factor sorpresa de mi lado, me siento segura de que voy a ganar esta vez.",
  "\\bDon´t let the darkness consume you, or your title is gone!" => "\\b¡No dejes que la oscuridad te consuma, o tu título desaparece!",
  "\\bThat was unexpected. Or was it?" => "\\bEso fue inesperado. ¿O no?",
  "\\bI´m starting to think that you have no weaknesses. No matter what move my Pokémon used, your team didn´t break a sweat." => "\\bEmpiezo a pensar que no tenés debilidades. No importa qué movimiento usaran mis Pokémon, tu equipo ni se inmutó.",
  "\\bYou´re very close to reaffirming your status as the Champion, all you have to do is win against Elysio." => "\\bEstás muy cerca de reafirmar tu estatus de Campeón, solo tenés que ganarle a Elysio.",
  "\\bHe told me that he´s made a pretty big change in his team, so maybe he wants to catch you off guard, although I doubt that that´s even possible." => "\\bMe dijo que le hizo un cambio bastante grande a su equipo, así que tal vez quiere agarrarte desprevenido, aunque dudo que eso sea siquiera posible.",
  "\\bI´ll keep on trying to find your weakness, because every trainer has one. Don´t let the darkness consume you!" => "\\bVoy a seguir intentando encontrar tu debilidad, porque todo entrenador tiene una. ¡No dejes que la oscuridad te consuma!",
  "\\bGreetings, Champion. I have a feeling that this battle will be even greater than our previous ones." => "\\bSaludos, Campeón. Tengo la sensación de que este combate va a ser todavía mejor que los anteriores.",
  "\\bGet ready, I´ll hit you with everything I´ve got!" => "\\bPreparate, ¡te voy a atacar con todo lo que tengo!",
  "\\bYup, that was the best one yet. But shall we try have an even greater battle the next time we meet?" => "\\bSip, ese fue el mejor hasta ahora. ¿Pero probamos tener un combate todavía mejor la próxima vez que nos veamos?",
  "\\bThanks for stopping bye!" => "\\b¡Gracias por pasar!",
  "\\bIf our battles continue to get greater and greater, we might have the best battle of all time some day!" => "\\bSi nuestros combates siguen mejorando cada vez más, ¡tal vez algún día tengamos el mejor combate de todos los tiempos!",
}

DICT_254 = {
  "\\bOh, hello. Do you realize how far you´ve come? You´re super close to challenging the Champion!" => "\\bAh, hola. ¿Te das cuenta hasta dónde llegaste? ¡Estás súper cerca de retar al Campeón!",
  "\\bBut before you can do that, you´ll have to get past me. My name is Elysio, and I´m a Fairy-Type specialist." => "\\bPero antes de eso, vas a tener que pasarme a mí. Mi nombre es Elysio, y soy especialista en tipo Hada.",
  "\\bThese Pokémon aren´t just powerful, but they´re beautiful as well. Let me show you their beauty!" => "\\bEstos Pokémon no son solo poderosos, también son hermosos. ¡Dejame mostrarte su belleza!",
  "\\bYou have done it. You have actually done it!" => "\\bLo lograste. ¡De verdad lo lograste!",
  "\\bCongratulations, \\PN, you just beat the Elite Four. Only the best of the best are able to get this far, and you didn´t even break a sweat." => "\\bFelicitaciones, \\PN, acabás de vencer al Alto Mando. Solo los mejores de los mejores logran llegar tan lejos, y vos ni siquiera te agitaste.",
  "\\bYou can now enter the Champion´s arena. Once you go through this door, there is no turning back!" => "\\bAhora podés entrar a la arena del Campeón. ¡Una vez que cruces esta puerta, no hay vuelta atrás!",
  "\\bThe battle against the Champion will be on an entirely different level. None of us Elite Four members ever came close to beating him." => "\\bEl combate contra el Campeón va a estar en un nivel completamente distinto. Ninguno de nosotros, los del Alto Mando, estuvo ni cerca de vencerlo.",
  "\\bWhatever happens in there, don´t give up. It won´t be easy, but you can do it!" => "\\bPase lo que pase ahí adentro, no te rindas. No va a ser fácil, ¡pero podés lograrlo!",
  "\\bCould we see a new Champion being crowned today?" => "\\b¿Podríamos ver a un nuevo Campeón siendo coronado hoy?",
  "\\bHello, \\PN. During our first battle, I already had a feeling that not even Arthur could stop you. And I guess I was right." => "\\bHola, \\PN. Durante nuestro primer combate, ya tenía la sensación de que ni siquiera Arthur podría detenerte. Y supongo que tenía razón.",
  "\\bIs there really no way to stop you? Are you gonna keep on winning battles until you die?" => "\\b¿De verdad no hay forma de detenerte? ¿Vas a seguir ganando combates hasta que te mueras?",
  "\\bEvery trainer loses a battle once in a while, except you. At this rate, you´re highly likely to win the next World Championship Tournament." => "\\bTodo entrenador pierde un combate de vez en cuando, excepto vos. A este ritmo, es muy probable que ganes el próximo Torneo del Campeonato Mundial.",
  "\\bOn paper, a simple Elite Four member like myself should stand no chance against you in battle." => "\\bEn el papel, un simple miembro del Alto Mando como yo no debería tener ninguna chance contra vos en combate.",
  "\\bYet something is telling me that I can win. It seems impossible, but I´ll work my bloody ass off to defeat you." => "\\bY sin embargo, algo me dice que puedo ganar. Parece imposible, pero me voy a partir el alma para derrotarte.",
  "\\bWell then, show me how Champions fight!" => "\\bBueno entonces, ¡mostrame cómo combaten los Campeones!",
  "\\bI guess I was just delusional. There was no way that you´d lose against me, but I just couldn´t have a battle with that mindset." => "\\bSupongo que solo estaba delirando. No había forma de que perdieras contra mí, pero no podía tener un combate con esa mentalidad.",
  "\\bYou may now return to the Champion´s room, it is yours now." => "\\bAhora podés volver a la sala del Campeón, ya es tuya.",
  "\\bOh, but wait. It looks like a new challenger has just entered the League." => "\\bAh, pero esperá. Parece que un nuevo retador acaba de entrar a la Liga.",
  "\\bNo way, how´s he doing that?! That guy is destroying Cassian!" => "\\bNo puede ser, ¡¿cómo está haciendo eso?! ¡Ese tipo está destrozando a Cassian!",
  "\\bGo on to your room, Champ. The Elite Four has battles to win!" => "\\bAndá a tu sala, Campeón. ¡El Alto Mando tiene combates que ganar!",
  "\\bIf this guy somehow manages to get past every single member of the Elite Four, then you´ll have to defend your title once more." => "\\bSi este tipo de alguna forma logra pasar a todos y cada uno de los miembros del Alto Mando, vas a tener que defender tu título una vez más.",
  "\\bI doubt that this guy will make it that far, but you should consider every possibility." => "\\bDudo que este tipo llegue tan lejos, pero deberías considerar todas las posibilidades.",
  "\\bHello, \\PN. Another day, another battle, huh? You´ve crushed me several times now, but I will never give up!" => "\\bHola, \\PN. Otro día, otro combate, ¿eh? Ya me aplastaste varias veces, ¡pero nunca me voy a rendir!",
  "\\bMy Pokémon have grown stronger with each battle, and this time I will bring you down!" => "\\bMis Pokémon se hicieron más fuertes con cada combate, ¡y esta vez te voy a derribar!",
  "\\bAnother day, another loss..." => "\\bOtro día, otra derrota...",
  "\\bI don´t know if I´ll ever beat you, but I will keep on trying!" => "\\bNo sé si algún día voy a poder vencerte, ¡pero voy a seguir intentando!",
  "\\bI hope you come back soon, because nothing in life brings me greater joy than this!" => "\\bEspero que vuelvas pronto, ¡porque nada en la vida me da más alegría que esto!",
  "\\bI know that my Fairy-Type Pokémon have the potential to win against you." => "\\bSé que mis Pokémon de tipo Hada tienen el potencial de ganarte.",
  "\\bIt´s me who needs to improve. That´s the only way for me to stand a chance." => "\\bSoy yo quien necesita mejorar. Es la única forma de que tenga alguna chance.",
}

DICT_255 = {
  "\\bArthur: This is the Hall of Fame, where your names will be recorded for prosperity." => "\\bArthur: Este es el Salón de la Fama, donde tus nombres quedarán registrados para la posteridad.",
  "\\bWhat you are leaving are the memories of your adventures so far." => "\\bLo que dejás son los recuerdos de tus aventuras hasta ahora.",
  "\\bIt´s time to record your names. You and your Pokémon." => "\\bEs hora de registrar sus nombres. Los tuyos y los de tus Pokémon.",
  "\\bThis machine will make a permanent record of your achievement." => "\\bEsta máquina va a dejar un registro permanente de tu logro.",
}

DICT_256 = {
  "\\bArthur: Welcome, \\PN. Do you remember me? We have met before, on Crystal Beach and in Glimmerwood." => "\\bArthur: Bienvenido, \\PN. ¿Te acordás de mí? Ya nos conocimos antes, en Playa Tushi y en el Bosque Lumínico.",
  "\\bSomething about you was special. I knew it the moment I saw you for the first time." => "\\bHabía algo especial en vos. Lo supe apenas te vi por primera vez.",
  "\\bTurns out I was right, because you´ve made it past the Elite Four and now you´re here! But please, allow me to reintroduce myself." => "\\bResulta que tenía razón, ¡porque pasaste al Alto Mando y ahora estás acá! Pero por favor, permitime volver a presentarme.",
  "\\bI am Arthur, the Champion of the Delta Pokémon League. My journey started just like yours, so I know what true determination feels like." => "\\bSoy Arthur, el Campeón de la Liga Pokémon Delta. Mi viaje empezó igual que el tuyo, así que sé lo que se siente la verdadera determinación.",
  "\\bI´m sure you´re aware that this won´t be an easy battle, and that I´m very eager to defend my title." => "\\bEstoy seguro de que sabés que este no va a ser un combate fácil, y que tengo muchas ganas de defender mi título.",
  "\\bWith that being said, I think it´s time to get down to business. Show me your determination!" => "\\bDicho esto, creo que es hora de ir al grano. ¡Mostrame tu determinación!",
  "\\bArthur: Congratulations! You are the new Champion of the Delta Pokémon League!" => "\\bArthur: ¡Felicitaciones! ¡Sos el nuevo Campeón de la Liga Pokémon Delta!",
  "\\bOnly a handful of trainers around the world can call themselves Champion, and you are now one of them. You really deserve this, \\PN." => "\\bSolo un puñado de entrenadores en todo el mundo pueden llamarse Campeones, y ahora vos sos uno de ellos. De verdad te merecés esto, \\PN.",
  "\\bPlease follow me into the Hall of Fame, where we will officially crown you Champion." => "\\bPor favor, seguime al Salón de la Fama, donde te vamos a coronar Campeón oficialmente.",
  "\\b???: So you´re the new kid on the block, huh?" => "\\b???: Así que sos el nuevo del barrio, ¿eh?",
  "\\bI´m here to see if you´re really as strong as they say." => "\\bVine a ver si de verdad sos tan fuerte como dicen.",
  "\\bAhhhh, wait, sorry, I forgot to introduce myself. I´m Gary Oak, and I came here all the way from Kanto." => "\\bAhhh, esperá, perdón, me olvidé de presentarme. Soy Gary Oak, y vine desde Kanto hasta acá.",
  "\\bGary: Oak sounds familiar, doesn´t it? Yup, Professor Oak is my grandfather." => "\\bGary: Oak te suena familiar, ¿no? Sip, el Profesor Oak es mi abuelo.",
  "\\bHe used to work in Kanto, but he moved to the Delta Region to find new challenges." => "\\bAntes trabajaba en Kanto, pero se mudó a la Región Delta para buscar nuevos desafíos.",
  "\\bHe called me on the day you became Champion, and now I´m here to see if you´re worthy of that title." => "\\bMe llamó el día que te convertiste en Campeón, y ahora estoy acá para ver si sos digno de ese título.",
  "\\bAnd don´t underestimate me, \\PN. I am Kanto´s former Champion." => "\\bY no me subestimes, \\PN. Soy el ex Campeón de Kanto.",
  "\\bYes, I lost my title after a while, but I´ve trained a lot since that defeat. I´m ready to become a Champion once again, and you won´t stop me!" => "\\bSí, perdí mi título después de un tiempo, pero entrené mucho desde esa derrota. Estoy listo para volver a ser Campeón, ¡y no me vas a detener!",
  "\\bHELL YEAH, IT´S TIME FOR A CLASH OF CHAMPIONS!" => "\\b¡CLARO QUE SÍ, ES HORA DE UN CHOQUE DE CAMPEONES!",
  "\\bGary: Hold up, you actually lived up to the hype?!" => "\\bGary: Esperá, ¿¡de verdad estuviste a la altura de las expectativas?!",
  "\\bThere´re a lot of trainers who have more reputation than skill, but you´re not one of them." => "\\bHay un montón de entrenadores que tienen más reputación que habilidad, pero vos no sos uno de ellos.",
  "\\bYou are worthy of your title. Seriously, I´m impressed." => "\\bSos digno de tu título. En serio, estoy impresionado.",
  "\\bWait, why do I get the feeling that you might stand a chance against him?" => "\\bEsperá, ¿por qué tengo la sensación de que podrías tener una chance contra él?",
  "\\bNah, but he´s retired. He won´t care unless you become the World Champion or something, so ignore what I just said." => "\\bNa, pero está retirado. No le va a importar a menos que te conviertas en el Campeón Mundial o algo así, así que ignorá lo que acabo de decir.",
  "\\bWell, I´m off now. Don´t forget to record this victory in the Hall of Fame. Try to hang on to your title longer than I did. Bye!" => "\\bBueno, ya me voy. No te olvides de registrar esta victoria en el Salón de la Fama. Tratá de mantener tu título más tiempo del que yo pude. ¡Chau!",
  "\\bGary: Hm, maybe I should tell Ash about this..." => "\\bGary: Mm, tal vez debería contarle esto a Ash...",
  "\\bArthur: Hello, \\PN. I hope you´re ready to defend your title, because I want it back!" => "\\bArthur: Hola, \\PN. Espero que estés listo para defender tu título, ¡porque lo quiero de vuelta!",
  "\\bI will go all out in this battle, and my Pokémon want this victory as much as I do." => "\\bVoy a ir con todo en este combate, y mis Pokémon quieren esta victoria tanto como yo.",
  "\\bI´m Arthur, and I will be the Champion of the Delta Pokémon League once again!" => "\\bSoy Arthur, ¡y voy a volver a ser el Campeón de la Liga Pokémon Delta!",
  "\\bArthur: Congratulations, you defended your title!" => "\\bArthur: ¡Felicitaciones, defendiste tu título!",
  "\\bThat was seriously incredible. But I will return, because I want my title back even more now!" => "\\bEso fue realmente increíble. Pero voy a volver, ¡porque ahora quiero mi título de vuelta más que nunca!",
  "\\bWell, I guess I´ll leave you alone now. Remember to record your victory in the Hall of Fame. Take care, Champion!" => "\\bBueno, supongo que ahora te voy a dejar tranquilo. Acordate de registrar tu victoria en el Salón de la Fama. ¡Cuidate, Campeón!",
}

apply("Data/Map245.rxdata", DICT_245)
apply("Data/Map246.rxdata", DICT_246)
apply("Data/Map248.rxdata", DICT_248)
apply("Data/Map250.rxdata", DICT_250)
apply("Data/Map252.rxdata", DICT_252)
apply("Data/Map254.rxdata", DICT_254)
apply("Data/Map255.rxdata", DICT_255)
apply("Data/Map256.rxdata", DICT_256)
