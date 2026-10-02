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

DICT_335 = {
  "Rayquaza is staring at you." => "Rayquaza te está mirando fijamente.",
  "It wants to battle!" => "¡Quiere combatir!",
  "\\c[3]QUAZAAA!!!" => "\\c[3]¡¡¡QUAZAAA!!!",
  "Rayquaza disappeared. Will it come back?" => "Rayquaza desapareció. ¿Volverá?",
  "\\b???: Oh, hello. You´re Delta´s new Champion, aren´t you?" => "\\b???: Ah, hola. Tú eres el nuevo Campeón de Delta, ¿verdad?",
  "\\bI´m Lorelei, and I´m part of the Indigo League Elite Four." => "\\bSoy Lorelei, y formo parte del Alto Mando de la Liga Añil.",
  "\\bLorelei: Are you interested in a little adventure? I recently visited the Galar Region, and I came across two ancient artefacts." => "\\bLorelei: ¿Te interesa una pequeña aventura? Hace poco visité la Región de Galar, y me topé con dos artefactos antiguos.",
  "\\bThese are the sword and the shield from an old Galarian legend, and apparently they can grant Zacian and Zamazenta great power!" => "\\bSon la espada y el escudo de una vieja leyenda de Galar, ¡y al parecer pueden otorgarles un gran poder a Zacian y Zamazenta!",
  "\\bWhy don´t you take them and look for these Legendary Pokémon? I was gonna do it myself, but now I just want to relax on the beach." => "\\b¿Por qué no los coges y buscas a estos Pokémon Legendarios? Yo iba a hacerlo, pero ahora solo quiero relajarme en la playa.",
  "\\bHere you go." => "\\bAquí tienes.",
  "\\bI´m not too sure where Zacian and Zamazenta will show up, since they usually just roam around Galar, but all Legendary Pokémon come to Delta eventually." => "\\bNo estoy muy segura de dónde aparecerán Zacian y Zamazenta, ya que normalmente vagan por Galar, pero todos los Pokémon Legendarios acaban llegando a Delta tarde o temprano.",
  "\\bI´m sure that you´ll come across them one day. Have a nice day!" => "\\bEstoy segura de que te los cruzarás algún día. ¡Que tengas un buen día!",
  "\\bLorelei: Mh, this is my kind of vacation." => "\\bLorelei: Mh, estas son mis vacaciones ideales.",
}

