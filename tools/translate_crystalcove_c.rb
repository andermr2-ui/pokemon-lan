# encoding: UTF-8
require_relative "rpg_stubs"

DICT_160 = {
  "\\bBack when the lighthouse was still being used to guide ships, a powerful Ampharos was lighting the tower." =>
    "\\bCuando el faro todavía se usaba para guiar barcos, un poderoso Ampharos iluminaba la torre.",
  "\\bThese days we just use my Voltorb, that´s enough to keep the tradition alive." =>
    "\\bHoy en día solo usamos a mi Voltorb, eso basta para mantener viva la tradición.",
  "\\bVolto!" => "\\b¡Volto!",
  "\\bAlright \\PN, this time I will defeat you. I trained so much, I taught my Pokémon strong moves, and now my hard work will finally pay off!" =>
    "\\bMuy bien \\PN, esta vez te voy a derrotar. Entrené muchísimo, le enseñé a mis Pokémon movimientos poderosos, ¡y ahora mi esfuerzo por fin va a dar sus frutos!",
  "\\bHere we go!" => "\\b¡Aquí vamos!",
  "\\bZeke: Oh..." => "\\bXarly: Oh...",
  "\\bZeke: Haha, you got me good. Seems like you´re always one step ahead, huh?" =>
    "\\bXarly: Jaja, me diste bien. Parece que siempre vas un paso por delante, ¿eh?",
  "\\bI have to admit something: \\PN, I admire you. You´ve always been more talented than me. And I wanted to be like you. So I tried everything to get there." =>
    "\\bTengo que admitir algo: \\PN, te admiro. Siempre fuiste más talentoso que yo. Y quería ser como tú. Así que intenté todo para llegar ahí.",
  "\\bBut maybe that´s the wrong thing to do. Maybe I should just do my own thing. And the next time we battle, we will see eye to eye." =>
    "\\bPero quizás eso sea un error. Quizás debería simplemente hacer lo mío. Y la próxima vez que combatamos, estaremos al mismo nivel.",
  "\\bUntil that day comes, we should both try to do our best. Now, I´m off to find the guy that has the HM for Fly. I heard he lives somewhere at this coastline." =>
    "\\bHasta que llegue ese día, ambos deberíamos dar lo mejor de nosotros. Ahora, me voy a buscar al tipo que tiene la MO de Vuelo. Oí que vive en algún lugar de esta costa.",
  "\\bPromise me that you won´t lose a single battle until the next time we meet, because I want to battle against the strongest trainer. See ya!" =>
    "\\bProméteme que no perderás ni un solo combate hasta la próxima vez que nos veamos, porque quiero combatir contra el entrenador más fuerte. ¡Nos vemos!",
  "\\bI can see super far from here!" => "\\b¡Puedo ver súper lejos desde aquí!",
  "\\bBut wait, isn´t that Braviary coming a bit close to that tower?!" =>
    "\\bPero espera, ¿¡ese Braviary no se está acercando demasiado a esa torre?!",
  "\\bNah, I´m just joking. The Ho-Oh incident from 2001 is a serious topic, I should behave myself." =>
    "\\bNah, solo estoy bromeando. El incidente de Ho-Oh del 2001 es un tema serio, debería comportarme.",
}

DICT_162 = {
  "\\bLet´s amp it up a bit!" => "\\b¡Subamos un poco el amperaje!",
  "\\bThese switch boxes control the electric gate. Just turn them off and you´re good to go." =>
    "\\bEstas cajas de interruptores controlan la puerta eléctrica. Solo apágalas y podrás pasar.",
  "\\bNow that Watron lost to two young trainers in a row, he should reconsider his job choice..." =>
    "\\bAhora que Watron perdió contra dos jóvenes entrenadores seguidos, debería replantearse su elección de carrera...",
  "\\bI´m charged up!" => "\\b¡Estoy cargado!",
  "\\bIf you want to stand any chance against Watron, you need to use strong Ground-Type moves. But even with that, he´s still hard to beat." =>
    "\\bSi quieres tener alguna oportunidad contra Watron, necesitas usar movimientos fuertes de tipo Tierra. Pero incluso así, sigue siendo difícil de vencer.",
  "\\bWow, you actually did it!" => "\\b¡Vaya, de verdad lo lograste!",
  "\\bTime for a shocking battle!" => "\\b¡Hora de un combate electrizante!",
  "\\bDon´t underestimate Watron. He has some tricks up his sleeve." => "\\bNo subestimes a Watron. Tiene algunos trucos bajo la manga.",
  "\\bLooks like you had more tricks up your sleeve. Good job!" => "\\bParece que tú tenías más trucos bajo la manga. ¡Buen trabajo!",
  "\\bWelcome to the Crystal Cove Gym. In this gym, trainers use Electric-Type Pokémon, which are only weak to Ground-Type attacks." =>
    "\\bBienvenido al Gimnasio de Cueva de la Meta. En este gimnasio, los entrenadores usan Pokémon de tipo Eléctrico, que solo son débiles a los ataques de tipo Tierra.",
  "\\bWithout a Ground-Type attack, you will struggle here. Good luck!" => "\\bSin un ataque de tipo Tierra, lo pasarás mal aquí. ¡Buena suerte!",
  "\\bHaha, nothing can shock a trainer like you. Good job!" => "\\bJaja, nada puede electrizar a un entrenador como tú. ¡Buen trabajo!",
  "You deactivated the circuit." => "Desactivaste el circuito.",
}

