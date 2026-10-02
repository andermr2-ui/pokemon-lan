# encoding: UTF-8
require_relative "rpg_stubs"

VENDING = {
  "It's a vending machine.\\nWhich drink would you like?\\G" =>
    "Es una máquina expendedora.\\n¿Qué bebida te gustaría?\\G",
  "\\GA Fresh Water dropped down!" => "\\G¡Cayó un Agua Fresca!",
  "\\GBonus! Another Fresh Water dropped down." => "\\G¡Bonus! Cayó otra Agua Fresca.",
  "\\GYou have no room left in the Bag." => "\\GNo te queda espacio en la Mochila.",
  "\\GYou don't have enough money." => "\\GNo tienes suficiente dinero.",
  "\\GA Soda Pop dropped down!" => "\\G¡Cayó un Refresco!",
  "\\GBonus! Another Soda Pop dropped down." => "\\G¡Bonus! Cayó otro Refresco.",
  "\\GA Lemonade dropped down!" => "\\G¡Cayó una Limonada!",
  "\\GBonus! Another Lemonade dropped down." => "\\G¡Bonus! Cayó otra Limonada.",
  "\\GDecided not to buy a drink." => "\\GDecidiste no comprar ninguna bebida.",
}

VENDING_CHOICES = {
  "Fresh Water - $200|Soda Pop - $300|Lemonade - $350|Cancel" =>
    "Agua Fresca - 200 ₽|Refresco - 300 ₽|Limonada - 350 ₽|Cancelar",
}

