# encoding: UTF-8
require_relative "rpg_stubs"

DICT_091 = {
  "\\bOh, I didn´t see you there. This mist makes it a bit tricky to see what´s going on." =>
    "\\bOh, no te vi ahí. Esta niebla hace que sea un poco difícil ver qué pasa.",
  "\\bBut don´t worry, the mist is not harmful. It´s just the result of minor thermal activities. " =>
    "\\bPero no te preocupes, la niebla no es dañina. Es solo el resultado de una actividad térmica menor.",
  "Mistveil Gym\\nLeader: Solan" => "Gimnasio de Velo Brumoso\\nLíder: Solan",
  "\\b$20.000.000 for this house?! I thought the mist would drop the price, but I guess our economy is just that ******." =>
    "\\b¿¡20.000.000 ₽ por esta casa!? Pensaba que la niebla bajaría el precio, pero supongo que nuestra economía está así de ******.",
  "\\bPay up right now, or you´ll rot in prison for the rest of your life!" =>
    "\\b¡Paga ahora mismo, o te pudrirás en la cárcel el resto de tu vida!",
  "\\bWhat?!" => "\\b¡¿Qué?!",
  "\\bOh, don´t mind me, I´m just arresting a criminal for, uhm, robbery. Yeah, robbery. Let me do my job." =>
    "\\bOh, no me hagas caso, solo estoy arrestando a un criminal por, eh, robo. Sí, robo. Déjame hacer mi trabajo.",
  "\\bCorrupt?! You call me corrupt?!" => "\\b¿¡Corrupto!? ¿¡Me llamas corrupto!?",
  "\\bTHAT`S IT! TAKE THIS!!!" => "\\b¡SE ACABÓ! ¡¡¡TOMA ESTO!!!",
  "\\bAlright, alright, you win. I guess this wasn´t very honorable of me. I´ll try to be a better officer in the future. Please, forgive me." =>
    "\\bVale, vale, ganas tú. Supongo que esto no fue muy honorable de mi parte. Intentaré ser un mejor agente en el futuro. Por favor, perdóname.",
  "\\bSometimes the mist gets so thick that you lose all sense of direction. I even struggle to leave the town sometimes." =>
    "\\bA veces la niebla se pone tan espesa que pierdes todo el sentido de la orientación. A veces hasta me cuesta salir del pueblo.",
  "\\bYou really saved me there! Let me thank you with this." =>
    "\\b¡De verdad me salvaste ahí! Deja que te lo agradezca con esto.",
  "\\bCorruption is a serious problem. Cops shouldn´t be so greedy." =>
    "\\bLa corrupción es un problema serio. Los policías no deberían ser tan codiciosos.",
  "\\bI like that boulder. That is a nice boulder." =>
    "\\bMe gusta esa roca. Qué roca tan bonita.",
  "For Sale: $20.000.000" => "En venta: 20.000.000 ₽",
  "\\bZeke: Alright, pal. I trained my Pokémon, and now you stand no chance. It´s battle time!" =>
    "\\bXarly: Bien, colega. Entrené a mis Pokémon, y ahora no tienes ninguna posibilidad. ¡Es hora de combatir!",
  "\\bZeke: How can this be possible? AHHRRGGHHHH!!! Next time we meet you´re done for sure. See ya." =>
    "\\bXarly: ¿Cómo es esto posible? ¡¡¡AHHRRGGHHHH!!! La próxima vez que nos veamos estás acabado, seguro. Nos vemos.",
}

