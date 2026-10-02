# encoding: UTF-8
require_relative "rpg_stubs"

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

DICT_316 = {
  "\\bWho decided to code this in JavaScript?! Why can´t we use Python?!" => "\\b¿Quién decidió programar esto en JavaScript?! ¿¡Por qué no podemos usar Python?!",
  "\\bArthur told us what happened. Thanks for helping us!" => "\\bArthur nos contó lo que pasó. ¡Gracias por ayudarnos!",
  "\\bAnd since we want to show our gratitude, we have prepared a little gift for you. Here you go." => "\\bY como queremos mostrarte nuestra gratitud, te preparamos un pequeño regalo. Tomá.",
  "\\bOh, and of course you can also take a look at Dr. Reed´s lab, since he won´t be needing that anymore." => "\\bAh, y por supuesto también podés echarle un vistazo al laboratorio del Dr. Reed, ya que él ya no lo va a necesitar.",
  "\\bOnce again, thank you for everything!" => "\\bUna vez más, ¡gracias por todo!",
  "\\bI hope you like our gift. And thanks for helping us." => "\\bEspero que te guste nuestro regalo. Y gracias por ayudarnos.",
  "\\bWait, this is strange. One of the Rotoms has been sending the exact same data for hours now. If this doesn´t stop soon, then I´ll have to get the hammer!" => "\\bEsperá, esto es raro. Uno de los Rotom estuvo mandando exactamente los mismos datos durante horas. ¡Si esto no para pronto, voy a tener que sacar el martillo!",
  "\\bThese servers have a lot of power, but that also comes with issues. My job is to keep the servers running." => "\\bEstos servidores tienen mucha potencia, pero eso también trae problemas. Mi trabajo es mantener los servidores funcionando.",
  "\\bThe power supply and the cooling system is controlled with these machines. I´m the only one here who can operate them." => "\\bLa fuente de alimentación y el sistema de refrigeración se controlan con estas máquinas. Soy el único acá que puede operarlas.",
  "\\bWe use every form of Rotom for the data analysis. Each form receives different data, because all of them have a different approach." => "\\bUsamos todas las formas de Rotom para el análisis de datos. Cada forma recibe datos distintos, porque todas tienen un enfoque diferente.",
  "\\bMy job is to watch over the data flow. There´s a designated order in which the data is supposed to be distributed, and I have to make sure it stays like that." => "\\bMi trabajo es vigilar el flujo de datos. Hay un orden designado en el que se supone que los datos deben distribuirse, y tengo que asegurarme de que se mantenga así.",
  "\\bWelcome to the Rotom AI Company! We´re an open-door institution, so visitors are always welcome." => "\\b¡Bienvenido a la Compañía de IA Rotom! Somos una institución de puertas abiertas, así que los visitantes siempre son bienvenidos.",
  "\\bIf you came to see the Rotom Data Station, it´s on the third floor." => "\\bSi viniste a ver la Estación de Datos Rotom, está en el tercer piso.",
  "\\bAnthony: Ah, there you are. Welcome to the Rotom AI Company. Are you familiar with what we do?" => "\\bAnthony: Ah, ahí estás. Bienvenido a la Compañía de IA Rotom. ¿Sabés a qué nos dedicamos?",
  "\\bIt´s pretty straight forward actually. We´re developing artificial intelligence techonology with the help of Rotom." => "\\bEs bastante simple, la verdad. Estamos desarrollando tecnología de inteligencia artificial con la ayuda de Rotom.",
  "\\bRotoms have proven to be very useful for scientific research, and the best example are Rotom Phones." => "\\bLos Rotom demostraron ser muy útiles para la investigación científica, y el mejor ejemplo son los Rotom Phone.",
  "\\bIf you´re interested in seeing the Rotoms at work, just go to the third floor. That´s where our Rotoms analyze hundreds of Terrabytes every day." => "\\bSi te interesa ver a los Rotom trabajando, andá al tercer piso. Ahí es donde nuestros Rotom analizan cientos de Terabytes todos los días.",
  "\\bIn order to handle these massive amounts of data, we also have our own server room." => "\\bPara manejar estas cantidades masivas de datos, también tenemos nuestra propia sala de servidores.",
  "\\bIt´s on the top floor, and it´s used to store data, but also to send it to our server satellite." => "\\bEstá en el último piso, y se usa para almacenar datos, pero también para enviarlos a nuestro satélite servidor.",
  "\\bYup, the Rotom AI Company has their own satellite. Our founder, Elon Musk, poured billions of dollars into the company, and the results are starting to show." => "\\bSip, la Compañía de IA Rotom tiene su propio satélite. Nuestro fundador, Elon Musk, invirtió miles de millones de dólares en la compañía, y los resultados están empezando a notarse.",
  "\\bOur neighbors, the Delta Tech Company, have used our AI to develope a new type of Pokéball. The AI has saved them years of developement." => "\\bNuestros vecinos, la Compañía Delta Tech, usaron nuestra IA para desarrollar un nuevo tipo de Poké Ball. La IA les ahorró años de desarrollo.",
  "\\bOh, I´m going off-topic again, sorry. We´re here to study Z-Power." => "\\bAh, me estoy yendo del tema de nuevo, perdón. Estamos acá para estudiar el Poder Z.",
  "\\bAs you probably you know, Z-Moves can only be used with a Z-Power Ring and a Z-Crystal." => "\\bComo seguramente ya sabés, los Movimientos Z solo se pueden usar con un Anillo Z y un Cristal Z.",
  "\\bI don´t know if you came across a Z-Crystal yet, but I´ve heard rumours of a place where you can find a lot of them." => "\\bNo sé si ya te topaste con algún Cristal Z, pero escuché rumores de un lugar donde se pueden encontrar muchos.",
  "\\bApparently there´s a secret cave somewhere in Delta, and that cave is supposed to be the origin of the Z-Power." => "\\bAl parecer hay una cueva secreta en algún lugar de Delta, y se supone que esa cueva es el origen del Poder Z.",
  "\\bUntil today, I thought that this story was just a hoax, but now I´m not so sure anymore." => "\\bHasta hoy, pensaba que esa historia era solo un invento, pero ahora ya no estoy tan seguro.",
  "\\bI even believe that I know how to find this cave, but there´s something else I want to do first." => "\\bIncluso creo que sé cómo encontrar esa cueva, pero hay algo más que quiero hacer primero.",
  "\\bWould you give me the opportunity to have a battle against the Champion? I train Pokémon as a hobby, and I´d like to see where I stand." => "\\b¿Me darías la oportunidad de combatir contra el Campeón? Entreno Pokémon como hobby, y me gustaría ver en qué nivel estoy.",
  "\\bReally? You will?! That´s very kind of you!" => "\\b¿En serio? ¡¿Lo vas a hacer?! ¡Qué amable de tu parte!",
  "\\bBut before we do that, you should talk to a colleague of mine, he´s currently working with the Rotoms on the third floor." => "\\bPero antes de eso, deberías hablar con un colega mío, ahora mismo está trabajando con los Rotom en el tercer piso.",
  "\\bHe also knows a few things about Z-Power, as he´s from Alola. Once you´re done, meet me at the Crystal Harbor battle field." => "\\bÉl también sabe algunas cosas sobre el Poder Z, ya que es de Alola. Cuando termines, encontrame en el campo de batalla de Puerto del Cristal.",
  "\\bTalk to my colleague on the third floor, and then we´ll have our battle." => "\\bHablá con mi colega en el tercer piso, y después tendremos nuestro combate.",
  "\\bWe´re almost done with the newest version of Rotom AI. The new version will be 5 times faster than the old one!" => "\\bYa casi terminamos la versión más nueva de la IA Rotom. ¡La nueva versión va a ser 5 veces más rápida que la anterior!",
  "\\bOh, hello. This is our Rotom Data Station. It´s the only one in the world, and the amount of data we analyze here is unbelievably large." => "\\bAh, hola. Esta es nuestra Estación de Datos Rotom. Es la única en el mundo, y la cantidad de datos que analizamos acá es increíblemente grande.",
  "\\bAh, Anthony said that I know a thing or two about Z-Power. That guy is really into this stuff, huh." => "\\bAh, Anthony dijo que yo sé un par de cosas sobre el Poder Z. Ese tipo está bien metido en el tema, ¿eh?",
  "\\bWe all know that the use of Z-Moves is quite common in Alola, which was believed to be the only region where Z-Power existed." => "\\bTodos sabemos que el uso de Movimientos Z es bastante común en Alola, que se creía que era la única región donde existía el Poder Z.",
  "\\bIt turns out that Z-Power itself has nothing to do with Alola, it just happened to be a common thing their due to the region´s history." => "\\bResulta que el Poder Z en sí no tiene nada que ver con Alola, simplemente se dio que era algo común ahí por la historia de la región.",
  "\\bSurprisingly, Z-Power is one of the most well researched Pokémon phenomenons. We know much less about Mega Evolutions or Dynamax." => "\\bSorprendentemente, el Poder Z es uno de los fenómenos Pokémon mejor investigados. Sabemos mucho menos sobre las Megaevoluciones o el Dynamax.",
  "\\bShould this mysterious Z-Crystal cave actually exist, then it´d be possible for Z-Power to become popular in way more regions." => "\\bSi esta misteriosa cueva de Cristales Z realmente existiera, entonces sería posible que el Poder Z se popularice en muchas más regiones.",
  "\\bThere are 3 Z-Crystals that we´ve researched with the help of Rotom, and I think we´ve discovered pretty much everything there is to know about these." => "\\bHay 3 Cristales Z que investigamos con la ayuda de Rotom, y creo que descubrimos prácticamente todo lo que hay que saber sobre ellos.",
  "\\bThey are unique Z-Crystals that only show their effect with a certain move on a certain Pokémon. I want you to have them, since you have a Z-Ring." => "\\bSon Cristales Z únicos que solo muestran su efecto con un movimiento determinado en un Pokémon determinado. Quiero que los tengas, ya que tenés un Anillo Z.",
  "\\bThe Pokémon that can use the power of these crystals are rare Alolan Pokémon, which you usually can´t come across in the Delta Region." => "\\bLos Pokémon que pueden usar el poder de estos cristales son Pokémon de Alola raros, con los que normalmente no te podés topar en la Región Delta.",
  "\\bHowever, the Freelancer Agency in Crystal Harbor might be able to help you out." => "\\bSin embargo, la Agencia de Freelance en Puerto del Cristal podría ayudarte.",
  "\\bThere, you can do freelancer jobs in order to earn rare rewards, which sometimes include Pokémon." => "\\bAhí podés hacer trabajos freelance para ganar recompensas raras, que a veces incluyen Pokémon.",
  "\\bIt´s the building with the Pokéball above the door. I hope I could explain the relevance of Z-Power to you. Goodbye!" => "\\bEs el edificio con la Poké Ball arriba de la puerta. Espero haberte podido explicar la relevancia del Poder Z. ¡Chau!",
  "\\bI wonder if there´s a way to make Terastallization possible everywhere in the world." => "\\bMe pregunto si hay alguna forma de hacer posible la Teracristalización en todo el mundo.",
  "\\bThe Blueberry Academy found a way to make it possible inside their dome, but I don´t know if there´s a way to make it available everywhere." => "\\bLa Academia Arándano encontró la forma de hacerlo posible dentro de su domo, pero no sé si hay alguna manera de que esté disponible en todos lados.",
  "\\bThis is one of our filter stations. A powerful algorithm is checking the data from the Rotoms for possible issues." => "\\bEsta es una de nuestras estaciones de filtrado. Un algoritmo potente revisa los datos de los Rotom en busca de posibles problemas.",
  "\\bThe algorithm is running 24/7, and it produces a lot of heat, so we need these massive cooling units to keep the computers from overheating." => "\\bEl algoritmo funciona las 24 horas, los 7 días de la semana, y produce mucho calor, así que necesitamos estas unidades de refrigeración enormes para evitar que las computadoras se sobrecalienten.",
  "\\bDr. Reed´s private lab is off limits. Only he can go down here." => "\\bEl laboratorio privado del Dr. Reed está prohibido. Solo él puede bajar acá.",
  "\\bHey, look at this! I´m currently using the pre-relase version of the new Rotom AI to work on the new Rotom AI." => "\\b¡Che, mirá esto! Ahora mismo estoy usando la versión preliminar de la nueva IA Rotom para trabajar en la nueva IA Rotom.",
  "\\bIn other words, the AI is writing itself. I´m only pressing buttons right now, I have nothing to do with the rest." => "\\bEn otras palabras, la IA se está escribiendo a sí misma. Ahora mismo solo estoy apretando botones, no tengo nada que ver con el resto.",
  "\\bIf we manage to automize this, then we would send humanity hundreds of years into the future." => "\\bSi logramos automatizar esto, enviaríamos a la humanidad cientos de años hacia el futuro.",
  "\\bI studied Computer Science and Advanced AI for 5 years, but now I´m only using Excel to archive data. Why can´t we use our AI for this? I hate Excel!" => "\\bEstudié Ciencias de la Computación e IA Avanzada durante 5 años, pero ahora solo uso Excel para archivar datos. ¿Por qué no podemos usar nuestra IA para esto? ¡Odio el Excel!",
  "\\bGood thing we have our own server room. I can stream spicy videos lightning fast like this, hehe. But don´t tell my boss, he´ll fire me for sure." => "\\bMenos mal que tenemos nuestra propia sala de servidores. Así puedo transmitir videos picantes a toda velocidad, jeje. Pero no le digas a mi jefe, seguro me despide.",
}

