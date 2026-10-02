# encoding: UTF-8
require_relative "rpg_stubs"

DICT_153 = {
  "Crystal Cove Gym\\nLeader: Watron" => "Gimnasio de Cueva de la Meta\\nLíder: Watron",
  "Larry & Mindy´s Specialties" => "Especialidades de Larry y Mindy",
  "\\bTurn around you little brat, I´m letting no one through. The path ahead isn´t blocked or anything, I just happen to be a jerk." =>
    "\\bDa media vuelta, mocoso, no dejo pasar a nadie. El camino no está bloqueado ni nada, es que resulta que soy un capullo.",
  "\\bWe would battle you, but with just one Pokémon on your team, this wouldn´t be fair. Now get lost!" =>
    "\\bTe combatiríamos, pero con solo un Pokémon en tu equipo, esto no sería justo. ¡Ahora lárgate!",
  "\\bNo one is allowed to enter the Rocky Gate. And I don´t know who this \"No One\" guy is, but I know it´s not you!" =>
    "\\bNadie tiene permitido entrar en la Puerta Rocosa. Y no sé quién es ese tal \"Nadie\", ¡pero sé que no eres tú!",
  "\\bAlright, go ahead. But please, don´t tell the boss where I went." =>
    "\\bVale, adelante. Pero por favor, no le digas al jefe adónde fui.",
  "\\bThe Boss said that no one is allowed to bother him. And you look like you want to bother him!" =>
    "\\bEl Jefe dijo que nadie puede molestarlo. ¡Y tú pareces que quieres molestarlo!",
  "\\bI should get out of here, or the boss will be mad..." => "\\bDebería salir de aquí, o el jefe se enfadará...",
  "\\bOh no, you´re not going to ruin our plan!" => "\\b¡Oh no, no vas a arruinar nuestro plan!",
  "\\bYou must be the kid that the boss mentioned. You don´t even know our goal, so why are you here?" =>
    "\\bDebes de ser el chaval que mencionó el jefe. Ni siquiera conoces nuestro objetivo, ¿entonces por qué estás aquí?",
  "\\bEither way, you never saw me." => "\\bDe todas formas, nunca me viste.",
  "\\bThis place is perfect for swimmers like me. I hate walking but I love swimming, and in Crystal Cove that´s your only option." =>
    "\\bEste lugar es perfecto para nadadores como yo. Odio caminar pero me encanta nadar, y en Cueva de la Meta esa es tu única opción.",
  "\\bWell, unless your Pokémon uses Surf, but that´s boring." => "\\bBueno, a menos que tu Pokémon use Surf, pero eso es aburrido.",
  "\\bSwimming in Crystal Cove is much better than swimming in the ocean, because this ain´t salt water." =>
    "\\bNadar en Cueva de la Meta es mucho mejor que nadar en el océano, porque esto no es agua salada.",
  "\\bMy grandparents sell rare mints and feathers. You should check out their selection if you´re a trainer, they might have just the right thing for you." =>
    "\\bMis abuelos venden Mentas y Plumas raras. Deberías echar un vistazo a su selección si eres entrenador, puede que tengan justo lo que necesitas.",
  "\\bThe good ol´ lighthouse isn´t in use anymore, but they still turn on the light as a tradition." =>
    "\\bEl buen viejo faro ya no está en uso, pero aún encienden la luz por tradición.",
  "\\bHey, thanks for saving me from that cop. He was about to do things to me..." =>
    "\\bEy, gracias por salvarme de ese policía. Estaba a punto de hacerme cosas...",
  "\\bI don´t even want to think about it..." => "\\bNi siquiera quiero pensar en eso...",
  "\\bHere, take this as a sign of my gratitute." => "\\bToma, acepta esto como muestra de mi gratitud.",
  "\\bOur world needs more people like you. You´re a true hero!" => "\\bNuestro mundo necesita más gente como tú. ¡Eres un héroe de verdad!",
  "\\bHello, trainer. Someone is currently challenging Watron, and no one is allowed to interrupt them. I´m sorry, but you will have to come back later." =>
    "\\bHola, entrenador. Alguien está retando a Watron ahora mismo, y nadie puede interrumpirlos. Lo siento, pero tendrás que volver más tarde.",
  "\\bZeke: Oh, looks like I got the Volt Badge before you. I told you I would surpass you in no time. If we were to battle now, you would stand no chance." =>
    "\\bXarly: Oh, parece que conseguí la Medalla Voltio antes que tú. Te dije que te superaría en poco tiempo. Si combatiéramos ahora, no tendrías ninguna oportunidad.",
  "\\bBut I´m not going to do that, because I am a fair sportsman. Once you claimed the Volt Badge, meet me at the top of the lighthouse." =>
    "\\bPero no voy a hacer eso, porque soy un deportista justo. En cuanto consigas la Medalla Voltio, encuéntrame en lo alto del faro.",
  "\\bDon´t let me wait for too long. See ya!" => "\\bNo me hagas esperar demasiado. ¡Nos vemos!",
  "\\bWow, what a view..." => "\\bVaya, qué vista...",
  "\\bMhh, yeees, I know you want it." => "\\bMmh, síii, sé que lo quieres.",
  "\\bHuh? What´s a kid doing here?" => "\\b¿Eh? ¿Qué hace un niño aquí?",
  "\\bLeave us alone, this is adult business." => "\\bDéjanos en paz, esto son asuntos de adultos.",
  "\\bHmm?! No, I´m not gonna \"let her go\"." => "\\b¿¡Hmm?! No, no voy a \"dejarla ir\".",
  "\\bLooks like you want to do this the hard way. Fine. Here we go!" => "\\bParece que quieres hacer esto por las malas. Bien. ¡Aquí vamos!",
  "\\bYou little..." => "\\bMaldito...",
  "\\bDon´t tell anyone about this, or I´ll come and find you." => "\\bNo le cuentes esto a nadie, o vendré a buscarte.",
}

