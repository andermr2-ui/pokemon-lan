# encoding: UTF-8
require_relative "rpg_stubs"

DICT_195 = {
  "\\bGary: Congratulations, \\PN. I know how it feels to battle against you, and those trainers really gave it their all, but you crushed them all!" =>
    "\\bGary: Felicitaciones, \\PN. Sé lo que se siente combatir contra vos, y esos entrenadores realmente dieron todo, ¡pero los aplastaste a todos!",
  "\\bBut let me keep this short: After our battle, I called my old rival, Ash Ketchum. Yup, the former World Champion." =>
    "\\bPero seré breve: después de nuestro combate, llamé a mi viejo rival, Ash Ketchum. Sí, el ex Campeón Mundial.",
  "\\bI told him about you, and I think he was interested." => "\\bLe hablé de vos, y creo que le interesó.",
  "\\bAt the end of our call, he simply said: \"Should \\PN manage to become World Champion, then I´ll come out of retirement.\"" =>
    "\\bAl final de la llamada, simplemente dijo: \"Si \\PN logra convertirse en Campeón Mundial, entonces saldré del retiro\".",
  "\\bAnd guess what, the second you took down Zeke´s last Pokémon, he called me. He´s waiting for you on Route 1." =>
    "\\bY adivina qué, en el segundo en que derribaste al último Pokémon de Xarly, me llamó. Te está esperando en la Ruta 1.",
  "\\bI should warn you though, Ash isn´t like the other trainers you´ve battled so far. He´s different. So don´t challenge him unprepared. Good luck!" =>
    "\\bAunque debería advertirte, Ash no es como los demás entrenadores contra los que combatiste hasta ahora. Es diferente. Así que no lo desafíes sin estar preparado. ¡Buena suerte!",
  "\\bGary: I should visit Gramps again, I want to see how he´s doing." =>
    "\\bGary: Debería visitar al abuelo de nuevo, quiero ver cómo está.",
  "\\bZeke: Here we are. I´m off to sign up for the tournament. And you better make it to the final round!" =>
    "\\bXarly: Bueno, llegamos. Me voy a anotar para el torneo. ¡Y más te vale llegar a la ronda final!",
  "\\bI wish I could afford a ticket to a tournament. Did you know Cynthia, the Sinnoh Champion, actually had a battle in this stadium 5 years ago?" =>
    "\\bOjalá pudiera pagar una entrada a un torneo. ¿Sabías que Cynthia, la Campeona de Sinnoh, tuvo un combate en este estadio hace 5 años?",
  "\\bI watched that on TV, and she smoked her opponent!" => "\\bLo vi por televisión, ¡y aplastó a su rival!",
  "\\bIf I train hard enough, I might be able to participate in a tournament one day. That´d be the coolest thing ever!" =>
    "\\bSi entreno lo suficiente, tal vez algún día pueda participar en un torneo. ¡Eso sería lo más genial del mundo!",
}

