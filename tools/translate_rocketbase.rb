# encoding: UTF-8
require_relative "rpg_stubs"

DICT_204 = {
  "Break Room" => "Sala de Descanso",
  "Sleeping Rooms\\n\\nStorage Room" => "Dormitorios\\n\\nSala de Almacenamiento",
}

DICT_205 = {
  "\\bHey, you can´t run around here in your normal clothes. Remember the rules!" =>
    "\\bEy, no podés andar por acá con tu ropa normal. ¡Acordate de las reglas!",
  "\\bWe always battle in the common room. It´s super fun!" =>
    "\\bSiempre combatimos en la sala común. ¡Es súper divertido!",
  "\\bLinoone, use Nightslash!" => "\\b¡Linoone, usa Tajo Umbrío!",
  "Mark your own stuff, otherwise it´s not yours anymore. Unplug the fridge when it´s empty, we have an electricity bill to pay." =>
    "Marcá tus propias cosas, si no ya no son tuyas. Desenchufá la heladera cuando esté vacía, tenemos una factura de luz que pagar.",
  "\\bDon´t tell the boss that we´re battling in here. It´s against the rules, but we don´t care." =>
    "\\bNo le digas al jefe que estamos combatiendo acá adentro. Va contra las reglas, pero no nos importa.",
  "\\bWeezing, use Sludgebomb!" => "\\b¡Weezing, usa Bomba Lodo!",
  "\\bAre you the new guy? Where is your uniform?" => "\\b¿Sos el nuevo? ¿Dónde está tu uniforme?",
  "\\bWait, aren´t you the guy we just locked up?" => "\\bEsperá, ¿no sos el tipo que acabamos de encerrar?",
  "\\bNah, there´s no way someone could escape from there." =>
    "\\bNah, no hay forma de que alguien pueda escapar de ahí.",
}

DICT_206 = {
  "\\bWHAT?! YOU GOT OUT?!" => "\\b¿¡QUÉ!? ¿¡SALISTE!?",
  "\\bAlright, now you went a step too far. I will make you suffer!" =>
    "\\bBueno, ahora sí te pasaste de la raya. ¡Te voy a hacer sufrir!",
  "\\bAlright, fine. You chose the hard way." => "\\bBueno, está bien. Elegiste el camino difícil.",
  "\\bI´m gonna beat the shit out of you!" => "\\b¡Te voy a cagar a palos!",
  "\\bOUCH! WHAT THE ****! YOU BROKE MY NOSE!" => "\\b¡AY! ¡QUÉ ****! ¡ME ROMPISTE LA NARIZ!",
  "\\bOUCH! MY BALLS! WHAT THE ****!" => "\\b¡AY! ¡MIS BOLAS! ¡QUÉ ****!",
  "\\bI´M GONNA ******* KILL YOU, YOU LITTLE SHIT!" => "\\b¡TE VOY A ******* MATAR, PEDAZO DE MIERDA!",
  "\\b..." => "\\b...",
  "\\bI... I don´t feel so well..." => "\\bYo... no me siento nada bien...",
}

CHOICES_206 = {
  "Punch his face|Kick him into the nuts" => "Golpearle la cara|Patearle las bolas",
}

DICT_207 = {
  "A Porygon got out of the cage. It looks thankful and wants to join you." =>
    "Un Porygon salió de la jaula. Se ve agradecido y quiere unirse a vos.",
  "The Porygon was holding something." => "El Porygon tenía algo.",
  "It´s an old poster. Do you want to tear it off?" =>
    "Es un póster viejo. ¿Querés arrancarlo?",
  "Cage Lock: 0053" => "Candado de la jaula: 0053",
  "You unlocked the door." => "Abriste la puerta.",
  "\\bAh, you´re finally awake." => "\\bAh, por fin estás despierto.",
  "\\bLet me welcome you to our base. This is the storage room, and this is where we´ll keep you locked up." =>
    "\\bDejame darte la bienvenida a nuestra base. Esta es la sala de almacenamiento, y acá es donde te vamos a mantener encerrado.",
  "\\bDon´t worry, we´ll let you out eventually, but only after we have accomplished our mission." =>
    "\\bNo te preocupes, eventualmente te vamos a dejar salir, pero solo después de haber cumplido nuestra misión.",
  "\\bYou can use the spare bed, because even a jerk like you doesn´t deserve to sleep on the ground." =>
    "\\bPodés usar la cama de repuesto, porque ni siquiera un idiota como vos merece dormir en el piso.",
  "\\bIf you need to eat and drink something, just look into the fridge over there." =>
    "\\bSi necesitás comer o tomar algo, solo fijate en la heladera de allá.",
  "\\bAnd don´t get us wrong, we only treat you this well because you´re a kid. After all, we´re just people, not monsters." =>
    "\\bY no nos malinterpretes, te tratamos tan bien solo porque sos un chico. Después de todo, somos personas, no monstruos.",
  "\\bI hope our storage room will keep you entertained. I´m gonna go now." =>
    "\\bEspero que nuestra sala de almacenamiento te mantenga entretenido. Ya me voy.",
  "A Pokémon is locked inside the cage." => "Hay un Pokémon encerrado dentro de la jaula.",
  "It´s an empty cage." => "Es una jaula vacía.",
  "There´s some water in the fridge. Do you want to take it?" =>
    "Hay algo de agua en la heladera. ¿Querés llevártela?",
  "It´s an empty fridge." => "Es una heladera vacía.",
  "A combination lock keeps the cage locked. It requires 4 numbers." =>
    "Un candado de combinación mantiene la jaula cerrada. Requiere 4 números.",
  "Do you want to enter the code?" => "¿Querés ingresar el código?",
}