DICT_096 = {
  "\\bDo you feel the heat?" => "\\b¿Sientes el calor?",
  "\\bDo you need a hint? The switch next to me needs to be turned on." =>
    "\\b¿Necesitas una pista? El interruptor de al lado tiene que activarse.",
  "\\bWell done. Defeating Solan is a big achievement!" =>
    "\\bBien hecho. ¡Derrotar a Solan es un gran logro!",
  "\\bIt´s about to get hot!" => "\\b¡Esto se va a poner al rojo vivo!",
  "\\bDo you need a hint? I would help you but I don´t actually know the right combination." =>
    "\\b¿Necesitas una pista? Te ayudaría, pero la verdad es que no sé la combinación correcta.",
  "\\bWow, impressive! Solan always brings his Pokémon to the limit of what they can do, but you still triumphed!" =>
    "\\b¡Vaya, impresionante! Solan siempre lleva a sus Pokémon al límite de lo que pueden hacer, ¡pero aun así triunfaste!",
  "\\bWelcome to the Mistveil Gym. In this Gym, the trainers use Fire-Type Pokémon, which are weak to Ground-, Water- and Rock-Type attacks." =>
    "\\bBienvenido al Gimnasio de Velo Brumoso. En este Gimnasio, los entrenadores usan Pokémon de tipo Fuego, que son débiles contra los ataques de tipo Tierra, Agua y Roca.",
  "\\bBut don´t underestimate Solan, the Gym Leader. He is known for ending trainer careers early. Good luck!" =>
    "\\bPero no subestimes a Solan, el Líder de Gimnasio. Es conocido por acabar con las carreras de los entrenadores antes de tiempo. ¡Buena suerte!",
  "\\bGood job! Solan is a fierce trainer, so you should be proud!" =>
    "\\b¡Buen trabajo! Solan es un entrenador feroz, ¡así que deberías estar orgulloso!",
}

DICT_097 = {
  "\\bSolan: Congrats on solving the switch puzzle. I´m Solan, and I live for the heat of battle. That´s why I use Fire-Type Pokémon, because they bring the heat." =>
    "\\bSolan: Felicidades por resolver el puzle de los interruptores. Soy Solan, y vivo por el calor de la batalla. Por eso uso Pokémon de tipo Fuego, porque traen el calor.",
  "\\bI hope you´re ready, because I´m fired up!" =>
    "\\bEspero que estés listo, ¡porque estoy que ardo!",
  "\\me[Badge get]\\bHere you go kid, take the Solar Badge.\\wtnp[110]" =>
    "\\me[Badge get]\\bToma, chaval, coge la Medalla Solar.\\wtnp[110]",
  "\\bI´ve got another little something here for you. Take this TM." =>
    "\\bTengo otro pequeño detalle para ti. Toma esta MT.",
  "\\bSolan: This TM cointains Flame Charge, a very useful move for getting your Pokémon up to speed. I´m sure you will use it wisely." =>
    "\\bSolan: Esta MT contiene Ariete Ígneo, un movimiento muy útil para coger velocidad con tu Pokémon. Seguro que lo usas con sabiduría.",
  "\\bNow, head out there and try to win against the other Gym Leaders. You should challenge the Silver Peak Gym next. Until we meet again!" =>
    "\\bAhora, sal ahí fuera e intenta vencer al resto de Líderes de Gimnasio. Deberías retar el Gimnasio de Pico Plata a continuación. ¡Hasta que nos volvamos a ver!",
  "\\bSolan: If you haven´t done so yet, you should visit the Mistveil Institute. They are experts regarding prehistoric Pokémon." =>
    "\\bSolan: Si todavía no lo has hecho, deberías visitar el Instituto Velo Brumoso. Son expertos en Pokémon prehistóricos.",
  "\\bSolan: Ah, we meet again. I had a feeling that we´d have a rematch one day, but I didn´t expect that rematch to be against the Champion." =>
    "\\bSolan: Ah, nos volvemos a ver. Tenía la sensación de que tendríamos una revancha algún día, pero no esperaba que esa revancha fuera contra el Campeón.",
  "\\bCongratulations on that achievement. I should warn you though, because I really want to take that title away from you." =>
    "\\bFelicidades por ese logro. Aunque debo advertirte, porque de verdad quiero quitarte ese título.",
  "\\bAre you ready? I´ll show you my burning passion!" =>
    "\\b¿Estás listo? ¡Voy a mostrarte mi pasión ardiente!",
  "\\bSolan: Oh, I actually thought that I had a chance, but I guess you´re in a different league." =>
    "\\bSolan: Oh, la verdad es que pensaba que tenía una oportunidad, pero supongo que estás en otra liga.",
  "\\bEither way, that was really fun! Cherish every even remotely challenging battle, because those will be rare from now on. Goodbye!" =>
    "\\bDe todos modos, ¡eso fue muy divertido! Aprecia cada combate que suponga aunque sea un mínimo reto, porque a partir de ahora escasearán. ¡Adiós!",
  "\\bSolan: I´m getting goosebumps right now. Just being in the room with you is kinda intimidating. Arthur didn´t have this much aura..." =>
    "\\bSolan: Se me está poniendo la piel de gallina ahora mismo. Solo estar en la misma sala que tú resulta intimidante. Arthur no tenía tanta aura...",
}