DICT_125 = VENDING.merge({
  "Say my name." => "Di mi nombre.",
  "Who´s Walter? Leave me alone already!" => "¿Quién es Walter? ¡Déjame en paz ya!",
  "You´re god damn right!" => "¡Así es, maldita sea!",
  "\\bKYLE!!!" => "\\b¡KYLE!!!",
  "\\bOPEN THE ******* DOOR!!! YOU ******* CHEATER!!! I´M GONNA KILL THAT LITTLE BITCH AND THEN I´M GONNA KILL YOU!!!" =>
    "\\b¡ABRE LA ******* PUERTA!!! ¡TRAMPOSO DE ******* MIERDA!!! ¡VOY A MATAR A ESA MALDITA PERRA Y LUEGO TE VOY A MATAR A TI!!!",
  "\\bKYLEEEEEEE!!!" => "\\b¡KYLEEEEEEE!!!",
  "\\bThanks to Mayor Marshall I was finally able to afford this truck. I´m glad I voted for him, he really cares about us." =>
    "\\bGracias al alcalde Marshall por fin pude pagarme esta camioneta. Me alegro de haber votado por él, de verdad se preocupa por nosotros.",
  "It´s a Pokémon Statue dedicated to Victini." => "Es una estatua Pokémon dedicada a Victini.",
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo acaba de brillar!",
  "Something powerful is approaching!" => "¡Algo poderoso se aproxima!",
  "\\bVIIIIIIIICTINIIIIIIIIII!!!" => "\\b¡VIIIIIIIICTINIIIIIIIIII!!!",
  "Victini disappeared. Will it come back?" => "Victini desapareció. ¿Volverá?",
  "\\bI´m sorry, but the Riverstone Gym is currently closed. Emmett, the Gym Leader, is out of town. He should be back very soon though." =>
    "\\bLo siento, pero el Gimnasio de Río el Último está cerrado por ahora. Emmett, el Líder de Gimnasio, está fuera de la ciudad. Aunque debería volver muy pronto.",
  "\\bCongratulations, trainer. That was your first step towards challengenig the Pokémon League." =>
    "\\bFelicidades, entrenador. Ese fue tu primer paso hacia el Reto de la Liga Pokémon.",
  "\\bOuch! Ah! This is police brutality! All I did was tax fraud!!! Someone, please help me!!!" =>
    "\\b¡Ay! ¡Ah! ¡Esto es brutalidad policial! ¡Lo único que hice fue fraude fiscal!!! ¡Alguien, ayúdeme, por favor!!!",
  "\\bWow, thank you! Please, take this, it´s the least I can do for my savior." =>
    "\\b¡Vaya, gracias! Por favor, toma esto, es lo mínimo que puedo hacer por mi salvador.",
  "\\bThe police should save people from real danger. All I did was fake some tax documents." =>
    "\\bLa policía debería salvar a la gente de peligros reales. Lo único que hice fue falsificar unos documentos fiscales.",
  "\\bMy damn truck broke down again. I asked Rotom AI for a fix, but that stupid bot just made the problem worse." =>
    "\\bMi maldita camioneta se rompió otra vez. Le pedí a la IA Rotom que la arreglara, pero ese estúpido robot solo empeoró el problema.",
  "\\bNothing to see here, kid. I´m just doing my job, now go away." =>
    "\\bAquí no hay nada que ver, chaval. Solo estoy haciendo mi trabajo, ahora vete.",
  "\\bWhat do you mean, \"stop\"? This man is a criminal! Tax fraud is a serious crime, so I have to punish him!!!" =>
    "\\b¿Cómo que \"para\"? ¡Este hombre es un criminal! ¡El fraude fiscal es un delito grave, así que tengo que castigarlo!!!",
  "\\bAlright, if you don´t go away right now, I´ll arrest you for tax fraud as well." =>
    "\\bMuy bien, si no te vas ahora mismo, te arrestaré a ti también por fraude fiscal.",
  "\\bOkay, if you don´t want it any other way, then you´ll suffer the consequences!" =>
    "\\bBien, si no quieres que sea de otra manera, ¡sufrirás las consecuencias!",
  "\\b****!" => "\\b¡****!",
  "\\bFine, I´ll let you off with a warning." => "\\bBien, te dejaré ir con una advertencia.",
  "\\bWhat a beautiful day for a walk. Let me tell you something, kid. All of us grow old eventually, so make sure you stay fit." =>
    "\\bQué día tan bonito para dar un paseo. Déjame decirte algo, chaval. Todos envejecemos tarde o temprano, así que asegúrate de mantenerte en forma.",
  "\\bI try to go on walks every day, that makes me feel young again." =>
    "\\bIntento salir a caminar todos los días, eso me hace sentir joven de nuevo.",
  "\\bSTOP! GIVE THAT BACK!" => "\\b¡ALTO! ¡DEVUÉLVEME ESO!",
  "\\bI´m still waiting for our stupid mayor to green light the Dojo Project." =>
    "\\bSigo esperando a que nuestro estúpido alcalde apruebe el Proyecto del Dojo.",
  "\\bSince the closure of the Ambergrove Dojo I´ve had no place to train, and I don´t wanna train in the bloody mountains." =>
    "\\bDesde que cerraron el Dojo de Arboleda Ámbar no tengo dónde entrenar, y no quiero entrenar en las malditas montañas.",
  "A man is lying on the bed with a Lopunny." => "Hay un hombre tumbado en la cama con un Lopunny.",
  "\\bHuh?!" => "\\b¿¿Eh?!",
  "\\bWho are you? Out of my way, I got places to be!" =>
    "\\b¿Quién eres? ¡Apártate, tengo cosas que hacer!",
  "\\bWhat do you mean, \"Give them back!\". I don´t know what you´re talking about." =>
    "\\b¿Cómo que \"devuélvelos\"? No sé de qué me hablas.",
  "\\bMega Rings? Never heard of that. But if you don´t get out of my way right now, it´s gonna get ugly!" =>
    "\\b¿Anillos Mega? Nunca oí hablar de eso. ¡Pero como no te apartes ahora mismo, esto se va a poner feo!",
  "\\bAlright, fine. Take them. We don´t need these anyways." =>
    "\\bVale, está bien. Tómalos. De todas formas no los necesitamos.",
  "\\bBut now, let me go already!" => "\\bPero ahora, ¡déjame ir ya!",
  "\\bI like our mayor. He raised the minimum salary in Riverstone, he makes sure that the greenery stays fresh, and he lowered taxes!" =>
    "\\bMe cae bien nuestro alcalde. Subió el salario mínimo en Río el Último, se asegura de que las zonas verdes se mantengan cuidadas, ¡y bajó los impuestos!",
  "\\bThe roads in this town are awesome! It´s the perfect place to go for a ride." =>
    "\\b¡Las carreteras de este pueblo son geniales! Es el lugar perfecto para dar una vuelta.",
  "\\bI´m itching to hit the slots again..." => "\\bTengo ganas de volver a las tragaperras...",
  "\\bI know I shouldn´t, but I need to..." => "\\bSé que no debería, pero lo necesito...",
  "Riverstone Gym\\nLeader: Emmett" => "Gimnasio de Río el Último\\nLíder: Emmett",
  "\\bHey Boss, I´ve got great news! I got the stuff. Where do you want to meet?" =>
    "\\bOye, Jefe, ¡tengo buenas noticias! Conseguí la mercancía. ¿Dónde quieres que nos veamos?",
  "\\bHmm, understood. I will be there." => "\\bHmm, entendido. Estaré ahí.",
})

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
          joined = opts.join("|")
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

apply("Data/Map125.rxdata", DICT_125, VENDING_CHOICES)
