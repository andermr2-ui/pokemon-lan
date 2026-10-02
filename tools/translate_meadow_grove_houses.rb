# encoding: UTF-8
# Traduce las 4 casas de Prado Arboleda que faltaban: Casa de Marcus (086),
# y las 3 casas genericas "House a/b/c" (290/291/292). Compara el texto
# completo reconstruido (101 + continuaciones 401) contra un diccionario por
# mapa, reemplaza el primer comando y vacia los 401 sobrantes.
require_relative "rpg_stubs"

DICTS = {
  86 => {
    "\\bMarcus: Oh, hello. You must be the other kid that the Professor mentioned." =>
      "\\bMarcus: Oh, hola. Debes de ser el otro chico que mencionó el Profesor.",
    "\\bThere´s something I´m supposed to give to you, but I want to evaluate your performance first." =>
      "\\bTengo que darte algo, pero antes quiero evaluar cómo te desenvuelves.",
    "\\bI hope you´re not as impulsive as the other kid, although he did do a solid job." =>
      "\\bEspero que no seas tan impulsivo como el otro chico, aunque él lo hizo bastante bien.",
    "\\bNow show me some results!" =>
      "\\b¡Ahora enséñame resultados!",
    "\\bMarcus: My evaluation is complete. You are very talented! I have no doubt in my mind that you´ll do well in the Gym Challenge." =>
      "\\bMarcus: Mi evaluación ha terminado. ¡Tienes mucho talento! No me cabe duda de que te irá bien en el Reto de Gimnasios.",
    "\\bIt´s no secret that defeating all 8 Gym Leaders is very difficult, but if you catch some strong Pokémon and train them enough you´ll have a fair shot." =>
      "\\bNo es ningún secreto que derrotar a los 8 Líderes de Gimnasio es muy difícil, pero si capturas Pokémon fuertes y los entrenas lo suficiente, tendrás una buena oportunidad.",
    "\\bIf you want to complete the Pokédex, you´ll have to complete the Gym Challenge eventually, there´s no way around it." =>
      "\\bSi quieres completar la Pokédex, tarde o temprano tendrás que completar el Reto de Gimnasios, no hay forma de evitarlo.",
    "\\bAt the moment, 1025 different Pokémon have been found, with some of them having different forms." =>
      "\\bPor ahora se han descubierto 1025 especies distintas de Pokémon, y algunas tienen formas diferentes.",
    "\\bCatching every single Pokémon is a task that some consider impossible, but in the Delta Region, you can come across a lot of different species." =>
      "\\bCapturarlos todos es una tarea que algunos consideran imposible, pero en la Región Delta puedes encontrarte con muchísimas especies distintas.",
    "\\bYour Pokédex will gather a lot of data if you catch and train a lot of Pokémon, and you´d be helping us scientists a lot." =>
      "\\bTu Pokédex reunirá muchos datos si capturas y entrenas muchos Pokémon, y nos ayudarías mucho a los científicos.",
    "\\bAnd before I forget, here´s the \"little something\" that I´m supposed to give to you. Take this Starter Kit." =>
      "\\bY antes de que se me olvide, aquí tienes ese \"pequeño detalle\" que se supone que debía darte. Toma este Kit Inicial.",
    "\\bMarcus: This Starter Kit provides you with everything you need to train your Pokémon. It even includes an Exp. Share!" =>
      "\\bMarcus: Este Kit Inicial te da todo lo que necesitas para entrenar a tus Pokémon. ¡Incluso trae un Compartir Exp.!",
    "\\bNow you´re ready to attempt the Gym Challenge and fill your Pokédex. Your next stop should be Arrow Ridge." =>
      "\\bAhora ya estás listo para intentar el Reto de Gimnasios y completar tu Pokédex. Tu próxima parada debería ser Cordillera Flecha.",
    "\\bYou can get there by using Route 2. Good luck out there!" =>
      "\\bPuedes llegar allí usando la Ruta 2. ¡Buena suerte ahí fuera!",
    "\\bMarcus: Don´t forget to heal your Pokémon." =>
      "\\bMarcus: No olvides curar a tus Pokémon.",
  },
  290 => {
    "\\bStupid homework..." =>
      "\\bMenudos deberes más tontos...",
    "\\bAll I wanna do is play some League!" =>
      "\\b¡Lo único que quiero es jugar a la Liga!",
    "\\bMy granddaughter is sitting in front of that stupid computer all day. She needs to touch some grass!" =>
      "\\bMi nieta se pasa todo el día sentada delante de ese estúpido ordenador. ¡Necesita salir a que le dé el aire!",
  },
  291 => {
    "\\bIf I open the fridge often enough, something good will appear." =>
      "\\bSi abro la nevera las veces suficientes, seguro que aparece algo bueno.",
    "\\bHave you read \"Fairy-Types and where they come from\"? It´s an amazing book!" =>
      "\\b¿Has leído \"Los tipos Hada y de dónde vienen\"? ¡Es un libro increíble!",
    "\\bI´ve been asking the question why we only found out about the Fairy-Type recently for quite some time now." =>
      "\\bLlevo bastante tiempo preguntándome por qué descubrimos el tipo Hada tan recientemente.",
    "\\bI like the theories in the book, but they still don´t quite explain how this Type came to be." =>
      "\\bMe gustan las teorías del libro, pero todavía no explican del todo cómo surgió este tipo.",
  },
  292 => {
    "\\bDear diary, today I saw a Bidoof. It didn´t even attack me in the tall grass, it was just staring at me." =>
      "\\bQuerido diario, hoy vi a un Bidoof. Ni siquiera me atacó en la hierba alta, solo se quedó mirándome.",
    "\\bI wonder what was going through that little guy´s mind..." =>
      "\\bMe pregunto qué estaría pasando por la cabeza de ese pequeñín...",
    "\\bHey kid, can you help me with something? I´ve been trying to think of the name of a Pokémon, but I just can´t remember..." =>
      "\\bOye, chaval, ¿me puedes ayudar con algo? Llevo un rato intentando acordarme del nombre de un Pokémon, pero no me sale...",
    "\\bIt´s rather small, and it resembles a cloud. It can fly, and it evolves into Altaria. Do you know how that Pokémon is called?" =>
      "\\bEs bastante pequeño, y parece una nube. Puede volar, y evoluciona a Altaria. ¿Sabes cómo se llama ese Pokémon?",
    "\\bHm, no, I don´t think that was the right name..." =>
      "\\bHmm, no, no creo que ese fuera el nombre correcto...",
    "\\bAh, yes, it was Swablu. Thank you! I keep on forgetting things like these as I get older. I guess that´s life..." =>
      "\\bAh, sí, era Swablu. ¡Gracias! Se me olvidan estas cosas cada vez más con la edad. Supongo que así es la vida...",
    "\\bHere, let me reward you for helping me." =>
      "\\bToma, deja que te recompense por ayudarme.",
    "\\bIf you get your hands on an Altaria, let it hold this stone. Oh, but I believe that Swablu and Altaria are quite rare in this region..." =>
      "\\bSi consigues un Altaria, deja que lleve esta piedra. Ah, pero creo que Swablu y Altaria son bastante raros en esta región...",
    "\\bYou´ll find one of them eventually. Take care now!" =>
      "\\bTarde o temprano encontrarás uno. ¡Cuídate!",
    "\\bWrite down your best memories, kid. You´ll forget things when you grow old, and our memories are the most precious thing we have!" =>
      "\\bApunta tus mejores recuerdos, chaval. Cuando te hagas mayor olvidarás cosas, ¡y nuestros recuerdos son lo más valioso que tenemos!",
  },
}.freeze

DICTS.each do |num, dict|
  path = format("Data/Map%03d.rxdata", num)
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
          full += c2.dup.force_encoding("UTF-8") if c2
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
