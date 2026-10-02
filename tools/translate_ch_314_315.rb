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

DICT_314 = {
  "Southside Beach Passage Way (Currently Closed)" => "Paso de Playa del Sur (Actualmente Cerrado)",
  "\\bWow, Crystal Harbor is a lot bigger than I thought. What a view!" => "\\bGuau, Puerto del Cristal es mucho más grande de lo que pensaba. ¡Qué vista!",
  "\\bIt´s time for our cruise! This will be great!" => "\\b¡Es hora de nuestro crucero! ¡Esto va a estar genial!",
  "\\bThe Southside Beach Passage Way is currently closed due to dangerous weather in the area. No one is allowed to go there." => "\\bEl Paso de Playa del Sur está actualmente cerrado por clima peligroso en la zona. Nadie tiene permitido ir para allá.",
  "\\bHm? Why do you need to go there? Can´t you wait until it´s safe again?" => "\\b¿Mmm? ¿Por qué necesitás ir para allá? ¿No podés esperar hasta que sea seguro de nuevo?",
  "\\bOh, you´re the Champion? Ah, yeah I recognize you now. Your face was all over the news." => "\\bAh, ¿sos el Campeón? Ah, sí, ahora te reconozco. Tu cara estuvo en todos los noticieros.",
  "\\bBecause you´re a very capable trainer, I´m willing to make an exception, but if anything happens to you, it´s not my fault." => "\\bComo sos un entrenador muy capaz, estoy dispuesto a hacer una excepción, pero si te pasa algo, no es mi culpa.",
  "\\bI´m the owner of the Pikachu Fan Club. We had some fun times, but I´ve gotten too old and we were running out of members." => "\\bSoy el dueño del Club de Fans de Pikachu. Tuvimos buenos momentos, pero ya me puse demasiado viejo y nos estábamos quedando sin miembros.",
  "\\bAfter 50 amazing years, I made the decision to disband the club and sell the house. I am still sad about it, but nothing lasts forever." => "\\bDespués de 50 años increíbles, tomé la decisión de disolver el club y vender la casa. Todavía me pone triste, pero nada dura para siempre.",
  "\\bZeke: Oh, it´s you. Did you really come here just to say goodbye?" => "\\bXarly: Ah, sos vos. ¿En serio viniste hasta acá solo para despedirte?",
  "\\bHm, thanks I guess. Ah, and congrats on becoming Champion. You know, it makes me feel a bit better to know that I lost against the Champ out of all people." => "\\bMmm, gracias, supongo. Ah, y felicitaciones por convertirte en Campeón. ¿Sabés? Me hace sentir un poco mejor saber que perdí justo contra el Campeón.",
  "\\bBut a loss is still a loss. I need to get onto the ship to Paldea very soon, and I´ll be gone for a while." => "\\bPero una derrota sigue siendo una derrota. Necesito subir al barco a Paldea muy pronto, y voy a estar afuera un buen tiempo.",
  "\\bSeeing the world has been one of my top priorities for quite some time now, and it´s finally happening." => "\\bConocer el mundo fue una de mis prioridades desde hace bastante, y por fin está pasando.",
  "\\bBefore I leave, I have something for you. This is a parting gift, as I don´t even know if we´ll meet again, and it is an apology." => "\\bAntes de irme, tengo algo para vos. Es un regalo de despedida, ya que ni siquiera sé si nos vamos a volver a ver, y también es una disculpa.",
  "\\bWe never really got along too well, and that´s mostly my fault. I´m a jealous little bitch, and I need to change that." => "\\bNunca nos llevamos demasiado bien, y eso es mayormente culpa mía. Soy un envidioso de mierda, y necesito cambiar eso.",
  "\\bSo please, take this." => "\\bAsí que, por favor, tomá esto.",
  "\\bI gave some of my Pokémon to the Day Care in Ambergrove, and when I went to pick them up, I also got an egg." => "\\bLe di algunos de mis Pokémon a la Guardería de Arboleda Ámbar, y cuando fui a buscarlos, también me dieron un huevo.",
  "\\bI think you know this Pokémon by now, and it is hard to find in the Delta Region. Maybe it will be of more use to you than it was to me..." => "\\bCreo que ya conocés a este Pokémon, y es difícil de encontrar en la Región Delta. Tal vez te sirva más a vos de lo que me sirvió a mí...",
  "\\bAHHHH, I NEED TO GET ON THE SHIP!!!" => "\\b¡¡¡AHHHH, TENGO QUE SUBIR AL BARCO!!!",
  "\\bSee ya, \\PN!" => "\\b¡Nos vemos, \\PN!",
  "There's no more room for Pokémon!" => "¡No hay más lugar para Pokémon!",
  "The Pokémon Boxes are full and can't accept any more!" => "¡Las Cajas Pokémon están llenas y no pueden aceptar más!",
  "\\bYaaaaay! Big ship!" => "\\b¡Siiii! ¡Barco grande!",
  "\\bAnthony: I´ve already tried to convince the guard, but he won´t let me through. You gotta do this, I´m sorry." => "\\bAnthony: Ya traté de convencer al guardia, pero no me deja pasar. Vas a tener que hacerlo vos, lo siento.",
  "\\bAnthony: Okay, that worked. I hope you´re prepared, ´cause it´s gonna get rough on the other side!" => "\\bAnthony: Bien, eso funcionó. Espero que estés preparado, ¡porque del otro lado se va a poner feo!",
  "\\b???: Excuse me, does that thing on your arm happen to be a Z-Power Ring?" => "\\b¿???: Disculpá, ¿esa cosa que tenés en el brazo es, por casualidad, un Anillo Poder Z?",
  "\\bHm, so I was right. You´re from Alola, aren´t you?" => "\\bMmm, entonces tenía razón. Sos de Alola, ¿no?",
  "\\bHm?! You´re from Delta?! Then where did you get that ring from?!" => "\\b¿¡Mmm?! ¿¡Sos de Delta?! ¡¿Entonces de dónde sacaste ese anillo?!",
  "\\bOh, you wanna know who I am? Of course, how rude of me to not introduce myself." => "\\bAh, ¿querés saber quién soy? Claro, qué maleducado de mi parte no presentarme.",
  "\\bI am Doctor Anthony Reed, but you can call me Anthony. I work for the Rotom AI Company here in Crystal Harbor." => "\\bSoy el Doctor Anthony Reed, pero podés decirme Anthony. Trabajo para la Compañía de IA Rotom acá en Puerto del Cristal.",
  "\\bAnthony: But back to my question, where did you get that ring from?" => "\\bAnthony: Pero volviendo a mi pregunta, ¿de dónde sacaste ese anillo?",
  "\\bHm?! You found it in a secret chamber in Aurora Mountain?!" => "\\b¿¡Mmm?! ¿¡Lo encontraste en una cámara secreta del Monte Auroreal?!",
  "\\bPlease, let me take a closer look at that ring. This is very fascinating, you know." => "\\bPor favor, dejame ver ese anillo más de cerca. Esto es muy fascinante, ¿sabés?",
  "\\bHm, yes, this is indeed fascinating." => "\\bMmm, sí, esto es realmente fascinante.",
  "\\bYou´re the first person that I´ve met in the Delta Region with a Z-Power Ring. Not only that, but this one is different from the ones in Alola." => "\\bSos la primera persona que conozco en la Región Delta con un Anillo Poder Z. Y no solo eso, sino que este es distinto a los de Alola.",
  "\\bWhen I visited Alola a few years ago, I was researching Z-Power and the use of powerful Z-Moves." => "\\bCuando visité Alola hace unos años, estaba investigando el Poder Z y el uso de Movimientos Z poderosos.",
  "\\bNone of my results had scientific relevance, so I gave up on my research." => "\\bNinguno de mis resultados tenía relevancia científica, así que abandoné mi investigación.",
  "\\bBut what I´m seeing here is making me wanna study Z-Power all over again!" => "\\b¡Pero lo que estoy viendo acá me está dando ganas de estudiar el Poder Z de nuevo!",
  "\\bLet me tell you what´s special about that ring. Unlike the Z-Rings used in Alola, yours is ancient." => "\\bDejame contarte qué tiene de especial ese anillo. A diferencia de los Anillos Z que se usan en Alola, el tuyo es ancestral.",
  "\\bIt looks modern at first glance, but it´s not build with today´s technology." => "\\bParece moderno a primera vista, pero no está hecho con la tecnología de hoy.",
  "\\bTHIS CHANGES EVERYTHING!!!" => "\\b¡¡¡ESTO LO CAMBIA TODO!!!",
  "\\bPlease, meet me at the Rotom AI Company." => "\\bPor favor, encontrame en la Compañía de IA Rotom.",
  "\\bIt´s the building with the large antennas on the roof, the one right behind me." => "\\bEs el edificio con las antenas grandes en el techo, el que está justo detrás de mí.",
  "\\bTogether, we can help each other. You can add to my research with that ring of yours, and I can make you a strong trainer..." => "\\bJuntos, podemos ayudarnos mutuamente. Vos podés aportar a mi investigación con ese anillo tuyo, y yo puedo hacerte un entrenador fuerte...",
  "\\bBut wait..." => "\\bPero esperá...",
  "\\bYou´re the new Champion, aren´t you?!" => "\\b¡¿Sos el nuevo Campeón, no?!",
  "\\bHaha, that´s even better! If you want to help me out, I´m waiting for you. Until then!" => "\\bJaja, ¡mejor todavía! Si querés darme una mano, te espero. ¡Hasta entonces!",
  "\\bI always get seasick on ships, but I´m doing this for my son and my wife." => "\\bSiempre me mareo en los barcos, pero hago esto por mi hijo y mi esposa.",
  "\\bDo you know that feeling when your vacation is about to end, and you´re trying to take it all in one last time? That´s what I´m going through right now." => "\\b¿Conocés esa sensación de cuando tus vacaciones están por terminar y tratás de disfrutarlo todo una última vez? Eso es lo que estoy sintiendo ahora mismo.",
  "\\bWell, at least it was a fun vacation! The one thing that would´ve made it perfect is a Kantonian Raichu. I really want one, because they´re sooo cute!" => "\\b¡Bueno, al menos fueron unas vacaciones divertidas! Lo único que las hubiera hecho perfectas es un Raichu de Kanto. ¡Lo quiero muchísimo, porque son reeee lindos!",
  "\\bYou don´t happen to have a Kantonian Raichu that you´d be willing to trade for my Alolan Raichu?" => "\\b¿No tendrás, por casualidad, un Raichu de Kanto que estés dispuesto a cambiar por mi Raichu de Alola?",
  "\\bYou don't want to trade?  Aww..." => "\\b¿No querés intercambiar? Ay...",
  "\\bWow, you actually have one!" => "\\b¡Guau, en serio tenés uno!",
  "\\bOK, let's get started." => "\\bOK, empecemos.",
  "\\PN traded Raichu for Raichu!" => "\\PN cambió Raichu por Raichu!",
  "\\bThank you so much! You really made my day! Actually, because you helped me out, I want you to have this." => "\\b¡Muchísimas gracias! ¡De verdad me alegraste el día! De hecho, como me diste una mano, quiero que tengas esto.",
  "\\bOnce again, thanks for helping me. Take care!" => "\\bDe nuevo, gracias por ayudarme. ¡Cuidate!",
  "\\bYeah, that would´ve been a miracle." => "\\bSí, eso hubiera sido un milagro.",
  "\\bThanks for trading with me!" => "\\b¡Gracias por intercambiar conmigo!",
  "\\bPlease be careful on Southside Beach. Before we closed the Passage Way, there were several casualties." => "\\bPor favor, tené cuidado en Playa del Sur. Antes de que cerráramos el Paso, hubo varias víctimas.",
  "\\bAnthony: Ah, there you are. I hope you learned something new today, as a Champion should know how things work in our world." => "\\bAnthony: Ah, ahí estás. Espero que hayas aprendido algo nuevo hoy, ya que un Campeón debería saber cómo funcionan las cosas en nuestro mundo.",
  "\\bStatistically speaking, I´m cooked. You should win this battle with ease, but I´m willing to let the experiment speak for itself." => "\\bEstadísticamente hablando, estoy frito. Deberías ganar este combate con facilidad, pero estoy dispuesto a dejar que el experimento hable por sí solo.",
  "\\bLet´s begin!" => "\\b¡Empecemos!",
  "\\bAnthony: Yup, that was the expected result. Thanks for giving me this opportunity." => "\\bAnthony: Sí, ese era el resultado esperado. Gracias por darme esta oportunidad.",
  "\\bAfter all, only very few people actually get to battle the Champion. But it´s time to tell you about my plan now." => "\\bAl fin y al cabo, muy pocas personas llegan realmente a combatir contra el Campeón. Pero ahora es momento de contarte mi plan.",
  "\\bThe hidden entrance to the Z-Crystal Cave is supposed to be somewhere on Southside Beach, which is a problem." => "\\bSe supone que la entrada oculta a la Cueva del Cristal Z está en algún lugar de Playa del Sur, y eso es un problema.",
  "\\bEven if the cave is there, and even if we found the entrance, Southside Beach isn´t as pleasent as it sounds." => "\\bAunque la cueva esté ahí, y aunque encontráramos la entrada, Playa del Sur no es tan agradable como suena.",
  "\\bThe weather on that beach has been going crazy for quite a while now, and no one knows the reason why." => "\\bEl clima en esa playa está enloquecido desde hace bastante, y nadie sabe la razón.",
  "\\bThere´re thunderstorms, sandstorms and blizzards all on one beach, and no one is allowed to go there." => "\\bHay tormentas eléctricas, tormentas de arena y ventiscas, todas en la misma playa, y a nadie se le permite ir para allá.",
  "\\bIt has gotten so bad that Route 14 and Southford have been cut off from the rest of the region." => "\\bSe puso tan mal que la Ruta 14 y Fuerte Sur quedaron incomunicados del resto de la región.",
  "\\bEmergency supplies have been brought to that town, and the people have been told to stay inside." => "\\bLe llevaron suministros de emergencia a ese pueblo, y le dijeron a la gente que se quede adentro.",
  "\\bThere are guards at the Southside Beach Passage Way, and they let no one through. The only person that they might allow through is you!" => "\\bHay guardias en el Paso de Playa del Sur, y no dejan pasar a nadie. ¡La única persona a la que tal vez dejen pasar sos vos!",
  "\\bIf you´re ready for an adventure, then follow me to the passage way. This could get dangerous, but that has never stopped us scientists!" => "\\bSi estás listo para una aventura, entonces seguime hasta el paso. Esto se puede poner peligroso, ¡pero eso nunca detuvo a los científicos!",
  "Rotom AI Company" => "Compañía de IA Rotom",
  "\\bHey, do you need anyone to do a job for you? Then head inside the Freelancer Agency. I´m a freelancer myself, and we´re always in need of new jobs." => "\\bEy, ¿necesitás que alguien te haga un trabajo? Entonces andá a la Agencia de Freelancers. Yo mismo soy freelancer, y siempre necesitamos trabajos nuevos.",
  "Pikachu Fan Club (Now disbanded)" => "Club de Fans de Pikachu (Ahora disuelto)",
}

DICT_315 = {
  "\\bAhoy, Champion! You wanna visit the Delta Islands, don´t you?" => "\\b¡Ahoy, Campeón! Querés visitar las Islas Delta, ¿no?",
  "\\bThen I´m sorry, but the ferry is broken. We´re waiting for spare parts, but Jeff Bezos is taking his bloody time..." => "\\bEntonces lo siento, pero el ferry está roto. Estamos esperando repuestos, pero Jeff Bezos se está tomando su maldito tiempo...",
  "\\bAhoy, Champion! Are you ready to go to the Delta Islands?" => "\\b¡Ahoy, Campeón! ¿Estás listo para ir a las Islas Delta?",
  "\\bAlright, hop on the ferry and you´ll be there in no time!" => "\\bBueno, subite al ferry ¡y vas a llegar en un santiamén!",
  "\\bSure, I´ll wait. Just tell me when you want to go." => "\\bDale, voy a esperar. Solo avisame cuando quieras ir.",
}

apply("Data/Map314.rxdata", DICT_314)
apply("Data/Map315.rxdata", DICT_315)
