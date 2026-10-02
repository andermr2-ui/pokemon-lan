# encoding: UTF-8
require_relative "rpg_stubs"

DICT_215 = {
  "\\bWhy can´t I jump down this ledge?! I´m too lazy to take the long way to the Pokémon Mart, but I guess I´ve got no other choice..." =>
    "\\b¿¡Por qué no puedo saltar por este saliente!? Me da fiaca ir por el camino largo hasta la Tienda Pokémon, pero supongo que no tengo otra opción...",
  "Move Maniac" => "Profesor de Movimientos",
  "\\bIf you turn out to be worthy, you will be rewarded accordingly." =>
    "\\bSi resultás ser digno, serás recompensado como corresponde.",
  "\\bI accidentally named my Pangoro \"Dingleberry\", but the Name Rater helped me change its name to \"Garp\"." =>
    "\\bLe puse por accidente \"Bolagrasa\" a mi Pangoro, pero el Evaluador de Nombres me ayudó a cambiarle el nombre a \"Garp\".",
  "\\bYup, I´m a One Piece fan. Watch One Piece. DO IT!" =>
    "\\bSip, soy fan de One Piece. Miren One Piece. ¡HÁGANLO!",
  "\\bNo one is allowed to enter Aurora Mountain. Get lost!" =>
    "\\bA nadie se le permite entrar al Monte Auroreal. ¡Rajá!",
  "Aurora Summit" => "Cumbres Auroreales",
  "\\bGiovanni: Ah, there you are. Take your time to say goodbye to your friends and family." =>
    "\\bGiovanni: Ah, ahí estás. Tomate tu tiempo para despedirte de tus amigos y familia.",
  "\\bActually, instead of saying goodbye you should apologize to them, because you´re the one who sealed their fate!" =>
    "\\bEn realidad, en vez de despedirte, deberías disculparte con ellos, ¡porque vos sellaste su destino!",
  "\\bTake the time you need, but this world is doomed. I´m gonna start with the Delta Region, and then I will do the same to the other regions." =>
    "\\bTomate el tiempo que necesites, pero este mundo está condenado. Voy a empezar con la Región Delta, y después voy a hacer lo mismo con las demás regiones.",
  "\\bAnd don´t even think about asking the Champ to help you out, if anyone else comes to fight me, I will order Kyurem to rip their heart out." =>
    "\\bY ni se te ocurra pedirle ayuda al Campeón, si alguien más viene a pelear contra mí, le voy a ordenar a Kyurem que le arranque el corazón.",
  "\\bI´m gonna wait right here, and once our battle begins, your final minutes have begun." =>
    "\\bVoy a esperar justo acá, y en cuanto empiece nuestro combate, empezarán tus últimos minutos.",
  "\\bThe struggle in your eyes as you fail to even damage Kyurem will be a sight to behold." =>
    "\\bEl sufrimiento en tus ojos mientras fracasás en siquiera dañar a Kyurem va a ser un espectáculo digno de ver.",
  "\\bGiovanni: The time has come. Get ready for the last battle of your life!" =>
    "\\bGiovanni: Llegó el momento. ¡Preparate para el último combate de tu vida!",
  "\\bGiovanni: You actually did it. You stopped the mighty Kyurem. And you´re still just a kid." =>
    "\\bGiovanni: De verdad lo lograste. Detuviste al poderoso Kyurem. Y sos apenas un chico.",
  "\\bIf not one but two kids were able to stop me, that might be a sign that I´m not just a bad guy but also a terrible trainer..." =>
    "\\bSi no uno sino dos chicos pudieron detenerme, tal vez eso sea una señal de que no solo soy un mal tipo, sino también un entrenador terrible...",
  "\\bMaybe I should just go an pursue the same path as you. You look happy. You´re a strong trainer with a bright future. I´m jealous of you." =>
    "\\bTal vez debería simplemente seguir el mismo camino que vos. Te ves feliz. Sos un entrenador fuerte con un futuro brillante. Te tengo envidia.",
  "\\bI never had what you have. I never had the chance to do a journey like all those other kids did. My family was poor." =>
    "\\bNunca tuve lo que vos tenés. Nunca tuve la oportunidad de hacer un viaje como todos esos otros chicos. Mi familia era pobre.",
  "\\bMy mother died early. I hardly got to know her. My dad made just enough money to get us through, and he did it with illegal underground battles." =>
    "\\bMi madre murió temprano. Casi no llegué a conocerla. Mi papá ganaba apenas lo suficiente para que sobreviviéramos, y lo hacía con combates clandestinos ilegales.",
  "\\bThen my dad died. I was alone, I only had my dad´s Meowth and some money. I was a horrible trainer. I couldn´t catch Pokémon or make money in battles." =>
    "\\bDespués murió mi papá. Quedé solo, solo tenía al Meowth de mi papá y algo de dinero. Era un entrenador horrible. No podía atrapar Pokémon ni ganar dinero en combates.",
  "\\bThat´s when I started to steal Pokémon. It was the only way for me to survive. One day I met someone with a similar fate. " =>
    "\\bAhí fue cuando empecé a robar Pokémon. Era la única forma que tenía de sobrevivir. Un día conocí a alguien con un destino parecido. ",
  "\\bWe began recruiting more misfits, and that´s how Team Rocket was created." =>
    "\\bEmpezamos a reclutar más marginados, y así se creó el Team Rocket.",
  "\\bI have made my choice. I´m gonna start the Gym Challenge, and one day I will challenge the Elite Four." =>
    "\\bTomé mi decisión. Voy a empezar el Desafío de Gimnasios, y algún día voy a desafiar al Alto Mando.",
  "\\bI tried to kill you. I wanted to destroy the world. These are unforgivable crimes, and I probably deserve to die." =>
    "\\bIntenté matarte. Quería destruir el mundo. Estos son crímenes imperdonables, y probablemente merezca morir.",
  "\\bYup. I´m gonna kill the old Giovanni, and then I will take on a new identity." =>
    "\\bSip. Voy a matar al viejo Giovanni, y después voy a adoptar una nueva identidad.",
  "\\bI´m the last person that should get a second chance, but please, let me at least try to become a better person." =>
    "\\bSoy la última persona que debería tener una segunda oportunidad, pero por favor, dejame al menos intentar convertirme en una mejor persona.",
  "\\bI´ll start by releasing Kyurem." => "\\bVoy a empezar liberando a Kyurem.",
  "Giovanni released Kyurem. It fled back into Aurora Mountain." =>
    "Giovanni liberó a Kyurem. Huyó de vuelta al Monte Auroreal.",
  "\\bGiovanni: There we go. If my plan doesn´t work out, then I´ll put a bullet through my head." =>
    "\\bGiovanni: Bueno, ahí está. Si mi plan no sale bien, entonces me voy a pegar un tiro.",
  "\\bPray for me, \\PN. And if I manage to stay determined, then we´ll meet again. Goodbye." =>
    "\\bRezá por mí, \\PN. Y si logro mantenerme firme en mi decisión, nos volveremos a encontrar. Adiós.",
  "\\bYou´ll reach the highest point of Aurora Mountain if you follow these stairs." =>
    "\\bVas a llegar al punto más alto del Monte Auroreal si seguís estas escaleras.",
  "Aurora Summit Gym\\nLeader: Wesley" => "Gimnasio de Cumbres Auroreales\\nLíder: Wesley",
  "\\bOnly those who are worthy can enter this part of Aurora Mountain. And you aren´t worthy!" =>
    "\\bSolo quienes son dignos pueden entrar a esta parte del Monte Auroreal. ¡Y vos no sos digno!",
  "\\bOnly those who are worthy can enter this part of Aurora Mountain. And you..." =>
    "\\bSolo quienes son dignos pueden entrar a esta parte del Monte Auroreal. Y vos...",
  "\\bWait, who are you? You seem different. But you´re just a kid. Interesting. I think I might let you prove your worth." =>
    "\\bEsperá, ¿quién sos? Parecés diferente. Pero sos solo un chico. Interesante. Creo que te voy a dejar demostrar tu valor.",
  "\\bNo one has had this opportunity before, so don´t waste it. Show me that you´re worthy!" =>
    "\\bNadie tuvo esta oportunidad antes, así que no la desperdicies. ¡Demostrame que sos digno!",
  "\\bYou might be worthy, but you have to convince the other elders as well. Go ahead." =>
    "\\bPuede que seas digno, pero también tenés que convencer a los otros ancianos. Adelante.",
  "Kyurem is staring into your soul." => "Kyurem te está mirando directo al alma.",
  "Name Rater" => "Evaluador de Nombres",
  "\\bI´m sorry, but you can´t use Thunder Pass right now. There´s been a massive landslide and we have to make sure that everything is save again." =>
    "\\bLo siento, pero no podés usar el Paso del Trueno ahora mismo. Hubo un derrumbe masivo y tenemos que asegurarnos de que todo esté seguro de nuevo.",
  "\\bIt´s a bit breezy, isn´t it?" => "\\bHay un poco de viento, ¿no?",
  "\\bHaha, no, I´m just joking." => "\\bJaja, no, es broma nomás.",
  "\\bI´M FREEZING MY BLOODY ASS OFF!!!" => "\\b¡ME ESTOY CONGELANDO EL MALDITO TRASERO!",
}

