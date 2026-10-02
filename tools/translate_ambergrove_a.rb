# encoding: UTF-8
require_relative "rpg_stubs"

DICT_257 = {
  "\\bWelcome to our house! I´m a big fan of a Pokémon called Accelgor, but my sister doesn´t want to trade her Shelmet with me." =>
    "\\b¡Bienvenido a nuestra casa! Soy un gran fan de un Pokémon llamado Accelgor, pero mi hermana no quiere cambiarme su Shelmet.",
  "\\bDid you know that Shelmet and Karrablast can only evolve when they´re traded with each other? And my stupid sister refuses to trade with me out of spite." =>
    "\\b¿Sabías que Shelmet y Karrablast solo pueden evolucionar si se los intercambia entre sí? Y mi hermana tonta se niega a cambiarme el suyo solo por rencor.",
  "\\bDo you have a Shelmet that you want to trade for my Karrablast?" =>
    "\\b¿Tenés un Shelmet que quieras cambiar por mi Karrablast?",
  "\\bYou don't want to trade?  Aww..." => "\\b¿No querés intercambiar? Ay...",
  "\\bOK, let's get started." => "\\bBueno, empecemos.",
  "\\PN traded Shelmet for Karrablast!" => "¡\\PN cambió Shelmet por Karrablast!",
  "\\bThanks a lot, you´re much nicer than my sister." => "\\bMuchas gracias, sos mucho más amable que mi hermana.",
  "\\bYou don't want to trade? Aww..." => "\\b¿No querés intercambiar? Ay...",
  "\\bThanks for trading with me!" => "\\b¡Gracias por intercambiar conmigo!",
  "\\bOh, hello. Welcome to our place. Would you mind doing me a little favor? Don´t worry, you´d benefit from this as well." =>
    "\\bOh, hola. Bienvenido a nuestra casa. ¿Te molestaría hacerme un pequeño favor? No te preocupes, vos también saldrías beneficiado.",
  "\\bMy annoying brother wants me to trade my Shelmet for his Karrablast, which would make both Pokémon evolve, but I don´t want to give him the satisfaction." =>
    "\\bMi molesto hermano quiere que le cambie mi Shelmet por su Karrablast, lo que haría evolucionar a ambos Pokémon, pero no quiero darle el gusto.",
  "\\bWould you trade a Karrablast for my Shelmet in oder to make my brother shut up?" =>
    "\\b¿Cambiarías un Karrablast por mi Shelmet para que mi hermano se calle de una vez?",
  "\\PN traded Karrablast for Shelmet!" => "¡\\PN cambió Karrablast por Shelmet!",
  "\\bThank you, now my brother won´t bother me again." => "\\bGracias, ahora mi hermano no me va a molestar más.",
}

