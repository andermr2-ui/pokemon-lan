# encoding: UTF-8
require_relative "rpg_stubs"

def apply(path, dict, choice_dict = {})
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
          next unless choice_dict.key?(joined)
          cmd.parameters[0] = choice_dict[joined].split("|")
          count += 1
        end
      end
    end
  end
  File.open(path, "wb") { |f| Marshal.dump(map, f) }
  puts "#{path}: #{count} reemplazos"
end

DICT_358 = {
  "\"These ancient relics were found 40 years ago. Archeologists date them back to the war from 3000 years ago.\"" =>
    "\"Estas antiguas reliquias fueron encontradas hace 40 años. Los arqueólogos las datan de la guerra de hace 3000 años.\"",
  "\"This painting shows the war from 3000 years ago. In the center of the painting, we can see what is believed to be the super-weapon.\"" =>
    "\"Esta pintura muestra la guerra de hace 3000 años. En el centro de la pintura, podemos ver lo que se cree que es la super-arma.\"",
  "\\bI ain´t reading all that!" => "\\b¡No pienso leer todo eso!",
  "\\bMy disappointment is immeasurable, and my day is ruined..." => "\\bMi decepción es inmensurable, y mi día está arruinado...",
  "\"This mysterious fossil is believed to be a casualty of the war from 3000 years ago. It seems to be linked to an old attack called Light of Ruin.\"" =>
    "\"Se cree que este misterioso fósil es una víctima de la guerra de hace 3000 años. Parece estar vinculado a un antiguo ataque llamado Luz de la Ruina.\"",
  "\"This painting shows the war from 3000 years ago. On the right side, we can see what is believed to be the Eternal Flower.\"" =>
    "\"Esta pintura muestra la guerra de hace 3000 años. En el lado derecho, podemos ver lo que se cree que es la Flor Eterna.\"",
  "\\bThese are just rocks, how boring..." => "\\bEstas son solo rocas, qué aburrido...",
  "\\bWelcome to the Kalos Museum. We have rare exhibits from Kalos, and they tell exciting stories!" =>
    "\\bBienvenido al Museo de Kalos. Tenemos exhibiciones raras de Kalos, ¡y cuentan historias emocionantes!",
  "\\bYou can visit this museum for free, isn´t that great?!" => "\\bPodés visitar este museo gratis, ¿no es genial?!",
  "\"This is an experimental version of a Pokéball. The age of it is unkown, but is very similar to today´s Pokéballs.\"" =>
    "\"Esta es una versión experimental de una Poké Ball. Se desconoce su antigüedad, pero es muy similar a las Poké Balls actuales.\"",
  "\"This painting shows the war from 3000 years ago. Here, we see a battlefield.\"" =>
    "\"Esta pintura muestra la guerra de hace 3000 años. Aquí, vemos un campo de batalla.\"",
  "\\bIt´s scary to think that a weapon like this ever existed. But that was 3000 years ago, a lot of things have changed since then." =>
    "\\bDa miedo pensar que un arma así alguna vez existió. Pero eso fue hace 3000 años, muchas cosas cambiaron desde entonces.",
  "The XYZ-Exhibition is upstairs." => "La Exhibición XYZ está arriba.",
  "\"This statue was found in ancient ruins in Kalos. It is believed to be dedicated to the Giver of Life. " =>
    "\"Esta estatua fue encontrada en ruinas antiguas de Kalos. Se cree que está dedicada al Dador de Vida. ",
  "The big X on the statue lets us believe that the Giver of Life is the Legendary Pokémon Xerneas.\"" =>
    "La gran X en la estatua nos hace creer que el Dador de Vida es el Pokémon Legendario Xerneas.\"",
  "\\bI´m sorry, but the archive is off-limits, even for the Champion. But please take your time and look at our exhibits." =>
    "\\bLo siento, pero el archivo está restringido, incluso para el Campeón. Pero tomate tu tiempo y mirá nuestras exhibiciones.",
  "\\bThat sure is an old Pokéball. I wonder if it still works?" => "\\bSin dudas es una Poké Ball vieja. ¿Funcionará todavía?",
  "\"The Alpha-Omega Space Shuttle was the result of a cooperation between Hoenn and Kalos. The shuttle was supposed to travel to the moon." =>
    "\"El Transbordador Espacial Alfa-Omega fue el resultado de una cooperación entre Hoenn y Kalos. El transbordador debía viajar a la luna.",
  "The asteroid-incident has brought the project to a halt, but the mission is supposed to continue in a few months." =>
    "El incidente del asteroide detuvo el proyecto, pero se supone que la misión continuará en unos meses.",
  "This model is a recreation of the real shuttle, which was gifted to the Kalos Museum after the project was unveiled.\"" =>
    "Este modelo es una recreación del transbordador real, que fue obsequiado al Museo de Kalos después de que se revelara el proyecto.\"",
  "\\bSince you tried to steal from the museum, you must be in need of money. That seems a bit odd, because you´re the Champion, but whatever." =>
    "\\bYa que intentaste robar del museo, debés necesitar dinero. Eso es un poco raro, porque sos el Campeón, pero bueno.",
  "\\bI can help you get super rich. Have you ever heard about the Treasure of the Swords?" =>
    "\\bPuedo ayudarte a hacerte súper rico. ¿Alguna vez escuchaste hablar del Tesoro de las Espadas?",
  "\\bI thought not. But it´s a simple story. About 60 years ago, a group of robbers who just robbed a bank had to hide their treasure somewhere." =>
    "\\bMe lo imaginaba. Pero es una historia simple. Hace unos 60 años, un grupo de ladrones que acababa de robar un banco tuvo que esconder su tesoro en algún lado.",
  "\\bThey got arrested near the Sword Ruins, with the treasure no where to be seen." =>
    "\\bLos arrestaron cerca de las Ruinas de la Espada, sin rastro del tesoro por ningún lado.",
  "\\bIn those 60 years, no one has been able to find that treasure, but I am certain that it´s hidden somewhere in the Sword Ruins." =>
    "\\bEn esos 60 años, nadie pudo encontrar ese tesoro, pero estoy seguro de que está escondido en algún lugar de las Ruinas de la Espada.",
  "\\bMaybe this could be worth a shot. Anyways, have a nice day!" => "\\bTal vez valga la pena intentarlo. En fin, ¡que tengas un buen día!",
  "\\bI wonder how valuable that treasure is..." => "\\bMe pregunto cuán valioso será ese tesoro...",
  "\"This statue was found in ancient ruins in Kalos. It is believed to be dedicated to the Bringer of Death." =>
    "\"Esta estatua fue encontrada en ruinas antiguas de Kalos. Se cree que está dedicada al Portador de la Muerte.",
  "The big Y on the statue hints at the identity of the Bringer of Death, which is believed to be the Legendary Pokémon Yveltal.\"" =>
    "La gran Y en la estatua sugiere la identidad del Portador de la Muerte, que se cree que es el Pokémon Legendario Yveltal.\"",
  "\"This is a piece of a star that fell from the sky after the ancient super-weapon was fired. (DO NOT TOUCH)\"" =>
    "\"Este es un pedazo de una estrella que cayó del cielo después de que se disparara la antigua super-arma. (NO TOCAR)\"",
  "\"This fragment was part of the ancient super-weapon that was used in the war 3000 years ago." =>
    "\"Este fragmento era parte de la antigua super-arma que se usó en la guerra de hace 3000 años.",
  "Further research has been impossible due to the destructive behaviour of the material.\"" =>
    "No fue posible seguir investigando debido al comportamiento destructivo del material.\"",
  "\\bHm?" => "\\b¿Mm?",
  "\\bHMMMM?!" => "\\b¿¡MMMM!?",
  "\\bWHERE IS THE STAR PIECE?!" => "\\b¡¿DÓNDE ESTÁ EL TROZO DE ESTRELLA?!",
  "\\bThat was our most valuable exhibit!" => "\\b¡Esa era nuestra exhibición más valiosa!",
  "\\bWho would do such a thing..." => "\\b¿Quién haría algo así...?",
  "\"This statue was found in ancient ruins in Kalos. It is believed to be dedicated to the Protector of Order." =>
    "\"Esta estatua fue encontrada en ruinas antiguas de Kalos. Se cree que está dedicada al Protector del Orden.",
  "The big Z on the statue implies that the Protector of Order is the Legendary Pokémon Zygarde.\"" =>
    "La gran Z en la estatua implica que el Protector del Orden es el Pokémon Legendario Zygarde.\"",
}