DICT_218 = {
  "\\bThis will be a heated battle, but I´m just a chill guy." =>
    "\\bVa a ser un combate acalorado, pero yo soy un tipo relajado nomás.",
  "\\bI think you have a chance against Wesley, because he´s just a chill guy." =>
    "\\bCreo que tenés una chance contra Wesley, porque es un tipo relajado nomás.",
  "\\bSo I was right. Chill guys like us just don´t stand a chance against trainers of your caliber." =>
    "\\bAsí que tenía razón. Los tipos relajados como nosotros no tenemos chance contra entrenadores de tu calibre.",
  "\\bI don´t feel like going all out, because I´m just a chill guy." =>
    "\\bNo tengo ganas de darlo todo, porque soy un tipo relajado nomás.",
  "\\bIn this Gym, no one goes all out. After all, we´re just chill guys." =>
    "\\bEn este Gimnasio, nadie da todo de sí. Al fin y al cabo, somos todos tipos relajados nomás.",
  "\\bChill guys like me could never be champion material like you." =>
    "\\bLos tipos relajados como yo nunca podríamos tener madera de Campeón como vos.",
  "\\bI´m just a chill guy that likes to battle." => "\\bSoy solo un tipo relajado al que le gusta combatir.",
  "\\bEveryone in this gym is really chill. We´re all just chill guys." =>
    "\\bTodos en este gimnasio son bien relajados. Somos todos tipos relajados nomás.",
  "\\bI should be impressed, but I´m just a chill guy." => "\\bDebería estar impresionado, pero soy un tipo relajado nomás.",
  "\\bWelcome to the Aurora Summit Gym. In this Gym, trainers use Normal-Type Pokémon, which are only weak to Fighting-Type attacks." =>
    "\\bBienvenido al Gimnasio de Cumbres Auroreales. En este Gimnasio, los entrenadores usan Pokémon de tipo Normal, que solo son débiles contra ataques de tipo Lucha.",
  "\\bAnd don´t you dare underestimate Wesley, the Gym Leader. He is recognized as the world´s strongest Normal-Type trainer. Good luck!" =>
    "\\bY ni se te ocurra subestimar a Wesley, el líder de gimnasio. Es reconocido como el entrenador de tipo Normal más fuerte del mundo. ¡Buena suerte!",
  "\\bOh, did Wesley hold back again? I thought you could make him go all out..." =>
    "\\bAh, ¿Wesley se guardó algo de nuevo? Pensé que ibas a lograr que diera todo...",
  "\\bI love battles, but I´m just a chill guy." => "\\bAmo los combates, pero soy un tipo relajado nomás.",
  "\\bIn case you haven´t noticed, we´re all just chill guys." =>
    "\\bPor si no te diste cuenta, somos todos tipos relajados nomás.",
  "\\bWesley is a chill guy like us, so he probably didn´t try very hard." =>
    "\\bWesley es un tipo relajado como nosotros, así que probablemente no se esforzó mucho.",
}

