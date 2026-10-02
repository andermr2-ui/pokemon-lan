# encoding: UTF-8
require_relative "rpg_stubs"

DICT_179 = {
  "It´s a Pokémon Statue dedicated to Entei." => "Es una estatua Pokémon dedicada a Entei.",
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo acaba de brillar!",
  "Something powerful is approaching!" => "¡Algo poderoso se aproxima!",
  "\\bENTEEEEEEIII!!!" => "\\b¡ENTEEEEEEIII!!!",
  "Entei disappeared. Will it come back?" => "Entei desapareció. ¿Volverá?",
  "\\bThe sun is firing my Pokémon up. Watch this!" =>
    "\\bEl sol tiene a mi Pokémon a pleno. ¡Mirá esto!",
  "\\bFire-Type Pokémon become extremely strong in the sun. They love this environment!" =>
    "\\bLos Pokémon de tipo Fuego se vuelven extremadamente fuertes al sol. ¡Les encanta este ambiente!",
  "\\bLooks like it´s time for a heated battle!" => "\\b¡Parece que es hora de un combate ardiente!",
  "\\bThe entrance to Ambergrove Cave lies in the Scorching Valley. It´s not far from here." =>
    "\\bLa entrada a la Cueva de Arboleda Ámbar está en el Valle Abrasador. No queda lejos de acá.",
  "\\bThis is not my kind of weather, but my Pokémon loves it!" =>
    "\\bEste no es el clima que prefiero, ¡pero a mi Pokémon le encanta!",
  "It´s an ancient tomb. A dark aura is filling the air." =>
    "Es una tumba antigua. Un aura oscura llena el aire.",
  "An ominous creature is coming out of the tomb!" => "¡Una criatura ominosa sale de la tumba!",
  "\\bYUUUUU!!!" => "\\b¡YUUUUU!!!",
  "It´s an ancient tomb." => "Es una tumba antigua.",
  "Chi-Yu returned to its tomb. Will it come out again?" => "Chi-Yu volvió a su tumba. ¿Saldrá de nuevo?",
}

DICT_180 = {
  "\\bI´m gonna crush you!" => "\\b¡Te voy a aplastar!",
  "\\bTraining in this heat makes me strong! But only with sunscreen." =>
    "\\b¡Entrenar con este calor me hace fuerte! Pero solo con protector solar.",
  "\\bI ran out of sunscreen. Give me yours!" => "\\bSe me acabó el protector solar. ¡Dame el tuyo!",
  "\\bWhat?! You don´t have any sunscreen in the first place? That´s dangerous..." =>
    "\\b¿¡Qué!? ¿Ni siquiera tenés protector solar? Eso es peligroso...",
  "\\bWould you be so kind and train with me?" => "\\b¿Serías tan amable de entrenar conmigo?",
  "\\bI need to train a bit more, but one day I will challenge Nyssa!" =>
    "\\bNecesito entrenar un poco más, ¡pero algún día voy a desafiar a Nyssa!",
  "Reshiram is staring at you." => "Reshiram te está mirando fijo.",
  "It wants to battle!" => "¡Quiere combatir!",
  "\\bRESHIIIIII!!!" => "\\b¡RESHIIIIII!!!",
  "Reshiram disappeared. Will it come back?" => "Reshiram desapareció. ¿Volverá?",
  "It´s a Pokémon Statue dedicated to Moltres." => "Es una estatua Pokémon dedicada a Moltres.",
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo acaba de brillar!",
  "Something powerful is approaching!" => "¡Algo poderoso se aproxima!",
  "\\bMOOOOOLLL!!!" => "\\b¡MOOOOOLLL!!!",
  "Moltres disappeared. Will it come back?" => "Moltres desapareció. ¿Volverá?",
}

DICT_181 = {
  "It´s an ancient plate with strange symbols." => "Es una placa antigua con símbolos extraños.",
  "\\b???: Oh, hello. Who are you?" => "\\b???: Oh, hola. ¿Quién sos?",
  "\\b???: \\PN? Alright. I´m Nyssa, the Gym Leader in Ambergrove Gym. I take it you want to challenge me?" =>
    "\\b???: ¿\\PN? Bueno. Soy Nyssa, la líder del Gimnasio de Arboleda Ámbar. Supongo que querés desafiarme, ¿no?",
  "\\bNyssa: So I was right. Usually you can always find me at the Gym, but today I felt like examining the ancient plates of Ambergrove Cave." =>
    "\\bNyssa: Así que tenía razón. Normalmente siempre me podés encontrar en el Gimnasio, pero hoy me dieron ganas de examinar las placas antiguas de la Cueva de Arboleda Ámbar.",
  "\\bI´m still struggling with some of these symbols, but I know that these plates tell the story of a legendary Pokémon." =>
    "\\bTodavía me cuestan algunos de estos símbolos, pero sé que estas placas cuentan la historia de un Pokémon legendario.",
  "\\bI think it´s time to go back to the Gym now, I´m sorry for making you wait. I´m looking forward to our battle." =>
    "\\bCreo que ya es hora de volver al Gimnasio, perdón por hacerte esperar. Tengo muchas ganas de nuestro combate.",
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

apply("Data/Map179.rxdata", DICT_179)
apply("Data/Map180.rxdata", DICT_180)
apply("Data/Map181.rxdata", DICT_181)