CHOICE_358 = {
  "Take it?|Leave it there?" => "¿Llevarlo?|¿Dejarlo ahí?",
}

DICT_359 = {
  "It´s an odd looking machine containing a Pokémon." => "Es una máquina de aspecto extraño que contiene un Pokémon.",
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo se iluminó!",
  "The Pokémon came back to life!" => "¡El Pokémon volvió a la vida!",
  "\\bVELTAAAL!!!" => "\\b¡¡¡VELTAAAL!!!",
  "It´s an odd looking machine." => "Es una máquina de aspecto extraño.",
  "Yveltal returned to a vegetative state. Will it wake up again?" => "Yveltal volvió a un estado vegetativo. ¿Despertará de nuevo?",
  "\\bIT WAS YOU!" => "\\b¡¡FUISTE VOS!!",
  "\\bYou´re the one who stole the Star Piece. UNFORGIVABLE!" => "\\bVos sos quien robó el Trozo de Estrella. ¡¡IMPERDONABLE!!",
  "\\bBut wait, yeah, you´re the Champion?!" => "\\bPero esperá, ¿¡en serio sos el Campeón?!",
  "\\bWhy would you do that? I thought the Champion was a good guy?!" =>
    "\\b¿Por qué harías eso? ¡¿Pensé que el Campeón era el bueno de la película?!",
  "\\bHm, okay, I have to be honest with you: That Star Piece isn´t actually from the star that fell down 3000 years ago." =>
    "\\bMm, bueno, tengo que ser sincero con vos: ese Trozo de Estrella en realidad no es de la estrella que cayó hace 3000 años.",
  "\\bIt´s still worth a lot, but is has no historic relevance. I put it there because I wanted it to get stolen, as I´ve been pretty bored around here." =>
    "\\bTodavía vale mucho, pero no tiene relevancia histórica. Lo puse ahí porque quería que me lo robaran, ya que estuve bastante aburrido por acá.",
  "\\bOh, and in case you´re wondering why the archive is off-limits: I´ve been experimenting on something." =>
    "\\bAh, y por si te preguntás por qué el archivo está restringido: estuve experimentando con algo.",
  "\\bA few weeks ago, we received a new delivery from Kalos, with stuff for the exhibition." =>
    "\\bHace unas semanas, recibimos un nuevo envío desde Kalos, con cosas para la exhibición.",
  "\\bIn between all of the boring stuff, there were three very interesting objects." =>
    "\\bEntre todas las cosas aburridas, había tres objetos muy interesantes.",
  "\\bAs it turns out, these objects were containing the Legendary Pokémon Xerneas, Yveltal and Zygarde." =>
    "\\bResulta que esos objetos contenían a los Pokémon Legendarios Xerneas, Yveltal y Zygarde.",
  "\\bThis would´ve made huge news, so I decided to hide them down here. You´re standing between the machines that I´m using to revive them!" =>
    "\\bEsto hubiera sido una noticia enorme, así que decidí esconderlos acá abajo. ¡Estás parado entre las máquinas que estoy usando para revivirlos!",
  "\\bAnd if that wasn´t crazy enough already, I´ve made quite some progress. May I show you?" =>
    "\\bY por si eso no fuera suficientemente loco, hice bastante progreso. ¿Puedo mostrarte?",
  "\\bWhat you just saw were Zygarde´s 10%-Form and its 50%-Form." =>
    "\\bLo que acabás de ver fueron la Forma 10% y la Forma 50% de Zygarde.",
  "\\bSince Zygarde consists of hundreds of cells, it can take different forms, depending on the amount of cells." =>
    "\\bComo Zygarde está compuesto por cientos de células, puede tomar diferentes formas, dependiendo de la cantidad de células.",
  "\\bFurthermore, the cells can create multiple Zygardes, which is why I was able to use 3 of them." =>
    "\\bAdemás, las células pueden crear múltiples Zygardes, por eso pude usar 3 de ellos.",
  "\\bBut only when all of the cells are together, Zygarde can turn into its Completed Form. In this form, it´s extremely powerful!" =>
    "\\bPero solo cuando todas las células están juntas, Zygarde puede transformarse en su Forma Completa. ¡En esta forma, es extremadamente poderoso!",
  "\\bBut let me take a look at the current data, I want to know where I stand." =>
    "\\bPero dejame revisar los datos actuales, quiero saber en qué punto estoy.",
  "\\bWait, this is odd." => "\\bEsperá, esto es raro.",
  "\\bAll cells have been revived?!" => "\\b¿¡Todas las células fueron revividas?!",
  "\\bI was at 75% a few hours ago, how can this be?!" => "\\bEstaba en el 75% hace unas horas, ¿¡cómo puede ser esto?!",
  "\\bHm? You´re saying it´s your Delta Stone?" => "\\b¿Mm? ¿Decís que es tu Piedra Delta?",
  "\\bI don´t know what that is, but it must´ve done something." => "\\bNo sé qué es eso, pero debe haber hecho algo.",
  "\\bOkay, wait, let me just do this..." => "\\bBueno, esperá, dejame hacer esto...",
  "\\band then this..." => "\\by después esto...",
  "\\band done!" => "\\b¡y listo!",
  "\\bIncredible, Zygarde has been fully revived!" => "\\b¡Increíble, Zygarde fue completamente revivido!",
  "\\bYes, you stole from the museum, but I hid crucial information from the world. So how about we make a deal?" =>
    "\\bSí, robaste del museo, pero yo le oculté información crucial al mundo. Entonces, ¿qué tal si hacemos un trato?",
  "\\bYou get Zygarde, and in return this remains our little secret. Okay?" =>
    "\\bVos te quedás con Zygarde, y a cambio esto queda como nuestro pequeño secreto. ¿Okay?",
  "\\bGood. Then here you go." => "\\bBien. Entonces, tomá.",
  "\\bAlright, then I´ll say goodbye for now. And remember, don´t tell anyone about this." =>
    "\\bBueno, entonces me despido por ahora. Y recordá, no le cuentes esto a nadie.",
  "\\bXEEER!!!" => "\\b¡¡¡XEEER!!!",
  "Xerneas returned to a vegetative state. Will it wake up again?" => "Xerneas volvió a un estado vegetativo. ¿Despertará de nuevo?",
}