DICT_259 = {
  "\\bOh my, a visitor! What a pleasent surprise! You know, I never had any children, so I´ve been quite lonely since my husband died." =>
    "\\bVaya, ¡una visita! Qué grata sorpresa. Sabes, nunca tuve hijos, así que he estado bastante sola desde que murió mi marido.",
  "\\bYoung folks like you usually don´t want to listen to an old lady like me, so having a visitor really makes my day." =>
    "\\bLos jóvenes como tú normalmente no quieren escuchar a una anciana como yo, así que tener una visita me alegra el día.",
  "\\bI regret never becoming a mother or even a grandmother, so let me try to at least feel like one for a day." =>
    "\\bMe arrepiento de no haber llegado a ser madre ni siquiera abuela, así que déjame al menos sentirme como una por un día.",
  "\\bMy husband made me a gift shortly before he passed away, and I haven´t been able to take care of this thing since then." =>
    "\\bMi marido me hizo un regalo poco antes de fallecer, y no he podido cuidar de esto desde entonces.",
  "\\bOh, and don´t worry, you aren´t taking away a parting gift or anything like that, he got me something else as well." =>
    "\\bOh, y no te preocupes, no te estás llevando ningún regalo de despedida ni nada parecido, él también me dio otra cosa.",
  "\\bSo please, let me gift you this." => "\\bAsí que, por favor, deja que te regale esto.",
  "\\bI feel quite accomplished now. My husband is waiting for me, and I wouldn´t mind seeing him again now. Take care of the little Bulbasaur." =>
    "\\bMe siento bastante realizada ahora. Mi marido me está esperando, y no me importaría volver a verlo ya. Cuida bien del pequeño Bulbasaur.",
  "\\bFarewell!" => "\\b¡Adiós!",
  "There's no more room for Pokémon!" => "¡No hay más espacio para Pokémon!",
  "The Pokémon Boxes are full and can't accept any more!" => "¡Las Cajas Pokémon están llenas y no pueden aceptar más!",
  "\\bI´ve now done everything I wanted to do in this life. Let me give you a lesson, kid. Never settle for less, and marry someone who is very rich." =>
    "\\bYa he hecho todo lo que quería hacer en esta vida. Deja que te dé una lección, chaval. Nunca te conformes con menos, y cásate con alguien muy rico.",
  "\\bThat´s what I did, and it worked out for me." => "\\bEso fue lo que hice yo, y me funcionó.",
}

DICT_282 = {
  "It´s an old steel doll." => "Es una vieja muñeca de acero.",
  "The Delta Stone in your pocket just lit up!" =>
    "¡La Piedra Delta en tu bolsillo acaba de brillar!",
  "The doll is coming to life!" => "¡La muñeca está cobrando vida!",
  "\\bEARNAAA!!!" => "\\b¡¡¡EARNAAA!!!",
  "Magearna went back into a deep slumber. Will it wake up again?" =>
    "Magearna volvió a caer en un sueño profundo. ¿Despertará de nuevo?",
}

