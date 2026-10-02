# encoding: UTF-8
require_relative "rpg_stubs"

DICT_172 = {
  "\\bHello and welcome to my beach house. People call me the Fly Master, because my Pokémon have mastered that move." =>
    "\\bHola y bienvenido a mi casa de playa. La gente me llama el Maestro del Vuelo, porque mis Pokémon han dominado ese movimiento.",
  "\\bThe government has assigned me to give every trainer who claims the Volt Badge the HM for Fly." =>
    "\\bEl gobierno me ha encargado dar la MO de Vuelo a todo entrenador que consiga la Medalla Voltio.",
  "\\bAnd? Have you managed to claim the badge?" => "\\b¿Y bien? ¿Conseguiste la medalla?",
  "\\bYou do? Fantastic! Then you´re eligible to receive this HM. Here you go!" =>
    "\\b¿Sí? ¡Fantástico! Entonces cumples los requisitos para recibir esta MO. ¡Aquí tienes!",
  "\\bOh, you´re saying you haven´t claimed the Volt Badge yet? Then I´m sorry, but the government doesn´t allow me to hand you the HM." =>
    "\\bOh, ¿me estás diciendo que todavía no conseguiste la Medalla Voltio? Entonces lo siento, pero el gobierno no me permite entregarte la MO.",
  "\\bYou can use Fly to get to every town that you´ve already been to. Just tell your Pokémon where you want to go, and you´ll be there in no time." =>
    "\\bPuedes usar Vuelo para llegar a cualquier pueblo que ya hayas visitado. Solo dile a tu Pokémon adónde quieres ir, y estarás allí en un abrir y cerrar de ojos.",
}

DICT_175 = {
  "The laptop shows a website. It´s called \"Epstein and Friends\"." =>
    "El portátil muestra una página web. Se llama \"Epstein y Amigos\".",
  "\\bWow, you were amazing!" => "\\b¡Vaya, fuiste increíble!",
  "\\bYou´re an adult now, so let me reward you!" => "\\bYa eres un adulto, ¡así que déjame recompensarte!",
  "\\bA responsible adult always uses protection, so take this." => "\\bUn adulto responsable siempre usa protección, así que toma esto.",
  "\\bYou´re welcome, honey!" => "\\b¡De nada, cariño!",
  "\\bRemember, don´t tell anyone about this!" => "\\b¡Recuerda, no le cuentes esto a nadie!",
}

DICT_265 = {
  "\\bYOU SON OF A BITCH!!! STOP SPAWN CAMPING YOU ******!!!" =>
    "\\b¡¡¡HIJO DE PUTA!!! ¡DEJA DE CAMPEAR EL SPAWN, ******!!!",
  "\\bAll I want is for my son to stop playing that damn game all day. This Counter Strike thing has taken over his entire life!" =>
    "\\bLo único que quiero es que mi hijo deje de jugar a ese maldito juego todo el día. ¡Ese tal Counter Strike se ha apoderado de toda su vida!",
  "\\bI know that the loss of his mother has hit him hard, but I still want him to have a normal childhood like most children." =>
    "\\bSé que la pérdida de su madre le ha afectado mucho, pero aun así quiero que tenga una infancia normal como la mayoría de los niños.",
  "\\bSometimes I wonder if I should´ve been the one to get cancer and not Emily..." =>
    "\\bA veces me pregunto si debería haber sido yo quien tuviera cáncer y no Emily...",
  "\\bOh, sorry, I was getting carried away there. You look like a strong Pokémon Trainer, aren´t you?" =>
    "\\bOh, perdona, me estaba dejando llevar. Pareces un Entrenador Pokémon fuerte, ¿verdad?",
  "\\bI wanted to gift my son a Pokémon for his 10th Birthday, but since the thing with Emily happened, I just haven´t been strong enough to do so." =>
    "\\bQuería regalarle a mi hijo un Pokémon por su décimo cumpleaños, pero desde que pasó lo de Emily, no he tenido fuerzas para hacerlo.",
  "\\bOne day I will give him a Pokémon that he will be able to connect with, so I want you to have this one. Please, you´d help me a lot if you´d take it." =>
    "\\bAlgún día le daré un Pokémon con el que pueda conectar de verdad, así que quiero que tú te quedes con este. Por favor, me ayudarías mucho si lo aceptas.",
  "\\bThank you! This will make things easier for me, and now I might be able to help my son. Take good care of the little Mudkip, trainer, and have a good day." =>
    "\\b¡Gracias! Esto me lo pondrá más fácil, y puede que ahora pueda ayudar a mi hijo. Cuida bien del pequeño Mudkip, entrenador, y que tengas un buen día.",
  "There's no more room for Pokémon!" => "¡No hay más espacio para Pokémon!",
  "The Pokémon Boxes are full and can't accept any more!" => "¡Las Cajas Pokémon están llenas y no pueden aceptar más!",
  "\\bEven with all of the amazing technologies that we have thanks to Pokémon, we still can´t fight most forms of cancer." =>
    "\\bIncluso con todas las increíbles tecnologías que tenemos gracias a los Pokémon, todavía no podemos combatir la mayoría de los tipos de cáncer.",
  "\\bI hope we can change that in the future!" => "\\b¡Espero que podamos cambiar eso en el futuro!",
}