DICT_338 = {
  "It´s an incubator containing a Pokémon." => "Es una incubadora que contiene un Pokémon.",
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo se iluminó!",
  "The Pokémon woke up!" => "¡El Pokémon se despertó!",
  "\\bMEWWW!!!" => "\\b¡¡¡MEWWW!!!",
  "It´s an empty incubator." => "Es una incubadora vacía.",
  "Mew went back to sleep. Will it wake up again?" => "Mew volvió a dormirse. ¿Se despertará de nuevo?",
  "There´s a bunch of items in the machine." => "Hay un montón de objetos en la máquina.",
  "It´s an empty machine." => "Es una máquina vacía.",
  "\\bTWOOO!!!" => "\\b¡¡¡TWOOO!!!",
  "Mewtwo went back to sleep. Will it wake up again?" => "Mewtwo volvió a dormirse. ¿Se despertará de nuevo?",
}

DICT_324 = {
  "\\bAh, so you want more Deity Balls? No problem, I have a few for you." => "\\bAh, ¿así que querés más Deity Balls? No hay problema, tengo algunas para vos.",
  "\\bSorry, but we´re out of Deity Balls at the moment. New ones are currently being produced, so why don´t you come back later?" => "\\bPerdón, pero por ahora nos quedamos sin Deity Balls. Se están produciendo unas nuevas, así que ¿por qué no volvés más tarde?",
  "\\bWhy did they ask their trainee to operate this machine? I only got here by using Rotom AI, I don´t know what any of these buttons do!" => "\\b¿Por qué le pidieron a su pasante que opere esta máquina? Yo llegué acá solo usando la IA Rotom, ¡no tengo idea qué hace ninguno de estos botones!",
  "\\bArthur: Welcome to the Delta Tech Company. This is were theory becomes reality. You´ve already used some of their products, the Deity Balls." => "\\bArthur: Bienvenido a la Compañía Delta Tech. Acá es donde la teoría se vuelve realidad. Ya usaste algunos de sus productos, las Deity Balls.",
  "\\bYou really helped us, so the least I can do is give you some super useful stuff." => "\\bNos ayudaste muchísimo, así que lo mínimo que puedo hacer es darte algunas cosas súper útiles.",
  "\\bBut wait, there´s more!" => "\\b¡Pero esperá, hay más!",
  "\\bI´ve been allowed to test a new device called the Delta Scanner, and it was able to reveal the location of both Zekrom and Reshiram." => "\\bMe dejaron probar un nuevo dispositivo llamado el Escáner Delta, y logró revelar la ubicación tanto de Zekrom como de Reshiram.",
  "\\bZekrom is currently roaming around somewhere on Thunder Pass, and Reshiram should be somewhere in the Scorching Valley." => "\\bZekrom anda rondando en algún lugar del Paso del Trueno, y Reshiram debería estar en algún lugar del Valle Abrasador.",
  "\\bYou could try to go after those, or you could take the ferry to the Delta Islands. Yup, they finally fixed that bloody boat!" => "\\bPodrías intentar ir tras ellos, o podrías tomar el ferry hacia las Islas Delta. Sip, ¡por fin arreglaron ese maldito bote!",
  "\\bYou should check out the Champions Village and the Hisui Wildlife Station, I highly recommend it." => "\\bDeberías visitar la Villa Deliciosa y la Estación de Vida Silvestre de Hisui, te lo recomiendo mucho.",
  "\\bWe still don´t know why the weather on Southside Beach is going crazy, but I´m sure you´ll figure it out eventually." => "\\bTodavía no sabemos por qué el clima en Playa del Sur se está volviendo loco, pero seguro que en algún momento lo vas a averiguar.",
  "\\bI´m thinking of challenging the Pokémon League again, because I want to take back my title. So be prepared, I will battle you again one day!" => "\\bEstoy pensando en retar a la Liga Pokémon de nuevo, porque quiero recuperar mi título. Así que preparate, ¡voy a combatir contra vos otra vez algún día!",
  "\\bArthur: The Hisui Wildlife Station is a very special place. Seeing those nearly extinct Pokémon is a humbling experience." => "\\bArthur: La Estación de Vida Silvestre de Hisui es un lugar muy especial. Ver a esos Pokémon casi extintos es una experiencia que te hace bajar a tierra.",
  "\\bAh, you must be the new Champion. Arthur has told us all about you. I bet you´re interested in obtaining a rare Pokémon!" => "\\bAh, debés ser el nuevo Campeón. Arthur nos contó todo sobre vos. ¡Apuesto a que te interesa conseguir un Pokémon raro!",
  "\\bAs you might know, we tested our new Deity Balls on a Pokémon called Type: Null, but we no longer need it for research purposes." => "\\bComo tal vez sepas, probamos nuestras nuevas Deity Balls en un Pokémon llamado Type: Null, pero ya no lo necesitamos para fines de investigación.",
  "\\bSince this Pokémon was made in a lab, its true power is unknown, so it should be with a very strong trainer." => "\\bComo este Pokémon fue creado en un laboratorio, se desconoce su verdadero poder, así que debería estar con un entrenador muy fuerte.",
  "\\bAlright, here you go." => "\\bBueno, tomá.",
  "\\bShould this Pokémon evolve or gain immense power in some way, please come back and show me the result." => "\\bSi este Pokémon llegara a evolucionar o ganar un poder inmenso de alguna forma, por favor volvé y mostrame el resultado.",
  "There's no more room for Pokémon!" => "¡Ya no hay más espacio para Pokémon!",
  "The Pokémon Boxes are full and can't accept any more!" => "¡Las Cajas Pokémon están llenas y no pueden aceptar más!",
  "\\bHm? What? Type: Null actually evolved? That´s incredible! Could you show me the result?" => "\\b¿Eh? ¿Qué? ¿¡Type: Null en verdad evolucionó?! ¡Es increíble! ¿Me podrías mostrar el resultado?",
  "\\bAh, so that´s Silvally. But wait, are my eyes deceiving me?! Could this one actually be compatible with the discs that we got?!" => "\\bAh, así que eso es Silvally. Pero esperá, ¡¿me están engañando los ojos?! ¡¿Podría este ser compatible con los discos que conseguimos?!",
  "\\bIf you haven´t done so already, talk to one of my colleagues. She has weird memory discs that might be useful now." => "\\bSi todavía no lo hiciste, hablá con una de mis colegas. Ella tiene unos discos de memoria raros que podrían servir ahora.",
  "\\bAnyways, I bet you want to look after another mysterious Pokémon. Haha, then I have great news for you." => "\\bBueno, apuesto a que querés ir tras otro Pokémon misterioso. Jaja, entonces tengo excelentes noticias para vos.",
  "\\bA few weeks ago, a very strange Pokémon was discovered. No one knows anything about it, so this sounds like a job for you." => "\\bHace unas semanas, se descubrió un Pokémon muy extraño. Nadie sabe nada sobre él, así que esto suena como un trabajo para vos.",
  "\\bHere you go." => "\\bTomá.",
  "\\bAlright, have fun researching this one. Bye!" => "\\bBueno, divertite investigando a este. ¡Chau!",
  "\\bResearching the power of mysterious Pokémon is always exciting!" => "\\b¡Investigar el poder de los Pokémon misteriosos siempre es emocionante!",
  "\\bThere´re some mysterious Pokémon out there, wouldn´t you agree?" => "\\bHay algunos Pokémon misteriosos por ahí afuera, ¿no te parece?",
  "\\bWhat? Type: Null evolved?! Then I believe these discs will work now. And since we gifted you the Pokémon, why don´t you take the discs as well?" => "\\b¿Qué? ¿¡Type: Null evolucionó?! Entonces creo que estos discos van a funcionar ahora. Y ya que te regalamos el Pokémon, ¿por qué no te llevás los discos también?",
  "\\bThat´s all of them. Thanks for helping us out!" => "\\bEsos son todos. ¡Gracias por ayudarnos!",
  "\\bA team of scientists from Alola gifted us with Type: Null, a mysterious Pokémon which was born in their laboratory." => "\\bUn equipo de científicos de Alola nos regaló a Type: Null, un Pokémon misterioso que nació en su laboratorio.",
  "\\bThey also gave us some weird discs, which are supposed to change Type: Null´s Type, but so far we haven´t been successful with that." => "\\bTambién nos dieron unos discos raros, que se supone que cambian el Tipo de Type: Null, pero hasta ahora no tuvimos éxito con eso.",
  "\\bI wonder how many Pokémon have been made in labs so far..." => "\\bMe pregunto cuántos Pokémon habrán sido creados en laboratorios hasta ahora...",
}

apply("Data/Map316.rxdata", DICT_316)
apply("Data/Map338.rxdata", DICT_338)
apply("Data/Map324.rxdata", DICT_324)
