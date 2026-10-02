# encoding: UTF-8
require_relative "rpg_stubs"

DICT_083 = {
  "\\bDo you even lift?" => "\\b¿Es que no entrenas?",
  "\\bMaybe I don´t lift enough." => "\\bQuizá no entreno lo suficiente.",
  "\\bWe would battle you, but with just one Pokémon on your team, this wouldn´t be fair." =>
    "\\bTe combatiríamos, pero con un solo Pokémon en tu equipo, no sería justo.",
  "\\bHey Alexander, looks like it´s time for a Double Battle! " =>
    "\\bOye, Alexander, ¡parece que es hora de un Combate Doble!",
  "\\bDouble Battles are thrilling. You need to know what you´re doing in order to win." =>
    "\\bLos Combates Dobles son emocionantes. Necesitas saber lo que haces para ganar.",
  "\\bAre you ready, Alicia? Because I am!" => "\\b¿Estás lista, Alicia? ¡Porque yo sí!",
  "\\bAren´t Double Battles much more thrilling than normal battles?" =>
    "\\b¿A que los Combates Dobles son mucho más emocionantes que los normales?",
  "\\bLet me show you why it´s called Rumble Mountain!" =>
    "\\b¡Deja que te muestre por qué se llama Montaña Calada!",
  "\\bI heard that a rare Pokémon lives in this cave." =>
    "\\bHe oído que un Pokémon raro vive en esta cueva.",
}

DICT_085 = {
  "\\bIf you want to go any further, I need to check if you´re strong enough." =>
    "\\bSi quieres seguir adelante, necesito comprobar si eres lo bastante fuerte.",
  "\\bGo on ahead." => "\\bAdelante, sigue.",
}

DICT_089 = {
  "\\bI want to become one with the mountain." =>
    "\\bQuiero convertirme en uno con la montaña.",
  "\\bI will stay here until I am one with the mountain." =>
    "\\bMe quedaré aquí hasta que sea uno con la montaña.",
  "It´s a Pokémon Statue dedicated to Diancie." =>
    "Es una estatua Pokémon dedicada a Diancie.",
  "The Delta Stone in your pocket just lit up!" =>
    "¡La Piedra Delta en tu bolsillo acaba de brillar!",
  "Something powerful is approaching!" => "¡Algo poderoso se acerca!",
  "\\bDIAAA!!!" => "\\b¡¡¡DIAAA!!!",
  "Diancie disappeared. Will it come back?" => "Diancie desapareció. ¿Volverá?",
  "\\bHear me out, child. You should put it all on Red." =>
    "\\bEscúchame, criatura. Deberías apostarlo todo al rojo.",
  "\\bI´m not addicted. I can stop whenever I want." =>
    "\\bNo soy adicto. Puedo dejarlo cuando quiera.",
  "\\bOh my, your Pokémon look tired. Let´s give them some rest." =>
    "\\bVaya, tus Pokémon parecen cansados. Vamos a dejarlos descansar.",
  "\\bThere we go. Be careful out there, and thanks for stopping bye!" =>
    "\\bYa está. Ten cuidado ahí fuera, ¡y gracias por pasarte!",
  "\\bYou look lost." => "\\bPareces perdido.",
  "\\bDon´t get lost like I did." => "\\bNo te pierdas como me pasó a mí.",
  "\\bThe north exit is close. Can you reach it?" =>
    "\\bLa salida norte está cerca. ¿Puedes llegar hasta ella?",
  "\\bHave you seen the special forms in Rumble Mountain? A strange phenomenon caused Alolan forms from to appear here." =>
    "\\b¿Has visto las formas especiales de Montaña Calada? Un extraño fenómeno hizo que aparecieran aquí formas de Alola.",
}

DICT_284 = {
  "It´s a large stature resembling a Pokémon." =>
    "Es una gran estatua que se parece a un Pokémon.",
  "The Delta Stone in your pocket just lit up!" =>
    "¡La Piedra Delta en tu bolsillo acaba de brillar!",
  "The stature is coming to life!" => "¡La estatua está cobrando vida!",
  "\\bÜNÜNÜNÜN!!!" => "\\b¡¡¡ÜNÜNÜNÜN!!!",
  "Regirock went back into a deep slumber. Will it wake up again?" =>
    "Regirock volvió a caer en un sueño profundo. ¿Despertará de nuevo?",
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

apply("Data/Map083.rxdata", DICT_083)
apply("Data/Map085.rxdata", DICT_085)
apply("Data/Map089.rxdata", DICT_089)
apply("Data/Map284.rxdata", DICT_284)