DICT_289 = {
  "\\bAre you familiar with a Pokémon called Cresselia? It resembles the crescent moon." =>
    "\\b¿Conoces a un Pokémon llamado Cresselia? Se parece a la luna creciente.",
  "\\bAnd you look like you´re the right trainer to find it." => "\\bY pareces el entrenador indicado para encontrarlo.",
  "\\bWait a minute, aren´t you the new Champion?!" => "\\bEspera un momento, ¿¡no eres el nuevo Campeón?!",
  "\\bHaha, I knew it. I read about you on Reddit. I feel honored to have you as my guest." =>
    "\\bJaja, lo sabía. Leí sobre ti en Reddit. Me siento honrado de tenerte como invitado.",
  "\\bAs the Champion, I take it you´d like to find a Legendary Pokémon?" =>
    "\\bComo Campeón, supongo que te gustaría encontrar un Pokémon Legendario, ¿no?",
  "\\bYeah, that´s what I thought. I´ve been quite invested in the research of the old Champion, Arthur." =>
    "\\bSí, eso pensaba. Me he interesado bastante en la investigación del antiguo Campeón, Arthur.",
  "\\bHis theory regarding the Delta Aura does make a lot of sense, and that´s what we need to make this work." =>
    "\\bSu teoría sobre el Aura Delta tiene mucho sentido, y eso es lo que necesitamos para que esto funcione.",
  "\\bFirst, we need to find a Delta Stone. That´s the difficult part, because..." =>
    "\\bPrimero, necesitamos encontrar una Piedra Delta. Esa es la parte difícil, porque...",
  "\\bHm? What? You got a Delta Stone from Arthur?! YEEEEEEES!!!" =>
    "\\b¿Hmm? ¿Qué? ¡¿Conseguiste una Piedra Delta de Arthur?! ¡¡¡SÍIIIII!!!",
  "\\bThen this should be quite easy. If my calculations are correct, your Delta Stone can attract Cresselia." =>
    "\\bEntonces esto debería ser bastante fácil. Si mis cálculos son correctos, tu Piedra Delta puede atraer a Cresselia.",
  "\\bThere is a tiny little island on the shore of Crystal Cove, in the North to be more exact." =>
    "\\bHay una pequeña isla en la costa de Cueva de la Meta, en el norte para ser más exactos.",
  "\\bAt night, you need to be in the very center of that island, with your Delta Stone." =>
    "\\bDe noche, tienes que estar justo en el centro de esa isla, con tu Piedra Delta.",
  "\\bThat way, you might be able to attract Cresselia. Good luck!" => "\\bAsí, puede que consigas atraer a Cresselia. ¡Buena suerte!",
  "\\bI think there´s a way to find Cresselia, but only a super strong trainer would be able to do so." =>
    "\\bCreo que hay una forma de encontrar a Cresselia, pero solo un entrenador súper fuerte podría conseguirlo.",
  "\\bCome back to me and tell me what happened. I hope this works!" => "\\bVuelve y cuéntame qué pasó. ¡Espero que esto funcione!",
  "\\bWhat? You caught Cresselia?! That´s crazy! Huh, I shouldn´t be surprised, you´re the Champion after all." =>
    "\\b¿Qué? ¡¿Atrapaste a Cresselia?! ¡Eso es una locura! Bueno, no debería sorprenderme, al fin y al cabo eres el Campeón.",
  "\\bPlease, show me Cresselia´s Pokédex-Entry." => "\\bPor favor, muéstrame la entrada de la Pokédex de Cresselia.",
  "\\bWow, what a beautiful Pokémon. The Pokémon of the crescent moon..." =>
    "\\bVaya, qué Pokémon tan hermoso. El Pokémon de la luna creciente...",
  "\\bOh, but did you know that there also is a Pokémon of the new moon? I´m talking about Darkrai." =>
    "\\bOh, pero ¿sabías que también hay un Pokémon de la luna nueva? Me refiero a Darkrai.",
  "\\bI´m not too familiar with that Pokémon, but I know that it has the ability to cause nightmares." =>
    "\\bNo conozco muy bien a ese Pokémon, pero sé que tiene la capacidad de causar pesadillas.",
  "\\bThe latest sighting of Darkrai was in Ambergove, but I don´t know how reliable that source is." =>
    "\\bEl último avistamiento de Darkrai fue en Arboleda Ámbar, pero no sé qué tan fiable es esa fuente.",
  "\\bFor every bit of helpful information, Reddit also has an equal amount of shenanigans and tomfoolery." =>
    "\\bPor cada dato útil, Reddit también tiene la misma cantidad de tonterías y disparates.",
  "\\bIf you also want to find Darkrai, you should talk to the people of Ambergrove." =>
    "\\bSi también quieres encontrar a Darkrai, deberías hablar con la gente de Arboleda Ámbar.",
  "\\bBut leave me out of this, I don´t want to have nightmares. Take care!" =>
    "\\bPero déjame fuera de esto, no quiero tener pesadillas. ¡Cuídate!",
  "\\bDarkrai and Cresselia..." => "\\bDarkrai y Cresselia...",
  "\\bI wonder if there´s a connection between the two." => "\\bMe pregunto si hay alguna conexión entre los dos.",
  "\\bMy cousin spends too much time on Reddit. He actually believes that this Cresselia Pokémon is real..." =>
    "\\bMi primo pasa demasiado tiempo en Reddit. De verdad cree que ese Pokémon Cresselia es real...",
  "\\bI might also use Reddit, but at least I only use it for the porn." =>
    "\\bPuede que yo también use Reddit, pero al menos solo lo uso para el porno.",
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

apply("Data/Map172.rxdata", DICT_172)
apply("Data/Map175.rxdata", DICT_175)
apply("Data/Map265.rxdata", DICT_265)
apply("Data/Map289.rxdata", DICT_289)