DICT_337 = {
  "Groudon is staring at Kyogre." => "Groudon está mirando fijamente a Kyogre.",
  "Groudon is staring at you." => "Groudon te está mirando fijamente.",
  "\\rGRRRRROOOOUUU!!!" => "\\r¡¡¡GRRRRROOOOUUU!!!",
  "Groudon disappeared. Will it come back?" => "Groudon desapareció. ¿Volverá?",
  "Kyogre is staring at Groudon." => "Kyogre está mirando fijamente a Groudon.",
  "Kyogre is staring at you." => "Kyogre te está mirando fijamente.",
  "\\bKYOOOOO!!!" => "\\b¡¡¡KYOOOOO!!!",
  "Kyogre disappeared. Will it come back?" => "Kyogre desapareció. ¿Volverá?",
  "\\bSteven: I didn´t even have time to prepare my device, that´s how fast these two went at each other´s throat!" => "\\bSteven: Ni siquiera me dio tiempo de preparar mi dispositivo, ¡así de rápido se fueron estos dos al cuello!",
  "\\bOkay, wait a minute, let me get this ready." => "\\bVale, espera un momento, déjame prepararlo.",
  "\\bThere we go. Okay, all I gotta do now is point it at these two." => "\\bYa está. Vale, ahora solo tengo que apuntarlo hacia estos dos.",
  "\\bOkay, here we go." => "\\bVale, allá vamos.",
  "\\rGroudon: Get the **** out of my sight before I turn you into a nice filet!" => "\\rGroudon: ¡Quítate de mi ****** vista antes de que te convierta en un buen filete!",
  "\\bKyogre: Nuh uh, if you don´t step aside right ******* now, then I´ll show you what these hands can do!" => "\\bKyogre: Ni de coña, ¡como no te apartes ahora ****** mismo, te voy a enseñar de lo que son capaces estas manos!",
  "\\rGroudon: Hater ass fish!" => "\\rGroudon: ¡Pez de mierda envidioso!",
  "\\bKyogre: Bitch ass lizard!" => "\\bKyogre: ¡Lagarto de mierda cabrón!",
  "\\rGroudon: Kill yourself!" => "\\rGroudon: ¡Suicídate!",
  "\\bKyogre: I ****** your mom!" => "\\bKyogre: ¡Me follé a tu ****** madre!",
  "\\c[3]???: STOP FIGHTING RIGHT NOW, OR I`LL BEAT YOUR ASSES!!!" => "\\c[3]???: ¡¡¡PARAD DE PELEAR AHORA MISMO, O OS VOY A DAR UNA PALIZA A LOS DOS!!!",
  "\\bSteven: Oh, I think I know who that is." => "\\bSteven: Ah, creo que sé quién es.",
  "\\c[3]Rayquaza: Don´t make me repeat myself. Have I made myself clear?" => "\\c[3]Rayquaza: No me hagáis repetirlo. ¿Me he explicado con claridad?",
  "\\rGroudon: Yes, boss..." => "\\rGroudon: Sí, jefe...",
  "\\bKyogre: Alright, fine, the lizard can live for another day..." => "\\bKyogre: Vale, bien, el lagarto vivirá un día más...",
  "\\c[3]Rayquaza: That´s what I like to hear. And remember, I´m always watching you." => "\\c[3]Rayquaza: Eso es lo que quiero oír. Y recordad, siempre os estoy vigilando.",
  "\\c[9]???: Ready for round 2, big guy?" => "\\c[9]???: ¿Listo para el asalto 2, grandullón?",
  "\\c[3]Rayquaza: Oh, why now?! IT`S THAT ******* ALIEN AGAIN!" => "\\c[3]Rayquaza: ¿Por qué ahora?! ¡¡¡ES ESE ****** ALIENÍGENA OTRA VEZ!!!",
  "\\c[3]Rayquaza: Stay right where you are, I gotta beat this alien up first. Don´t do anything stupid!" => "\\c[3]Rayquaza: Quedaos justo donde estáis, primero tengo que darle una paliza a este alienígena. ¡No hagáis ninguna tontería!",
  "\\bSteven: Wait a bloody second, was the Pokémon that just flew by Deoxys?!" => "\\bSteven: Espera un maldito segundo, ¿¡el Pokémon que acaba de pasar volando era Deoxys!?",
  "\\bYou know, the Pokémon inside the asteroid that almost destroyed Hoenn?!" => "\\b¿Sabes, el Pokémon del asteroide que casi destruye Hoenn?!",
  "\\bThat was about a year ago, and Rayquaza saved us on that day." => "\\bEso fue hace más o menos un año, y Rayquaza nos salvó aquel día.",
  "\\bI think Deoxys was flying towards Memorial Tower. That´s a sign that we should head back to Champions Village." => "\\bCreo que Deoxys volaba hacia la Torre Conmemorativa. Eso es una señal de que deberíamos volver a Villa Deliciosa.",
  "\\bBut if you want to, you can go to Memorial Tower to find out what´s going on. I´ll go back to my place, and I´ll be waiting for you with a gift." => "\\bPero si quieres, puedes ir a la Torre Conmemorativa a averiguar qué está pasando. Yo vuelvo a mi casa, y te estaré esperando con un regalo.",
  "\\bYou really helped me here, so I want to reward you accordingly." => "\\bDe verdad me has ayudado mucho aquí, así que quiero recompensarte como corresponde.",
  "\\bAlright, time to go." => "\\bBien, hora de irse.",
  "\\bSteven: This should be the place. Well, what are we waiting for, let´s go inside!" => "\\bSteven: Este debería ser el lugar. Bueno, ¿a qué esperamos? ¡Entremos!",
  "\\bSteven: Come on, this will be exciting!" => "\\bSteven: ¡Venga, esto va a ser emocionante!",
}

DICT_356 = {
  "It´s an ancient plate with strange symbols." => "Es una placa antigua con símbolos extraños.",
  "\\bSteven: That looks like a shrine if I´ve ever seen one. Hm, maybe we could try and pray?" => "\\bSteven: Eso parece un santuario donde los haya. Mh, ¿quizá podríamos intentar rezar?",
  "\\bOh, nothing happened..." => "\\bAh, no ha pasado nada...",
  "\\rGRRRROOOOUUU!!!" => "\\r¡¡¡GRRRROOOOUUU!!!",
  "\\bSteven: Wait, did it work?" => "\\bSteven: Espera, ¿¡ha funcionado!?",
  "\\bKYOOOOOO!!!" => "\\b¡¡¡KYOOOOOO!!!",
  "\\bSteven: YES, IT`S THEM! Come on, we gotta go outside!" => "\\bSteven: ¡¡¡SÍ, SON ELLOS!!! ¡Venga, tenemos que salir fuera!",
}