DICT_219 = {
  "\\bWesley: Oh, hello. My name is Wesley, and I´m Aurora Summit´s Gym Leader. For some reason a lot of people think that I´m really strong," =>
    "\\bWesley: Ah, hola. Me llamo Wesley, y soy el líder de gimnasio de Cumbres Auroreales. Por alguna razón mucha gente piensa que soy muy fuerte,",
  "\\bbut that´s not true. I´m just a chill guy that likes to battle sometimes. Don´t get your hopes up though, I never go all out." =>
    "\\bpero eso no es cierto. Soy solo un tipo relajado al que le gusta combatir de vez en cuando. Aunque no te ilusiones, nunca doy todo de mí.",
  "\\bEnough talking now, I feel like battling!" => "\\bBueno, basta de charla, ¡tengo ganas de combatir!",
  "\\me[Badge get]\\bThat almost made me break a sweat, impressive. Take the Standard Badge!\\wtnp[110]" =>
    "\\me[Badge get]\\bEso casi me hace sudar, impresionante. ¡Tomá la Medalla Estándar!\\wtnp[110]",
  "\\bNot only did you manage to beat me, but you also passed the vibe check. Please, take this as well." =>
    "\\bNo solo lograste ganarme, sino que además pasaste la prueba de onda. Por favor, tomá esto también.",
  "\\bWesley: This TM contains Giga Impact. It hits really hard, but your Pokémon has to recharge after using it. It´s the perfect move for chill guys." =>
    "\\bWesley: Esta MT contiene Culmen. Golpea muy fuerte, pero tu Pokémon tiene que recargarse después de usarlo. Es el movimiento perfecto para los tipos relajados.",
  "\\bYou´re just one badge away from completing the Gym Challenge. I suppose you´re headed for the final Gym now?" =>
    "\\bEstás a solo una medalla de completar el Desafío de Gimnasios. ¿Supongo que ahora vas rumbo al último Gimnasio?",
  "\\bOh, you need to get into Aurora Mountain, but some Team Rocket guy won´t let you through?" =>
    "\\bAh, ¿necesitás entrar al Monte Auroreal, pero un tipo del Team Rocket no te deja pasar?",
  "\\bI think I have a solution for your problem. There´s a second entrance into Aurora Mountain, but that one is always blocked by one of the four elders." =>
    "\\bCreo que tengo una solución para tu problema. Hay una segunda entrada al Monte Auroreal, pero esa siempre está bloqueada por uno de los cuatro ancianos.",
  "\\bThe four elders protect a certain treasure, and only those who they recognize as worthy are able to claim it. So far, they have let no one through." =>
    "\\bLos cuatro ancianos protegen cierto tesoro, y solo quienes ellos reconocen como dignos pueden reclamarlo. Hasta ahora, no dejaron pasar a nadie.",
  "\\bEven the Elite Four and the Champion weren´t allowed through. But maybe you´re worthy to them, it is worth a shot for sure!" =>
    "\\bNi siquiera al Alto Mando ni al Campeón los dejaron pasar. ¡Pero tal vez para ellos vos seas digno, seguro vale la pena intentarlo!",
  "\\bI should warn you though, because they will test whoever is worthy, and if they challenge you to a battle, they won´t hold back at all." =>
    "\\bAunque debería advertirte, porque van a poner a prueba a quien sea digno, y si te desafían a un combate, no se van a guardar nada.",
  "\\bI hope you can achieve your goal. Good luck, trainer!" => "\\bEspero que puedas lograr tu meta. ¡Buena suerte, entrenador!",
  "\\bWesley: One day I´ll stop holding back. But until that day comes, I´ll just be a chill guy that likes to battle sometimes." =>
    "\\bWesley: Algún día voy a dejar de guardarme cosas. Pero hasta que llegue ese día, voy a seguir siendo solo un tipo relajado al que le gusta combatir de vez en cuando.",
  "\\bWesley: Oh, it´s the new Champion. How´s it going?" => "\\bWesley: Ah, es el nuevo Campeón. ¿Cómo va todo?",
  "\\bAh, that´s good to hear. I´m still just a chill guy, so nothing new from my side. I take it you´re here for a rematch?" =>
    "\\bAh, qué bueno escuchar eso. Yo sigo siendo un tipo relajado nomás, así que nada nuevo de mi lado. Supongo que viniste por una revancha, ¿no?",
  "\\bOf course you are. Hm, I guess facing the Champion is a good reason to actually try for once. Let´s get this over with." =>
    "\\bClaro que sí. Mm, supongo que enfrentar al Campeón es una buena razón para esforzarme por una vez. Terminemos con esto.",
  "\\bWesley: I don´t even regret trying harder, because I´m just a chill guy after all." =>
    "\\bWesley: Ni siquiera me arrepiento de haberme esforzado más, porque al fin y al cabo soy un tipo relajado nomás.",
  "\\bWell, is there anything else?" => "\\bBueno, ¿hay algo más?",
  "\\bNo? Alright, then I guess all I can do is say goodbye." => "\\b¿No? Bueno, entonces supongo que solo me queda despedirme.",
  "\\bWesley: Now that I went all out, I have no reason to try that hard ever again. After all, I´m just a chill guy." =>
    "\\bWesley: Ahora que di todo de mí, no tengo razón para volver a esforzarme tanto nunca más. Al fin y al cabo, soy un tipo relajado nomás.",
}

