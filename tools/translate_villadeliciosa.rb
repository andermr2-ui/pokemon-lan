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

DICT_334 = {
  "\\bWow, it´s really you..." => "\\bVaya, eres tú de verdad...",
  "\\bI´m like your biggest fan, \\PN! Since you became Champion, I´ve always wanted to meet you." => "\\b¡Soy tu mayor fan, \\PN! Desde que te convertiste en Campeón, siempre he querido conocerte.",
  "\\bI snuck into Champions Village, because I knew I´d find you here. Please, take this gift!" => "\\bMe colé en Villa Deliciosa, porque sabía que te encontraría aquí. ¡Por favor, acepta este regalo!",
  "\\bPlease don´t tell the guards that I´m here..." => "\\bPor favor, no le digas a los guardias que estoy aquí...",
  "\\b???: Ah, you must be \\PN. Congratulations on becoming Champion!" => "\\b???: Ah, tú debes de ser \\PN. ¡Felicidades por convertirte en Campeón!",
  "\\bMy name is Bruno. I´m an Elite Four member from Kanto, so I know how strong you have to be." => "\\bMe llamo Bruno. Soy miembro del Alto Mando de Kanto, así que sé lo fuerte que tienes que ser.",
  "\\bBruno: Since you´re such a strong trainer, you´re just the one I need for this job." => "\\bBruno: Como eres un entrenador tan fuerte, eres justo quien necesito para este trabajo.",
  "\\bA few years ago, I visited the Crown Tundra, which is part of Galar, and I found an old relic called the Reins of Unity." => "\\bHace unos años, visité la Tundra Coronada, que forma parte de Galar, y encontré una vieja reliquia llamada las Riendas de la Unidad.",
  "\\bThese reins once belonged to a Legendary Pokémon called Calyrex. With the power of the reins, it could mount two mighty steeds." => "\\bEstas riendas pertenecieron una vez a un Pokémon Legendario llamado Calyrex. Con el poder de las riendas, podía montar dos poderosos corceles.",
  "\\bI´m talking about Glastrier and Spectrier!" => "\\b¡Hablo de Glastrier y Spectrier!",
  "\\bBasically, all I want you to do is take the Reins of Unity and find these Pokémon. No one has seen them in ages, so they might not even be alive anymore." => "\\bBásicamente, lo único que quiero que hagas es coger las Riendas de la Unidad y encontrar a estos Pokémon. Hace siglos que nadie los ve, así que puede que ni siquiera sigan vivos.",
  "\\bPlease tell me if you find at least one of them, that´s enough for me." => "\\bPor favor, avísame si encuentras al menos a uno de ellos, con eso me basta.",
  "\\bOh, and of course you shouldn´t go without these." => "\\bAh, y por supuesto no deberías irte sin esto.",
  "\\bGood luck for your search!" => "\\b¡Buena suerte con la búsqueda!",
  "\\bBruno: I hope these Pokémon are still alive..." => "\\bBruno: Espero que estos Pokémon sigan vivos...",
  "\\bBruno: Hm? Do you have any news for me?" => "\\bBruno: ¿Eh? ¿Tienes alguna noticia para mí?",
  "\\bWhat? So they´re still alive?! That´s great!" => "\\b¿Qué? ¿¡Así que siguen vivos!? ¡Genial!",
  "\\bI was super worried, but this calms me down. Let me reward you with this." => "\\bEstaba súper preocupado, pero esto me tranquiliza. Déjame recompensarte con esto.",
  "\\bWait, no, that´s not enough of a reward. Take these as well." => "\\bEspera, no, eso no es suficiente recompensa. Toma también estos.",
  "\\bThat should do it. Thanks for helping me out, and take care!" => "\\bCon eso debería bastar. Gracias por ayudarme, ¡y cuídate!",
  "\\bBruno: Yup, I happen to have a lot of Z-Crystals." => "\\bBruno: Sí, da la casualidad de que tengo muchos Cristales Z.",
  "\\b???: Ah, you´re \\PN if I´m not mistaken. Name´s Brock, nice to meet ya." => "\\b???: Ah, tú eres \\PN si no me equivoco. Me llamo Brock, encantado de conocerte.",
  "\\bBrock: I´m a Gym Leader in Kanto, and I recently found a very interesting Rockruff." => "\\bBrock: Soy Líder de Gimnasio en Kanto, y hace poco encontré un Rockruff muy interesante.",
  "\\bThis little fella has a lot of potential, but I just can´t get it to evolve into Lycanroc." => "\\bEste pequeñín tiene mucho potencial, pero no consigo que evolucione a Lycanroc.",
  "\\bWhy don´t you take this Rockruff? Maybe you´ve more luck than me." => "\\b¿Por qué no te llevas este Rockruff? Quizá tengas más suerte que yo.",
  "\\bOh, and you should take this as well." => "\\bAh, y deberías llevarte esto también.",
  "\\bUsually, Rockruffs evolve very early. They can evolve into one of two Lycanroc forms, it all depends on when they evolve." => "\\bNormalmente, los Rockruff evolucionan muy pronto. Pueden evolucionar a una de dos formas de Lycanroc, todo depende de cuándo evolucionen.",
  "\\bApparently there is a third form of Lycanroc, also known as the Dusk Form, but I haven´t come across one yet. Have a nice day!" => "\\bAl parecer hay una tercera forma de Lycanroc, conocida como la Forma Crepúsculo, pero todavía no me he topado con ninguna. ¡Que tengas un buen día!",
  "There's no more room for Pokémon!" => "¡No queda más sitio para Pokémon!",
  "The Pokémon Boxes are full and can't accept any more!" => "¡Las Cajas de Pokémon están llenas y no pueden aceptar más!",
  "\\bI really want to have a Lycanroc for my team, but maybe this is a sign that it´s the wrong Pokémon for me." => "\\bDe verdad quiero tener un Lycanroc en mi equipo, pero quizá esto sea una señal de que no es el Pokémon adecuado para mí.",
  "\\bAh, there you are. This is where we´ll test the strength of Urshifu." => "\\bAh, ahí estás. Aquí es donde vamos a poner a prueba la fuerza de Urshifu.",
  "\\bSince you came all the way to Champions Village, I am certain that you are ready. Let´s begin!" => "\\bYa que has venido hasta Villa Deliciosa, estoy seguro de que estás listo. ¡Empecemos!",
  "\\bWow, that was quite the perfomance. I expected no less from a Champion!" => "\\bVaya, menuda actuación. ¡No esperaba menos de un Campeón!",
  "\\bI was able to proof what I wanted to proof, so this is the end of my career as a trainer. But let me think about that for a second." => "\\bHe podido demostrar lo que quería demostrar, así que este es el final de mi carrera como entrenador. Pero déjame pensarlo un momento.",
  "\\bOh, but why haven´t you brought your Urshifu? Please come back with Urshifu." => "\\bAh, ¿pero por qué no has traído a tu Urshifu? Por favor, vuelve con Urshifu.",
  "\\bI have made up my mind. This is truly the end of my career, I am now a retired trainer." => "\\bHe tomado una decisión. Este es de verdad el final de mi carrera, ahora soy un entrenador retirado.",
  "\\bAnd because you helped me achieve my goal, I want to gift you the other Urshifu." => "\\bY como me has ayudado a lograr mi objetivo, quiero regalarte el otro Urshifu.",
  "\\bWith both Urshifus on your side, you´ll be unstoppable! I wish you the best for your future battles. Never give up!" => "\\b¡Con ambos Urshifu de tu lado, serás imparable! Te deseo lo mejor para tus futuros combates. ¡Nunca te rindas!",
  "\\bMh, Champions Village is the perfect place to spend the rest of my life. No tourists, a nice beach, and I can have a chat with Champions whenever I want!" => "\\bMh, Villa Deliciosa es el lugar perfecto para pasar el resto de mi vida. Sin turistas, una playa bonita, ¡y puedo charlar con Campeones cuando quiera!",
}