DICT_339 = {
  "\\bThere´s three things in life that I love. Beautiful women, cooking, and Pokémon battles!" => "\\bHay tres cosas en la vida que me encantan. ¡Las mujeres hermosas, cocinar y los combates Pokémon!",
  "\\bI need a woman in my life..." => "\\bNecesito una mujer en mi vida...",
  "\\bHey, get off my beach!" => "\\b¡Eh, sal de mi playa!",
  "\\bThis is easily the best beach in all of Delta, because hardly anyone comes here. This is what I call relaxing." => "\\bEsta es sin duda la mejor playa de todo Delta, porque casi nadie viene por aquí. Esto es lo que yo llamo relajarse.",
  "\\bAhhhhhh, get out of my waaaaaay!!!" => "\\b¡¡¡Ahhhhhh, quítate de mi caaaaamino!!!",
  "\\bPlease get out of my way now, I really need to train. I have a competition coming up, and I don´t plan on losing!" => "\\bPor favor, quítate de mi camino, de verdad necesito entrenar. Tengo una competición próximamente, ¡y no pienso perder!",
}

DICT_340 = {
  "Dialga is unbothered." => "Dialga permanece impasible.",
  "Dialga is staring at you." => "Dialga te está mirando fijamente.",
  "\\bDIAAA!!!" => "\\b¡¡¡DIAAA!!!",
  "Dialga returned to its dimension. Will it come back?" => "Dialga volvió a su dimensión. ¿Volverá?",
  "Palkia is unbothered." => "Palkia permanece impasible.",
  "Palkia is staring at you." => "Palkia te está mirando fijamente.",
  "\\bPAAAL!!!" => "\\b¡¡¡PAAAL!!!",
  "Palkia returned to its dimension. Will it come back?" => "Palkia volvió a su dimensión. ¿Volverá?",
  "\\c[6]???: Welcome, child. I am Arceus. You humans also call me God. But please, let me take a closer look at you." => "\\c[6]???: Bienvenido, niño. Soy Arceus. Vosotros los humanos también me llamáis Dios. Pero, por favor, déjame echarte un vistazo más de cerca.",
  "\\c[6]Arceus: How fascinating. Your kind has developed much further than I ever would´ve imagined." => "\\c[6]Arceus: Qué fascinante. Vuestra especie ha evolucionado mucho más de lo que jamás habría imaginado.",
  "\\c[6]I might have come up with Pokémon and humans, but I wouldn´t have been able to create all of these amazing things." => "\\c[6]Puede que se me ocurrieran los Pokémon y los humanos, pero no habría sido capaz de crear todas estas cosas increíbles.",
  "\\c[6]Gambling." => "\\c[6]El juego de apuestas.",
  "\\c[6]Drunk driving." => "\\c[6]Conducir borracho.",
  "\\c[6]Tax fraud." => "\\c[6]El fraude fiscal.",
  "\\c[6]Chicken Jockey." => "\\c[6]El Chicken Jockey.",
  "\\c[6]One Piece." => "\\c[6]One Piece.",
  "\\c[6]Lockheed Martin." => "\\c[6]Lockheed Martin.",
  "\\c[6]Kansas." => "\\c[6]Kansas.",
  "\\c[6]Femboys." => "\\c[6]Los femboys.",
  "\\c[6]And many more incredible things. But listen up: I want to give you the chance to have a battle against me." => "\\c[6]Y muchas otras cosas increíbles más. Pero escucha: quiero darte la oportunidad de tener un combate contra mí.",
  "\\c[6]Take your time to get ready. I will be waiting right here." => "\\c[6]Tómate tu tiempo para prepararte. Te estaré esperando aquí mismo.",
  "\\c[6]Arceus: It´s time to show me your courage!" => "\\c[6]Arceus: ¡Es hora de que me muestres tu valentía!",
  "\\c[6]Arceus: Wow, that was an incredible battle. Are you ready for another round?" => "\\c[6]Arceus: Vaya, ha sido un combate increíble. ¿Listo para otra ronda?",
  "\\bCynthia: Wow, it worked! And don´t be scared, Dialga and Palkia are usually quite peaceful." => "\\bCynthia: ¡Vaya, ha funcionado! Y no te asustes, Dialga y Palkia suelen ser bastante pacíficos.",
  "\\bAnd now it shouldn´t take long until..." => "\\bY ahora no debería tardar mucho hasta que...",
  "\\bGIRAAA!!!" => "\\b¡¡¡GIRAAA!!!",
  "\\bCynthia: Oh that was quick. Alright, time to enter the Distortion Temple!" => "\\bCynthia: Vaya, eso ha sido rápido. Bien, ¡hora de entrar al Templo de la Distorsión!",
  "\\bCynthia: Great, you caught the Lake Trio! Then every condition has been met." => "\\bCynthia: ¡Genial, atrapaste al Trío del Lago! Entonces se han cumplido todas las condiciones.",
  "\\bYou´re standing right in front of the Distortion Temple, the only place that is located both in our world and in the Distortion World." => "\\bEstás justo delante del Templo de la Distorsión, el único lugar que se encuentra tanto en nuestro mundo como en el Mundo Distorsión.",
  "\\bThis is were we´ll meet Giratina! Since you caught the Lake Trio, they can´t open a portal to the Distortion World unless you tell them to." => "\\b¡Aquí es donde nos encontraremos con Giratina! Como atrapaste al Trío del Lago, no pueden abrir un portal al Mundo Distorsión a menos que se lo ordenes.",
  "\\bWe don´t want to do that though. We want Giratina to enter the Distortion Temple, and we can do that by summoning Dialga and Palkia." => "\\bPero no queremos hacer eso. Queremos que Giratina entre en el Templo de la Distorsión, y podemos conseguirlo invocando a Dialga y Palkia.",
  "\\bWith the dimensional balance disrupted, we should be able to get them to appear here. Don´t worry, that sounds a lot worse than it is." => "\\bCon el equilibrio dimensional alterado, deberíamos poder hacer que aparezcan aquí. No te preocupes, suena mucho peor de lo que es.",
  "\\bHere´s what we´ll have to do: you´ll go and stand in the center of the Gate of Time, and I´ll stand in the center of the Gate of Space." => "\\bEsto es lo que tenemos que hacer: tú vas a colocarte en el centro de la Puerta del Tiempo, y yo me colocaré en el centro de la Puerta del Espacio.",
  "\\bIf I´m right, that should be all it takes to make Dialga and Palkia appear." => "\\bSi no me equivoco, con eso debería bastar para hacer que aparezcan Dialga y Palkia.",
  "\\bAlright, let´s go and take our positions." => "\\bBien, vamos a colocarnos en posición.",
  "\\bCynthia: What are you doing up here? Get into position on the other side." => "\\bCynthia: ¿Qué haces aquí arriba? Ponte en posición al otro lado.",
  "\\bCynthia: Do you feel that? The dimensions are colliding! They are here!" => "\\bCynthia: ¿Lo sientes? ¡Las dimensiones están colisionando! ¡Ya están aquí!",
}