DICT_220 = {
  "\\bAre my eyes deceiving me? Are you the worthy trainer that we have been waiting for?" =>
    "\\b¿Me engañan los ojos? ¿Sos el entrenador digno que estuvimos esperando?",
  "\\bI am the last obstacle between you and the treasure. This is the final test to see if you´re truly worthy. Time to battle!" =>
    "\\bSoy el último obstáculo entre vos y el tesoro. Esta es la última prueba para ver si de verdad sos digno. ¡Hora de combatir!",
  "\\bI am fully convinced now. You are worthy of claiming the treasure. Katsuro must have seen that you´re special." =>
    "\\bAhora estoy plenamente convencido. Sos digno de reclamar el tesoro. Katsuro debe haber visto que sos especial.",
  "\\bYou were the first trainer to even get this opportunity, and you made the best of it." =>
    "\\bFuiste el primer entrenador en siquiera tener esta oportunidad, y la aprovechaste al máximo.",
  "\\bPlease, go ahead and take the treasure. You have earned it." => "\\bPor favor, adelante, tomá el tesoro. Te lo ganaste.",
  "\\bWe don´t know what exactly the treasure is, but don´t worry, you won´t be disappointed." =>
    "\\bNo sabemos exactamente qué es el tesoro, pero no te preocupes, no vas a decepcionarte.",
  "\\bWhat? Katsuro let you through? A kid is supposed to be worthy enough to claim the treasure? Well, I trust Katsuro, so show me what you got!" =>
    "\\b¿Qué? ¿Katsuro te dejó pasar? ¿Se supone que un chico es lo bastante digno para reclamar el tesoro? Bueno, confío en Katsuro, ¡así que mostrame de qué estás hecho!",
  "\\bI am impressed. Defeating us elders might not be the most difficult thing for an experienced trainer, but the way that you battle is special." =>
    "\\bEstoy impresionado. Derrotarnos a los ancianos tal vez no sea lo más difícil para un entrenador experimentado, pero tu forma de combatir es especial.",
  "\\bI think I can let you through." => "\\bCreo que te puedo dejar pasar.",
  "\\bYou have what it takes to claim the treasure. Go ahead and convince the others." =>
    "\\bTenés lo necesario para reclamar el tesoro. Andá y convencé a los demás.",
  "\\bOh, welcome. We have waited a long time, and it looks like a worthy trainer might finally be upon us. Well then, convince me to let you through!" =>
    "\\bAh, bienvenido. Esperamos mucho tiempo, y parece que finalmente tenemos ante nosotros a un entrenador digno. Bueno entonces, ¡convencéme de dejarte pasar!",
  "\\bI can see why the others let you through. If you keep this up, then the treasure will be yours. You can go ahead." =>
    "\\bYa veo por qué los demás te dejaron pasar. Si seguís así, el tesoro va a ser tuyo. Podés seguir adelante.",
  "\\bYou need to prove your worth one last time, and then you´ve made it." =>
    "\\bNecesitás demostrar tu valor una última vez, y entonces lo habrás logrado.",
}

DICT_221 = {
  "There´s something hidden inside the stature." => "Hay algo escondido dentro de la estatua.",
  "You attached the Z-Power Ring to your bracelet." => "Fijaste el Anillo Z a tu brazalete.",
}

DICT_222 = {
  "A strange crystal is embedded into a socket. Do you want to take it?" =>
    "Un cristal extraño está incrustado en un receptáculo. ¿Querés tomarlo?",
  "\\bWait a minute, how did you get in here?! Well, the boss pays us to get rid of annoying folks like you, so I´m gonna remove you!" =>
    "\\bEsperá un momento, ¿¡cómo entraste acá!? Bueno, el jefe nos paga para deshacernos de gente molesta como vos, ¡así que te voy a sacar de encima!",
  "\\bGood thing I already got this month´s pay check." => "\\bMenos mal que ya cobré el sueldo de este mes.",
}