DICT_196 = {
  "\\bThe preparations for the upcoming Challengers Tournament are running. Soon, Delta´s strongest trainers will battle each other." =>
    "\\bLos preparativos para el próximo Torneo de Aspirantes están en marcha. Pronto, los entrenadores más fuertes de Delta combatirán entre sí.",
  "\\bOh, so you want to participate? Well, have you completed the Gym Challenge yet?" =>
    "\\bAh, ¿así que querés participar? Bueno, ¿ya completaste el Desafío de Gimnasios?",
  "\\bOh, you haven´t? That´s a problem. Only those who claimed all 8 badges can sign up for the tournament." =>
    "\\bAh, ¿todavía no? Eso es un problema. Solo quienes consiguieron las 8 medallas pueden inscribirse en el torneo.",
  "\\bHowever, you still have time to complete the challenge, as we haven´t fully prepared everything." =>
    "\\bSin embargo, todavía tenés tiempo para completar el desafío, ya que no terminamos de prepararlo todo.",
  "\\bWelcome to Riverstone Stadium. The preparations for the Challengers Tournament are complete, but there´s room for one more trainer." =>
    "\\bBienvenido al Estadio Río el Último. Los preparativos para el Torneo de Aspirantes están completos, pero hay lugar para un entrenador más.",
  "\\bDid you manage to complete the Gym Challenge?" => "\\b¿Lograste completar el Desafío de Gimnasios?",
  "\\bYou did?! Fantastic! Then you can sign up right now." => "\\b¿¡En serio!? ¡Fantástico! Entonces podés inscribirte ahora mismo.",
  "\\bSo you´re \\PN from Starter Valley, and you´re 10 years old? Alright, then you´re signed up!" =>
    "\\bAsí que sos \\PN, del Valle del Rocío, y tenés 10 años. Bueno, ¡entonces ya estás inscripto!",
  "\\bThe tournament can begin!" => "\\b¡El torneo puede comenzar!",
  "ATTENTION ALL TRAINERS AND VISITORS!" => "¡ATENCIÓN A TODOS LOS ENTRENADORES Y VISITANTES!",
  "THE SECOND EVER CHALLENGERS TOURNAMENT IS ABOUT TO BEGIN." => "EL SEGUNDO TORNEO DE ASPIRANTES DE LA HISTORIA ESTÁ A PUNTO DE COMENZAR.",
  "VISITORS, PLEASE HEAD TO THE SPECTATORS AREA NOW." => "VISITANTES, POR FAVOR DIRÍJANSE AL ÁREA DE ESPECTADORES AHORA.",
  "8 TRAINERS HAVE ENTERED THE TOURNAMENT." => "8 ENTRENADORES SE HAN INSCRITO EN EL TORNEO.",
  "THESE WILL BE THE FIRST BATTLES:" => "ESTOS SERÁN LOS PRIMEROS COMBATES:",
  "\\PN vs Alessio" => "\\PN vs. Alessio",
  "Freya vs Kaito" => "Freya vs. Kaito",
  "Enzo vs Zeke" => "Enzo vs. Xarly",
  "Lucien vs Sofia" => "Lucien vs. Sofía",
  "THE FIRST BATTLE CAN BEGIN. TRAINERS, HEAD TO THE GATES." => "EL PRIMER COMBATE PUEDE COMENZAR. ENTRENADORES, DIRÍJANSE A LAS PUERTAS.",
  "\\bGood luck, trainer. This tournament will bring you to your limit!" =>
    "\\bBuena suerte, entrenador. ¡Este torneo te va a llevar al límite!",
  "\\bCongratulations! You ´ve made it to the semi-finals!" => "\\b¡Felicitaciones! ¡Llegaste a las semifinales!",
  "THE FIRST ROUND OF BATTLES IS OVER." => "LA PRIMERA RONDA DE COMBATES TERMINÓ.",
  "THE WINNERS ARE:" => "LOS GANADORES SON:",
  "\\PN" => "\\PN",
  "Freya" => "Freya",
  "Zeke" => "Xarly",
  "Lucien" => "Lucien",
  "IT´S TIME FOR THE SEMI-FINALS. THESE ARE THE NEXT BATTLES:" => "ES HORA DE LAS SEMIFINALES. ESTOS SON LOS PRÓXIMOS COMBATES:",
  "\\PN vs Freya" => "\\PN vs. Freya",
  "Zeke vs Lucien" => "Xarly vs. Lucien",
  "TRAINERS, GO TO THE GATES. THE SEMI-FINALS BEGIN NOW!" => "ENTRENADORES, VAYAN A LAS PUERTAS. ¡LAS SEMIFINALES COMIENZAN AHORA!",
  "\\bNow there´s just 4 trainers left. Give it your all!" => "\\bAhora solo quedan 4 entrenadores. ¡Dalo todo!",
  "\\bWow, you´ve made it to the final round!" => "\\b¡Guau, llegaste a la ronda final!",
  "THE SEMI-FINALS ARE OVER." => "LAS SEMIFINALES TERMINARON.",
  "IT´S TIME FOR THE FINAL ROUND. THIS WILL BE THE LAST BATTLE:" => "ES HORA DE LA RONDA FINAL. ESTE SERÁ EL ÚLTIMO COMBATE:",
  "\\PN vs Zeke" => "\\PN vs. Xarly",
  "TRAINERS, GO TO THE GATES. THE FINAL ROUND BEGINS NOW!" => "ENTRENADORES, VAYAN A LAS PUERTAS. ¡LA RONDA FINAL COMIENZA AHORA!",
  "\\bYou´re one battle away from winning the Challengers Tournament. You can do it!" =>
    "\\bEstás a un combate de ganar el Torneo de Aspirantes. ¡Vos podés!",
  "\\bCongratulations, \\PN. You just won the second ever Challengers Tournament. Please, take your prize." =>
    "\\bFelicitaciones, \\PN. Acabás de ganar el segundo Torneo de Aspirantes de la historia. Por favor, tomá tu premio.",
  "\\bWe´ll host other tournaments in the future. We´d be honored to have you participate again." =>
    "\\bVamos a organizar más torneos en el futuro. Sería un honor que participaras de nuevo.",
  "\\bAh, welcome back, \\PN. Let me get straight to the point. You might´ve heard that Riverstone Stadium will host the next World Championship Tournament." =>
    "\\bAh, bienvenido de nuevo, \\PN. Voy directo al grano. Puede que hayas oído que el Estadio Río el Último va a albergar el próximo Torneo del Campeonato Mundial.",
  "\\bThis event is unlike anything else in the world. The battles in this tournament will be outstanding!" =>
    "\\bEste evento no se parece a nada más en el mundo. ¡Los combates de este torneo van a ser sobresalientes!",
  "\\bAs the local Champion, you are allowed to participate in the tournament." =>
    "\\bComo Campeón local, tenés permitido participar en el torneo.",
  "\\bHm, of course that doesn´t surprise you. Who else but you would be allowed to represent the Delta Region?" =>
    "\\bMm, claro que eso no te sorprende. ¿Quién más sino vos podría representar a la Región Delta?",
  "\\bThis isn´t the reason why I wanted to see you though. There´s a tradition that the local Champion of the tournament personally invites the other trainers." =>
    "\\bPero esta no es la razón por la que quería verte. Existe una tradición según la cual el Campeón local del torneo invita personalmente a los demás entrenadores.",
  "\\bDon´t worry, you don´t have to travel the world to do so, it´s much easier than that." =>
    "\\bNo te preocupes, no tenés que viajar por el mundo para hacerlo, es mucho más fácil que eso.",
  "\\bAll of the trainers that´ll participate in the tournament have to be a region´s Champion, which makes the selection quite straight forward." =>
    "\\bTodos los entrenadores que participarán en el torneo tienen que ser el Campeón de una región, lo que hace que la selección sea bastante sencilla.",
  "\\bAs there´re are more Champions than slots in the tournament, we can´t just invite all of them, so we had to choose the ones we wanted to invite." =>
    "\\bComo hay más Campeones que cupos en el torneo, no podemos invitarlos a todos, así que tuvimos que elegir a quiénes queríamos invitar.",
  "\\bI need you to sign the invitations for a few Champions that live far away, but some are actually visiting the Delta Region right now." =>
    "\\bNecesito que firmes las invitaciones de algunos Campeones que viven lejos, pero algunos en realidad están visitando la Región Delta ahora mismo.",
  "\\bSteven, the current Champion of Hoenn, and Cynthia, the current Champion of Sinnoh, are on vacation in the Champions Village." =>
    "\\bSteven, el actual Campeón de Hoenn, y Cynthia, la actual Campeona de Sinnoh, están de vacaciones en la Villa Deliciosa.",
  "\\bThe Champion Village is a town which only Champions and other important people can enter. It´s located on the Delta Islands." =>
    "\\bLa Villa Deliciosa es un pueblo al que solo pueden entrar Campeones y otras personas importantes. Está ubicada en las Islas Delta.",
  "\\bIf you could head over there and personally invite them to the tournament, that´d be great." =>
    "\\bSi pudieras ir hasta allá e invitarlos personalmente al torneo, sería genial.",
  "\\bBut now I´d like you to sign the invitation letters for the other Champions." =>
    "\\bPero ahora quiero que firmes las cartas de invitación de los otros Campeones.",
  "\\bFirst up, we have the invitation for Lance, the current Champion of the Indigo League. Sign right there." =>
    "\\bPrimero, tenemos la invitación para Lance, el actual Campeón de la Liga Añil. Firmá justo ahí.",
  "\\bNext up, we have the invitation for Iris, the current Champion of the Unova League. Sign right there again." =>
    "\\bLuego, tenemos la invitación para Iris, la actual Campeona de la Liga Unova. Firmá ahí de nuevo.",
  "\\bThis one is for Diantha, the current Champion of the Kalos League. You know what to do." =>
    "\\bEsta es para Diantha, la actual Campeona de la Liga Kalos. Ya sabés qué hacer.",
  "\\bThis invitation is for Leon, the current Champion of the Galar League. Yup, right there again." =>
    "\\bEsta invitación es para Leon, el actual Campeón de la Liga Galar. Sí, ahí de nuevo.",
  "\\bIf we count Steven, Cynthia and you on top of the invitations, we´d have 7 participants." =>
    "\\bSi contamos a Steven, Cynthia y a vos además de las invitaciones, tendríamos 7 participantes.",
  "\\bHm, but who will be number 8?" => "\\bMm, ¿pero quién será el número 8?",
  "\\bThe obvious choice would´ve been Ash Ketchum, the current World Champion and the Champion of the Alola League, but he retired after claiming those titles." =>
    "\\bLa elección obvia habría sido Ash Ketchum, el actual Campeón Mundial y Campeón de la Liga Alola, pero se retiró después de conseguir esos títulos.",
  "\\bAnother option would be Geeta, but unlike the other Champions her position in the Paldea League is a bit different, so we´re not too sure about that." =>
    "\\bOtra opción sería Geeta, pero a diferencia de los otros Campeones, su posición en la Liga Paldea es un poco distinta, así que no estamos muy seguros de eso.",
  "\\bThere´s still some time until the tournament, so we´ll find a fitting trainer eventually." =>
    "\\bTodavía queda algo de tiempo hasta el torneo, así que eventualmente encontraremos a un entrenador adecuado.",
  "\\bThanks for helping us out, Champion!" => "\\b¡Gracias por ayudarnos, Campeón!",
  "\\bYou can get to the Delta Islands by ship. Just go to Crystal Harbor and you´ll find a good option to get there." =>
    "\\bPodés llegar a las Islas Delta en barco. Solo andá al Puerto del Cristal y ahí vas a encontrar una buena opción para llegar.",
  "\\bI have excellent news. We are ready for the World Championship Tournament. We found 8 Champions who are eager to win, so it´s time to begin." =>
    "\\bTengo excelentes noticias. Estamos listos para el Torneo del Campeonato Mundial. Encontramos a 8 Campeones ansiosos por ganar, así que es hora de empezar.",
  "\\bThe opening matches between the Gym Leaders are almost over, so you should get ready." =>
    "\\bLos combates de apertura entre los líderes de gimnasio ya casi terminan, así que deberías prepararte.",
  "DEAR GUESTS, DEAR TRAINERS, DEAR CHAMPIONS!!!" => "¡QUERIDOS INVITADOS, QUERIDOS ENTRENADORES, QUERIDOS CAMPEONES!",
  "THE OPENING TOURNAMENT OF THE WCT IS OVER, AND WE HAVE A WINNER:" =>
    "EL TORNEO DE APERTURA DEL TCM TERMINÓ, ¡Y TENEMOS UN GANADOR!:",
  "MISTVEIL´S HIGHLY TALENTED GYM LEADER SOLAN!!!" => "¡EL ALTAMENTE TALENTOSO LÍDER DE GIMNASIO DE VELO BRUMOSO, SOLAN!",
  "AND NOW IT´S TIME FOR WHAT WE´VE ALL BEEN WAITING FOR!!!" => "¡Y AHORA ES HORA DE LO QUE TODOS ESTUVIMOS ESPERANDO!",
  "OUR 8 CHAMPIONS HAVE ASSEMBLED, AND THEY ARE READY TO BECOME THE NEW WORLD CHAMPION!!!" =>
    "¡NUESTROS 8 CAMPEONES SE HAN REUNIDO, Y ESTÁN LISTOS PARA CONVERTIRSE EN EL NUEVO CAMPEÓN MUNDIAL!",
  "LET ME INTRODUCE THESE FIERCE TRAINERS!" => "¡DÉJENME PRESENTAR A ESTOS FEROCES ENTRENADORES!",
  "THE CURRENT CHAMPION OF THE DELTA LEAGUE, \\PN!!! DOES ANYONE HAVE WHAT IT TAKES TO STOP THE NEW KID ON THE BLOCK?! " =>
    "¡EL ACTUAL CAMPEÓN DE LA LIGA DELTA, \\PN! ¿¡ALGUIEN TIENE LO NECESARIO PARA DETENER AL CHICO NUEVO DEL BARRIO!? ",
  "THE CURRENT CHAMPION OF THE HOENN LEAGUE, STEVEN!!! CAN ANYONE BREAK HIS TOUGH POKÉMON?!" =>
    "¡EL ACTUAL CAMPEÓN DE LA LIGA HOENN, STEVEN! ¿¡ALGUIEN PUEDE QUEBRAR A SUS DUROS POKÉMON!?",
  "THE CURRENT CHAMPION OF THE INDIGO LEAGUE, LANCE!!! CAN ANYONE STOP HIM AND HIS DRAGONS?!" =>
    "¡EL ACTUAL CAMPEÓN DE LA LIGA AÑIL, LANCE! ¿¡ALGUIEN PUEDE DETENERLO A ÉL Y A SUS DRAGONES!?",
  "THE CURRENT CHAMPION OF THE SINNOH LEAGUE, CYNTHIA!!! DOES ANYONE STAND A CHANCE AGAINST HER HARD HITTING TEAM?!" =>
    "¡LA ACTUAL CAMPEONA DE LA LIGA SINNOH, CYNTHIA! ¿¡ALGUIEN TIENE UNA OPORTUNIDAD CONTRA SU CONTUNDENTE EQUIPO!?",
  "THE CURRENT CHAMPION OF THE UNOVA LEAGUE, IRIS!!! IS ANYONE STRONG ENOUGH TO BEST THE MASTER OF DRAGONS?!" =>
    "¡LA ACTUAL CAMPEONA DE LA LIGA UNOVA, IRIS! ¿¡ALGUIEN ES LO BASTANTE FUERTE COMO PARA VENCER A LA MAESTRA DE LOS DRAGONES!?",
  "THE CURRENT CHAMPION OF THE KALOS LEAGUE, DIANTHA!!! CAN ANYONE MATCH HER BEAUTY?!" =>
    "¡LA ACTUAL CAMPEONA DE LA LIGA KALOS, DIANTHA! ¿¡ALGUIEN PUEDE IGUALAR SU BELLEZA!?",
  "THE CURRENT CHAMPION OF THE GALAR LEAGUE, LEON!!! DOES ANYONE HAVE WHAT IT TAKES TO WIN AGAINST LAST YEAR´S RUNNER UP?!" =>
    "¡EL ACTUAL CAMPEÓN DE LA LIGA GALAR, LEON! ¿¡ALGUIEN TIENE LO NECESARIO PARA GANARLE AL SUBCAMPEÓN DEL AÑO PASADO!?",
  "AND LAST BUT NOT LEAST:" => "Y POR ÚLTIMO, PERO NO MENOS IMPORTANTE:",
  "THE NEW CHAMPION OF THE ALOLA LEAGUE, ZEKE!!! HOW FAR WILL THIS YOUNG TALENT GO?!" =>
    "¡EL NUEVO CAMPEÓN DE LA LIGA ALOLA, XARLY! ¿¡HASTA DÓNDE LLEGARÁ ESTE JOVEN TALENTO!?",
  "AND THIS WILL BE THE FIRST ROUND:" => "Y ESTA SERÁ LA PRIMERA RONDA:",
  "\\PN vs Steven" => "\\PN vs. Steven",
  "Lance vs Cynthia" => "Lance vs. Cynthia",
  "Iris vs Diantha" => "Iris vs. Diantha",
  "Leon vs Zeke" => "Leon vs. Xarly",
  "MAY THE STRONGEST TRAINER WIN!!!" => "¡QUE GANE EL ENTRENADOR MÁS FUERTE!",
  "\\bGood luck for your first battle, \\PN. All of Delta is counting on you!" =>
    "\\bBuena suerte en tu primer combate, \\PN. ¡Toda Delta cuenta con vos!",
  "THE FIRST ROUND OF BATTLES IS OVER!!!" => "¡LA PRIMERA RONDA DE COMBATES TERMINÓ!",
  "Cynthia" => "Cynthia",
  "Iris" => "Iris",
  "IT´S TIME FOR ROUND 2:" => "ES HORA DE LA RONDA 2:",
  "\\PN vs Cynthia" => "\\PN vs. Cynthia",
  "Iris vs Zeke" => "Iris vs. Xarly",
  "THE SEMI-FINALS BEGIN NOW!!!" => "¡LAS SEMIFINALES COMIENZAN AHORA!",
  "\\bYou´re only two battle away from becoming the new World Champion. You can do it!" =>
    "\\bEstás a solo dos combates de convertirte en el nuevo Campeón Mundial. ¡Vos podés!",
  "\\bYou´ve made it to the final round. That´s incredible!" => "\\b¡Llegaste a la ronda final! Eso es increíble.",
  "THE SECOND ROUND OF BATTLES IS OVER!!!" => "¡LA SEGUNDA RONDA DE COMBATES TERMINÓ!",
  "ONLY TWO TRAINERS REMAIN," => "SOLO QUEDAN DOS ENTRENADORES,",
  "SO THIS WILL BE \\nTHE FINAL BATTLE TO DECIDE WHO THE NEW WORLD CHAMPION WILL BE:\\PN vs Zeke" =>
    "ASÍ QUE ESTE SERÁ \\nEL COMBATE FINAL PARA DECIDIR QUIÉN SERÁ EL NUEVO CAMPEÓN MUNDIAL:\\PN vs. Xarly",
  "THE FINAL ROUND BEGINS NOW!!!" => "¡LA RONDA FINAL COMIENZA AHORA!",
  "\\bCome on, I believe in you! You only have to win one last battle!" =>
    "\\b¡Dale, yo creo en vos! ¡Solo tenés que ganar un último combate!",
  "\\bCongratulations, \\PN. You are the new World Champion!" => "\\bFelicitaciones, \\PN. ¡Sos el nuevo Campeón Mundial!",
  "\\bPlease, take your well earned reward." => "\\bPor favor, tomá tu bien merecida recompensa.",
  "\\bOh, and guess who stopped by a few minutes ago: Gary Oak. He´s waiting for you in front of the stadium." =>
    "\\bAh, y adivina quién pasó por acá hace unos minutos: Gary Miyagi. Te está esperando frente al estadio.",
  "\\bYou´ve made all of Delta proud. And just in case you need to hear it: you are now officially the strongest trainer in the world!" =>
    "\\bHiciste que toda Delta se sintiera orgullosa. Y por si necesitás oírlo: ¡ahora sos oficialmente el entrenador más fuerte del mundo!",
  " \\bThis is the entrance to the spectators area. Do you have a ticket?" =>
    " \\bEsta es la entrada al área de espectadores. ¿Tenés una entrada?",
  "\\bOh, you don´t? Well then you can´t go here." => "\\bAh, ¿no tenés? Bueno, entonces no podés pasar por acá.",
}

