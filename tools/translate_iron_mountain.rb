# encoding: UTF-8
require_relative "rpg_stubs"

DICT_108 = {
  "\\bThis cave is huge! Just like your mom." => "\\b¡Esta cueva es enorme! Como tu madre.",
  "\\bDon´t take my jokes too personal please." => "\\bNo te tomes mis chistes muy en serio, por favor.",
  "\\bWould you be so kind and have a battle with me?" =>
    "\\b¿Serías tan amable de combatir conmigo?",
  "\\bIt´s good to see that the youth has still got it." =>
    "\\bMe alegra ver que la juventud todavía lo tiene.",
  "\\bI can bend steel!" => "\\b¡Puedo doblar el acero!",
  "\\bIf I keep on training I will be able to bend diamonds!" =>
    "\\b¡Si sigo entrenando podré doblar diamantes!",
  "\\bFace me! I´m a Dragon Tamer." => "\\b¡Enfréntate a mí! Soy un Domador de Dragones.",
  "\\bThere are some rare Dragon-Type Pokémon in here. I bet you can catch them!" =>
    "\\bHay algunos Pokémon raros de tipo Dragón por aquí. ¡Seguro que puedes atraparlos!",
}

DICT_109 = {
  "\\bAre you with the cops? Stay away!" => "\\b¿Vienes con la policía? ¡Aléjate!",
  "\\bPlease don´t tell the cops, I can´t get locked up!" =>
    "\\bPor favor, no se lo digas a la policía, ¡no puedo acabar encerrado!",
  "\\bIron Mountain is not for the weak!" => "\\b¡El Monte Hierro no es para los débiles!",
  "\\bLooks like this is a walk in the park for you. Take care!" =>
    "\\bParece que esto es un paseo para ti. ¡Cuídate!",
  "\\bNot so fast, trainer. You should only enter this part of the cave once you´re absolutely sure that you can face it!" =>
    "\\bNo tan rápido, entrenador. Solo deberías entrar en esta parte de la cueva cuando estés absolutamente seguro de que puedes enfrentarte a ella.",
  "\\bWhat do you mean you don´t know what that means? Iron Mountain is the only place in the Delta Region where you can find Duraludon." =>
    "\\b¿Cómo que no sabes qué significa eso? El Monte Hierro es el único lugar de la Región Delta donde puedes encontrar a Duraludon.",
  "\\bThis rare Pokémon is very strong, so you shouldn´t underestimate it. But I won´t stop you, I am just here to warn people." =>
    "\\bEste Pokémon raro es muy fuerte, así que no deberías subestimarlo. Pero no voy a detenerte, solo estoy aquí para avisar a la gente.",
  "\\bSo far, everyone who ignored my words has regretted it..." =>
    "\\bHasta ahora, todo el que ha ignorado mis palabras se ha arrepentido...",
  "\\bOh my, your Pokémon look tired. Let´s give them some rest." =>
    "\\bVaya, tus Pokémon parecen cansados. Vamos a dejarlos descansar.",
  "\\bThere we go. Be careful out there, and thanks for stopping bye!" =>
    "\\bYa está. Ten cuidado ahí fuera, ¡y gracias por pasarte!",
}

DICT_111 = {
  "\\bAre you worthy of making it to Silver Peak?" => "\\b¿Eres digno de llegar a Pico Plata?",
  "\\bSilver Peak is a very remote town, but it is a must visit if you´re attempting the Gym Challenge." =>
    "\\bPico Plata es un pueblo muy remoto, pero es de visita obligada si estás haciendo el Reto de Gimnasios.",
  "\\bYoooooooo! This place is literally metal!" =>
    "\\b¡¡¡Toooomaaa!!! ¡Este sitio es literalmente metal!",
  "\\bThis place is heaven for metalheads!" => "\\b¡Este sitio es el paraíso para los metaleros!",
}

DICT_274 = {
  "It´s a large stature resembling a Pokémon." =>
    "Es una gran estatua que se parece a un Pokémon.",
  "The Delta Stone in your pocket just lit up!" =>
    "¡La Piedra Delta en tu bolsillo acaba de brillar!",
  "The stature is coming to life!" => "¡La estatua está cobrando vida!",
  "\\bREEEGGGGIIIIII!!!" => "\\b¡¡¡REEEGGGGIIIIII!!!",
  "Registeel went back into a deep slumber. Will it wake up again?" =>
    "Registeel volvió a caer en un sueño profundo. ¿Despertará de nuevo?",
}

DICT_276 = {
  "Heatran has fallen asleep." => "Heatran se ha quedado dormido.",
  "The Delta Stone in your pocket just lit up!" =>
    "¡La Piedra Delta en tu bolsillo acaba de brillar!",
  "Heatran woke up!" => "¡Heatran se despertó!",
  "\\bHEATRAAAAA!!!" => "\\b¡¡¡HEATRAAAAA!!!",
  "Heatran fell asleep. Will it wake up again?" => "Heatran se durmió. ¿Se despertará de nuevo?",
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

apply("Data/Map108.rxdata", DICT_108)
apply("Data/Map109.rxdata", DICT_109)
apply("Data/Map111.rxdata", DICT_111)
apply("Data/Map274.rxdata", DICT_274)
apply("Data/Map276.rxdata", DICT_276)