DICT_223 = {
  "\\bOh no, you´re not gonna stop us!" => "\\bAh no, ¡no nos vas a detener!",
  "\\bThis changes nothing. Soon, the boss will rule over everyone!" =>
    "\\bEsto no cambia nada. ¡Pronto, el jefe va a gobernar sobre todos!",
  "\\bTurn around, or this will get ugly!" => "\\bDate la vuelta, ¡o esto se va a poner feo!",
  "\\bFine. Go ahead. But you will regret it!" => "\\bBueno. Adelante. ¡Pero te vas a arrepentir!",
  "\\bGet lost!" => "\\b¡Rajá!",
  "\\bI disappointed the boss..." => "\\bDecepcioné al jefe...",
  "\\bWrong place wrong time, kid!" => "\\b¡Lugar y momento equivocados, chico!",
  "\\bI´m serious, nothing will happen to you if you turn around now. But if you go ahead, then you´re gonna be in trouble." =>
    "\\bHablo en serio, no te va a pasar nada si te das la vuelta ahora. Pero si seguís adelante, te vas a meter en problemas.",
  "\\bWhat? You already want to leave? Come on, the party hasn´t even started!" =>
    "\\b¿Qué? ¿Ya te querés ir? Dale, ¡la fiesta ni siquiera empezó!",
  "\\bI won´t stop you if you use an Escape Rope, but you´re not taking the normal exit!" =>
    "\\bNo te voy a detener si usás una Cuerda Fuga, ¡pero no vas a salir por la salida normal!",
  "\\bThe boss said that we´re all getting fired if someone gets to him. And I need the money!" =>
    "\\bEl jefe dijo que a todos nos van a echar si alguien llega hasta él. ¡Y yo necesito el dinero!",
  "\\bThe boss will succeed with his plan. And then I won´t need to worry about money ever again!" =>
    "\\bEl jefe va a tener éxito con su plan. ¡Y entonces nunca más voy a tener que preocuparme por el dinero!",
}