DICT_197 = {
  "\\bWhat´s up? I´m Alessio, and I did the Gym Challenge with ease. I will win this tournament, and then the champion is done for!" =>
    "\\b¿Qué onda? Soy Alessio, y completé el Desafío de Gimnasios sin esfuerzo. Voy a ganar este torneo, ¡y después el Campeón está acabado!",
  "\\bMy Pokémon team wiped the floor with the Gym Leaders, but you came here and did the same thing with me..." =>
    "\\bMi equipo Pokémon arrasó con los líderes de gimnasio, pero vos viniste acá e hiciste lo mismo conmigo...",
  "\\bWe will meet again." => "\\bNos volveremos a encontrar.",
  "\\bHello, \\PN. I was watching your first battle, and it really impressed me. I´m Freya, and I´ve wanted to become champion since I was young." =>
    "\\bHola, \\PN. Estuve viendo tu primer combate, y de verdad me impresionó. Soy Freya, y quiero ser Campeona desde que era chica.",
  "\\bLet´s put on a show for the spectators!" => "\\b¡Démosle un espectáculo a los espectadores!",
  "\\bIt hurts to lose like this. But I had a lot of fun! This battle was straight from a movie!" =>
    "\\bDuele perder así. ¡Pero me divertí muchísimo! ¡Este combate parecía sacado de una película!",
  "\\bWe´ll have a rematch one day. Good luck for the last battle." =>
    "\\bAlgún día tendremos una revancha. Buena suerte en el último combate.",
  "\\bZeke: This is exactly what I wanted. A battle to find out who the stronger trainer is. You beat me before, because I had the wrong mindset." =>
    "\\bXarly: Esto es exactamente lo que quería. Un combate para descubrir quién es el entrenador más fuerte. Me ganaste antes porque tenía la mentalidad equivocada.",
  "\\bBut I no longer want to be like you. I have a different goal. I want to become the best trainer in the entire world!" =>
    "\\bPero ya no quiero ser como vos. Tengo una meta distinta. ¡Quiero convertirme en el mejor entrenador de todo el mundo!",
  "\\bYou and the Champion are just small obstacles on my way to challenge the all time greats." =>
    "\\bVos y el Campeón son solo pequeños obstáculos en mi camino para desafiar a las grandes leyendas de todos los tiempos.",
  "\\bSteven Stone. Cynthia. Leon. Ash Ketchum. Those names sound familiar, don´t they? And I will surpass all of them!" =>
    "\\bSteven Stone. Cynthia. Leon. Ash Ketchum. Esos nombres te suenan, ¿no? ¡Y voy a superarlos a todos!",
  "\\bI´ve created a strong team. I have mastered the Mega Evolution. And I will win this tournament!" =>
    "\\bCreé un equipo fuerte. Dominé la Megaevolución. ¡Y voy a ganar este torneo!",
  "\\bZeke: It can´t be..." => "\\bXarly: No puede ser...",
  "\\bWhat do I have to do in order to surpass you? What am I doing wrong?!" =>
    "\\b¿¡Qué tengo que hacer para superarte!? ¿¡Qué estoy haciendo mal!?",
  "\\bNo, wait..." => "\\bNo, esperá...",
  "\\bMaybe this is the limit. Maybe there´s a limit for each trainer. And you might be one of the few who managed to go past their limit." =>
    "\\bTal vez este sea el límite. Tal vez cada entrenador tenga un límite. Y vos tal vez seas uno de los pocos que logró superar el suyo.",
  "\\bDon´t worry, I won´t just give up like that." => "\\bNo te preocupes, no me voy a rendir así nomás.",
  "\\bMaybe I still don´t have the right mindset. Maybe I still need to figure out who I want to be." =>
    "\\bTal vez todavía no tengo la mentalidad correcta. Tal vez todavía necesito descubrir quién quiero ser.",
  "\\bI think I should travel the world. I really want to see Alola and Paldea. There´s so much to see and learn out there." =>
    "\\bCreo que debería viajar por el mundo. De verdad quiero conocer Alola y Paldea. Hay tanto para ver y aprender allá afuera.",
  "\\bI´ve reached my limit, so there´s nothing else for me to do at home. Well, I guess I´m off now. See ya!" =>
    "\\bLlegué a mi límite, así que no hay nada más que hacer en casa. Bueno, supongo que ya me voy. ¡Nos vemos!",
  "WE HAVE A WINNER! CONGRATULATIONS, YOU WON THE CHALLENGERS TOURNAMENT!" =>
    "¡TENEMOS UN GANADOR! ¡FELICITACIONES, GANASTE EL TORNEO DE ASPIRANTES!",
  "THERE`S  A SPECIAL PRICE FOR YOU. YOU CAN CLAIM IT AT THE REGESTRATION." =>
    "HAY UN PREMIO ESPECIAL PARA VOS. PODÉS RECLAMARLO EN LA RECEPCIÓN.",
  "\\bSteven: Hello, \\PN. I guess it´s finally time to find out who the better trainer is." =>
    "\\bSteven: Hola, \\PN. Supongo que finalmente es hora de descubrir quién es el mejor entrenador.",
  "\\bYour rise to the top is quite impressive, but you shouldn´t underestimate me. Are you ready? Then show me what you´ve got!" =>
    "\\bTu ascenso a la cima es bastante impresionante, pero no deberías subestimarme. ¿Estás listo? ¡Entonces mostrame de qué estás hecho!",
  "\\bSteven: Ah, now I get what all the fuzz is about. You´re always one step ahead of your opponent, huh?" =>
    "\\bSteven: Ah, ahora entiendo de qué se trataba todo el alboroto. Siempre vas un paso adelante de tu rival, ¿eh?",
  "\\bGood luck for round 2, \\PN. Bye!" => "\\bBuena suerte en la ronda 2, \\PN. ¡Chau!",
  "\\bCynthia: Hey, what´s this? Why isn´t my theme playing?!" => "\\bCynthia: Ey, ¿qué es esto? ¿¡Por qué no suena mi tema!?",
  "\\bThat´s more like it!" => "\\b¡Así está mejor!",
  "\\bSo, \\PN, are you ready for an amazing battle? I´ve honed my skills over the years, and I want to see what they can do against you." =>
    "\\bBueno, \\PN, ¿estás listo para un combate increíble? Perfeccioné mis habilidades con los años, y quiero ver qué pueden hacer contra vos.",
  "\\bI hope you brought a strong team, because you will need that now. Let´s go!" =>
    "\\bEspero que hayas traído un equipo fuerte, porque lo vas a necesitar ahora. ¡Vamos!",
  "\\bCynthia: Alright, that was a strong team. I´m impressed. You know what you´re doing, that´s for sure." =>
    "\\bCynthia: Bueno, ese fue un equipo fuerte. Estoy impresionada. Sabés lo que hacés, eso es seguro.",
  "\\bGood luck for the final battle. Give it your all!" => "\\bBuena suerte en el combate final. ¡Dalo todo!",
  "\\bZeke: Long time no see, my friend. First of all, I want to thank you for showing me my place back then." =>
    "\\bXarly: Cuánto tiempo, amigo. Antes que nada, quiero agradecerte por haberme puesto en mi lugar en su momento.",
  "\\bIf it wasn´t for my loss, I would´ve never found the right path. But look at me now, I managed to become a Champion!" =>
    "\\bSi no hubiera sido por esa derrota, nunca habría encontrado el camino correcto. ¡Pero mirame ahora, logré convertirme en Campeón!",
  "\\bTravelling Paldea and Alola helped me understand who I wanted to be, and I managed to become that person." =>
    "\\bViajar por Paldea y Alola me ayudó a entender quién quería ser, y logré convertirme en esa persona.",
  "\\bAnd I know that this battle will make one of us the new World Champion, but let´s put that aside for now and just have fun. Here we go!" =>
    "\\bY sé que este combate hará que uno de los dos se convierta en el nuevo Campeón Mundial, pero dejemos eso de lado por ahora y simplemente divirtámonos. ¡Allá vamos!",
  "\\bZeke: Wow, you´re truly in a league of your own. Congratulations, \\PN, you´re now the World Champion!" =>
    "\\bXarly: Guau, de verdad estás en una liga aparte. Felicitaciones, \\PN, ¡ahora sos el Campeón Mundial!",
  "\\bBut most importantly: THAT WAS AMAZING!" => "\\bPero lo más importante: ¡ESO FUE INCREÍBLE!",
  "\\bI´ve never had this much fun in my whole life, and that´s all I wanted from this tournament." =>
    "\\bNunca me divertí tanto en toda mi vida, y eso es todo lo que quería de este torneo.",
  "\\bBut I think it´s time for me to go home. I want to see mom again, I really miss her. Why don´t you come and visit me once in a while?" =>
    "\\bPero creo que ya es hora de que vuelva a casa. Quiero ver a mamá de nuevo, la extraño mucho. ¿Por qué no venís a visitarme de vez en cuando?",
  "\\bAlright, see ya!" => "\\bBueno, ¡nos vemos!",
  "AND WE HAVE A WINNER!!!" => "¡Y TENEMOS UN GANADOR!",
  "CONGRATULATIONS, YOU ARE THE NEW WORLD CHAMPION!!!" => "¡FELICITACIONES, SOS EL NUEVO CAMPEÓN MUNDIAL!",
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

apply("Data/Map195.rxdata", DICT_195)
apply("Data/Map196.rxdata", DICT_196)
apply("Data/Map197.rxdata", DICT_197)