DICT_154 = {
  "\\bI think I can see Alola..." => "\\bCreo que puedo ver Alola...",
  "\\bMy grandson is going to be a great swimmer one day. I also used to swim a lot, but my age has finally caught up with me." =>
    "\\bMi nieto va a ser un gran nadador algún día. Yo también solía nadar mucho, pero mi edad por fin me alcanzó.",
  "\\bThis is my favorite place in the Delta Region, so I just had to show it to my girlfriend." =>
    "\\bEste es mi lugar favorito de la Región Delta, así que tenía que mostrárselo a mi novia.",
  "\\b???: The Delta Sea..." => "\\b???: El Mar Delta...",
  "\\b???: Oh, hello. We haven´t met before, have we? My name is Arthur, and I am currently researching the vast variation of Pokémon in the Delta Region." =>
    "\\b???: Oh, hola. No nos conocíamos, ¿verdad? Me llamo Arthur, y actualmente estoy investigando la enorme variedad de Pokémon en la Región Delta.",
  "\\bArthur: Did you know that you can find almost every known Pokémon species in the Delta Region? No other region has this variation." =>
    "\\bArthur: ¿Sabías que puedes encontrar casi todas las especies de Pokémon conocidas en la Región Delta? Ninguna otra región tiene esta variedad.",
  "\\bWhile we don´t know for sure why this is the case, one reason for this phenomen could be the age of this region." =>
    "\\bAunque no sabemos con certeza por qué ocurre esto, una razón de este fenómeno podría ser la antigüedad de esta región.",
  "\\bWhen Arceus created the universe and our planet, he created this region before the others. This could have caused the Delta Region to have a special aura." =>
    "\\bCuando Arceus creó el universo y nuestro planeta, creó esta región antes que las demás. Esto podría haber hecho que la Región Delta tenga un aura especial.",
  "\\bBecause of this aura, which I like to call \"Delta Aura\", many legendary and mythical Pokémon come to visit this region." =>
    "\\bDebido a esta aura, a la que me gusta llamar \"Aura Delta\", muchos Pokémon legendarios y singulares vienen a visitar esta región.",
  "\\bThey rest here and take in the Delta Aura, which gives them more power. I myself have managed to encounter a legendary Pokémon not far from here." =>
    "\\bDescansan aquí y absorben el Aura Delta, que les da más poder. Yo mismo he conseguido encontrarme con un Pokémon legendario no muy lejos de aquí.",
  "\\bI´m talking about one of Alola´s Guardians, Tapu Fini. I didn´t challenge it to a battle though, I just observed it from a save distance." =>
    "\\bMe refiero a uno de los Guardianes de Alola, Tapu Fini. Aunque no lo reté a un combate, solo lo observé desde una distancia segura.",
  "\\bMaybe the reason it showed up in the first place, was the Delta Stone I was carrying with me." =>
    "\\bQuizás la razón por la que apareció fue la Piedra Delta que llevaba conmigo.",
  "\\bAlthough science can´t find a trace of this Delta Aura, some objects are said to emit it." =>
    "\\bAunque la ciencia no puede encontrar rastro de esta Aura Delta, se dice que algunos objetos la emiten.",
  "\\bOne good example are Mega Stones. When a Pokémon mega evolves, it goes a step over it´s limit. This is likely a result of the Delta Aura." =>
    "\\bUn buen ejemplo son las Piedras Mega. Cuando un Pokémon megaevoluciona, va un paso más allá de su límite. Esto probablemente sea resultado del Aura Delta.",
  "\\bThe Mega Stones spread around the world all originate from the Delta Region, which supports my theory." =>
    "\\bTodas las Piedras Mega repartidas por el mundo se originan en la Región Delta, lo cual respalda mi teoría.",
  "\\bYou seem like a nice guy, so I want you to have my second Delta Stone. Who knows, maybe this will help you meet legendary Pokémon?" =>
    "\\bPareces buena persona, así que quiero que te quedes con mi segunda Piedra Delta. Quién sabe, ¿quizás esto te ayude a encontrarte con Pokémon legendarios?",
  "\\bArthur: I have to go now, my colleagues probably miss me already. I´m sure we will meet again. Goodbye!" =>
    "\\bArthur: Tengo que irme ya, seguro que mis colegas ya me echan de menos. Estoy seguro de que nos volveremos a ver. ¡Adiós!",
  "\\bFreddy was right, this place is beautiful." => "\\bFreddy tenía razón, este lugar es precioso.",
  "\\bI forgot my repels, so instead I caught this cool Pokémon!" => "\\bMe olvidé los Repelentes, ¡así que en su lugar atrapé este Pokémon genial!",
  "\\bWith how many different Pokémon there are in the Delta Sea, using repels might actually be a crime." =>
    "\\bCon la cantidad de Pokémon distintos que hay en el Mar Delta, usar Repelentes casi que debería ser un delito.",
  "\\bThe water is wonderful here! But you´re in my way!" => "\\b¡El agua aquí es maravillosa! ¡Pero me estás estorbando!",
  "\\bDo you like swimming as much as I do?" => "\\b¿Te gusta nadar tanto como a mí?",
  "\\bAwesome!" => "\\b¡Genial!",
  "\\bOh, okay..." => "\\bOh, vale...",
  "\\bCrystal Beach is the perfect place to swim! You just have to watch out for the Pokémon, but usually a few repels are enough to get around that." =>
    "\\bPlaya Tushi es el lugar perfecto para nadar. Solo tienes que tener cuidado con los Pokémon, pero normalmente con unos cuantos Repelentes basta para evitarlo.",
}