DICT_224 = {
  "Kyurem looks angry. It wants to fight!" => "Kyurem se ve enojado. ¡Quiere pelear!",
  "\\bKYUUU!!!" => "\\b¡KYUUU!!!",
  "Kyurem took a step back. It has already recharged!" => "Kyurem retrocedió un paso. ¡Ya se recargó!",
  "\\bGiovanni: Wait..." => "\\bGiovanni: Esperá...",
  "\\bGiovanni: What the ****?!" => "\\bGiovanni: ¿¡Qué ****!?",
  "\\bWHAT THE ACTUAL ****?!" => "\\b¿¡QUÉ ****, EN SERIO!?",
  "\\bYOU TRULY ARE THE MOST ANNOYING PERSON THAT I HAVE EVER MET. I WILL MAKE YOU REGRET COMING HERE." =>
    "\\bDE VERDAD SOS LA PERSONA MÁS MOLESTA QUE CONOCÍ EN MI VIDA. TE VOY A HACER ARREPENTIRTE DE HABER VENIDO ACÁ.",
  "\\bOh, but wait a minute..." => "\\bAh, pero esperá un momento...",
  "\\bHaha, I never actually told you what my plan is! You´re trying to stop me and you don´t even know why?!" =>
    "\\bJaja, ¡nunca te dije en realidad cuál es mi plan! ¿¡Estás tratando de detenerme y ni siquiera sabés por qué!?",
  "\\bYou sure are one annoying brat. But don´t worry, I´ll explain what I have in mind." =>
    "\\bSí que sos un mocoso molesto. Pero no te preocupes, te voy a explicar lo que tengo en mente.",
  "\\bMy life was anything but easy. I´ve been kicked down countless times, and I got very close to losing my will to live." =>
    "\\bMi vida no fue nada fácil. Me derribaron incontables veces, y estuve muy cerca de perder las ganas de vivir.",
  "\\bBut not anymore! I´ve made it in life, and I will show the world how strong I am!" =>
    "\\b¡Pero ya no más! Triunfé en la vida, ¡y le voy a mostrar al mundo lo fuerte que soy!",
  "\\bWith the power of Kyurem, I will overthrow the government of the Delta Region!" =>
    "\\b¡Con el poder de Kyurem, voy a derrocar al gobierno de la Región Delta!",
  "\\bThose who deserve it will be punished, and only those who obey will prevail!" =>
    "\\b¡Quienes lo merezcan serán castigados, y solo quienes obedezcan van a prevalecer!",
  "\\bEvery person you love will suffer the same pain that I went through, and there is nothing you can do!" =>
    "\\b¡Cada persona que amás va a sufrir el mismo dolor que yo sufrí, y no hay nada que puedas hacer!",
  "\\bIt is time. Kyurem will be mine!" => "\\bLlegó el momento. ¡Kyurem va a ser mío!",
  "\\bGiovanni: Keldeo, lend me your power!" => "\\bGiovanni: ¡Keldeo, prestame tu poder!",
  "\\bAh, the mighty Resolute Form." => "\\bAh, la poderosa Forma Resoluta.",
  "\\bWhen I caught Keldeo, it had forgotten it´s most important move, Secret Sword. That´s why we didn´t see its true form in the Sword Ruins." =>
    "\\bCuando atrapé a Keldeo, había olvidado su movimiento más importante, Espada Santa. Por eso no vimos su verdadera forma en las Ruinas de la Espada.",
  "\\bI made Keldeo remember the move, which caused it to return to it´s true form, the Resolute Form." =>
    "\\bHice que Keldeo recordara el movimiento, lo que provocó que volviera a su verdadera forma, la Forma Resoluta.",
  "\\bNow it´s capable of breaking the ice that seals Kyurem. Watch this!" =>
    "\\bAhora es capaz de romper el hielo que sella a Kyurem. ¡Mirá esto!",
  "\\bKeldeo, use Secret Sword!" => "\\b¡Keldeo, usa Espada Santa!",
  "\\bGiovanni: What?! That´s all?! You´re the one that sealed Kyurem, it shouldn´t be that hard to unseal it!" =>
    "\\bGiovanni: ¿¡Qué!? ¿¡Eso es todo!? ¡Vos fuiste quien selló a Kyurem, no debería ser tan difícil desellarlo!",
  "\\bGiovanni: Oh, I see. The rest is up to Kyurem then." => "\\bGiovanni: Ah, ya veo. Entonces el resto depende de Kyurem.",
  "\\bKYUUUUU!!!" => "\\b¡KYUUUUU!!!",
  "\\bGiovanni: Finally, the mighty Kyurem has returned! It slept for 100 years, and now it can unleash it´s unmatched power once more!" =>
    "\\bGiovanni: ¡Finalmente, el poderoso Kyurem ha regresado! Durmió durante 100 años, ¡y ahora puede desatar su poder incomparable una vez más!",
  "\\bI suppose you´re not gonna obey me?" => "\\b¿Supongo que no me vas a obedecer?",
  "\\bYeah, I expected that." => "\\bSí, ya me lo esperaba.",
  "\\bYOU`LL BE THE FIRST TO SUFFER!" => "\\b¡VAS A SER EL PRIMERO EN SUFRIR!",
  "\\bKeldeo, keep Kyurem at bay until I´m done with this brat!" =>
    "\\b¡Keldeo, mantené a raya a Kyurem hasta que termine con este mocoso!",
  "\\bGiovanni: So, \\PN, any last words?" => "\\bGiovanni: Bueno, \\PN, ¿últimas palabras?",
  "\\bTHIS IS THE END!" => "\\b¡ESTO ES EL FIN!",
  "\\bGiovanni: Hm, not bad." => "\\bGiovanni: Mm, nada mal.",
  "\\bBut your struggle is meaningless. I´m not gonna give up just because I lost a Pokémon Battle. Who the **** do you think I am?!" =>
    "\\bPero tu esfuerzo no significa nada. No me voy a rendir solo porque perdí un combate Pokémon. ¿¡Quién **** te pensás que soy!?",
  "\\bKeldeo, use Secret Sword and finish this brat!" => "\\b¡Keldeo, usa Espada Santa y terminá con este mocoso!",
  "\\bGiovanni: Ouch..." => "\\bGiovanni: Ay...",
  "\\bUNACCEPTABLE. A POKÈMON CANNOT ATTACK ITS TRAINER. I AM DONE. I AM SO DONE WITH THIS ****!" =>
    "\\bINACEPTABLE. UN POKÉMON NO PUEDE ATACAR A SU ENTRENADOR. SE ACABÓ. ¡ESTOY MÁS QUE HARTO DE ESTA ****!",
  "\\bI´M GONNA END THIS REGION. I DON`T GIVE TWO ***** ABOUT TEAM ROCKET OR ANYONE ELSE!" =>
    "\\b¡VOY A ACABAR CON ESTA REGIÓN! ¡ME IMPORTA UNA ***** EL TEAM ROCKET O CUALQUIER OTRO!",
  "\\bGiovanni: KYUREM, YOU´RE MINE!" => "\\bGiovanni: ¡KYUREM, SOS MÍO!",
  "\\bGiovanni: Soon, the world as you know it will be gone. And it´s all your fault, because you didn´t obey me!" =>
    "\\bGiovanni: Pronto, el mundo tal como lo conocés va a desaparecer. Y es toda tu culpa, ¡porque no me obedeciste!",
  "\\bGiovanni: Kyurem, freeze this damn brat!" => "\\bGiovanni: ¡Kyurem, congelá a este maldito mocoso!",
  "\\bGiovanni: What?! It protected you?! KYUREM, FREEZE KELDEO!" =>
    "\\bGiovanni: ¿¡Qué!? ¿¡Te protegió!? ¡KYUREM, CONGELÁ A KELDEO!",
  "\\bGiovanni: Good luck saving Keldeo. Even if you manage to melt that ice, you won´t be able to stop Kyurem!" =>
    "\\bGiovanni: Buena suerte salvando a Keldeo. Aunque logres derretir ese hielo, ¡no vas a poder detener a Kyurem!",
  "\\bIf I killed you right here, it would be meaningless. Before I freeze this region, I will have one more battle with you." =>
    "\\bSi te matara acá mismo, no significaría nada. Antes de congelar esta región, voy a tener un último combate con vos.",
  "\\bCome back, Kyurem. We´ll wait for \\PN in Aurora Summit." =>
    "\\bVolvé, Kyurem. Vamos a esperar a \\PN en Cumbres Auroreales.",
  "Keldeo is frozen solid." => "Keldeo quedó completamente congelado.",
  "The Delta Stone in your pocket just moved! The ice cracked!" =>
    "¡La Piedra Delta en tu bolsillo se acaba de mover! ¡El hielo se agrietó!",
  "Keldeo seems confused." => "Keldeo parece confundido.",
  "\\bKEEEELLLL!!!" => "\\b¡KEEEELLLL!!!",
  "Keldeo shook its head." => "Keldeo sacudió la cabeza.",
  "Something is happening on the outside!" => "¡Algo está pasando afuera!",
}