DICT_354 = {
  "\\bI am the guardian of Memorial Tower. Show me that you´re allowed to be here!" => "\\bSoy el guardián de la Torre Conmemorativa. ¡Demuéstrame que tienes permiso para estar aquí!",
  "\\bOkay, you are allowed to be here. But respect the Pokémon that live here, this is a sacred place!" => "\\bDe acuerdo, tienes permiso para estar aquí. ¡Pero respeta a los Pokémon que viven aquí, este es un lugar sagrado!",
  "\\bThe Memorial Tower is the oldest building in Delta. It has been here for thousands of years!" => "\\bLa Torre Conmemorativa es el edificio más antiguo de Delta. ¡Lleva aquí miles de años!",
  "Deoxys is staring at you." => "Deoxys te está mirando fijamente.",
  "It wants to battle!" => "¡Quiere combatir!",
  "\\c[5]XYSSS!!!" => "\\c[5]¡¡¡XYSSS!!!",
  "Deoxys is unfazed." => "Deoxys permanece impasible.",
  "\\bAh, I have been waiting for you. I am Ryu, and I used to be a member of the Elite Four in the Delta League." => "\\bAh, te estaba esperando. Soy Ryu, y antes era miembro del Alto Mando de la Liga Pokémon Delta.",
  "\\bI decided to quit because I felt like I didn´t have what it takes to be an Elite Four trainer, and I don´t regret that decision. " => "\\bDecidí dejarlo porque sentía que no tenía lo necesario para ser entrenador del Alto Mando, y no me arrepiento de esa decisión. ",
  "\\bBut would the new Champion be so kind to have a battle with me? I haven´t had one in a while and I do miss this feeling." => "\\bPero, ¿sería tan amable el nuevo Campeón de tener un combate conmigo? Hace tiempo que no tengo uno y echo de menos esa sensación.",
  "\\bWow, thanks a lot! The new generation of trainers really is in a league of their own." => "\\bVaya, ¡muchas gracias! La nueva generación de entrenadores está realmente en otra liga.",
  "\\bOh, and you should be careful when going through Memorial Tower, some powerful Pokémon live here." => "\\bAh, y deberías tener cuidado al atravesar la Torre Conmemorativa, aquí viven algunos Pokémon poderosos.",
  "\\bMany years ago, I almost managed to become Champion. But our battle showed me that I would´ve lost my title very fast." => "\\bHace muchos años, casi logré convertirme en Campeón. Pero nuestro combate me mostró que habría perdido mi título muy rápido.",
}

