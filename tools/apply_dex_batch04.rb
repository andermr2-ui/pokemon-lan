# encoding: UTF-8
require_relative "apply_dex_common"

DICT = {
  "A Skitty's adorably cute behavior makes it highly popular. In battle, it makes its tail puff out. It threatens foes with a sharp growl." =>
    "El comportamiento adorable de Skitty lo hace muy popular. En batalla, hincha su cola. Amenaza a sus rivales con un gruñido agudo.",
  "Rather than keeping a permanent lair, it habitually seeks comfortable spots and sleeps there. It is nocturnal and becomes active at dusk." =>
    "En lugar de tener una guarida fija, busca lugares cómodos donde dormir. Es nocturno y se activa al anochecer.",
  "It digs branching holes in caves using its sharp claws in search of food--raw gems. A Sableye lurks in darkness and is seen only rarely." =>
    "Cava túneles ramificados en cuevas con sus garras afiladas en busca de alimento: gemas en bruto. Sableye acecha en la oscuridad y rara vez se lo ve.",
  "Its giant jaws are actually steel horns that transformed. It fools foes into complacency with its adorable gestures, then chomps them with its huge jaws." =>
    "Sus enormes mandíbulas son en realidad cuernos de acero transformados. Confía a sus rivales con gestos adorables y luego los muerde con sus enormes fauces.",
  "A Pokémon that is clad in steel armor. A new suit of armor is made when it evolves. The old, discarded armor is salvaged as metal for making iron products." =>
    "Un Pokémon cubierto de armadura de acero. Al evolucionar forma una armadura nueva. La vieja se recicla como metal para fabricar productos de hierro.",
  "When two Lairon meet in the wild, they fight for territory by bashing into each other with their steel bodies. The sound of their collision carries for miles." =>
    "Cuando dos Lairon se encuentran en libertad, luchan por el territorio embistiéndose con sus cuerpos de acero. El sonido del choque se oye a kilómetros de distancia.",
  "Its iron horns grow longer a little at a time. They are used to determine the Aggron's age. The gouges in its armor are worn with pride as mementos from battles." =>
    "Sus cuernos de hierro crecen poco a poco y sirven para calcular su edad. Luce con orgullo las marcas de su armadura como recuerdo de sus batallas.",
  "It continually meditates for hours every day. As a result of rigorous and dedicated yoga training, it has tempered its spiritual power so much it can fly." =>
    "Medita durante horas todos los días. Gracias a un riguroso entrenamiento de yoga, ha templado tanto su poder espiritual que puede volar.",
  "Through crushingly harsh yoga training, it gained the power to foretell its foe's actions. It battles with elegant, dance- like movement." =>
    "Gracias a un entrenamiento de yoga extremadamente duro, obtuvo el poder de predecir los movimientos de sus rivales. Combate con elegantes movimientos de danza.",
  "It generates electricity using friction from the atmosphere. In seasons with especially arid air, its entire body blazes with violent showers of sparks." =>
    "Genera electricidad por fricción con el aire. En épocas de aire muy seco, todo su cuerpo se cubre de violentas lluvias de chispas.",
  "Because lightning falls in their vicinities, Manectric were thought to have been born from lightning. In battle, they create thunderclouds." =>
    "Como los rayos caen cerca de ellos, se creía que los Manectric nacían de los rayos. En batalla, generan nubes de tormenta.",
  "It has the trait of cheering on its fellow Pokémon. By shorting out the electricity it releases from its paws, it creates pom-poms for cheering." =>
    "Tiene la costumbre de animar a sus compañeros Pokémon. Cortocircuitando la electricidad que libera de sus patas, crea pompones para animar.",
  "At a meeting of Pokémon academics, it was announced that simultaneous exposure to electricity from a Plusle and Minun will promote circulation and boost vitality." =>
    "En una reunión de académicos Pokémon se anunció que la exposición simultánea a la electricidad de un Plusle y un Minun mejora la circulación y aumenta la vitalidad.",
  "With their taillights lit, Volbeat fly in a swarm, drawing geometric designs in the night sky. They move their nests if their pond water becomes dirty." =>
    "Con sus luces traseras encendidas, los Volbeat vuelan en enjambre trazando figuras geométricas en el cielo nocturno. Mudan su nido si el agua de su estanque se ensucia.",
  "A nocturnal Pokémon that becomes active upon nightfall. It leads a Volbeat swarm to draw patterns in the night sky. Over 200 different patterns have been seen." =>
    "Un Pokémon nocturno que se activa al anochecer. Guía a un enjambre de Volbeat para trazar patrones en el cielo nocturno. Se han observado más de 200 patrones distintos.",
  "A Roselia that drinks nutritionally rich springwater blooms with lovely flowers. The fragrance of its flowers has the effect of making its foes careless." =>
    "Una Roselia que bebe agua de manantial rica en nutrientes florece con hermosas flores. La fragancia de sus flores hace que sus rivales bajen la guardia.",
  "This Pokémon's stomach fluid can even digest scrap iron. In one gulp, it can swallow something that is as large as itself." =>
    "Los jugos gástricos de este Pokémon pueden digerir incluso chatarra de hierro. De un solo bocado puede tragar algo tan grande como él mismo.",
  "Its powerful stomach acid is capable of digesting almost anything. The one thing in the whole world a Swalot can't digest is its own stomach." =>
    "Su potente ácido estomacal puede digerir casi cualquier cosa. Lo único en el mundo que un Swalot no puede digerir es su propio estómago.",
  "Carvanha attack ships in swarms, making them sink. Although it is said to be a very vicious Pokémon, it timidly flees as soon as it finds itself alone." =>
    "Los Carvanha atacan barcos en enjambre y logran hundirlos. Aunque se dice que es un Pokémon muy feroz, huye tímidamente en cuanto se queda solo.",
  "The vicious and sly gangster of the sea. Its skin is specially textured to minimize drag in water. Its speed tops out at over 75 miles per hour." =>
    "El feroz y astuto gánster de los mares. Su piel tiene una textura especial que reduce la resistencia en el agua. Alcanza velocidades de más de 120 km/h.",
  "While this Pokémon usually lives in the sea, it can survive on land, although not too long. It loses vitality if its body becomes dried out." =>
    "Aunque suele vivir en el mar, puede sobrevivir en tierra, aunque no por mucho tiempo. Pierde vitalidad si su cuerpo se seca.",
  "It breathes through nostrils that it raises above the sea. By inhaling to its maximum capacity, a Wailord can dive close to 10,000 feet beneath the waves." =>
    "Respira por sus fosas nasales, que asoma sobre el mar. Al inhalar al máximo, un Wailord puede sumergirse casi 3.000 metros bajo las olas.",
  "A Numel stores boiling magma in the hump on its back. It is a hardy Pokémon that can transport a 220-pound load. It has served humans at work since long ago." =>
    "Numel almacena magma hirviendo en la joroba de su lomo. Es un Pokémon resistente que puede transportar cargas de 100 kg. Ha servido a los humanos desde tiempos antiguos.",
  "A Pokémon that lives in the crater of a volcano. Every 10 years, the volcanoes on its back erupt violently. Research is under way on the cause of eruption." =>
    "Un Pokémon que vive en el cráter de un volcán. Cada 10 años, los volcanes de su lomo entran en erupción violentamente. Se investiga la causa de estas erupciones.",
  "It battles using energy it gets from burning coal. When loosing smoke from its nostrils, it lets off a sound that is similar to a locomotive's horn." =>
    "Combate con la energía que obtiene al quemar carbón. Cuando expulsa humo por sus fosas nasales, emite un sonido similar al de la bocina de una locomotora.",
  "A Pokémon that manipulates psychic power at will. It doesn't stop bouncing even when it is asleep. It loves eating mushrooms that grow underground." =>
    "Un Pokémon que manipula el poder psíquico a voluntad. No deja de rebotar ni siquiera cuando duerme. Le encanta comer hongos que crecen bajo tierra.",
  "It stores power in the black pearls on its forehead. When it uses psychic power, it performs an odd dance step. Its style of dancing became hugely popular overseas." =>
    "Almacena poder en las perlas negras de su frente. Cuando usa su poder psíquico, ejecuta un paso de baile peculiar que se hizo muy popular en el extranjero.",
  "It is distinguished by a pattern of spots that is always different. Its unsteady, tottering walk has the effect of fouling its foe's aim." =>
    "Se distingue por un patrón de manchas que siempre es diferente. Su andar inestable y tambaleante hace que sus rivales fallen al atacarlo.",
  "Its big jaws crunch through boulders. Because its head is so big, it has a hard time getting back upright if it tips over onto its back." =>
    "Sus grandes mandíbulas trituran rocas. Como su cabeza es tan grande, le cuesta enderezarse si cae de espaldas.",
  "It looses ultrasonic waves by rubbing its wings together. Since a Vibrava's wings are still in the process of growing, it can only fly short distances." =>
    "Emite ondas ultrasónicas frotando sus alas. Como las alas de Vibrava aún están creciendo, solo puede volar distancias cortas.",
  "The flapping of its wings sounds like singing. To prevent detection by enemies, it hides itself by flapping up a cloud of desert sand." =>
    "El aleteo de sus alas suena como un canto. Para evitar ser detectado por sus enemigos, se oculta levantando una nube de arena del desierto.",
  "Cacnea live in deserts with virtually no rainfall. It battles by swinging its thick, spiked arms. Once a year, a yellow flower blooms." =>
    "Los Cacnea viven en desiertos casi sin lluvias. Combate agitando sus gruesos brazos espinosos. Una vez al año le florece una flor amarilla.",
  "After spending thousands of years in harsh deserts, its blood transformed into the same substances as sand. It is nocturnal, so it hunts at night." =>
    "Tras pasar miles de años en desiertos hostiles, su sangre se transformó en la misma sustancia que la arena. Es nocturno, así que caza de noche.",
  "A Pokémon that has wings like cottony clouds. After enduring winter, in which little food is available, Swablu flocks move closer to towns in the spring." =>
    "Un Pokémon con alas como nubes de algodón. Tras soportar el invierno, cuando escasea el alimento, las bandadas de Swablu se acercan a los pueblos en primavera.",
  "It hums in a beautiful soprano voice. It flies among white clouds in the blue sky. It launches intensely hot fireballs from its mouth." =>
    "Canturrea con una hermosa voz de soprano. Vuela entre nubes blancas en el cielo azul. Lanza bolas de fuego intensamente calientes por la boca.",
  "When it battles, it stands on its hind legs and attacks with its sharply clawed forelegs. Its fur bristles if it encounters any Seviper." =>
    "Cuando combate, se yergue sobre sus patas traseras y ataca con sus afiladas garras delanteras. Su pelaje se eriza si se topa con un Seviper.",
  "Seviper and Zangoose are eternal rivals. It counters a Zangoose's dazzling agility with its swordlike tail, which also oozes a horrible poison." =>
    "Seviper y Zangoose son rivales eternos. Contrarresta la deslumbrante agilidad de Zangoose con su cola en forma de espada, que además rezuma un veneno horrible.",
  "It becomes very active on the night of a full moon. This Pokémon was first discovered 40 years ago at the site of a meteor strike." =>
    "Se vuelve muy activo en las noches de luna llena. Este Pokémon fue descubierto por primera vez hace 40 años en el lugar donde impactó un meteorito.",
  "Solar energy is the source of this Pokémon's power. On sunny days, groups of Solrock line up facing the sun and absorb its light." =>
    "La energía solar es la fuente del poder de este Pokémon. En días soleados, los grupos de Solrock se alinean de cara al sol para absorber su luz.",
  "Its body is covered with a slimy film. The film acts as a barrier to prevent germs in muddy water from entering the Barboach's body." =>
    "Su cuerpo está cubierto por una película viscosa que actúa como barrera para evitar que los gérmenes del agua fangosa penetren en su cuerpo.",
  "Mysteriously, it can foretell earthquakes. In the daytime, it sleeps in mud at the bottom of a pond. When it awakens, it continually feeds throughout the night." =>
    "Misteriosamente, es capaz de predecir terremotos. De día duerme en el barro del fondo de un estanque. Al despertar, se alimenta sin parar durante toda la noche.",
  "Once it grips prey with its large pincers, it will never let go, no matter what. It is a hardy Pokémon that can thrive in any environment." =>
    "Una vez que agarra a su presa con sus grandes pinzas, nunca la suelta pase lo que pase. Es un Pokémon resistente que prospera en cualquier entorno.",
  "A brutish Pokémon that loves to battle. A veteran Crawdaunt that has prevailed in hundreds of battles has giant pincers marked with countless scars." =>
    "Un Pokémon brutal que adora combatir. Un Crawdaunt veterano que ha ganado cientos de batallas tiene pinzas gigantes marcadas con innumerables cicatrices.",
  "A Baltoy moves by spinning on its single foot. It has been depicted in murals adorning the walls of a once-bustling city in an ancient age." =>
    "Baltoy se desplaza girando sobre su único pie. Aparece representado en murales que decoran los muros de una antigua ciudad que en tiempos fue próspera.",
  "A Claydol sleeps while hovering in midair. Its arms are separate from its body. They are kept floating by the Pokémon's manipulation of psychic power." =>
    "Claydol duerme flotando en el aire. Sus brazos están separados de su cuerpo y se mantienen flotando gracias al poder psíquico que manipula.",
  "It disguises itself as seaweed by making its tentacles sway. Unsuspecting prey that come too close are swallowed whole. It became extinct 100 million years ago." =>
    "Se disfraza de alga marina agitando sus tentáculos. Las presas desprevenidas que se acercan demasiado son tragadas enteras. Se extinguió hace 100 millones de años.",
  "It drags its heavy body along the seafloor. It makes its nest in the shallows of warm seas. Cradily can be seen on beaches when the tide goes out." =>
    "Arrastra su pesado cuerpo por el fondo marino. Anida en aguas poco profundas de mares cálidos. Se puede ver a Cradily en las playas cuando baja la marea.",
  "It was resurrected from a fossil using the power of science. It swims by undulating the wings at its sides. They were feet that adapted to life in the sea." =>
    "Fue resucitado a partir de un fósil gracias al poder de la ciencia. Nada ondulando las aletas de sus costados, que en su día fueron patas adaptadas a la vida marina.",
  "Armaldo usually lives on land. However, when it hunts for prey, it dives beneath the ocean. It swims around using its two large wings." =>
    "Armaldo suele vivir en tierra, pero cuando caza se sumerge en el océano. Nada usando sus dos grandes aletas.",
  "Feebas live in ponds that are heavily infested with weeds. Because of its hopelessly shabby appearance, it seems as if few trainers raise it." =>
    "Los Feebas viven en estanques muy invadidos de maleza. Debido a su aspecto lamentablemente desaliñado, parece que pocos entrenadores lo crían.",
  "It is said to live at the bottom of large lakes. Considered to be the most beautiful of all Pokémon, it has been depicted in paintings and statues." =>
    "Se dice que vive en el fondo de grandes lagos. Considerado el más bello de todos los Pokémon, ha sido representado en pinturas y estatuas.",
  "It alters its form depending on the weather. Changes in the climate such as the temperature and humidity appear to affect its cellular structure." =>
    "Altera su forma según el clima. Los cambios climáticos, como la temperatura y la humedad, parecen afectar a su estructura celular.",
  "A Pokémon that has the ability to alter its body colors to match its surroundings. A Kecleon reverts to its original colors if it is startled." =>
    "Un Pokémon capaz de alterar los colores de su cuerpo para camuflarse con su entorno. Kecleon recupera sus colores originales si se asusta.",
  "This Pokémon roams about deep in the night seeking such negative emotions as grudges and envy. It retreats to its nest when the sun begins to rise." =>
    "Este Pokémon vaga en plena noche en busca de emociones negativas como el rencor y la envidia. Se retira a su nido cuando empieza a salir el sol.",
  "An abandoned plush doll became this Pokémon. They are said to live in garbage dumps and wander about in search of the children that threw them away." =>
    "Este Pokémon nació de un muñeco de peluche abandonado. Se dice que viven en basurales y vagan en busca de los niños que los tiraron.",
  "A glare from its single scarlet eye makes even burly grown-ups freeze in utter fear. It is a nocturnal Pokémon that roams about under the cloak of darkness." =>
    "La mirada de su único ojo escarlata paraliza de terror incluso a los adultos más corpulentos. Es un Pokémon nocturno que vaga al amparo de la oscuridad.",
  "It is thought that its body is hollow with only a spectral ball of fire burning inside. However, no one has been able to confirm this theory as fact." =>
    "Se cree que su cuerpo está hueco y que en su interior solo arde una bola de fuego espectral, pero nadie ha podido confirmar esta teoría.",
  "It flies by flapping its broad leaves. The bunch of fruit that grows around its neck is deliciously sweet. In the spring, it scatters pollen from its neck." =>
    "Vuela agitando sus anchas hojas. El racimo de fruta que le crece en el cuello es deliciosamente dulce. En primavera esparce polen desde su cuello.",
  "They fly about very actively when the hot season arrives. They communicate among themselves using seven different and distinguishing cries." =>
    "Vuelan muy activamente cuando llega la temporada calurosa. Se comunican entre ellos usando siete gritos distintos y característicos.",
  "It sharply senses even subtle changes in the sky and the land to predict natural disasters. It is a long-lived Pokémon that has a life-span of 100 years." =>
    "Percibe con gran agudeza incluso los cambios más sutiles en el cielo y la tierra para predecir desastres naturales. Es un Pokémon longevo que vive 100 años.",
  "A Wynaut loves to eat sweet fruits. It cleverly picks fruits using its earlike arms. They gather in fruit gardens, drawn by the fragrance." =>
    "A Wynaut le encanta comer frutas dulces. Las recoge con habilidad usando sus brazos en forma de oreja. Se reúnen en huertos frutales, atraídos por su fragancia.",
  "They tend to move about in groups of around five Snorunt. In snowy regions, it is said that when they are seen late at night, snowfall will arrive by morning." =>
    "Suelen desplazarse en grupos de unos cinco Snorunt. En regiones nevadas se dice que, si se los ve entrada la noche, nevará por la mañana.",
  "A Glalie has the power to instantaneously freeze moisture in the atmosphere. A dazzling cloud of diamondlike ice crystals forms around its body." =>
    "Glalie tiene el poder de congelar instantáneamente la humedad del aire. Una deslumbrante nube de cristales de hielo, como diamantes, se forma alrededor de su cuerpo.",
  "It is completely covered with plushy fur. As a result, it never feels the cold even when it is rolling about on ice floes or diving in the sea." =>
    "Está completamente cubierto de un pelaje mullido, por lo que nunca siente frío, ni rodando sobre témpanos de hielo ni buceando en el mar.",
  "Sealeo live in herds on ice floes. Using its powerful flippers, it shatters ice. It dives into the sea to hunt prey five times a day." =>
    "Los Sealeo viven en manadas sobre témpanos de hielo. Con sus poderosas aletas rompe el hielo. Se sumerge en el mar a cazar presas cinco veces al día.",
  "To protect its herd, the leader battles anything that invades its territory, even at the cost of its life. Its tusks may snap off in battle." =>
    "Para proteger a su manada, el líder combate contra cualquier invasor de su territorio, incluso a costa de su vida. Sus colmillos pueden partirse en la batalla.",
  "A Clamperl slams its shell closed on prey to prevent escape. The pearl it creates upon evolution is said to be infused with a mysterious energy." =>
    "Clamperl cierra su concha de golpe sobre sus presas para impedir que escapen. Se dice que la perla que crea al evolucionar está impregnada de una energía misteriosa.",
  "To withstand the crushing water pressure deep under the sea, its spine is very thick and sturdy. Its tail, which is shaped like a small fish, has eyes that light up." =>
    "Para soportar la aplastante presión del agua en las profundidades marinas, su columna vertebral es muy gruesa y resistente. Su cola, con forma de pez pequeño, tiene ojos que brillan.",
  "A Gorebyss siphons the body fluids of prey through its thin, tubular mouth. Its light pink body color turns vivid when it finishes feeding." =>
    "Gorebyss succiona los fluidos corporales de sus presas con su fina boca tubular. Su color rosa pálido se vuelve intenso cuando termina de alimentarse.",
  "A Pokémon that was once believed to be extinct. The species has not changed its form for 100 million years. It walks on the seafloor using its pectoral fins." =>
    "Un Pokémon que se creía extinto. Esta especie no ha cambiado de forma en 100 millones de años. Camina por el fondo marino usando sus aletas pectorales.",
  "Luvdisc make the branches of Corsola their nests. There is a custom from long ago of giving a Luvdisc as a gift to express one's feelings of love." =>
    "Los Luvdisc anidan en las ramas de Corsola. Desde antiguo existe la costumbre de regalar un Luvdisc para expresar sentimientos de amor.",
  "Although it is small, this Pokémon is very powerful because its body is a bundle of muscles. It launches head-butts with its ironlike skull." =>
    "Aunque es pequeño, este Pokémon es muy poderoso porque su cuerpo es un manojo de músculos. Da cabezazos con su cráneo, duro como el hierro.",
  "It hardly eats while it awaits evolution. It becomes hardier by enduring hunger. Its shell peels off the instant it begins to evolve." =>
    "Apenas come mientras espera su evolución. Se vuelve más resistente soportando el hambre. Su caparazón se desprende en el instante en que comienza a evolucionar.",
  "After many long years, its cellular structure underwent a sudden mutation to grow wings. When angered, it loses all thought and rampages out of control." =>
    "Tras muchos años, su estructura celular sufrió una mutación repentina que le hizo crecer alas. Cuando se enfurece, pierde todo raciocinio y arrasa sin control.",
  "When Beldum gather in a swarm, they move in perfect unison as if they were but one Pokémon. They communicate with each other using brain waves." =>
    "Cuando los Beldum se reúnen en enjambre, se mueven al unísono como si fueran un solo Pokémon. Se comunican entre ellos mediante ondas cerebrales.",
  "The claws tipping its arms pack the destructive power to tear through thick iron sheets as if they were silk. It flies at over 60 miles per hour." =>
    "Las garras de sus brazos tienen el poder destructivo de rasgar gruesas planchas de hierro como si fueran seda. Vuela a más de 95 km/h.",
  "Metagross has four brains that are joined by a complex neural network. As a result of integration, this Pokémon is smarter than a supercomputer." =>
    "Metagross tiene cuatro cerebros unidos por una compleja red neuronal. Gracias a esta integración, este Pokémon es más inteligente que una supercomputadora.",
  "A Pokémon that is made entirely of rocks and boulders. If parts of its body chip off in battle, Regirock repairs itself by adding new rocks." =>
    "Un Pokémon hecho enteramente de rocas y peñascos. Si partes de su cuerpo se desprenden en batalla, Regirock se repara añadiendo nuevas rocas.",
  "Its entire body is made of Antarctic ice. After extensive studies, researchers believe the ice was formed during an ice age." =>
    "Todo su cuerpo está hecho de hielo antártico. Tras extensos estudios, los investigadores creen que el hielo se formó durante una era glacial.",
  "Its body is harder than any other kind of metal. The body metal is composed of a mysterious substance. Not only is it hard, it shrinks and stretches flexibly." =>
    "Su cuerpo es más duro que cualquier otro metal. Está compuesto de una sustancia misteriosa que, además de dura, se contrae y estira con flexibilidad.",
  "They make a small herd of only several members. They rarely make contact with people or other Pokémon. They disappear if they sense enemies." =>
    "Forman una pequeña manada de pocos miembros. Rara vez tienen contacto con personas u otros Pokémon. Desaparecen si perciben enemigos cerca.",
  "Even in hiding, it can detect the locations of others and sense their emotions since it has telepathy. Its intelligence allows it to understand human languages." =>
    "Incluso escondido, puede detectar la ubicación de otros y percibir sus emociones gracias a su telepatía. Su inteligencia le permite entender los idiomas humanos.",
  "Kyogre has appeared in mythology as the creator of the sea. After long years of feuding with Groudon, it took to sleep at the bottom of the sea." =>
    "Kyogre aparece en la mitología como el creador del mar. Tras largos años de enfrentamiento con Groudon, se retiró a dormir en el fondo del mar.",
  "Groudon has appeared in mythology as the creator of the land. It sleeps in magma underground and is said to make volcanoes erupt on awakening." =>
    "Groudon aparece en la mitología como el creador de la tierra. Duerme en el magma subterráneo y se dice que hace entrar en erupción a los volcanes al despertar.",
  "A Pokémon that flies endlessly in the ozone layer. It is said it would descend to the ground if Kyogre and Groudon were to fight." =>
    "Un Pokémon que vuela sin cesar en la capa de ozono. Se dice que descendería a tierra si Kyogre y Groudon llegaran a enfrentarse.",
  "Jirachi is said to make wishes come true. While it sleeps, a tough crystalline shell envelops the body to protect it from enemies." =>
    "Se dice que Jirachi hace realidad los deseos. Mientras duerme, un resistente caparazón cristalino envuelve su cuerpo para protegerlo de sus enemigos.",
  "A Pokémon that mutated from an extraterrestrial virus exposed to a laser beam. Its body is configured for superior agility and speed." =>
    "Un Pokémon que mutó a partir de un virus extraterrestre expuesto a un rayo láser. Su cuerpo está configurado para una agilidad y velocidad superiores.",
  "Made from soil, the shell on its back hardens when it drinks water. It lives along lakes." =>
    "El caparazón de su lomo, hecho de tierra, se endurece cuando bebe agua. Vive cerca de los lagos.",
  "It lives along water in forests. In the daytime, it leaves the forest to sunbathe its treed shell." =>
    "Vive cerca del agua en los bosques. De día sale del bosque para que su caparazón arbolado tome el sol.",
  "Small Pokémon occasionally gather on its unmoving back to begin building their nests." =>
    "Pequeños Pokémon suelen reunirse en su lomo inmóvil para empezar a construir sus nidos.",
  "It agilely scales sheer cliffs to live atop craggy mountains. Its fire is put out when it sleeps." =>
    "Escala ágilmente acantilados escarpados para vivir en la cima de montañas rocosas. Su fuego se apaga cuando duerme.",
  "To intimidate attackers, it stretches the fire on its tail to make itself appear bigger." =>
    "Para intimidar a sus atacantes, extiende el fuego de su cola para parecer más grande.",
  "It uses a special kind of martial arts involving all its limbs. Its fire never goes out." =>
    "Practica un tipo especial de arte marcial que involucra todas sus extremidades. Su fuego nunca se apaga.",
  "Because it is very proud, it hates accepting food from people. Its thick down guards it from cold." =>
    "Como es muy orgulloso, odia aceptar comida de las personas. Su grueso plumón lo protege del frío.",
  "It lives alone, away from others. Apparently, every one of them believes it is the most important." =>
    "Vive solo, alejado de los demás. Al parecer, todos ellos creen ser el más importante.",
  "The three horns that extend from its beak attest to its power. The leader has the biggest horns." =>
    "Los tres cuernos que se extienden desde su pico atestiguan su poder. El líder tiene los cuernos más grandes.",
  "They flock in great numbers. Though small, they flap their wings with great power." =>
    "Se agrupan en grandes bandadas. Aunque pequeños, baten sus alas con gran fuerza.",
  "It flies around forests and fields in search of bug Pokémon. It stays within a huge flock." =>
    "Vuela por bosques y campos en busca de Pokémon bicho. Permanece dentro de una enorme bandada.",
  "It has a savage nature. It will courageously challenge foes that are much larger." =>
    "Tiene una naturaleza salvaje. Desafía con valentía a rivales mucho más grandes que él.",
  "With nerves of steel, nothing can perturb it. It is more agile and active than it appears." =>
    "Con nervios de acero, nada lo perturba. Es más ágil y activo de lo que aparenta.",
  "It makes its nest by damming streams with bark and mud. It is known as an industrious worker." =>
    "Construye su nido represando arroyos con corteza y barro. Es conocido por ser un trabajador incansable.",
}

apply_dex_dict(DICT)