DICT_270 = {
  "\\bThe cold mountain air is quite refreshing, isn´t it? I think it is, that´s why I live in Aurora Summit. It´s a charming little town, isn´t it?" =>
    "\\bEl aire frío de la montaña es bastante refrescante, ¿no? Yo creo que sí, por eso vivo en Cumbres Auroreales. Es un pueblito encantador, ¿no?",
  "\\bBut what brings you here?" => "\\b¿Pero qué te trae por acá?",
  "\\bOh, how exciting. Wesley always acts like he´s a weak trainer, but he is one of the strongest trainers in the region." =>
    "\\bAh, qué emocionante. Wesley siempre actúa como si fuera un entrenador débil, pero es uno de los entrenadores más fuertes de la región.",
  "\\bAh, the icon of our town. I personally don´t like that place, it´s slippery and dangerous. There´s some rare Pokémon in there though, so that´s cool I guess." =>
    "\\bAh, el ícono de nuestro pueblo. A mí personalmente no me gusta ese lugar, es resbaladizo y peligroso. Aunque hay algunos Pokémon raros ahí adentro, así que supongo que está bueno.",
  "\\bKeldeo? Never heard of that. Whatever it might be, it´s not in this town." =>
    "\\b¿Keldeo? Nunca escuché eso. Sea lo que sea, no está en este pueblo.",
  "\\bYou´re here for a reason, that´s for sure. How about a little gift? You seem quite busy, and I happen to have a Pokémon that might help you." =>
    "\\bViniste por una razón, eso seguro. ¿Qué tal un pequeño regalo? Parecés bastante ocupado, y resulta que tengo un Pokémon que tal vez te ayude.",
  "\\bI should warn you though, this little bugger keeps on biting me, so you should teach it some manners. Here you go." =>
    "\\bAunque debería advertirte, este pequeño sinvergüenza no para de morderme, así que deberías enseñarle modales. Tomá.",
  "\\bOne of my relatives from Sinnoh brought this Turtwig here, and it found a liking to this region, so I decided to take care of it." =>
    "\\bUn pariente mío de Sinnoh trajo a este Turtwig acá, y le tomó cariño a esta región, así que decidí cuidarlo.",
  "\\bBut in the past few weeks the cold has been getting to this poor thing, so it´s more responsible to give it to a trainer that gets around." =>
    "\\bPero en las últimas semanas el frío le empezó a afectar al pobrecito, así que es más responsable dárselo a un entrenador que se mueve por ahí.",
  "\\bGood luck on your journey!" => "\\b¡Buena suerte en tu viaje!",
  "There's no more room for Pokémon!" => "¡No hay más espacio para Pokémon!",
  "The Pokémon Boxes are full and can't accept any more!" =>
    "¡Las cajas de Pokémon están llenas y no pueden recibir más!",
  "\\bI should visit my relatives in Sinnoh. I heard the mountain air over there is even better than it is here." =>
    "\\bDebería visitar a mis parientes en Sinnoh. Escuché que el aire de montaña allá es incluso mejor que acá.",
  "\\bOnce you get used to the blizzards, Aurora Summit is the perfect place to live." =>
    "\\bUna vez que te acostumbrás a las ventiscas, Cumbres Auroreales es el lugar perfecto para vivir.",
}

CHOICES_270 = {
  "The Gym Challenge|Aurora Mountain|Keldeo" => "El Desafío de Gimnasios|El Monte Auroreal|Keldeo",
}

DICT_280 = {
  "It´s a Pokémon Statue dedicated to Articuno." => "Es una estatua Pokémon dedicada a Articuno.",
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo acaba de brillar!",
  "Something powerful is approaching!" => "¡Algo poderoso se aproxima!",
  "\\bCUNOOOOO!!!" => "\\b¡CUNOOOOO!!!",
  "Articuno disappeared. Will it come back?" => "Articuno desapareció. ¿Volverá?",
}

DICT_286 = {
  "It´s a large stature resembling a Pokémon." => "Es una gran estatua que se asemeja a un Pokémon.",
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo acaba de brillar!",
  "The stature is coming to life!" => "¡La estatua está cobrando vida!",
  "\\bREGIIICEEE!!!" => "\\b¡REGIIICEEE!!!",
  "Regice went back into a deep slumber. Will it wake up again?" =>
    "Regice volvió a caer en un sueño profundo. ¿Despertará de nuevo?",
}

DICT_309 = {
  "\\bI got nothing to play..." => "\\bNo tengo nada para jugar...",
  "\\bI got nothing to wear..." => "\\bNo tengo nada para ponerme...",
}