DICT_360 = {
  "\\bWelcome to the Freelancer Agency. Here, you can ask freelancers to do a job for you, or you can become a freelancer yourself." =>
    "\\bBienvenido a la Agencia de Autónomos. Acá podés pedirle a autónomos que hagan un trabajo para vos, o podés convertirte en autónomo vos mismo.",
  "\\bInstead of normal payment, our freelancers do their jobs to get special rewards, such as rare Pokémon or objects." =>
    "\\bEn lugar de un pago normal, nuestros autónomos hacen sus trabajos para conseguir recompensas especiales, como Pokémon raros u objetos.",
  "\\bDo you want to become a freelancer?" => "\\b¿Querés convertirte en autónomo?",
  "\\bOkay, we appreciate your support! Let me just get your information, and you´re good to go." =>
    "\\bBueno, ¡agradecemos tu apoyo! Dejame anotar tus datos y ya estás listo.",
  "\\bAlright, all done. You´re now an official freelancer." => "\\bListo, todo hecho. Ahora sos un autónomo oficial.",
  "\\bAnd I already have a job for you. A man whose Pokémon passed away a few years ago wants to have its Pokédex entry." =>
    "\\bY ya tengo un trabajo para vos. Un hombre cuyo Pokémon falleció hace unos años quiere tener su entrada del Pokédex.",
  "\\bSince he doesn´t have a Pokédex, he´s asked us to find a trainer with a Pokédex to get the data. The name of the Pokémon is Marshadow." =>
    "\\bComo él no tiene un Pokédex, nos pidió que busquemos a un entrenador con Pokédex para conseguir los datos. El nombre del Pokémon es Marshadow.",
  "\\bIts grave is at the Riverstone Graveyard. If you can find a way to get the Pokédex data, he would reward you with Marshadow´s Z-Crystal." =>
    "\\bSu tumba está en el Cementerio de Río el Último. Si encontrás una forma de conseguir los datos del Pokédex, él te recompensaría con el Cristal Z de Marshadow.",
  "\\bGood luck for your first job. Once you´re done, come back here to claim your reward." =>
    "\\bBuena suerte con tu primer trabajo. Cuando termines, volvé acá para reclamar tu recompensa.",
  "\\bOkay, and you don´t have any jobs for our freelancers? Then have a nice day!" =>
    "\\bBueno, ¿y no tenés ningún trabajo para nuestros autónomos? ¡Entonces que tengas un buen día!",
  "\\bOh, you´re already done? Then please show me the Pokédex entry so I can save it for our client." =>
    "\\bAh, ¿ya terminaste? Entonces mostrame la entrada del Pokédex para que pueda guardarla para nuestro cliente.",
  "\\bAlright, that looks good. Then here you go, this is your reward." =>
    "\\bBien, eso se ve bien. Entonces tomá, esta es tu recompensa.",
  "\\bAnd I have some good news: There´s another client with a similar request. He wants the Pokédex Data of an Alolan Marowak." =>
    "\\bY tengo buenas noticias: hay otro cliente con un pedido similar. Quiere los datos del Pokédex de un Marowak de Alola.",
  "\\bSince this form of Marowak doesn´t live in Delta, this one might seem tricky at first, but I´m sure you´ll succeed!" =>
    "\\bComo esta forma de Marowak no vive en Delta, este puede parecer complicado al principio, ¡pero estoy seguro de que lo vas a lograr!",
  "\\bThe reward for this job is an interesting Z-Crystal. Apparently this one is for Alola´s Island Guardians." =>
    "\\bLa recompensa por este trabajo es un Cristal Z interesante. Parece que este es para los Guardianes de Alola.",
  "\\bGood luck for this job!" => "\\b¡Buena suerte con este trabajo!",
  "\\bWait, you´re already done?! Again?! You´re really good at this! But I still need to see the data so we can give it to the client." =>
    "\\bEsperá, ¿¡ya terminaste?! ¿¡De nuevo?! ¡Sos realmente bueno en esto! Pero todavía necesito ver los datos para poder dárselos al cliente.",
  "\\bYup, that´s the one. Here´s your reward." => "\\bSip, ese es. Acá tenés tu recompensa.",
  "\\bAnd I´ve already got your next job. And this is a special one. Professor Kukui, a famous professor from Alola, wants you to proove something." =>
    "\\bY ya tengo tu próximo trabajo. Y este es especial. El Profesor Kukui, un famoso profesor de Alola, quiere que demuestres algo.",
  "\\bFind convincing proof that a Pokémon called Terapagos exists. Pokédex data are enough for him, and the reward is quite something." =>
    "\\bEncontrá pruebas convincentes de que existe un Pokémon llamado Terapagos. Los datos del Pokédex le alcanzan, y la recompensa es de no creer.",
  "\\bShould you manage to proove that Terapagos exists, you will be rewarded with three Pokémon." =>
    "\\bSi lográs demostrar que Terapagos existe, vas a ser recompensado con tres Pokémon.",
  "\\bI don´t know which Pokémon we´re talking about, since I´m not allowed to open the package, but I´m sure you will be satisfied." =>
    "\\bNo sé de qué Pokémon estamos hablando, ya que no tengo permitido abrir el paquete, pero estoy seguro de que vas a quedar satisfecho.",
  "\\bGood luck for the job!" => "\\b¡Buena suerte con el trabajo!",
  "\\bGood luck for your next job!" => "\\b¡Buena suerte con tu próximo trabajo!",
  "\\bOf course you got this one done as well. You´re easily our most reliable freelancer. Let me just check your result." =>
    "\\bPor supuesto que también terminaste este. Sos fácilmente nuestro autónomo más confiable. Dejame revisar tu resultado.",
  "\\bWhat an odd looking creature. Alright, here´s the reward." => "\\bQué criatura de aspecto extraño. Bueno, acá tenés la recompensa.",
  "\\bI´m afraid that we currently have no other job offers. It might take a while for new ones to come around, but I hope you had fun so far. Bye!" =>
    "\\bMe temo que por ahora no tenemos más ofertas de trabajo. Puede que tarde un poco en aparecer alguna nueva, pero espero que la hayas pasado bien hasta ahora. ¡Chau!",
  "There's no more room for Pokémon!" => "¡No hay más espacio para Pokémon!",
  "The Pokémon Boxes are full and can't accept any more!" => "¡Las Cajas de Pokémon están llenas y no pueden aceptar más!",
}

apply("Data/Map358.rxdata", DICT_358, CHOICE_358)
apply("Data/Map359.rxdata", DICT_359)
apply("Data/Map360.rxdata", DICT_360)