DICT_341 = {
  "Giratina is staring at you." => "Giratina te está mirando fijamente.",
  "\\bGIRAAA!!!" => "\\b¡¡¡GIRAAA!!!",
  "Giratina returned to the Distortion World. Will it come back?" => "Giratina volvió al Mundo Distorsión. ¿Volverá?",
  "\\bCynthia: The last time I met Giratina, a maniac was trying to use its power to wipe all of us out, because he wanted to \"recreate the universe\"." => "\\bCynthia: La última vez que me encontré con Giratina, un maníaco estaba intentando usar su poder para aniquilarnos a todos, porque quería \"recrear el universo\".",
  "\\bI managed to stop that guy, with the help of a very capable trainer, but Giratina vanished after this incident." => "\\bLogré detener a ese tipo, con la ayuda de un entrenador muy capaz, pero Giratina desapareció tras este incidente.",
  "\\bBut now, it seems like Giratina is quite calm. Who knows, maybe your help in the Delta Region contributed to the balance of the dimensions?" => "\\bPero ahora, parece que Giratina está bastante tranquila. Quién sabe, ¿quizá tu ayuda en la Región Delta contribuyó al equilibrio de las dimensiones?",
  "\\bOh, and don´t worry, I told Giratina that the Lake Trio is in safe hands." => "\\bAh, y no te preocupes, le dije a Giratina que el Trío del Lago está en buenas manos.",
  "\\bThanks for helping me out here, it´s good to see that the world is becoming safer again." => "\\bGracias por ayudarme aquí, es bueno ver que el mundo se está volviendo más seguro otra vez.",
  "\\bI´ll head back to Champions Village. Please visit me once you´re done here, I have a gift for you." => "\\bVoy a volver a Villa Deliciosa. Por favor, visítame cuando termines aquí, tengo un regalo para ti.",
  "\\bOh, and one more thing, you can challenge these gods if you want to. They love to battle, and they won´t be angered if you beat them." => "\\bAh, y una cosa más, puedes retar a estos dioses si quieres. Les encanta combatir, y no se enfadarán si los vences.",
  "\\bSee you later, \\PN." => "\\bHasta luego, \\PN.",
}

apply("Data/Map335.rxdata", DICT_335)
apply("Data/Map337.rxdata", DICT_337)
apply("Data/Map356.rxdata", DICT_356)
apply("Data/Map339.rxdata", DICT_339)
apply("Data/Map340.rxdata", DICT_340)
apply("Data/Map341.rxdata", DICT_341)