DICT_355 = {
  "\\bSteven: Ah, finally. I´ve been looking forward to meet you. After all, you´re the one who beat Arthur!" => "\\bSteven: Ah, por fin. Tenía muchas ganas de conocerte. Al fin y al cabo, ¡tú eres quien venció a Arthur!",
  "\\bHe´s been a good friend of mine for a long time now, and I know how strong he is." => "\\bHa sido buen amigo mío desde hace mucho, y sé lo fuerte que es.",
  "\\bSince you can´t beat him by just being lucky, you must be as strong as everyone says you are. I respect that." => "\\bComo no puedes vencerlo solo con suerte, debes de ser tan fuerte como todos dicen. Eso lo respeto.",
  "\\bAnyways, I have something that I want to try, and it´d be great if you could help me." => "\\bEn fin, tengo algo que quiero probar, y me vendría genial que me ayudaras.",
  "\\bI have developed a new device with Arthur´s help, and I need your experience in dealing with legendary Pokémon to help me test it." => "\\bHe desarrollado un nuevo dispositivo con la ayuda de Arthur, y necesito tu experiencia lidiando con Pokémon legendarios para ayudarme a probarlo.",
  "\\bThe device I made is a Pokémon translator, and I want to use it to find out why Kyogre and Groudon hate each other so much." => "\\bEl dispositivo que hice es un traductor de Pokémon, y quiero usarlo para averiguar por qué Kyogre y Groudon se odian tanto.",
  "\\bApparently there´s a way to make them appear at Shrouded Cove, which isn´t far from here." => "\\bAl parecer hay una forma de hacer que aparezcan en la Cueva Envuelta, que no está lejos de aquí.",
  "\\bBut we should be very careful, if these two actually meet and start their beef again, Rayquaza might come down to stop their fight." => "\\bPero deberíamos tener mucho cuidado, si estos dos de verdad se encuentran y retoman su pelea, Rayquaza podría bajar a detener su combate.",
  "\\bAh, why am I even worried? We´re Champions!" => "\\bAh, ¿por qué me preocupo siquiera? ¡Somos Campeones!",
  "\\bI´ll meet you at Shrouded Cove. Bye!" => "\\bNos vemos en la Cueva Envuelta. ¡Adiós!",
  "\\bSteven: We´ll meet at Shrouded Cove." => "\\bSteven: Nos veremos en la Cueva Envuelta.",
  "\\bSteven: I didn´t expect these Pokémon to use so many swear words." => "\\bSteven: No esperaba que estos Pokémon soltaran tantas palabrotas.",
  "\\bOh, and of course thank you! I don´t think I would´ve gotten these Pokémon to appear on my own." => "\\bAh, ¡y gracias, claro! No creo que hubiera conseguido que estos Pokémon aparecieran yo solo.",
  "\\bAnyways, this is for you." => "\\bEn fin, esto es para ti.",
  "\\bThis is a piece of the asteroid that Deoxys was in. Should you manage to catch Deoxys, you can change its forms with the Meteorite." => "\\bEsto es un trozo del asteroide en el que estaba Deoxys. Si consigues atrapar a Deoxys, podrás cambiar sus formas con el Meteorito.",
  "\\bAnd that´s all from me for today. We should get some rest now. Bye!" => "\\bY eso es todo por mi parte por hoy. Deberíamos descansar un poco ahora. ¡Adiós!",
  "\\bSteven: I really wanna buy that Registeel body-pillow now..." => "\\bSteven: Ahora de verdad quiero comprarme esa almohada gigante de Registeel...",
  "\\bSteven: Oh, do you have news for me?" => "\\bSteven: Ah, ¿tienes noticias para mí?",
  "\\bHm? The World Championship Tournament? YEEEEEEEEEEEEEEES!!!" => "\\b¿Eh? ¿El Torneo del Campeonato Mundial? ¡¡¡SÍÍÍÍÍÍÍÍÍÍÍÍÍÍ!!!",
  "\\bFinally, it´s been too long since the last one. This tournament is amazing!" => "\\bPor fin, ha pasado demasiado tiempo desde el último. ¡Este torneo es increíble!",
  "\\bOkay, I´ll see you there. May the best trainer win!" => "\\bBueno, nos vemos allí. ¡Que gane el mejor entrenador!",
  "\\bSteven: I´m not gonna change my strategy, I´m just entering the tournament to have fun!" => "\\bSteven: No voy a cambiar mi estrategia, ¡solo entro al torneo para divertirme!",
  "\\bSteven: Congratulation dude! You´re the best of the best now, but always remember to stay humble." => "\\bSteven: ¡Felicidades, tío! Ahora eres el mejor de los mejores, pero recuerda siempre mantenerte humilde.",
}