DICT_208 = {
  "\\bExcuse me? This isn´t your bedroom. Get lost!" => "\\b¿Perdón? Este no es tu dormitorio. ¡Rajá!",
  "\\bAre you one of the guys from the Underground Market in Mistveil? Tell your mates to lower their bloody prices!" =>
    "\\b¿Sos uno de los tipos del Mercado Subterráneo de Velo Brumoso? ¡Decile a tus compañeros que bajen esos malditos precios!",
}

DICT_213 = {
  "It´s a modern safe. It can be opened through voice activation." =>
    "Es una caja fuerte moderna. Se puede abrir mediante activación por voz.",
  "It´s a modern safe. It is unlocked. Do you want to take what´s inside?" =>
    "Es una caja fuerte moderna. Está abierta. ¿Querés llevarte lo que hay adentro?",
  "It´s an empty safe." => "Es una caja fuerte vacía.",
  "It´s Giovanni. His body is cold, and there is a hole on the side of his head. A gun lies next to him." =>
    "Es Giovanni. Su cuerpo está frío, y hay un agujero en el costado de su cabeza. Hay un arma tirada a su lado.",
  "There´s something in the trash bin." => "Hay algo en el basurero.",
  "It´s an empty trash bin." => "Es un basurero vacío.",
  "\\bAnthony: Pff, what a moron..." => "\\bAnthony: Pff, qué idiota...",
  "\\bDidn´t he say something to you about trying to become a better person?" =>
    "\\b¿No te dijo algo sobre intentar convertirse en una mejor persona?",
  "\\bClearly he failed, and he did what he was going to do if that happened. Even though he betrayed me, he went out as a man of his word." =>
    "\\bClaramente fracasó, e hizo lo que iba a hacer si eso pasaba. Aunque me traicionó, se fue como un hombre de palabra.",
  "\\bHm, now it´s time to get what I came here for. That thing you just took out of that safe, give it to me." =>
    "\\bMm, ahora es hora de conseguir lo que vine a buscar. Esa cosa que acabás de sacar de la caja fuerte, dámela.",
  "\\bCome on, hand it over already!" => "\\bDale, ¡entregámelo ya!",
  "\\bWhat do you mean, \"this ain´t no translation device\"? Of course it is." =>
    "\\b¿Cómo que \"esto no es ningún dispositivo de traducción\"? Claro que lo es.",
  "\\bDon´t make me angry, kid, we´re on this mission together." =>
    "\\bNo me hagas enojar, chico, estamos en esta misión juntos.",
  "\\bHAND OVER THE DOUSE DRIVE RIGHT NOW!!!" => "\\b¡ENTREGAME EL MÓDULO DE BUCEO AHORA MISMO!",
  "You hand over the Douse Drive to Anthony." => "Le entregás el Módulo de Buceo a Anthony.",
  "\\bSee, no big deal." => "\\bVes, no es para tanto.",
  "\\bHm, aha, ahahahahahahahahahaha!!!" => "\\bMm, ajá, ¡ajajajajajajajajajaja!",
  "\\bYOU MORON! YOU TRUSTED SOMEONE FROM TEAM ROCKET!" =>
    "\\b¡SOS UN IDIOTA! ¡CONFIASTE EN ALGUIEN DEL TEAM ROCKET!",
  "\\bIt was too easy too fool you! You´ve fulfilled your purpose, \\PN." =>
    "\\b¡Fue demasiado fácil engañarte! Cumpliste tu propósito, \\PN.",
  "\\bYou brought me to Southside Beach, you found the Hidden Cave, and you just handed me the final piece I need for my experiment!" =>
    "\\b¡Me trajiste a Playa del Sur, encontraste la Cueva Oculta, y acabás de entregarme la última pieza que necesito para mi experimento!",
  "\\bShall I show you what I´ve been working on? Genesect, destroy this brat!" =>
    "\\b¿Te muestro en qué he estado trabajando? ¡Genesect, destruí a este mocoso!",
  "\\bAnthony: Hm, so not even Genesect can stop the Champion..." =>
    "\\bAnthony: Mm, así que ni siquiera Genesect puede detener al Campeón...",
  "\\b**** it, that doesn´t matter now. I have all the components I need to find the Z-Crystal Cave, and then I´ll gain unmatched power!" =>
    "\\bA la **** con eso, ya no importa. Tengo todos los componentes que necesito para encontrar la Cueva del Cristal Z, ¡y entonces voy a obtener un poder sin igual!",
  "\\bFollowing me will be useless. I´m the only one who knows how to get into the real cave, so you can´t do anything." =>
    "\\bSeguirme va a ser inútil. Soy el único que sabe cómo entrar a la cueva real, así que no podés hacer nada.",
  "\\bI knew what the plates said the moment I walked into that cave. It´s the same language as all of the others, what else would it be?!" =>
    "\\bSupe lo que decían las placas en el momento en que entré a esa cueva. Es el mismo idioma que todas las demás, ¿¡qué más podría ser!?",
  "\\bIf you try to interfere with my plan, then I´ll use you for my next experiment!" =>
    "\\b¡Si intentás interferir con mi plan, te voy a usar para mi próximo experimento!",
  "There´s a Pokémon in the box. Do you want to take it?" =>
    "Hay un Pokémon en la caja. ¿Querés llevártelo?",
  "It´s a book about the Tao-Trio. The pages show drawings of Zekrom, Reshiram and Kyurem. What do you want to read?" =>
    "Es un libro sobre el Trío Tao. Las páginas muestran dibujos de Zekrom, Reshiram y Kyurem. ¿Qué querés leer?",
  "\\f[ZEKROM]Zekrom, the embodiment of ideals, was born from the split of a legendary Dragon Pokémon and sides with those who pursue idealistic visions." =>
    "\\f[ZEKROM]Zekrom, la encarnación de los ideales, nació de la división de un legendario Pokémon Dragón y apoya a quienes persiguen visiones idealistas.",
  "\\f[ZEKROM]Its immense lightning powers can obliterate entire regions and punish kingdoms that forsake righteousness." =>
    "\\f[ZEKROM]Sus inmensos poderes eléctricos pueden arrasar regiones enteras y castigar a los reinos que abandonan la rectitud.",
  "\\f[RESHIRAM]Reshiram, the embodiment of truth, was born from the split of a legendary Dragon Pokémon and aligns with those who seek truth above all else." =>
    "\\f[RESHIRAM]Reshiram, la encarnación de la verdad, nació de la división de un legendario Pokémon Dragón y se alinea con quienes buscan la verdad por sobre todas las cosas.",
  "\\f[RESHIRAM]Its blazing fire can raze entire regions and incinerate kingdoms consumed by greed and falsehoods." =>
    "\\f[RESHIRAM]Su fuego abrasador puede arrasar regiones enteras e incinerar reinos consumidos por la codicia y las falsedades.",
  "\\f[KYUREM]Kyurem, a mysterious Pokémon that once terrorized the Delta Region with its devastating icy power, was sealed away 100 years ago." =>
    "\\f[KYUREM]Kyurem, un misterioso Pokémon que en su día aterrorizó a la Región Delta con su devastador poder helado, fue sellado hace 100 años.",
  "\\f[KYUREM]It was formed from the remnants of a mighty dragon after it split into Reshiram and Zekrom." =>
    "\\f[KYUREM]Se formó a partir de los restos de un poderoso dragón después de que se dividiera en Reshiram y Zekrom.",
}

CHOICES_213 = {
  "Zekrom|Reshiram|Kyurem|Stop Reading" => "Zekrom|Reshiram|Kyurem|Dejar de leer",
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

apply("Data/Map204.rxdata", DICT_204)
apply("Data/Map205.rxdata", DICT_205)
apply("Data/Map206.rxdata", DICT_206, CHOICES_206)
apply("Data/Map207.rxdata", DICT_207)
apply("Data/Map208.rxdata", DICT_208)
apply("Data/Map213.rxdata", DICT_213, CHOICES_213)
