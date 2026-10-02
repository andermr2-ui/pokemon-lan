# encoding: UTF-8
require_relative "apply_dex_common"

DICT = {
  "With its wings, it controls its position in the air. It likes to attack from above, a maneuver that is difficult to defend against." =>
    "Con sus alas controla su posición en el aire. Le gusta atacar desde arriba, una maniobra difícil de defender.",
  "Its whiskers serve as antennas. By sending and receiving electrical waves, it can communicate with others over vast distances." =>
    "Sus bigotes le sirven de antenas. Enviando y recibiendo ondas eléctricas, puede comunicarse con otros a grandes distancias.",
  "Born from the high temperatures and pressures deep underground, it defends itself by firing beams from the jewel part of its body." =>
    "Nacido de las altas temperaturas y presiones de las profundidades subterráneas, se defiende disparando rayos desde la parte enjoyada de su cuerpo.",
  "Its source of protection is its slimy, germ-laden mucous membrane. Anyone who touches it needs some thorough hand-washing." =>
    "Su fuente de protección es su membrana mucosa, viscosa y llena de gérmenes. Quien lo toque necesitará lavarse bien las manos.",
  "This Pokémon's mucous can dissolve anything. Toothless, it sprays mucous on its prey. Once they're nicely dissolved, it slurps them up." =>
    "El moco de este Pokémon puede disolver cualquier cosa. Al no tener dientes, rocía moco sobre sus presas y, una vez bien disueltas, las sorbe.",
  "It gets picked on because it's meek. But then, whoever teased it gets to feel the full force of its horns and a good swatting from its thick tail." =>
    "Lo molestan por ser manso. Pero quien lo hace acaba sintiendo toda la fuerza de sus cuernos y un buen golpe de su gruesa cola.",
  "It never lets go of a key that it likes, so people give it the keys to vaults and safes as a way to prevent crime." =>
    "Nunca suelta una llave que le gusta, así que la gente le confía las llaves de bóvedas y cajas fuertes como medida contra el crimen.",
  "These Pokémon are stumps possessed by the spirits of children who died in the forest. Their cries sound like eerie screams." =>
    "Estos Pokémon son tocones poseídos por los espíritus de niños que murieron en el bosque. Sus gritos suenan como alaridos escalofriantes.",
  "Through its roots, it exerts control over other trees. A deadly curse falls upon anyone cutting down trees in forests where Trevenant dwell." =>
    "A través de sus raíces controla otros árboles. Una maldición mortal cae sobre quien tale árboles en los bosques donde habita Trevenant.",
  "When taking spirits to the afterlife, small Pumpkaboo prefer the spirits of children to those of adults." =>
    "Al llevar espíritus al más allá, los Pumpkaboo pequeños prefieren los espíritus de niños antes que los de adultos.",
  "Small Gourgeist pretend to be children to fool adults. Anyone who falls for the act gets carried away to the hereafter." =>
    "Los Gourgeist pequeños fingen ser niños para engañar a los adultos. Quien cae en el engaño es llevado al más allá.",
  "It blocks opponents' attacks with the ice that shields its body. It uses cold air to repair any cracks with new ice." =>
    "Bloquea los ataques de sus rivales con el hielo que protege su cuerpo. Usa aire frío para reparar cualquier grieta con hielo nuevo.",
  "Its ice-covered body is as hard as steel. Its cumbersome frame crushes anything that stands in its way." =>
    "Su cuerpo cubierto de hielo es tan duro como el acero. Su corpachón aplasta todo lo que se le pone en el camino.",
  "Even a robust wrestler will become dizzy and unable to stand when exposed to its 200,000-hertz ultrasonic waves." =>
    "Hasta un luchador robusto se marea y no puede mantenerse en pie al ser expuesto a sus ondas ultrasónicas de 200.000 hercios.",
  "They fly around on moonless nights and attack careless prey. Nothing can beat them in a battle in the dark." =>
    "Vuelan en noches sin luna y atacan a las presas descuidadas. Nada puede vencerlos en un combate a oscuras.",
  "Legends say it can share eternal life. It slept for a thousand years in the form of a tree before its revival." =>
    "Las leyendas dicen que puede compartir la vida eterna. Durmió mil años con forma de árbol antes de su resurgimiento.",
  "When its life comes to an end, it absorbs the life energy of every living thing and turns into a cocoon once more." =>
    "Cuando su vida llega a su fin, absorbe la energía vital de todo ser viviente y vuelve a convertirse en un capullo.",
  "It's thought to be monitoring the ecosystem. There are rumors that even greater power lies hidden within it." =>
    "Se cree que vigila el ecosistema. Hay rumores de que oculta un poder aún mayor en su interior.",
  "A sudden transformation of Carbink, its pink, glimmering body is said to be the loveliest sight in the whole world." =>
    "Una transformación repentina de Carbink; se dice que su cuerpo rosado y reluciente es la vista más hermosa del mundo entero.",
  "This troublemaker sends anything and everything to faraway places using its loop, which can warp space." =>
    "Este travieso Pokémon envía todo tipo de cosas a lugares lejanos usando su aro, capaz de distorsionar el espacio.",
  "It lets out billows of steam and disappears into the dense fog. It's said to live in mountains where humans do not tread." =>
    "Expulsa nubes de vapor y desaparece entre la densa niebla. Se dice que vive en montañas donde el ser humano no pisa.",
  "It sends its feathers, which are as sharp as blades, flying in attack. Its legs are strong, so its kicks are also formidable." =>
    "Lanza sus plumas, afiladas como cuchillas, al atacar. Sus patas son fuertes, por lo que sus patadas también son formidables.",
  "A bit of a dandy, it spends its free time preening its wings. Its preoccupation with any dirt on its plumage can leave it unable to battle." =>
    "Un poco presumido, pasa su tiempo libre acicalando sus alas. Su preocupación por cualquier mancha en su plumaje puede dejarlo incapaz de combatir.",
  "It fires arrow quills from its wings with such precision, they can pierce a pebble at distances over a hundred yards." =>
    "Dispara plumas en forma de flecha desde sus alas con tal precisión que pueden atravesar una piedrecita a más de noventa metros de distancia.",
  "Its coat regrows twice a year. When the time comes, Litten sets its own body on fire and burns away the old fur." =>
    "Su pelaje se renueva dos veces al año. Cuando llega el momento, Litten prende fuego a su propio cuerpo y quema el pelaje viejo.",
  "It can act spoiled if it grows close to its Trainer. A powerful Pokémon, its sharp claws can leave its Trainer's whole body covered in scratches." =>
    "Puede volverse mimoso si se encariña con su entrenador. Es un Pokémon poderoso cuyas afiladas garras pueden cubrir de arañazos todo el cuerpo de su entrenador.",
  "Although it's rough mannered and egotistical, it finds beating down unworthy opponents boring. It gets motivated for stronger opponents." =>
    "Aunque tiene modales bruscos y es egocéntrico, le aburre vencer a rivales indignos. Se motiva ante oponentes más fuertes.",
  "This Pokémon snorts body fluids from its nose, blowing balloons to smash into its foes. It's famous for being a hard worker." =>
    "Este Pokémon resopla fluidos corporales por la nariz, creando globos que estrella contra sus rivales. Es famoso por ser muy trabajador.",
  "It gets excited when it sees a dance it doesn't know. This hard worker practices diligently until it can learn that dance." =>
    "Se entusiasma al ver un baile que no conoce. Este trabajador incansable practica con dedicación hasta aprenderlo.",
  "It controls its water balloons with song. The melody is learned from others of its kind and is passed down from one generation to the next." =>
    "Controla sus globos de agua con el canto. Aprende la melodía de otros de su especie y se transmite de generación en generación.",
  "It pecks at trees with its hard beak. You can get some idea of its mood or condition from the rhythm of its pecking." =>
    "Picotea árboles con su duro pico. Se puede intuir su humor o su estado por el ritmo de su picoteo.",
  "It eats berries and stores their seeds in its beak. When it encounters enemies or prey, it fires off all the seeds in a burst." =>
    "Come bayas y guarda sus semillas en el pico. Cuando encuentra enemigos o presas, dispara todas las semillas de golpe.",
  "They smack beaks with others of their kind to communicate. The strength and number of hits tell each other how they feel." =>
    "Se golpean el pico entre sí para comunicarse. La fuerza y el número de golpes indican cómo se sienten.",
  "Its stomach takes up most of its long torso. It's a big eater, so the amount Trainers have to spend on its food is no laughing matter." =>
    "Su estómago ocupa la mayor parte de su largo torso. Come muchísimo, así que lo que gastan los entrenadores en su comida no es ninguna broma.",
  "When it finds a trace of its prey, it patiently stakes out the location... but it's always snoozing by nightfall." =>
    "Cuando encuentra rastro de una presa, vigila el lugar con paciencia... pero al anochecer siempre acaba dormitando.",
  "It spits a sticky thread to stop opponents in their tracks, and then it grabs them in its sharp, sturdy mandibles to take them down." =>
    "Escupe un hilo pegajoso para detener a sus rivales en seco y luego los atrapa con sus fuertes y afiladas mandíbulas para derribarlos.",
  "It buries itself in fallen leaves and barely moves, munching away on humus. If you accidentally step on one, you'll get a shock!" =>
    "Se entierra en hojas caídas y apenas se mueve mientras mastica humus. ¡Si lo pisas por accidente, recibirás una descarga!",
  "It zips around, on sharp lookout for an opening. It concentrates electrical energy within its large jaws and uses it to zap its enemies." =>
    "Se desplaza veloz, siempre atento a una oportunidad. Concentra energía eléctrica en sus grandes mandíbulas y la usa para electrocutar a sus enemigos.",
  "It punches so much, its pincers often come off from overuse, but they grow back quickly. What little meat they contain is rich and delicious." =>
    "Golpea tanto que sus pinzas suelen desprenderse por el desgaste, pero le vuelven a crecer rápido. La poca carne que contienen es rica y deliciosa.",
  "It aimed for the top but got lost and ended up on a snowy mountain. Being forced to endure the cold, this Pokémon evolved and grew fur." =>
    "Apuntaba a la cima, pero se perdió y acabó en una montaña nevada. Obligado a soportar el frío, este Pokémon evolucionó y le creció pelaje.",
  "It beats its wings together to create fire. As it moves in the steps of its beautiful dance, it bathes opponents in intense flames." =>
    "Bate sus alas para crear fuego. Mientras se mueve con los pasos de su hermosa danza, baña a sus rivales en llamas intensas.",
  "It feeds on the nectar and pollen of flowers. Because it's able to sense auras, it can identify which flowers are about to bloom." =>
    "Se alimenta del néctar y el polen de las flores. Como puede percibir auras, identifica qué flores están a punto de florecer.",
  "Rain makes pollen damp, so Ribombee hates rain. When it sees ominous clouds, it finds a hollow in a tree, where it waits stock-still." =>
    "La lluvia humedece el polen, así que a Ribombee le desagrada. Cuando ve nubes de mal augurio, busca un hueco en un árbol y espera inmóvil.",
  "This Pokémon has lived with people since times long ago. It can sense when its Trainer is in the dumps and will stick close by its Trainer's side." =>
    "Este Pokémon convive con las personas desde tiempos antiguos. Percibe cuando su entrenador está deprimido y permanece cerca de él.",
  "Its quick movements confuse its enemies. Well equipped with claws and fangs, it also uses the sharp rocks in its mane as weapons." =>
    "Sus rápidos movimientos confunden a sus enemigos. Bien armado con garras y colmillos, también usa las rocas afiladas de su melena como armas.",
  "It's awfully weak and notably tasty, so everyone is always out to get it. As it happens, anyone trying to bully it receives a painful lesson." =>
    "Es terriblemente débil y notablemente sabroso, así que todos van tras él. Sin embargo, quien intenta acosarlo recibe una dolorosa lección.",
  "It plunges the poison spike on its head into its prey. When the prey has weakened, Mareanie deals the finishing blow with its 10 tentacles." =>
    "Clava la púa venenosa de su cabeza en sus presas. Cuando ya están debilitadas, Mareanie da el golpe final con sus 10 tentáculos.",
  "Those attacked by Toxapex's poison will suffer intense pain for three days and three nights. Post-recovery, there will be some aftereffects." =>
    "Quienes son atacados por el veneno de Toxapex sufren un dolor intenso durante tres días y tres noches, y tras recuperarse quedan algunas secuelas.",
  "It loves playing in the mud. If it isn't showered with mud on a daily basis, it gets stressed out and stops listening to its Trainer." =>
    "Le encanta jugar en el barro. Si no lo cubren de barro a diario, se estresa y deja de obedecer a su entrenador.",
  "It remains calm and unmoving no matter the situation. It mixes dirt with the saliva in its mouth to make a special kind of mud." =>
    "Permanece tranquilo e inmóvil sin importar la situación. Mezcla tierra con la saliva de su boca para crear un barro especial.",
  "When two Dewpider meet, they display their water bubbles to each other. Then the one with the smaller bubble gets out of the other's way." =>
    "Cuando dos Dewpider se encuentran, se muestran sus burbujas de agua. El que tiene la burbuja más pequeña se aparta del camino del otro.",
  "It delivers headbutts with the water bubble on its head. Small Pokémon get sucked into the bubble, where they drown." =>
    "Da cabezazos con la burbuja de agua de su cabeza. Los Pokémon pequeños quedan succionados dentro de la burbuja, donde se ahogan.",
  "When the sun rises, Fomantis spreads its four leaves and bathes in the sunlight. The tip of its head has a pleasant aroma." =>
    "Cuando sale el sol, Fomantis despliega sus cuatro hojas y se baña en la luz. La punta de su cabeza tiene un aroma agradable.",
  "It requires a lot of effort to maintain Lurantis's vivid coloring, but some collectors enjoy this work and treat it as their hobby." =>
    "Mantener el vivo colorido de Lurantis requiere mucho esfuerzo, pero algunos coleccionistas disfrutan de esta tarea como pasatiempo.",
  "It scatters its shining spores around itself. Even though they're dangerous, nighttime tours of forests where Morelull live are popular." =>
    "Esparce sus esporas brillantes a su alrededor. Aunque son peligrosas, los recorridos nocturnos por los bosques donde vive Morelull son populares.",
  "It puts its prey to sleep and siphons off their vitality through the tip of its arms. If one of its kind is weakened, it helps by sending it vitality." =>
    "Duerme a sus presas y les drena la vitalidad por la punta de sus brazos. Si uno de los suyos está debilitado, le envía vitalidad para ayudarlo.",
  "It burns its bodily fluids to create a poisonous gas. When its enemies become disoriented from inhaling the gas, it attacks them." =>
    "Quema sus fluidos corporales para crear un gas venenoso. Cuando sus enemigos se desorientan al inhalarlo, los ataca.",
  "Filled with pheromones, its poisonous gas can be diluted to use in the production of luscious perfumes." =>
    "Cargado de feromonas, su gas venenoso puede diluirse y usarse para fabricar exquisitos perfumes.",
  "Despite its adorable appearance, when it gets angry and flails about, its arms and legs could knock a pro wrestler sprawling." =>
    "Pese a su aspecto adorable, cuando se enfurece y agita sus extremidades, sus brazos y piernas pueden derribar a un luchador profesional.",
  "It waves its hands wildly in intimidation and warning. Life is over for anyone who doesn't run away as fast as possible." =>
    "Agita las manos violentamente para intimidar y advertir. Quien no huya lo más rápido posible tiene los días contados.",
  "Because of its sweet, delicious aroma, bird Pokémon are always after it, but it's not intelligent enough to care." =>
    "Debido a su dulce y delicioso aroma, los Pokémon pájaro siempre van tras él, pero no es lo bastante listo como para que le importe.",
  "It's protected by its hard sepals, so it plays with bird Pokémon without worry. They peck it relentlessly, but it doesn't care." =>
    "Está protegido por sus duros sépalos, así que juega sin preocupación con los Pokémon pájaro. Lo picotean sin descanso, pero no le importa.",
  "A Pokémon with an aggressive personality and a mastery of kicking, it cackles every time it kicks an opponent." =>
    "Un Pokémon de carácter agresivo y experto en patadas, suelta una carcajada cada vez que patea a un rival.",
  "Baths prepared with the flowers from its vine have a relaxing effect, so this Pokémon is a hit with many people." =>
    "Los baños preparados con las flores de su enredadera tienen un efecto relajante, por lo que este Pokémon es muy popular entre la gente.",
  "It normally spends its time meditating in the treetops. It throws Poké Balls and gives other Pokémon orders as it pleases." =>
    "Normalmente pasa el tiempo meditando en las copas de los árboles. Lanza Poké Balls y da órdenes a otros Pokémon a su antojo.",
  "Berries are its weapons as well as the staple of its diet. The one that can throw a berry the farthest is the boss of the troop." =>
    "Las bayas son tanto su arma como la base de su dieta. Quien logra lanzar una baya más lejos se convierte en el jefe de la tropa.",
  "This Pokémon is a coward. As it desperately dashes off, the flailing of its many legs leaves a sparkling clean path in its wake." =>
    "Este Pokémon es un cobarde. Al huir desesperadamente, el agitar de sus muchas patas deja un rastro reluciente y limpio a su paso.",
  "It battles skillfully with its six arms, but spends most of its time peacefully meditating in caves deep beneath the sea." =>
    "Combate con destreza usando sus seis brazos, pero pasa la mayor parte del tiempo meditando en paz en cuevas de las profundidades marinas.",
  "It likes the shovel on its head, so Sandygast will get serious and fight any children who come to take it back." =>
    "Le encanta la pala de su cabeza, así que Sandygast se pone serio y lucha contra cualquier niño que venga a recuperarla.",
  "Buried beneath the castle are masses of dried-up bones from those whose vitality it has drained." =>
    "Bajo el castillo están enterrados montones de huesos resecos de aquellos a quienes les drenó la vitalidad.",
  "It lives in shallow seas, such as areas near a beach. It can eject its internal organs, which it uses to engulf its prey or battle enemies." =>
    "Vive en mares poco profundos, como zonas cercanas a la playa. Puede expulsar sus órganos internos, que usa para envolver a sus presas o combatir enemigos.",
  "The heavy control mask it wears suppresses its intrinsic capabilities. This Pokémon has some hidden special power." =>
    "La pesada máscara de control que lleva puesta suprime sus capacidades intrínsecas. Este Pokémon oculta un poder especial.",
  "Its trust in its partner is what awakens it. This Pokémon is capable of changing its type, a flexibility that is well displayed in battle." =>
    "Lo que lo despierta es la confianza en su compañero. Este Pokémon puede cambiar de tipo, una flexibilidad que se aprecia bien en batalla.",
  "Originally making its home in the ozone layer, it hurtles to the ground when the shell enclosing its body grows too heavy." =>
    "Originario de la capa de ozono, se precipita hacia el suelo cuando el caparazón que envuelve su cuerpo se vuelve demasiado pesado.",
  "It remains asleep from birth to death as a result of the sedative properties of the leaves that form its diet." =>
    "Permanece dormido desde que nace hasta que muere debido a las propiedades sedantes de las hojas que componen su dieta.",
  "It lives in volcanoes and eats sulfur and other minerals. Materials from the food it eats form the basis of its explosive shell." =>
    "Vive en volcanes y come azufre y otros minerales. Los materiales de lo que come forman la base de su caparazón explosivo.",
  "The long hairs on its back act as lightning rods. The bolts of lightning it attracts are stored as energy in its electric sac." =>
    "Los largos pelos de su lomo actúan como pararrayos. Los rayos que atrae se almacenan como energía en su saco eléctrico.",
  "A lonely Pokémon, it conceals its terrifying appearance beneath an old rag so it can get closer to people and other Pokémon." =>
    "Un Pokémon solitario que oculta su aterrador aspecto bajo un trapo viejo para poder acercarse a personas y otros Pokémon.",
  "When it unleashes its psychic power from the protuberance on its head, the grating sound of grinding teeth echoes through the area." =>
    "Cuando libera su poder psíquico desde la protuberancia de su cabeza, resuena por la zona el chirriante sonido de dientes rechinando.",
  "This Pokémon is friendly to people and loves children most of all. It comes from deep in the mountains to play with children it likes in town." =>
    "Este Pokémon es amigable con las personas y adora sobre todo a los niños. Baja de las profundidades de las montañas para jugar con los niños que le agradan en el pueblo.",
  "The soul of seaweed adrift in the waves became reborn as this Pokémon. It maintains itself with new infusions of seabed detritus and seaweed." =>
    "El alma de algas a la deriva en las olas renació como este Pokémon. Se mantiene con nuevas infusiones de detritos del fondo marino y algas.",
  "It expresses its feelings by smacking its scales. Metallic sounds echo through the tall mountains where Jangmo-o lives." =>
    "Expresa sus sentimientos golpeando sus escamas. Sonidos metálicos resuenan por las altas montañas donde vive Jangmo-o.",
  "It sheds and regrows its scales on a continuous basis. The scales become harder and sharper each time they're regrown." =>
    "Muda y regenera sus escamas de forma continua. Cada vez que vuelven a crecer, se vuelven más duras y afiladas.",
  "Its rigid scales function as offense and defense. In the past, its scales were processed and used to make weapons and other commodities." =>
    "Sus rígidas escamas cumplen función ofensiva y defensiva. En el pasado se procesaban para fabricar armas y otros bienes.",
  "Although it's called a guardian deity, if a person or Pokémon puts it in a bad mood, it will become a malevolent deity and attack." =>
    "Aunque se lo llama deidad guardiana, si una persona o Pokémon lo pone de mal humor, se convierte en una deidad malévola y ataca.",
  "As it flutters about, it scatters its strangely glowing scales. Touching them is said to restore good health on the spot." =>
    "Mientras revolotea, esparce sus escamas de extraño brillo. Se dice que tocarlas restaura la salud al instante.",
  "It pulls large trees up by the roots and swings them around. It causes vegetation to grow, and then it absorbs energy from the growth." =>
    "Arranca grandes árboles de raíz y los blande. Hace crecer la vegetación y luego absorbe energía de ese crecimiento.",
  "The dense fog it creates brings the downfall and destruction of its confused enemies. Ocean currents are the source of its energy." =>
    "La densa niebla que crea provoca la caída y destrucción de sus enemigos confundidos. Las corrientes oceánicas son su fuente de energía.",
  "Whether or not it's a Pokémon from this world is a mystery. When it's in a jam, it warps away to a safe place to hide." =>
    "Es un misterio si es o no un Pokémon de este mundo. Cuando está en apuros, se teletransporta a un lugar seguro para esconderse.",
  "Motionless as if dead, its body is faintly warm to the touch. In the distant past, it was called the cocoon of the stars." =>
    "Inmóvil como si estuviera muerto, su cuerpo está tibio al tacto. En el pasado remoto se lo llamaba el capullo de las estrellas.",
  "It is said to live in another world. The intense light it radiates from the surface of its body can make the darkest of nights light up like midday." =>
    "Se dice que vive en otro mundo. La intensa luz que irradia la superficie de su cuerpo puede iluminar la noche más oscura como si fuera pleno día.",
  "Said to live in another world, this Pokémon devours light, drawing the moonless dark veil of night over the brightness of day." =>
    "Se dice que vive en otro mundo. Este Pokémon devora la luz, extendiendo el oscuro velo de la noche sin luna sobre el resplandor del día.",
  "One of several mysterious Ultra Beasts. People on the street report observing those infested by it suddenly becoming violent." =>
    "Uno de varios misteriosos ultraentes. Se ha informado que las personas infestadas por él se vuelven violentas de repente.",
  "This Ultra Beast appeared from another world. It shows off its body, but whether that display is a boast or a threat remains unclear." =>
    "Este ultraente apareció desde otro mundo. Exhibe su cuerpo, aunque no está claro si esa exhibición es alarde o amenaza.",
  "One of the Ultra Beasts. It refuses to touch anything, perhaps because it senses some uncleanness in this world." =>
    "Uno de los ultraentes. Se niega a tocar nada, quizás porque percibe algún tipo de impureza en este mundo.",
  "One of the mysterious life-forms known as Ultra Beasts. Astonishing electric shocks emanate from its entire body, according to witnesses." =>
    "Una de las misteriosas formas de vida conocidas como ultraentes. Según testigos, todo su cuerpo emite asombrosas descargas eléctricas.",
  "One kind of Ultra Beast. Witnesses have seen it burn down a forest by expelling gas from its two arms." =>
    "Un tipo de ultraente. Testigos lo han visto incendiar un bosque expulsando gas por sus dos brazos.",
  "One of the Ultra Beast life-forms, it was observed cutting down a gigantic steel tower with one stroke of its blade." =>
    "Una de las formas de vida ultraentes; se lo observó cortando una torre de acero gigantesca de un solo golpe de su cuchilla.",
  "A dangerous Ultra Beast, it appears to be eating constantly, but for some reason its droppings have never been found." =>
    "Un peligroso ultraente que parece comer sin parar, pero, por alguna razón, nunca se han encontrado sus excrementos.",
  "Light is apparently the source of its energy. It has an extraordinarily vicious disposition and is constantly firing off laser beams." =>
    "La luz es, al parecer, la fuente de su energía. Tiene un temperamento extraordinariamente feroz y dispara rayos láser sin cesar.",
}

apply_dex_dict(DICT)