DICT_163 = {
  "\\bWatron: Oh, another young talent! I got caught off guard in my last battle, but don´t worry, I have recharged now." =>
    "\\bWatron: Oh, ¡otro joven talento! Me pillaron desprevenido en mi último combate, pero no te preocupes, ya me he recargado.",
  "\\bIt´s time for a high voltage battle!" => "\\b¡Es hora de un combate de alto voltaje!",
  "\\me[Badge get]\\bI think I´m getting old. Here, you deserve the Volt Badge!\\wtnp[110]" =>
    "\\me[Badge get]\\bCreo que me estoy haciendo viejo. Toma, ¡te mereces la Medalla Voltio!\\wtnp[110]",
  "\\bAnd I won´t treat you any different than the other kid that claimed the badge. Take this TM." =>
    "\\bY no te trataré distinto al otro chaval que consiguió la medalla. Toma esta MT.",
  "\\bWatron: This TM cointains Thunder, an extremely strong electric type move. It can miss, but that drawback is worth it." =>
    "\\bWatron: Esta MT contiene Trueno, un movimiento de tipo Eléctrico extremadamente fuerte. Puede fallar, pero ese inconveniente merece la pena.",
  "\\bWith the Volt Badge, you can now use Fly to travel to towns that you´ve already been to faster." =>
    "\\bCon la Medalla Voltio, ya puedes usar Vuelo para viajar más rápido a pueblos que ya has visitado.",
  "\\bAnd you only need 3 more badges to be eligible to challenge the Pokémon league. I have a feeling that you will make it that far. Bye!" =>
    "\\bY solo necesitas 3 medallas más para poder retar a la Liga Pokémon. Tengo el presentimiento de que llegarás hasta ahí. ¡Adiós!",
  "\\bWatron: I found the Mega Stone for my Ampharos on Route 9. Maybe there´s another one?" =>
    "\\bWatron: Encontré la Piedra Mega de mi Ampharos en la Ruta 9. ¿Habrá otra?",
  "\\bWatron: Welcome back. I was quite shocked to hear that Arthur has been defeated, but I also really want to challenge our new Champion." =>
    "\\bWatron: Bienvenido de vuelta. Me quedé bastante impactado al oír que Arthur fue derrotado, pero también quiero de verdad retar a nuestro nuevo Campeón.",
  "\\bAre you interested in a rematch? And I know, I know, my chances of winning are very slim, but I want to see where I stand." =>
    "\\b¿Te interesa una revancha? Y ya sé, ya sé, mis posibilidades de ganar son muy escasas, pero quiero ver en qué punto estoy.",
  "\\bAre you gonna beat me in a flash, or can I give you a fair fight? I´m charged up, so let´s battle!" =>
    "\\b¿Me vas a vencer en un instante, o puedo darte una pelea justa? Estoy cargado, ¡así que combatamos!",
  "\\bWatron: Yeah, I´m not surprised. No matter what I do, you just don´t seem to care." =>
    "\\bWatron: Sí, no me sorprende. Haga lo que haga, parece que no te importa.",
  "\\bYou have the right mindset, that´s for sure. I´m the last person to run away from a battle, but I still lack confidence." =>
    "\\bDesde luego, tienes la mentalidad correcta. Yo soy el último que huiría de un combate, pero aún me falta confianza.",
  "\\bDon´t worry about me though, I´m doing just fine. Being a Gym Leader is a fun job, and I wouldn´t wanna have it any other way. Goodbye!" =>
    "\\bPero no te preocupes por mí, estoy bien. Ser Líder de Gimnasio es un trabajo divertido, y no lo cambiaría por nada. ¡Adiós!",
  "\\bWatron: I should be glad that I´ve made it this far. When I took the Gym Leader exam, I barely knew enough about Pokémon to pass." =>
    "\\bWatron: Debería alegrarme de haber llegado hasta aquí. Cuando hice el examen de Líder de Gimnasio, apenas sabía lo suficiente sobre Pokémon para aprobar.",
  "\\bIf Electric-Types weren´t as simple as they are, with their fast and hard-hitting attacks and lack of weaknesses, I wouldn´t be here today." =>
    "\\bSi los de tipo Eléctrico no fueran tan sencillos como son, con sus ataques rápidos y contundentes y su falta de debilidades, hoy no estaría aquí.",
}

