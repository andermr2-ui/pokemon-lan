# encoding: UTF-8
require_relative "rpg_stubs"

DICT_176 = {
  "\\bHello, kid. Are you familiar with the fate of a Pokémon called Ogerpon?" =>
    "\\bHola, chico. ¿Conocés el destino de un Pokémon llamado Ogerpon?",
  "\\bNo, of course not. Ogerpon used to be the guardian of Ambergrove, but these days the people of this town look down on it." =>
    "\\bNo, claro que no. Ogerpon solía ser el guardián de Arboleda Ámbar, pero hoy en día la gente de este pueblo lo desprecia.",
  "\\bI know what happened back then, because I saw it with my own eyes. Ogerpon protected us from these three frauds!" =>
    "\\bYo sé lo que pasó en ese entonces, porque lo vi con mis propios ojos. ¡Ogerpon nos protegió de esos tres farsantes!",
  "\\bNo one believes me, but it´s the truth." => "\\bNadie me cree, pero es la verdad.",
  "\\bOh, you have no idea what I´m talking about, I see. Many years ago, three Pokémon tried to rob everyone in Ambergrove." =>
    "\\bAh, veo que no tenés ni idea de qué estoy hablando. Hace muchos años, tres Pokémon intentaron robarle a todos en Arboleda Ámbar.",
  "\\bOgerpon was able to stop them, but they came back with an evil plan." =>
    "\\bOgerpon logró detenerlos, pero ellos volvieron con un plan malvado.",
  "\\bThey managed to trick Ogerpon, which made it seem like it was the one behind all of this." =>
    "\\bLograron engañar a Ogerpon, haciendo que pareciera que él era el responsable de todo esto.",
  "\\bI noticed what happened, but the whole town was ignorant and blamed Ogerpon." =>
    "\\bYo me di cuenta de lo que pasó, pero todo el pueblo estaba en la ignorancia y culpó a Ogerpon.",
  "\\bSince that day, these frauds have been the \"Guardians of Ambergrove\". They even got their own statures..." =>
    "\\bDesde ese día, esos farsantes son los \"Guardianes de Arboleda Ámbar\". Hasta consiguieron sus propias estatuas...",
  "\\bIf someone would catch them, the truth might finally be revealed. Oh, sorry, I´m just wasting your time at this point, but thanks for listening." =>
    "\\bSi alguien los atrapara, tal vez la verdad finalmente saldría a la luz. Ah, perdón, ya te estoy haciendo perder el tiempo, pero gracias por escuchar.",
  "\\bThese frauds need to get their deserved punishment! Poor Ogerpon is innocent!" =>
    "\\b¡Esos farsantes necesitan recibir el castigo que se merecen! ¡El pobre Ogerpon es inocente!",
  "\\bHm? Oh, it´s you again. Can I help you with something?" =>
    "\\b¿Mm? Ah, sos vos de nuevo. ¿Te puedo ayudar en algo?",
  "\\bWhat?! You actually caught Fezandipiti, Munkidori and Okidogi?! That´s great!" =>
    "\\b¿¡Qué!? ¿¡En serio atrapaste a Fezandipiti, Munkidori y Okidogi!? ¡Eso es genial!",
  "\\bNow that these frauds are no longer running around, we might even be able to get Ogerpon to return." =>
    "\\bAhora que esos farsantes ya no andan sueltos, tal vez incluso podamos lograr que Ogerpon regrese.",
  "\\bThat way we could show everyone what really happened all those years ago." =>
    "\\bAsí podríamos mostrarle a todos lo que realmente pasó hace tantos años.",
  "\\bI have an idea. Ogerpon used to have masks, which could grant it different powers." =>
    "\\bTengo una idea. Ogerpon solía tener máscaras que le otorgaban distintos poderes.",
  "\\bIt lost them on that fateful day, but I found them. I want you to use them to find Ogerpon. Please, that poor thing has been an outcast for too long." =>
    "\\bLas perdió aquel día fatídico, pero yo las encontré. Quiero que las uses para encontrar a Ogerpon. Por favor, el pobre ha sido un marginado por demasiado tiempo.",
  "\\bYou should start looking for Ogerpon at the Statures behind the Gym. I´d imagine it´s glad that these frauds are finally gone." =>
    "\\bDeberías empezar a buscar a Ogerpon en las estatuas detrás del Gimnasio. Me imagino que estará contento de que esos farsantes por fin se hayan ido.",
  "\\bJustice will be served, I´m sure of it!" => "\\b¡Se hará justicia, estoy seguro!",
  "\\bThe people of Ambergrove saw what you did, and our plan worked! They finally realized that Ogerpon was scared and had no evil intentions." =>
    "\\bLa gente de Arboleda Ámbar vio lo que hiciste, ¡y nuestro plan funcionó! Por fin se dieron cuenta de que Ogerpon estaba asustado y no tenía malas intenciones.",
  "\\bYou´re the right person to take care of it, that´s for sure. Ogerpon can be quite helpful in battle, it is a Legendary Pokémon after all. Take care!" =>
    "\\bSos la persona indicada para cuidarlo, de eso no hay duda. Ogerpon puede ser de mucha ayuda en combate, al fin y al cabo es un Pokémon Legendario. ¡Cuidate!",
  "\\bAmbergrove finally knows the truth. Thank you so much!" =>
    "\\bArboleda Ámbar por fin conoce la verdad. ¡Muchísimas gracias!",
  "It´s a Pokémon Statue dedicated to Okidogi." => "Es una estatua Pokémon dedicada a Okidogi.",
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo acaba de brillar!",
  "Something powerful is approaching!" => "¡Algo poderoso se aproxima!",
  "\\bDOGIII!!!" => "\\b¡DOGIII!!!",
  "Okidogi disappeared. Will it come back?" => "Okidogi desapareció. ¿Volverá?",
  "\\bWelcome to Ambergrove! Isn´t this a pretty town?" =>
    "\\b¡Bienvenido a Arboleda Ámbar! ¿No es un pueblo lindo?",
  "\\bOh, but if you want to challenge the Gym, you first need to go and find Nyssa, the Gym leader." =>
    "\\bAh, pero si querés desafiar al Gimnasio, primero tenés que ir a buscar a Nyssa, la líder de gimnasio.",
  "\\bShe went to the Scorching Valley to look for something, and she has been gone for quite a while now." =>
    "\\bSe fue al Valle Abrasador a buscar algo, y ya lleva bastante tiempo ausente.",
  "\\bScorching Valley is just south of Ambergrove. But take some sunscreen with you, the sun is blazing hot over there." =>
    "\\bEl Valle Abrasador está justo al sur de Arboleda Ámbar. Pero llevate protector solar, el sol quema muchísimo allá.",
  "Ogerpon looks scared." => "Ogerpon se ve asustado.",
  "It noticed the Teal Mask." => "Notó la Máscara Turquesa.",
  "\\bPON!" => "\\b¡PON!",
  "You hand the Teal Mask to Ogerpon." => "Le entregás la Máscara Turquesa a Ogerpon.",
  "\\bPONPON!!!" => "\\b¡PONPON!!!",
  "Ogerpon fled back into the woods. Will it come back?" => "Ogerpon huyó de vuelta al bosque. ¿Volverá?",
  "Ambergrove Gym\\nLeader: Nyssa" => "Gimnasio de Arboleda Ámbar\\nLíder: Nyssa",
  "\\bHuh, you really managed to win against Nyssa. That is quite impressive. Listen, the Gym in this town used to be my dojo." =>
    "\\bVaya, así que lograste ganarle a Nyssa. Eso es bastante impresionante. Escuchá, el Gimnasio de este pueblo solía ser mi dojo.",
  "\\bBut when Ambergrove was picked for the Gym Challenge, it was over for the dojo." =>
    "\\bPero cuando eligieron a Arboleda Ámbar para el Desafío de Gimnasios, fue el fin del dojo.",
  "\\bI wasn´t really sad about that, because all of my students were able to grow really strong, but there´s one thing I never got to do." =>
    "\\bNo me puso triste, la verdad, porque todos mis alumnos lograron volverse muy fuertes, pero hay algo que nunca llegué a hacer.",
  "\\bDo you know about a Pokémon called Kubfu? It is said to have the power of Legendary Pokémon, but it can only access these powers through hard work." =>
    "\\b¿Conocés a un Pokémon llamado Kubfu? Se dice que tiene el poder de los Pokémon Legendarios, pero solo puede acceder a ese poder a través del esfuerzo.",
  "\\bI´ve found two Kubfu´s, and I´ve been trying to get one of them to unleash their full power." =>
    "\\bEncontré dos Kubfu, y he estado tratando de que uno de ellos libere todo su poder.",
  "\\bIt hasn´t worked yet, but I´m confident that it will work soon." =>
    "\\bTodavía no funcionó, pero confío en que va a funcionar pronto.",
  "\\bI want you to take the other Kubfu and train it as well. As a matter of fact, I think we both need to train a Kubfu to make this work." =>
    "\\bQuiero que tomes al otro Kubfu y lo entrenes también. De hecho, creo que ambos necesitamos entrenar a un Kubfu para que esto funcione.",
  "\\bThere´s a choice that you´ll have to make, which I don´t quite understand the meaning of." =>
    "\\bHay una decisión que vas a tener que tomar, cuyo significado la verdad no termino de entender.",
  "\\bWhich path to you want to take your Kubfu on?" => "\\b¿Qué camino querés que siga tu Kubfu?",
  "\\bIs it the Path of Darkness, where Kubfu has to resist the temptations of evil?" =>
    "\\b¿Es el Camino de la Oscuridad, donde Kubfu tiene que resistir las tentaciones del mal?",
  "\\bOr is it the Path of Water, where Kubfu will have to become one with the flow?" =>
    "\\b¿O es el Camino del Agua, donde Kubfu tendrá que volverse uno con la corriente?",
  "\\bMake your choice now, and remember that I don´t know what any of this actually means." =>
    "\\bTomá tu decisión ahora, y recordá que yo la verdad no sé qué significa nada de esto.",
  "\\bSo be it, then. Take this Kubfu and let it resist the temptations of evil." =>
    "\\bQue así sea, entonces. Tomá este Kubfu y dejá que resista las tentaciones del mal.",
  "\\bSo be it, then. Take this Kubfu and let it become one with the flow." =>
    "\\bQue así sea, entonces. Tomá este Kubfu y dejá que se vuelva uno con la corriente.",
  "\\bWhen the time has come, meet me at the Pokémon League." =>
    "\\bCuando llegue el momento, encontrame en la Liga Pokémon.",
  "\\bDon´t stop training until that day comes. Good luck!" =>
    "\\bNo dejes de entrenar hasta que llegue ese día. ¡Buena suerte!",
  "\\bGreetings, young trainer. I take it you want to challenge Nyssa? Then good luck with that. She might be young, but she knows what she´s doing." =>
    "\\bSaludos, joven entrenador. Supongo que querés desafiar a Nyssa, ¿no? Entonces buena suerte con eso. Puede que sea joven, pero sabe lo que hace.",
  "\\bA friend of mine told me about Kubfu a few years ago. He also wanted to train Kubfu, but he passed away before he got the chance to do so." =>
    "\\bUn amigo mío me habló de Kubfu hace unos años. Él también quería entrenar a un Kubfu, pero falleció antes de tener la oportunidad de hacerlo.",
  "\\bPoor old Mustard. I want to achieve this for him!" =>
    "\\bPobre viejo Mustard. ¡Quiero lograr esto por él!",
  "It´s a Pokémon Statue dedicated to Munkidori." => "Es una estatua Pokémon dedicada a Munkidori.",
  "\\bDORIII!!!" => "\\b¡DORIII!!!",
  "Munkidori disappeared. Will it come back?" => "Munkidori desapareció. ¿Volverá?",
  "It´s a Pokémon Statue dedicated to Fezandipiti." => "Es una estatua Pokémon dedicada a Fezandipiti.",
  "\\bPITIII!!!" => "\\b¡PITIII!!!",
  "Fezandipiti disappeared. Will it come back?" => "Fezandipiti desapareció. ¿Volverá?",
}

CHOICES_176 = {
  "Path of Darkness|Path of Water" => "Camino de la Oscuridad|Camino del Agua",
}

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

apply("Data/Map176.rxdata", DICT_176, CHOICES_176)