DICT_310 = {
  "\\bI'm the Pokémon Move Maniac." => "\\bSoy el Profesor de Movimientos Pokémon.",
  "\\bI know every single move that Pokémon learn growing up." =>
    "\\bConozco todos y cada uno de los movimientos que los Pokémon aprenden al crecer.",
  "\\bI'm also a collector of Heart Scales." => "\\bTambién soy coleccionista de Escamas Corazón.",
  "\\bIf you bring me one, I'll teach a move to one of your Pokémon." =>
    "\\bSi me traés una, le voy a enseñar un movimiento a uno de tus Pokémon.",
  "\\bOh! That's it! That's a very pretty Heart Scale!" => "\\b¡Ah! ¡Eso es! ¡Es una Escama Corazón muy linda!",
  "\\bLet me guess, you want me to teach one of your Pokémon a move?" =>
    "\\bDejame adivinar, ¿querés que le enseñe un movimiento a uno de tus Pokémon?",
  "\\bWhich Pokémon needs tutoring?" => "\\b¿Qué Pokémon necesita clases?",
  "\\bIf your Pokémon need to learn a move, come back with a Heart Scale." =>
    "\\bSi tu Pokémon necesita aprender un movimiento, volvé con una Escama Corazón.",
  "\\bHunh? There isn't a single move that I can teach an Egg." =>
    "\\b¿Eh? No hay ni un solo movimiento que le pueda enseñar a un Huevo.",
  "\\bNo way, I don't want to go near a Shadow Pokémon." => "\\bNi loco, no me quiero acercar a un Pokémon Sombra.",
  "\\bSorry..." => "\\bPerdón...",
  "\\bIt doesn't appear as if I have any move I can teach to your \\v[3]." =>
    "\\bParece que no tengo ningún movimiento que le pueda enseñar a tu \\v[3].",
  "\\bWhich move should I teach to your \\v[3]?" => "\\b¿Qué movimiento le debería enseñar a tu \\v[3]?",
  "\\PN handed over one Heart Scale in exchange." => "\\PN entregó una Escama Corazón a cambio.",
  "\\bMy brother is awesome! He knows every single Pokémon move, and he can help your Pokémon remember it´s moves." =>
    "\\bMi hermano es increíble! Conoce todos y cada uno de los movimientos Pokémon, y puede ayudar a tu Pokémon a recordar sus movimientos.",
}

DICT_311 = {
  "\\bHello, hello!\\nI am the official Name Rater!" => "\\b¡Hola, hola!\\nSoy el Evaluador de Nombres oficial.",
  "\\bWant me to rate the nicknames of your Pokémon?" => "\\b¿Querés que evalúe los apodos de tus Pokémon?",
  "\\bWhich Pokémon's nickname should I critique?" => "\\b¿El apodo de qué Pokémon debería criticar?",
  "\\bI see.\\nDo come visit again." => "\\bYa veo.\\nVolvé a visitarme.",
  "\\bNow, now... That is merely an Egg!" => "\\bVamos, vamos... ¡Eso es apenas un Huevo!",
  "\\bI wouldn't dare critique a Shadow Pokémon's name!" =>
    "\\b¡No me atrevería a criticar el nombre de un Pokémon Sombra!",
  "\\bHmmm... \\v[3] it is!" => "\\bMmm... ¡\\v[3] es!",
  "\\bThis is a magnificent nickname! It is impeccably beyond reproach!" =>
    "\\b¡Este es un apodo magnífico! ¡Es impecablemente irreprochable!",
  "\\bYou'll do well to cherish your \\v[3] now and beyond." =>
    "\\bHarás bien en apreciar a tu \\v[3] ahora y siempre.",
  "\\b\\v[3], is it?\\nThat is a decent nickname!" => "\\b¿\\v[3], eh?\\n¡Es un apodo decente!",
  "\\bBut, would you like me to give it a nicer name?" => "\\bPero, ¿querés que le dé un nombre más lindo?",
  "\\bHow about it?" => "\\b¿Qué decís?",
  "\\bAh, good. Then, what shall the new nickname be?" => "\\bAh, bien. Entonces, ¿cuál será el nuevo apodo?",
  "\\bI see. You're right, there's no need to change this Pokémon's nickname." =>
    "\\bYa veo. Tenés razón, no hace falta cambiar el apodo de este Pokémon.",
  "\\bIt already had a superb name!" => "\\b¡Ya tenía un nombre soberbio!",
  "\\bDone! From now on, this Pokémon shall be knownas \\v[3]!" =>
    "\\b¡Listo! ¡De ahora en más, este Pokémon será conocido como \\v[3]!",
  "\\bIt looks no different from before, and yet, this is vastly superior!" =>
    "\\bSe ve igual que antes, y sin embargo, ¡esto es muchísimo mejor!",
  "\\bHow fortunate for you!" => "\\b¡Qué afortunado sos!",
  "\\bDone! From now on, this Pokémon shall be knownas \\v[5]!" =>
    "\\b¡Listo! ¡De ahora en más, este Pokémon será conocido como \\v[5]!",
  "\\bIt is a better name than before!\\nHow fortunate for you!" =>
    "\\b¡Es un nombre mejor que el anterior!\\n¡Qué afortunado sos!",
  "\\bMy gramps is the only Name Rater in the entire region. It´s an honor to meet him!" =>
    "\\bMi abuelo es el único Evaluador de Nombres de toda la región. ¡Es un honor conocerlo!",
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

apply("Data/Map215.rxdata", DICT_215)
apply("Data/Map218.rxdata", DICT_218)
apply("Data/Map219.rxdata", DICT_219)
apply("Data/Map220.rxdata", DICT_220)
apply("Data/Map221.rxdata", DICT_221)
apply("Data/Map222.rxdata", DICT_222)
apply("Data/Map223.rxdata", DICT_223)
apply("Data/Map224.rxdata", DICT_224)
apply("Data/Map270.rxdata", DICT_270, CHOICES_270)
apply("Data/Map280.rxdata", DICT_280)
apply("Data/Map286.rxdata", DICT_286)
apply("Data/Map309.rxdata", DICT_309)
apply("Data/Map310.rxdata", DICT_310)
apply("Data/Map311.rxdata", DICT_311)