DICT_155 = {
  "\\bGiovanni: WHAT?!" => "\\bGiovanni: ¡¿QUÉ?!",
  "\\bWhy are you here?! I told you to stay away!" => "\\b¿¡Por qué estás aquí?! ¡Te dije que te mantuvieras alejado!",
  "\\bThese grunts are useless in every region..." => "\\bEstos soldados son inútiles en todas las regiones...",
  "\\bWell, it doesn´t matter, I´m already finished here. And I know that you will follow us again, so I´m making it easy for you." =>
    "\\bBueno, no importa, ya terminé aquí. Y sé que nos seguirás otra vez, así que te lo voy a poner fácil.",
  "\\bI now have everything I need to reach my goal. I have made an alliance with the Swords of Justice. And now, I am finally able to meet their student." =>
    "\\bAhora tengo todo lo que necesito para alcanzar mi objetivo. He hecho una alianza con las Espadas de la Justicia. Y ahora, por fin puedo conocer a su alumno.",
  "\\bIf you also want to see Keldeo with your own eyes, then come to the Sword Ruins. But don´t try to bother us, just be glad I invited you." =>
    "\\bSi tú también quieres ver a Keldeo con tus propios ojos, ven a las Ruinas de la Espada. Pero no intentes molestarnos, solo alégrate de que te haya invitado.",
  "\\bUntil then, \\PN." => "\\bHasta entonces, \\PN.",
  "Terrakion is thankful for saving Keldeo. It wants to challenge you!" => "Terrakion está agradecido por salvar a Keldeo. ¡Quiere retarte!",
  "\\bRAKION!!!" => "\\b¡RAKION!!!",
  "Terrakion disappeared. Will it come back?" => "Terrakion desapareció. ¿Volverá?",
}

DICT_156 = {
  "\\bWelcome to Crystal Cove, enjoy your visit!" => "\\bBienvenido a Cueva de la Meta, ¡disfruta tu visita!",
  "\\bI need to see that you have the HM for Surf before you can enter Crystal Cove." =>
    "\\bNecesito comprobar que tienes la MO de Surf antes de que puedas entrar a Cueva de la Meta.",
  "\\bOh, you don´t have that HM yet? Then I can´t let you in." => "\\bOh, ¿todavía no tienes esa MO? Entonces no puedo dejarte entrar.",
  "\\bEvery visitor that comes to Crystal Cove needs to have the HM for Surf. If you don´t know why, just enter the town and see for yourself." =>
    "\\bTodo visitante que viene a Cueva de la Meta necesita tener la MO de Surf. Si no sabes por qué, entra al pueblo y compruébalo tú mismo.",
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

apply("Data/Map153.rxdata", DICT_153)
apply("Data/Map154.rxdata", DICT_154)
apply("Data/Map155.rxdata", DICT_155)
apply("Data/Map156.rxdata", DICT_156)