DICT_164 = {
  "\\bShould I use a Fire-Type Pokémon while battling in the sea?" => "\\b¿Debería usar un Pokémon de tipo Fuego mientras combato en el mar?",
  "\\bEven tough Fire-, Rock- and Ground-Type Pokémon are weak to water, they somehow don´t mind battling in the sea." =>
    "\\bAunque los Pokémon de tipo Fuego, Roca y Tierra son débiles al agua, de alguna manera no les importa combatir en el mar.",
  "\\bI love the beach! That´s why we´re here every day!" => "\\b¡Me encanta la playa! ¡Por eso venimos aquí todos los días!",
  "\\bMy daughter always gets upset when she can´t go to the beach, so I decided to take her here as often as possible." =>
    "\\bMi hija siempre se enfada cuando no puede ir a la playa, así que decidí traerla aquí tan a menudo como sea posible.",
  "\\bOh, hi. You don´t happen to have an Exeggutor with you right now, do you?" =>
    "\\bOh, hola. No tendrás un Exeggutor contigo ahora mismo, ¿verdad?",
  "\\bI´m from Alola and I´ve a rare Alolan Exeggutor with me, which I´d like to trade for a Kanto Exeggutor. Do you want to trade with me?" =>
    "\\bSoy de Alola y tengo conmigo un raro Exeggutor de Alola, que me gustaría intercambiar por un Exeggutor de Kanto. ¿Quieres intercambiar conmigo?",
  "\\bYou don't want to trade?  Aww..." => "\\b¿No quieres intercambiar? Vaya...",
  "\\bOK, let's get started." => "\\bVale, empecemos.",
  "\\PN traded Exeggutor for Exeggutor!" => "¡\\PN intercambió Exeggutor por Exeggutor!",
  "\\bThank you so much! I always wanted to have the Kanto Form of Exeggutor, and now I finally have one!" =>
    "\\b¡Muchísimas gracias! Siempre quise tener la forma de Kanto de Exeggutor, ¡y ahora por fin tengo una!",
  "\\bYou don't want to trade? Aww..." => "\\b¿No quieres intercambiar? Vaya...",
  "\\bThanks for trading with me!" => "\\b¡Gracias por intercambiar conmigo!",
  "\\bCareful, rocks come tumbling down the cliff sometimes." => "\\bCuidado, a veces caen rocas rodando por el acantilado.",
  "\\bThis rocky beach attracts rare Pokémon. They like to hide near the rocks." =>
    "\\bEsta playa rocosa atrae a Pokémon raros. Les gusta esconderse cerca de las rocas.",
  "\\bWe would battle you, but with just one Pokémon on your team, this wouldn´t be fair." =>
    "\\bTe combatiríamos, pero con solo un Pokémon en tu equipo, esto no sería justo.",
  "\\bWhere do you think you´re going? We reserved this spot with towels!" =>
    "\\b¿Adónde crees que vas? ¡Reservamos este sitio con toallas!",
  "\\bThis beach is massive, why do you need to be here?" => "\\bEsta playa es enorme, ¿por qué necesitas estar aquí?",
  "\\bThis is our spot. And we will fight for it!" => "\\bEste es nuestro sitio. ¡Y lucharemos por él!",
  "\\bPlease let us stay here, we had to wait ages for our vacation..." =>
    "\\bPor favor, déjanos quedarnos aquí, tuvimos que esperar una eternidad por nuestras vacaciones...",
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

apply("Data/Map160.rxdata", DICT_160)
apply("Data/Map162.rxdata", DICT_162)
apply("Data/Map163.rxdata", DICT_163)
apply("Data/Map164.rxdata", DICT_164)