DICT_357 = {
  "\\bCynthia: Oh, sorry, let me turn off my theme first. It always starts playing when someone enters this place, and I don´t know why." => "\\bCynthia: Ah, perdona, deja que apague mi tema musical primero. Siempre empieza a sonar cuando alguien entra aquí, y no sé por qué.",
  "\\bAlright, there we go." => "\\bBien, ya está.",
  "\\bIt´s great to finally meet you! I´ve heard a lot of stories about you, and now I can finally see what all the fuzz is about!" => "\\b¡Qué bien conocerte por fin! He oído un montón de historias sobre ti, ¡y ahora por fin puedo ver a qué viene tanto revuelo!",
  "\\bHere we go!" => "\\b¡Allá vamos!",
  "\\bOh, sorry, I don´t even want to battle you right now, that´s just a force of habit. I have a plan that´s much more exciting than a simple battle!" => "\\bAh, perdona, en realidad ahora mismo no quiero combatir contigo, es solo la fuerza de la costumbre. ¡Tengo un plan mucho más emocionante que un simple combate!",
  "\\bHave you heard of Ruin Island before? It´s north of Eastern Beach, and it´s said to be a sacred place dedicated to the gods of time and space." => "\\b¿Has oído hablar antes de la Isla Reliquia? Está al norte de Playa del Este, y se dice que es un lugar sagrado dedicado a los dioses del tiempo y el espacio.",
  "\\bA few years ago, back in Sinnoh, I met these gods, but under unfortunate circumstances." => "\\bHace unos años, allá en Sinnoh, conocí a estos dioses, pero en circunstancias desafortunadas.",
  "\\bI want to meet them again, but without the world being at stake." => "\\bQuiero volver a encontrarme con ellos, pero sin que el mundo esté en juego.",
  "\\bI know that the Lake Trio has been spotted in the Delta Region. I´d be great if you could go and catch them." => "\\bSé que se ha visto al Trío del Lago en la Región Delta. Estaría genial que fueras a atraparlos.",
  "\\bOnce you´ve managed to do so, meet me at Ruin Island." => "\\bUna vez que lo hayas logrado, reúnete conmigo en la Isla Reliquia.",
  "\\bThe Lake Trio has been spotted on Route 2, Route 8 and Route 9, and I´m sure you´ll find them." => "\\bSe ha visto al Trío del Lago en la Ruta 2, la Ruta 8 y la Ruta 9, y estoy segura de que los encontrarás.",
  "\\bAlright, see you soon!" => "\\bBien, ¡hasta pronto!",
  "\\bCynthia: Meet me at Ruin Island once you´ve caught the Lake Trio." => "\\bCynthia: Reúnete conmigo en la Isla Reliquia una vez que hayas atrapado al Trío del Lago.",
  "\\bCynthia: Once again, thank you for your help. And in case you should somehow catch these gods, then these will be useful for you." => "\\bCynthia: Una vez más, gracias por tu ayuda. Y por si de alguna forma llegas a atrapar a estos dioses, esto te será útil.",
  "\\bThese ancient relics can drastically boost the power of Dialga, Palkia and Giratina. If they weren´t strong enough already..." => "\\bEstas reliquias antiguas pueden aumentar drásticamente el poder de Dialga, Palkia y Giratina. Como si no fueran ya lo bastante fuertes...",
  "\\bThere are three similiar relics somewhere on these islands, and these are able to change the form of the Dimension Trio." => "\\bHay tres reliquias similares en algún lugar de estas islas, y son capaces de cambiar la forma del Trío de la Dimensión.",
  "\\bDialga and Palkia have an Origin Form like Giratina, which can only be brought back with these relics." => "\\bDialga y Palkia tienen una Forma Origen como Giratina, que solo se puede recuperar con estas reliquias.",
  "\\bSimiliarly, Giratina´s Origin Form can only be seen outside the Distortion World with the relic." => "\\bDe manera similar, la Forma Origen de Giratina solo se puede ver fuera del Mundo Distorsión con la reliquia.",
  "\\bI´m sure you´ll find them. Bye!" => "\\bEstoy segura de que los encontrarás. ¡Adiós!",
  "\\bCynthia: We´ll have a battle one day, I´m sure of it." => "\\bCynthia: Algún día tendremos un combate, estoy segura.",
  "\\bCynthia: Hm, what is it?" => "\\bCynthia: ¿Eh? ¿Qué pasa?",
  "\\bOh, you´re here to invite me to the World Championship Tournament?" => "\\bAh, ¿has venido a invitarme al Torneo del Campeonato Mundial?",
  "\\bThat´s very kind of you." => "\\bQué amable de tu parte.",
  "\\bOh, and of course I´ll join. I´m still upset that I didn´t win the tournament one year ago, but this time I´ll defeat all of you!" => "\\bAh, y por supuesto que me apunto. Todavía estoy molesta por no haber ganado el torneo hace un año, ¡pero esta vez os venceré a todos!",
  "\\bI guess I´ll see you in Riverstone, bye!" => "\\bSupongo que nos vemos en Río el Último, ¡adiós!",
  "\\bCynthia: I´m really looking forward to the tournament. Let´s have some awesome battles!" => "\\bCynthia: Tengo muchas ganas del torneo. ¡Que tengamos combates increíbles!",
  "\\bCynthia: Damn, I really thought this would be my year. But either way, congratulations on becoming World Champion, you really deserve it!" => "\\bCynthia: Vaya, de verdad pensé que este sería mi año. Pero de todas formas, ¡felicidades por convertirte en Campeón Mundial, de verdad te lo mereces!",
}

apply("Data/Map334.rxdata", DICT_334)
apply("Data/Map354.rxdata", DICT_354)
apply("Data/Map355.rxdata", DICT_355)
apply("Data/Map357.rxdata", DICT_357)
