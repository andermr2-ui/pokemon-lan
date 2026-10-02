# encoding: UTF-8
require_relative "apply_dex_common"

DICT = {
  "Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun's rays, the seed grows progressively larger." =>
    "A Bulbasaur se lo puede ver durmiendo la siesta bajo el sol brillante. Tiene una semilla en el lomo. Al absorber los rayos del sol, la semilla crece progresivamente.",
  "To support its bulb, Ivysaur's legs grow sturdy. If it spends more time lying in the sunlight, the bud will soon bloom into a large flower." =>
    "Para sostener su bulbo, las patas de Ivysaur se vuelven robustas. Si pasa más tiempo tumbado al sol, el brote pronto florecerá en una gran flor.",
  "Venusaur's flower is said to take on vivid colors if it gets plenty of nutrition and sunlight. The flower's aroma soothes the emotions of people." =>
    "Se dice que la flor de Venusaur adquiere colores vivos si recibe suficiente nutrición y luz solar. El aroma de la flor calma las emociones de las personas.",
  "The flame that burns at the tip of its tail is an indication of its emotions. The flame wavers when Charmander is happy, and blazes when it is enraged." =>
    "La llama que arde en la punta de su cola indica sus emociones. La llama titila cuando Charmander está contento, y arde con fuerza cuando está furioso.",
  "Without pity, its sharp claws destroy foes. If it encounters a strong enemy, it becomes agitated, and the flame on its tail flares with a bluish white color." =>
    "Sin piedad, sus afiladas garras destruyen a sus rivales. Si se encuentra con un enemigo fuerte, se agita, y la llama de su cola arde con un color blanco azulado.",
  "A Charizard flies about in search of strong opponents. It breathes intense flames that can melt any material. However, it will never torch a weaker foe." =>
    "Charizard vuela en busca de rivales fuertes. Exhala llamas intensas capaces de fundir cualquier material. Sin embargo, nunca quemaría a un rival más débil.",
  "Its shell is not just for protection. Its rounded shape and the grooves on its surface minimize resistance in water, enabling Squirtle to swim at high speeds." =>
    "Su caparazón no es solo para protegerse. Su forma redondeada y los surcos de su superficie minimizan la resistencia en el agua, permitiendo que Squirtle nade a gran velocidad.",
  "Its large tail is covered with rich, thick fur that deepens in color with age. The scratches on its shell are evidence of this Pokémon's toughness in battle." =>
    "Su gran cola está cubierta de un pelaje espeso que oscurece con la edad. Los arañazos de su caparazón son prueba de la resistencia de este Pokémon en combate.",
  "The waterspouts that protrude from its shell are highly accurate. Their bullets of water can precisely nail tin cans from a distance of over 160 feet." =>
    "Los cañones de agua que sobresalen de su caparazón son muy precisos. Sus proyectiles de agua pueden acertar a botes de lata con precisión desde más de 50 metros de distancia.",
  "Its voracious appetite compels it to devour leaves bigger than itself without hesitation. It releases a terribly strong odor from its antennae." =>
    "Su voraz apetito lo empuja a devorar sin dudar hojas más grandes que él mismo. Libera un olor terriblemente fuerte desde sus antenas.",
  "Its shell is as hard as an iron slab. A Metapod does not move very much because it is preparing its soft innards for evolution inside the shell." =>
    "Su caparazón es tan duro como una plancha de hierro. Metapod apenas se mueve porque está preparando su interior blando para la evolución dentro del caparazón.",
  "It has a superior ability to search for delicious honey from flowers. It can seek, extract, and carry honey from flowers blooming over six miles away." =>
    "Tiene una habilidad excepcional para buscar la deliciosa miel de las flores. Puede localizar, extraer y transportar miel de flores que florecen a más de diez kilómetros de distancia.",
  "A Weedle has an extremely acute sense of smell. It distinguishes its favorite kinds of leaves from those it dislikes by sniffing with its big red proboscis (nose)." =>
    "Weedle tiene un sentido del olfato extremadamente agudo. Distingue sus hojas favoritas de las que no le gustan olfateando con su gran probóscide roja (nariz).",
  "It remains virtually immobile while it clings to a tree. However, on the inside, it busily prepares for evolution. This is evident from how hot its shell becomes." =>
    "Permanece prácticamente inmóvil mientras se aferra a un árbol. Sin embargo, por dentro se prepara activamente para la evolución. Esto se nota en lo caliente que se pone su caparazón.",
  "A Beedrill is extremely territorial. For safety reasons, no one should ever approach its nest. If angered, they will attack in a swarm." =>
    "Beedrill es extremadamente territorial. Por seguridad, nadie debería acercarse jamás a su nido. Si se enfada, atacarán en enjambre.",
  "It has an extremely sharp sense of direction. It can unerringly return home to its nest, however far it may be removed from its familiar surroundings." =>
    "Tiene un sentido de la orientación extremadamente agudo. Puede regresar sin fallar a su nido, sin importar cuán lejos lo alejen de sus alrededores conocidos.",
  "This Pokémon flies around, patrolling its large territory. If its living space is violated, it shows no mercy in thoroughly punishing the foe with its sharp claws." =>
    "Este Pokémon vuela patrullando su vasto territorio. Si su espacio vital es invadido, no muestra piedad y castiga a fondo al intruso con sus afiladas garras.",
  "Pidgeot has gorgeous, glossy feathers. Many trainers are so captivated by the beautiful feathers on its head that they choose Pidgeot as their Pokémon." =>
    "Pidgeot tiene un plumaje magnífico y brillante. Muchos entrenadores quedan tan cautivados por las hermosas plumas de su cabeza que eligen a Pidgeot como su Pokémon.",
  "A Rattata is cautious in the extreme. Even while it is asleep, it constantly moves its ears and listens for danger. It will make its nest anywhere." =>
    "Rattata es extremadamente cauteloso. Incluso mientras duerme, mueve las orejas constantemente para detectar peligros. Hace su nido en cualquier lugar.",
  "A Raticate's sturdy fangs grow steadily. To keep them ground down, it gnaws on rocks and logs. It may even chew on the walls of houses." =>
    "Los robustos colmillos de Raticate crecen constantemente. Para desgastarlos, roe rocas y troncos. Incluso puede llegar a masticar las paredes de las casas.",
  "Its loud cry can be heard over half a mile away. If its high, keening cry is heard echoing all around, it is a sign that they are warning each other of danger." =>
    "Su fuerte graznido se puede oír a más de un kilómetro de distancia. Si se escucha su chillido agudo resonando por todas partes, es señal de que se están avisando entre sí de un peligro.",
  "Its long neck and elongated beak are ideal for catching prey in soil or water. It deftly moves this extended and skinny beak to pluck prey." =>
    "Su cuello largo y su pico alargado son ideales para atrapar presas en la tierra o el agua. Mueve con destreza ese pico fino y extendido para capturar a sus presas.",
  "An Ekans curls itself up in a spiral while it rests. This position allows it to quickly respond to an enemy from any direction with a threat from its upraised head." =>
    "Ekans se enrosca en espiral mientras descansa. Esta posición le permite responder rápidamente a un enemigo desde cualquier dirección, amenazando con la cabeza erguida.",
  "This Pokémon has a terrifically strong constricting power. It can even flatten steel oil drums. Once it wraps its body around its foe, escaping is impossible." =>
    "Este Pokémon tiene una fuerza de constricción tremenda. Puede llegar a aplastar bidones de acero. Una vez que envuelve a su rival con su cuerpo, escapar es imposible.",
  "It stores electricity in the electric sacs on its cheeks. When it releases pent-up energy in a burst, the electric power is equal to a lightning bolt." =>
    "Almacena electricidad en los sacos eléctricos de sus mejillas. Cuando libera la energía acumulada de golpe, la potencia eléctrica equivale a un rayo.",
  "If it stores too much electricity, its behavior turns aggressive. To avoid this, it occasionally discharges excess energy and calms itself down." =>
    "Si almacena demasiada electricidad, su comportamiento se vuelve agresivo. Para evitarlo, descarga de vez en cuando el exceso de energía y así se calma.",
  "When it curls up in a ball, it can make any attack bounce off harmlessly. Its hide has turned tough and solid as a result of living in the desert." =>
    "Cuando se enrosca en forma de bola, puede hacer que cualquier ataque rebote sin causarle daño. Su piel se ha vuelto dura y sólida por vivir en el desierto.",
  "It curls up in a ball to protect itself from enemy attacks. It also curls up to prevent heatstroke during the daytime when temperatures rise sharply." =>
    "Se enrosca en forma de bola para protegerse de los ataques enemigos. También se enrosca para evitar un golpe de calor durante el día, cuando las temperaturas suben bruscamente.",
  "Its highly toxic barbs are thought to have developed as protection for this small-bodied Pokémon. When enraged, it releases a horrible toxin from its horn." =>
    "Se cree que sus púas altamente tóxicas se desarrollaron como protección para este Pokémon de cuerpo pequeño. Cuando se enfurece, libera una toxina terrible desde su cuerno.",
  "When it is with its friends or family, its barbs are tucked away to prevent injury. It appears to become nervous if separated from the others." =>
    "Cuando está con sus amigos o su familia, mantiene las púas replegadas para evitar heridas. Parece ponerse nerviosa si se separa de los demás.",
  "It is adept at sending foes flying with harsh tackles using its tough, scaly body. This Pokémon is at its strongest when it is defending its young." =>
    "Es experta en mandar a volar a sus rivales con duros placajes usando su resistente cuerpo escamoso. Este Pokémon está en su punto más fuerte cuando defiende a sus crías.",
  "The male Nidoran has developed muscles that freely move its ears in any direction. Even the slightest sound does not escape this Pokémon's notice." =>
    "El Nidoran macho ha desarrollado músculos que mueven sus orejas libremente en cualquier dirección. Ni el más mínimo sonido escapa a la atención de este Pokémon.",
  "Its horn is harder than a diamond. If it senses a hostile presence, all the barbs on its back bristle up at once, and it challenges the foe with all its might." =>
    "Su cuerno es más duro que un diamante. Si detecta una presencia hostil, todas las púas de su espalda se erizan de golpe, y desafía al rival con todas sus fuerzas.",
  "A Nidoking's thick tail packs enormously destructive power capable of toppling a metal transmission tower. Once it goes on a rampage, there is no stopping it." =>
    "La gruesa cola de Nidoking tiene un poder destructivo enorme, capaz de derribar una torre de transmisión metálica. Una vez que se pone a arrasar, no hay quien lo detenga.",
  "On every night of a full moon, they come out to play. When dawn arrives, the tired Clefairy go to sleep nestled up against each other in deep and quiet mountains." =>
    "Todas las noches de luna llena, salen a jugar. Cuando llega el amanecer, los Clefairy cansados se acurrucan unos junto a otros para dormir en montañas profundas y tranquilas.",
  "A Clefable uses its wings to skip lightly as if it were flying. Its bouncy step lets it even walk on water. On quiet, moonlit nights, it strolls on lakes." =>
    "Clefable usa sus alas para dar saltitos ligeros como si volara. Su paso rebotante le permite incluso caminar sobre el agua. En noches tranquilas iluminadas por la luna, pasea sobre los lagos.",
  "It can freely control fire, making fiery orbs fly like will-o'-the-wisps. Just before evolution, its six tails grow hot as if on fire." =>
    "Puede controlar el fuego a voluntad, haciendo volar esferas ígneas como fuegos fatuos. Justo antes de evolucionar, sus seis colas se calientan como si ardieran.",
  "It has long been said that each of the nine tails embody an enchanted power. A long-lived Ninetales will have fur that shines like gold." =>
    "Desde hace mucho se dice que cada una de sus nueve colas encarna un poder encantado. Un Ninetales longevo tendrá un pelaje que brilla como el oro.",
  "Nothing can avoid falling asleep hearing a Jigglypuff's song. The sound waves of its singing voice match the brain waves of someone in a deep sleep." =>
    "Nada puede evitar quedarse dormido al escuchar la canción de Jigglypuff. Las ondas sonoras de su voz cantora coinciden con las ondas cerebrales de alguien en sueño profundo.",
  "Its fur is the ultimate in luxuriousness. Sleeping alongside a Wigglytuff is simply divine. Its body expands seemingly without end when it inhales." =>
    "Su pelaje es el colmo de la suavidad. Dormir junto a un Wigglytuff es sencillamente divino. Su cuerpo se expande aparentemente sin límite cuando inhala.",
  "While living in pitch-black caverns, their eyes gradually grew shut and deprived them of vision. They use ultrasonic waves to detect obstacles." =>
    "Al vivir en cavernas completamente oscuras, sus ojos se fueron cerrando gradualmente y perdieron la visión. Usan ondas ultrasónicas para detectar obstáculos.",
  "Its fangs easily puncture even thick animal hide. It loves to feast on the blood of people and Pokémon. It flits about in darkness and strikes from behind." =>
    "Sus colmillos perforan con facilidad incluso el cuero animal más grueso. Le encanta darse un festín con la sangre de personas y Pokémon. Revolotea en la oscuridad y ataca por la espalda.",
  "It grows by absorbing moonlight. During the daytime, it buries itself in the ground, leaving only its leaves exposed to avoid detection by its enemies." =>
    "Crece absorbiendo la luz de la luna. Durante el día, se entierra en el suelo, dejando solo las hojas al descubierto para evitar que sus enemigos lo detecten.",
  "A horribly noxious honey drools from its mouth. One whiff of the honey can result in memory loss. Some fans are said to enjoy this overwhelming stink, however." =>
    "De su boca gotea una miel terriblemente nociva. Con una sola bocanada de esa miel se puede perder la memoria. Sin embargo, se dice que algunos aficionados disfrutan de ese hedor abrumador.",
  "In seasons when it produces more pollen, the air around a Vileplume turns yellow with the powder as it walks. The pollen is highly toxic and causes paralysis." =>
    "En las temporadas en las que produce más polen, el aire alrededor de Vileplume se vuelve amarillo por el polvo mientras camina. El polen es altamente tóxico y provoca parálisis.",
  "A Paras has parasitic tochukaso mushrooms growing on its back. They grow by drawing nutrients from the host. They are valued as a medicine for long life." =>
    "Paras tiene hongos parásitos tochukaso creciendo en su espalda. Crecen absorbiendo nutrientes de su huésped. Son muy valorados como remedio para la longevidad.",
  "Parasect are known to infest the roots of large trees en masse and drain nutrients. When an infested tree dies, they move onto another tree all at once." =>
    "Se sabe que los Parasect infestan en masa las raíces de grandes árboles y les drenan los nutrientes. Cuando un árbol infestado muere, se trasladan todos juntos a otro árbol.",
  "Its coat of thin, stiff hair that covers its entire body is said to have evolved for protection. Its large eyes never fail to spot even miniscule prey." =>
    "Se dice que su pelaje fino y rígido, que cubre todo su cuerpo, evolucionó como protección. Sus grandes ojos nunca fallan a la hora de detectar hasta la presa más diminuta.",
  "Venomoth are nocturnal--they only are active at night. Their favorite prey are insects that gather around streetlights, attracted by the light in the darkness." =>
    "Venomoth es nocturno: solo está activo de noche. Sus presas favoritas son los insectos que se reúnen alrededor de las farolas, atraídos por la luz en la oscuridad.",
  "Diglett are raised in most farms. The reason is simple--wherever they burrow, the soil is left perfectly tilled for growing delicious crops." =>
    "Los Diglett se crían en la mayoría de las granjas. La razón es simple: allá por donde excavan, el suelo queda perfectamente removido para cultivar deliciosas cosechas.",
  "Because the triplets originally split from one body, they think exactly alike. They work cooperatively to burrow endlessly through the ground." =>
    "Como los trillizos se separaron originalmente de un solo cuerpo, piensan exactamente igual. Trabajan en equipo para excavar sin parar bajo tierra.",
  "Meowth withdraw their sharp claws into their paws to silently sneak about. For some reason, this Pokémon loves shiny coins that glitter with light." =>
    "Meowth retrae sus afiladas garras en las patas para merodear en silencio. Por alguna razón, a este Pokémon le encantan las monedas relucientes que brillan con la luz.",
  "A Persian's six bold whiskers sense air movements to determine what is in its vicinity. It becomes docile if grabbed by the whiskers." =>
    "Los seis marcados bigotes de Persian detectan los movimientos del aire para saber qué hay en sus alrededores. Se vuelve dócil si se le agarra de los bigotes.",
  "When its headache intensifies, it starts using strange powers. However, it has no recollection of its powers, so it always looks befuddled and bewildered." =>
    "Cuando su dolor de cabeza se intensifica, empieza a usar poderes extraños. Sin embargo, no recuerda nada de sus poderes, por eso siempre parece confundido y desconcertado.",
  "A Golduck is an adept swimmer. It sometimes joins competitive swimmers in training. It uses psychic powers when its forehead shimmers with light." =>
    "Golduck es un nadador experto. A veces se une al entrenamiento de nadadores de competición. Usa poderes psíquicos cuando su frente brilla con luz.",
  "When it starts shaking and its nasal breathing turns rough, it's a sure sign of anger. However, since this happens instantly, there is no time to flee." =>
    "Cuando empieza a temblar y su respiración nasal se vuelve agitada, es señal segura de que está enfadado. Sin embargo, como esto ocurre al instante, no da tiempo a huir.",
  "When it becomes furious, its blood circulation becomes more robust, and its muscles are made stronger. But it also becomes much less intelligent." =>
    "Cuando se enfurece, su circulación sanguínea se vuelve más vigorosa y sus músculos se fortalecen. Pero también se vuelve mucho menos inteligente.",
  "Its superb sense of smell ensures that this Pokémon won't forget any scent, no matter what. It uses its sense of smell to detect the emotions of others." =>
    "Su excelente sentido del olfato garantiza que este Pokémon nunca olvide un aroma, pase lo que pase. Usa su olfato para detectar las emociones de los demás.",
  "This fleet-footed Pokémon is said to run over 6,200 miles in a single day and night. The fire that blazes wildly within its body is its source of power." =>
    "Se dice que este veloz Pokémon puede correr más de 10.000 kilómetros en un solo día y noche. El fuego que arde con fuerza dentro de su cuerpo es su fuente de poder.",
  "It is possible to see this Pokémon's spiral innards right through its thin skin. However, the skin is also very flexible. Even sharp fangs bounce right off it." =>
    "Es posible ver el interior en espiral de este Pokémon a través de su fina piel. Sin embargo, esa piel también es muy flexible. Incluso los colmillos afilados rebotan en ella.",
  "Its body surface is always wet and slick with an oily fluid. Because of this greasy covering, it can easily slip and slide out of the clutches of any enemy in battle." =>
    "La superficie de su cuerpo siempre está húmeda y resbaladiza por un fluido aceitoso. Gracias a esta capa grasienta, puede escurrirse fácilmente de las garras de cualquier enemigo en combate.",
  "Its highly developed muscles never grow fatigued, however much it exercises. This Pokémon can swim back and forth across the Pacific Ocean without effort." =>
    "Sus músculos altamente desarrollados nunca se fatigan, por mucho que haga ejercicio. Este Pokémon puede cruzar el océano Pacífico de ida y vuelta sin esfuerzo.",
  "A Pokémon that sleeps 18 hours a day. Observation revealed that it uses Teleport to change its location once every hour." =>
    "Un Pokémon que duerme 18 horas al día. Las observaciones revelaron que usa Teletransporte para cambiar de ubicación una vez por hora.",
  "It is rumored that a boy with psychic abilities suddenly transformed into Kadabra while he was assisting research into extrasensory powers." =>
    "Se rumorea que un niño con habilidades psíquicas se transformó de repente en Kadabra mientras colaboraba en una investigación sobre poderes extrasensoriales.",
  "While it has strong psychic abilities and high intelligence, an Alakazam's muscles are very weak. It uses psychic power to move its body." =>
    "Aunque tiene fuertes poderes psíquicos y una gran inteligencia, los músculos de Alakazam son muy débiles. Usa el poder psíquico para mover su cuerpo.",
  "It continually undertakes strenuous training to master all forms of martial arts. Its strength lets it easily hoist a sumo wrestler onto its shoulders." =>
    "Se somete continuamente a un entrenamiento extenuante para dominar todas las formas de artes marciales. Su fuerza le permite levantar sobre sus hombros a un luchador de sumo con facilidad.",
  "A belt is worn by a Machoke to keep its overwhelming power under control. Because it is so dangerous, no one has ever removed the belt." =>
    "Machoke lleva puesto un cinturón para mantener bajo control su fuerza abrumadora. Como es tan peligroso, nadie se ha atrevido nunca a quitárselo.",
  "It is impossible to defend against punches and chops doled out by its four arms. Its fighting spirit flares up when it faces a tough opponent." =>
    "Es imposible defenderse de los puñetazos y golpes que reparte con sus cuatro brazos. Su espíritu de lucha se enciende cuando se enfrenta a un rival duro.",
  "A Bellsprout's thin and flexible body lets it bend and sway to avoid any attack, however strong it may be. From its mouth, it leaks a fluid that melts even iron." =>
    "El cuerpo fino y flexible de Bellsprout le permite doblarse y balancearse para esquivar cualquier ataque, por fuerte que sea. De su boca gotea un fluido capaz de fundir hasta el hierro.",
  "At night, a Weepinbell hangs on to a tree branch with its hooked rear and sleeps. If it moves around in its sleep, it may wake up to find itself on the ground." =>
    "De noche, Weepinbell se cuelga de la rama de un árbol con su trasero en forma de gancho y duerme. Si se mueve mientras duerme, puede despertarse y encontrarse en el suelo.",
  "The long vine extending from its head is waved about as if it were a living thing to attract prey. When an unsuspecting victim approaches, it is swallowed whole." =>
    "La larga liana que sale de su cabeza se agita como si tuviera vida propia para atraer presas. Cuando una víctima desprevenida se acerca, es tragada entera.",
  "Its body is almost entirely composed of water. It ensnares its foe with its two long tentacles, then stabs with the poison stingers at their tips." =>
    "Su cuerpo está compuesto casi por completo de agua. Atrapa a su rival con sus dos largos tentáculos, y luego lo apuñala con los aguijones venenosos que tienen en la punta.",
  "It lives in complex rock formations on the ocean floor and traps prey using its 80 tentacles. Its red orbs glow when it grows excited or agitated." =>
    "Vive en complejas formaciones rocosas en el fondo del océano y atrapa a sus presas usando sus 80 tentáculos. Sus esferas rojas brillan cuando se excita o se agita.",
  "It climbs mountain paths using only the power of its arms. Because they look just like boulders lining paths, hikers may step on them without noticing." =>
    "Escala senderos de montaña usando solo la fuerza de sus brazos. Como parecen simples rocas al borde del camino, los excursionistas pueden pisarlos sin darse cuenta.",
  "They descend from mountains by tumbling down steep slopes. They are so brutal, they smash aside obstructing trees and huge boulders with thunderous tackles." =>
    "Descienden de las montañas rodando por pendientes pronunciadas. Son tan brutales que apartan de un golpe árboles y enormes rocas con placajes atronadores.",
  "It is said to live in volcanic craters on mountain peaks. Once a year, it sheds its hide and grows larger. The shed hide crumbles and returns to the soil." =>
    "Se dice que vive en cráteres volcánicos en la cima de las montañas. Una vez al año, muda su piel y crece más grande. La piel mudada se desmorona y vuelve a la tierra.",
  "A Ponyta is very weak at birth. It can barely stand up. Its legs become stronger as it stumbles and falls while trying to keep up with its parent." =>
    "Ponyta es muy débil al nacer. Apenas puede mantenerse en pie. Sus patas se fortalecen mientras tropieza y cae intentando seguir el ritmo de sus padres.",
  "It usually canters casually in the fields and plains. But once a Rapidash turns serious, its fiery manes flare and blaze as it gallops its way up to 150 mph." =>
    "Suele trotar despreocupadamente por campos y llanuras. Pero cuando Rapidash se pone serio, su ardiente crin se enciende y llamea mientras galopa a más de 240 km/h.",
  "It catches prey by dipping its tail in water at the side of a river. But it often forgets what it is doing and spends whole days just loafing at the water's edge." =>
    "Atrapa presas metiendo la cola en el agua a orillas de un río. Pero a menudo se olvida de lo que está haciendo y pasa días enteros holgazaneando junto al agua.",
  "Its tail has a Shellder firmly attached with a bite. As a result, the tail can't be used for fishing anymore. This forces it to reluctantly swim and catch prey." =>
    "Tiene un Shellder mordiendo firmemente su cola. Como resultado, ya no puede usar la cola para pescar. Esto lo obliga, a regañadientes, a nadar para atrapar a sus presas.",
  "The units at its sides are extremely powerful magnets. They generate enough magnetism to draw in iron objects from over 300 feet away." =>
    "Las unidades de sus costados son imanes extremadamente potentes. Generan magnetismo suficiente para atraer objetos de hierro desde más de 90 metros de distancia.",
  "It is actually three Magnemite linked by magnetism. It generates powerful radio waves that raise temperatures by 3.6 degrees F within a 3,300-foot radius." =>
    "En realidad son tres Magnemite unidos por magnetismo. Genera poderosas ondas de radio que elevan la temperatura 2 grados centígrados en un radio de un kilómetro.",
  "It is always seen with a stick from a plant. Apparently, there are good sticks and bad sticks. This Pokémon occasionally fights with others over choice sticks." =>
    "Siempre se lo ve con un tallo de planta. Al parecer, hay tallos buenos y tallos malos. Este Pokémon a veces pelea con otros por los mejores tallos.",
  "Even while eating or sleeping, one of the heads remains always vigilant for any sign of danger. When threatened, it flees at over 60 miles per hour." =>
    "Incluso mientras come o duerme, una de sus cabezas permanece siempre vigilante ante cualquier señal de peligro. Cuando se siente amenazado, huye a más de 96 km/h.",
  "A peculiar Pokémon species with three heads. It vigorously races across grassy plains even in arid seasons with little rainfall." =>
    "Una peculiar especie de Pokémon con tres cabezas. Corre con energía por las llanuras herbosas incluso en temporadas áridas con poca lluvia.",
  "Seel hunt for prey in frigid, ice-covered seas. When it needs to breathe, it punches a hole through the ice with the sharply protruding section of its head." =>
    "Seel caza presas en mares gélidos cubiertos de hielo. Cuando necesita respirar, perfora un agujero en el hielo con la parte puntiaguda de su cabeza.",
  "It loves to snooze on bitterly cold ice. The sight of this Pokémon sleeping on a glacier was mistakenly thought to be a mermaid by a mariner long ago." =>
    "Le encanta dormitar sobre el hielo gélido. Hace mucho tiempo, un marinero confundió por error a este Pokémon durmiendo sobre un glaciar con una sirena.",
  "Born from polluted sludge in the sea, Grimer's favorite food is anything filthy. They feed on wastewater pumped out from factories." =>
    "Nacido del lodo contaminado del mar, la comida favorita de Grimer es cualquier cosa mugrienta. Se alimenta de las aguas residuales que expulsan las fábricas.",
  "It prefers warm and humid habitats. In the summertime, the toxic substances in its body intensify, making Muk reek like putrid kitchen garbage." =>
    "Prefiere hábitats cálidos y húmedos. En verano, las sustancias tóxicas de su cuerpo se intensifican, haciendo que Muk apeste como basura de cocina podrida.",
  "At night, it burrows a hole in the seafloor with its broad tongue to make a place to sleep. While asleep, it closes its shell, but leaves its tongue hanging out." =>
    "De noche, excava un agujero en el fondo marino con su ancha lengua para hacerse un lugar donde dormir. Mientras duerme, cierra su concha, pero deja la lengua colgando fuera.",
  "It swims in the sea by swallowing water, then jetting it out toward the rear. The Cloyster shoots spikes from its shell using the same system." =>
    "Nada en el mar tragando agua y luego expulsándola hacia atrás. Cloyster dispara púas desde su concha usando el mismo sistema.",
  "When exposed to a strong wind, a Gastly's gaseous body quickly dwindles away. They cluster under the eaves of houses to escape the ravages of wind." =>
    "Cuando se expone a un viento fuerte, el cuerpo gaseoso de Gastly se disipa rápidamente. Se agrupan bajo los aleros de las casas para escapar de los estragos del viento.",
  "If a Haunter beckons you while it is floating in darkness, don't approach it. This Pokémon will try to lick you with its tongue and steal your life away." =>
    "Si un Haunter te hace señas mientras flota en la oscuridad, no te acerques. Este Pokémon intentará lamerte con la lengua y robarte la vida.",
  "Deep in the night, your shadow cast by a streetlight may suddenly overtake you. It is actually a Gengar running past you, pretending to be your shadow." =>
    "En plena noche, tu sombra proyectada por una farola puede adelantarte de repente. En realidad es un Gengar que pasa corriendo a tu lado, fingiendo ser tu sombra.",
  "There is a magnet in its brain that prevents an Onix from losing direction while tunneling. As it grows older, its body becomes steadily rounder and smoother." =>
    "Tiene un imán en el cerebro que evita que Onix pierda el rumbo mientras excava túneles. A medida que envejece, su cuerpo se vuelve cada vez más redondeado y liso.",
  "If your nose becomes itchy while you are sleeping, it's a sure sign that a Drowzee is standing above your pillow and trying to eat your dream through your nostrils." =>
    "Si te pica la nariz mientras duermes, es señal segura de que un Drowzee está de pie sobre tu almohada, intentando comerse tu sueño a través de tus fosas nasales.",
  "The arcing movement and glitter of the pendulum in a Hypno's hand lull the foe into deep hypnosis. While searching for prey, it polishes the pendulum." =>
    "El movimiento oscilante y el brillo del péndulo en la mano de Hypno sumen al rival en una hipnosis profunda. Mientras busca presas, pule el péndulo.",
  "Krabby live in holes dug into beaches. On sandy shores with little in the way of food, they can be seen squabbling with each other over territory." =>
    "Krabby vive en agujeros cavados en las playas. En costas arenosas con poca comida, se los puede ver peleando entre ellos por el territorio.",
  "It waves its huge, oversized claw in the air to communicate with others. But since the claw is so heavy, this Pokémon quickly tires." =>
    "Agita en el aire su enorme y desproporcionada pinza para comunicarse con otros. Pero como la pinza es tan pesada, este Pokémon se cansa rápidamente.",
  "It bears an uncanny and unexplained resemblance to a Poké Ball. Because it explodes at the slightest shock, even veteran trainers treat it with caution." =>
    "Guarda un parecido asombroso e inexplicable con una Poké Ball. Como explota al menor impacto, hasta los entrenadores veteranos lo tratan con cautela.",
}

apply_dex_dict(DICT)