DICT_296 = {
  "\\bWho are you? A trainer?" => "\\b¿Quién eres? ¿Un entrenador?",
  "\\bOh, yeah, and you look really strong. I´m currently training to become a Gym Leader, and I want to have a Psychic-Type Gym." =>
    "\\bOh, sí, y pareces muy fuerte. Ahora mismo estoy entrenando para ser Líder de Gimnasio, y quiero tener un Gimnasio de tipo Psíquico.",
  "\\bI thought that the Pokémon I chose as my first partner would evolve into a Fire- and Psychic-Type, but I got it all wrong." =>
    "\\bPensaba que el Pokémon que elegí como mi primer compañero evolucionaría a un tipo Fuego y Psíquico, pero me equivoqué por completo.",
  "\\bI have no use for this Tepig, so I want a strong trainer to take care of it. Here you go." =>
    "\\bNo le doy ningún uso a este Tepig, así que quiero que un entrenador fuerte cuide de él. Toma.",
  "\\bI should get back to training soon, because I need to become a Psychic-Type expert if I want to lead a Gym." =>
    "\\bDebería volver a entrenar pronto, porque necesito convertirme en experta en tipo Psíquico si quiero liderar un Gimnasio.",
  "\\bBye!" => "\\b¡Adiós!",
  "There's no more room for Pokémon!" => "¡No hay más espacio para Pokémon!",
  "The Pokémon Boxes are full and can't accept any more!" => "¡Las Cajas Pokémon están llenas y no pueden aceptar más!",
  "\\bBut certainly not a strong one. I´m never gonna find someone to give this to then..." =>
    "\\bPero desde luego no uno fuerte. Entonces nunca voy a encontrar a quien dárselo...",
  "\\bSome of the current Gym Leaders are getting old, and they´ve started to look for successors." =>
    "\\bAlgunos de los actuales Líderes de Gimnasio se están haciendo mayores, y han empezado a buscar sucesores.",
  "\\bMy little sister is trying her hardest to become a Gym Leader. I´m sure she can do it!" =>
    "\\bMi hermana pequeña se está esforzando al máximo para ser Líder de Gimnasio. ¡Seguro que lo consigue!",
}

DICT_297 = {
  "\\bMy sister drinks too much choccy milk..." =>
    "\\bMi hermana bebe demasiada leche con chocolate...",
  "\\bI love choccy milk! Do you like choccy milk?" =>
    "\\b¡Me encanta la leche con chocolate! ¿A ti te gusta la leche con chocolate?",
  "It´s a biology book. It shows the anatomy of a Vaporeon." =>
    "Es un libro de biología. Muestra la anatomía de un Vaporeon.",
}

DICT_298 = {
  "It´s a strange looking stature. Something is written on the socket:" =>
    "Es una estatua de aspecto extraño. Hay algo escrito en el pedestal:",
  "\"Key Card required\"" => "\"Se requiere Tarjeta Llave\"",
  "You hold the Key Card against the stature." =>
    "Sostienes la Tarjeta Llave contra la estatua.",
  "\\bI´m just a normal guy living in a normal house." =>
    "\\bSoy solo un tipo normal que vive en una casa normal.",
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
  puts "#{path}: #{count}/#{dict.size} reemplazos"
end

apply("Data/Map091.rxdata", DICT_091)
apply("Data/Map096.rxdata", DICT_096)
apply("Data/Map097.rxdata", DICT_097)
apply("Data/Map259.rxdata", DICT_259)
apply("Data/Map282.rxdata", DICT_282)
apply("Data/Map296.rxdata", DICT_296)
apply("Data/Map297.rxdata", DICT_297)
apply("Data/Map298.rxdata", DICT_298)