DICT_266 = {
  "\\bOh, what do we have here? A Pokémon Trainer that likes to walk into random people´s houses." =>
    "\\bOh, ¿qué tenemos aquí? Un entrenador Pokémon al que le gusta entrar a las casas de gente al azar.",
  "\\bI still haven´t gotten behind this \"our door is open for everyone\" thing. Who invented that? I get that good manners are important, but this is a bit much." =>
    "\\bTodavía no entiendo esto de \"nuestra puerta está abierta para todos\". ¿Quién inventó eso? Entiendo que los buenos modales son importantes, pero esto ya es demasiado.",
  "\\bIt´s not like we´re in some kind of video game where every stranger has a reward or something." =>
    "\\bNo es como si estuviéramos en algún tipo de videojuego donde cada desconocido tiene una recompensa o algo así.",
  "\\bBut wait, what if we are living in a video game? Haven´t you noticed the lack of walls inside these houses? It´s all just black over there." =>
    "\\bPero esperá, ¿y si en verdad vivimos en un videojuego? ¿No notaste la falta de paredes dentro de estas casas? Ahí es todo negro nomás.",
  "\\bOr what´s with us sitting in the same exact spot all day, saying the same bloody thing over and over again." =>
    "\\bO qué onda con que nos quedemos sentados en el mismo lugar exacto todo el día, diciendo lo mismo una y otra vez.",
  "\\bBut we should be quiet, because everytime I mention this to someone, a weird shadow thing appears in the woods." =>
    "\\bPero deberíamos quedarnos callados, porque cada vez que le menciono esto a alguien, aparece una cosa-sombra rara en el bosque.",
  "\\bI always get nightmares after that, so it´s best to let all of this be nothing but a theory." =>
    "\\bSiempre tengo pesadillas después de eso, así que es mejor dejar todo esto como una simple teoría.",
  "\\bYou see, I´m just a normal girl that has a tragic reason to gift you a rare Pokémon. Here, take this." =>
    "\\bMirá, soy solo una chica normal que tiene una razón trágica para regalarte un Pokémon raro. Tomá, esto es para vos.",
  "\\bI don´t even know how I got this thing, but it´s probably gonna help you." =>
    "\\bNi siquiera sé cómo conseguí esta cosa, pero seguramente te va a servir.",
  "\\bOh, and I have something else that I feel like giving you for no reason. Here you go." =>
    "\\bAh, y tengo otra cosa más que se me antoja darte sin ninguna razón. Tomá.",
  "\\bIf you ever find some clues about this shadow thing that haunts me, please come back and tell me. I will find the truth behind this weird reality." =>
    "\\bSi alguna vez encontrás alguna pista sobre esta cosa-sombra que me atormenta, por favor volvé y contame. Voy a encontrar la verdad detrás de esta rara realidad.",
  "\\bWhat if this shadow thing turns out to be a Pokémon? I don´t know what´d scare me more..." =>
    "\\b¿Y si esta cosa-sombra resulta ser un Pokémon? No sé qué me asustaría más...",
  "There's no more room for Pokémon!" => "¡No hay más espacio para Pokémon!",
  "The Pokémon Boxes are full and can't accept any more!" =>
    "¡Las cajas de Pokémon están llenas y no pueden recibir más!",
  "\\bHm? What do you want now?" => "\\b¿Mm? ¿Qué querés ahora?",
  "\\bOh, I just said a different line. Did you change a game variable?!" =>
    "\\bOh, acabo de decir una línea distinta. ¿¡Cambiaste una variable del juego!?",
  "\\bOh, you´re saying you know which Pokémon haunts me." =>
    "\\bAh, estás diciendo que sabés qué Pokémon me atormenta.",
  "\\bDarkrai? Sounds scary. But can you help me get rid of that thing?! Please, I don´t want to be trapped in this game for much longer!!!" =>
    "\\b¿Darkrai? Suena aterrador. ¿¡Pero podés ayudarme a deshacerme de esa cosa!? ¡Por favor, no quiero seguir atrapada en este juego mucho más tiempo!",
  "\\bReally? You will? Thank you!" => "\\b¿En serio? ¿Lo vas a hacer? ¡Gracias!",
  "\\bOkay, so Darkrai always appears over the pond on the other side of the road." =>
    "\\bBueno, Darkrai siempre aparece sobre el estanque del otro lado del camino.",
  "\\bEverytime I openly question our reality, it starts to haunt me. But it only comes at night." =>
    "\\bCada vez que cuestiono abiertamente nuestra realidad, empieza a atormentarme. Pero solo viene de noche.",
  "\\bI trust you, so I will try to get it to return. Are you ready?" =>
    "\\bConfío en vos, así que voy a intentar hacer que vuelva. ¿Estás listo?",
  "\\bWE ARE ALL JUST NPCS TRAPPED INSIDE A POKÈMON FAN GAME. OUR LIFE IS NOTHING BUT A LIE!!!" =>
    "\\b¡SOMOS TODOS SOLO PNJ ATRAPADOS DENTRO DE UN FANGAME DE POKÉMON! ¡NUESTRA VIDA NO ES MÁS QUE UNA MENTIRA!",
  "\\bThat should do it. Darkrai will return, I can feel it. Please, help me!" =>
    "\\bCon eso debería alcanzar. Darkrai va a volver, lo puedo sentir. ¡Por favor, ayudame!",
  "\\bIf you actually manage to catch Darkrai, then I will try to find a way out of this world." =>
    "\\bSi realmente lográs atrapar a Darkrai, voy a intentar encontrar una salida de este mundo.",
  "\\bYou did it! I saw it from the window! Now there´s nothing that will stop me!" =>
    "\\b¡Lo lograste! ¡Lo vi desde la ventana! ¡Ahora nada me va a detener!",
  "\\bHm? Why can´t I move?! WHY CAN´T I MOVE?! NOOOO!!!" =>
    "\\b¿Mm? ¡¿Por qué no puedo moverme?! ¡¿POR QUÉ NO PUEDO MOVERME?! ¡NOOOO!",
  "\\bI will never get out of here..." => "\\bNunca voy a salir de acá...",
  "\\bI´ve been trying to find a therapist for my daughter. She´s convinced that our entire reality is fake." =>
    "\\bHe estado tratando de encontrar un terapeuta para mi hija. Está convencida de que toda nuestra realidad es falsa.",
  "\\bA week ago she said that everything in this world has been made by some weird 20 year old student who needs to touch grass." =>
    "\\bHace una semana dijo que todo en este mundo lo hizo un estudiante raro de 20 años que necesita salir a tomar aire.",
  "\\bIf you know someone who could help her, that´d be great. She´s a nice girl, but I can´t take this anymore." =>
    "\\bSi conocés a alguien que pueda ayudarla, sería genial. Es una buena chica, pero ya no puedo más con esto.",
  "\\bMy sister is insane. She needs therapy right now, because living with her is becoming impossible. Can you help us?" =>
    "\\bMi hermana está loca. Necesita terapia ya mismo, porque vivir con ella se está volviendo imposible. ¿Podés ayudarnos?",
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

apply("Data/Map257.rxdata", DICT_257)
apply("Data/Map266.rxdata", DICT_266)
