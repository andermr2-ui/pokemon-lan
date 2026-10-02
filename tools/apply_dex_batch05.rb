# encoding: UTF-8
require_relative "apply_dex_common"

DICT = {
  "It shakes its head back to front, causing its antennae to hit each other and sound like a xylophone." =>
    "Sacude la cabeza de adelante hacia atrás, haciendo que sus antenas choquen entre sí y suenen como un xilófono.",
  "It crosses its knifelike arms in front of its chest when it cries. It can compose melodies ad lib." =>
    "Cruza sus brazos, afilados como cuchillas, frente a su pecho cuando canta. Puede componer melodías improvisadas.",
  "All of its fur dazzles if danger is sensed. It flees while the foe is momentarily blinded." =>
    "Todo su pelaje deslumbra si percibe peligro. Huye mientras su rival queda momentáneamente cegado.",
  "Its claws loose electricity with enough amperage to cause fainting. They live in small groups." =>
    "Sus garras liberan electricidad con suficiente amperaje como para provocar desmayos. Viven en pequeños grupos.",
  "It has eyes that can see through anything. It spots and captures prey hiding behind objects." =>
    "Tiene ojos capaces de ver a través de cualquier cosa. Detecta y captura presas escondidas tras objetos.",
  "Over the winter, it closes its bud and endures the cold. In spring, the bud opens and releases pollen." =>
    "Durante el invierno cierra su capullo y soporta el frío. En primavera, el capullo se abre y libera polen.",
  "It attracts prey with a sweet aroma, then downs it with thorny whips hidden in its arms." =>
    "Atrae a sus presas con un aroma dulce y luego las derriba con látigos espinosos ocultos en sus brazos.",
  "It lived in jungles around 100 million years ago. Its skull is as hard as iron." =>
    "Vivía en las junglas hace unos 100 millones de años. Su cráneo es tan duro como el hierro.",
  "Its powerful head butt has enough power to shatter even the most durable things upon impact." =>
    "Su poderoso cabezazo tiene fuerza suficiente para destrozar al impacto incluso las cosas más resistentes.",
  "A Pokémon that lived in jungles around 100 million years ago. Its facial hide is extremely hard." =>
    "Un Pokémon que vivía en las junglas hace unos 100 millones de años. La piel de su rostro es extremadamente dura.",
  "Any frontal attack is repulsed. It is a docile Pokémon that feeds on grass and berries." =>
    "Repele cualquier ataque frontal. Es un Pokémon dócil que se alimenta de hierba y bayas.",
  "To shelter itself from cold, wintry winds, it covers itself with a cloak made of twigs and leaves." =>
    "Para protegerse de los fríos vientos invernales, se cubre con un manto hecho de ramitas y hojas.",
  "When Burmy evolved, its cloak became a part of this Pokémon's body. The cloak is never shed." =>
    "Cuando Burmy evolucionó, su manto pasó a formar parte del cuerpo de este Pokémon. Nunca se lo quita.",
  "It loves the honey of flowers and steals honey collected by Combee." =>
    "Adora la miel de las flores y roba la miel que recolectan los Combee.",
  "A Pokémon formed by three others. It busily carries sweet floral honey to Vespiquen." =>
    "Un Pokémon formado por otros tres. Transporta afanosamente dulce miel floral hasta Vespiquen.",
  "Its abdomen is a honeycomb for grubs. It raises its grubs on honey collected by Combee." =>
    "Su abdomen es un panal para sus larvas. Las cría con la miel que recolectan los Combee.",
  "It makes fur balls that crackle with static electricity. It stores them with berries in tree holes." =>
    "Fabrica bolas de pelo cargadas de electricidad estática. Las guarda junto con bayas en huecos de árboles.",
  "It has a flotation sac that is like an inflatable collar. It floats on water with its head out." =>
    "Tiene un saco flotador como un collar inflable. Flota en el agua con la cabeza fuera.",
  "It floats using its well-developed flotation sac. It assists in the rescues of drowning people." =>
    "Flota gracias a su saco flotador muy desarrollado. Ayuda a rescatar a personas que se ahogan.",
  "The small ball holds the nutrients needed for evolution. Apparently, it is very sweet and tasty." =>
    "La pequeña bola contiene los nutrientes necesarios para su evolución. Al parecer, es muy dulce y sabrosa.",
  "Its folded petals are pretty tough. Bird Pokémon can peck at them all they want, and Cherrim won't be bothered at all." =>
    "Sus pétalos plegados son bastante resistentes. Los Pokémon pájaro pueden picotearlos todo lo que quieran, que a Cherrim no le molesta en absoluto.",
  "This Pokémon's habitat shapes its physique. According to some theories, life in warm ocean waters causes this variation to develop." =>
    "El hábitat de este Pokémon determina su físico. Según algunas teorías, vivir en aguas oceánicas cálidas hace que se desarrolle esta variante.",
  "Its search for food sometimes leads it onto land, where it leaves behind a sticky trail of slime as it passes through." =>
    "Su búsqueda de alimento a veces lo lleva a tierra firme, donde deja tras de sí un rastro pegajoso de baba.",
  "To eat, it deftly shucks nuts with its two tails. It rarely uses its arms now." =>
    "Para comer, pela frutos secos con habilidad usando sus dos colas. Ahora casi no usa los brazos.",
  "A Pokémon formed by the spirits of people and Pokémon. It loves damp, humid seasons." =>
    "Un Pokémon formado por los espíritus de personas y Pokémon. Adora las estaciones húmedas.",
  "It's drowzy in daytime, but flies off in the evening in big groups. No one knows where they go." =>
    "Está somnoliento de día, pero al anochecer emprende el vuelo en grandes grupos. Nadie sabe adónde van.",
  "It slams foes by sharply uncoiling its rolled ears. It stings enough to make a grown-up cry in pain." =>
    "Golpea a sus rivales desenrollando bruscamente sus orejas enroscadas. El golpe duele lo suficiente como para hacer llorar a un adulto.",
  "An extremely cautious Pokémon. It cloaks its body with its fluffy ear fur when it senses danger." =>
    "Un Pokémon extremadamente cauteloso. Se envuelve el cuerpo con el pelaje esponjoso de sus orejas cuando percibe peligro.",
  "Its cries sound like incantations. Those hearing it are tormented by headaches and hallucinations." =>
    "Sus gritos suenan como conjuros. Quienes los escuchan sufren dolores de cabeza y alucinaciones.",
  "Becoming active at night, it is known to swarm with numerous Murkrow in tow." =>
    "Se activa de noche y se sabe que se desplaza en enjambre acompañado de numerosos Murkrow.",
  "It claws if displeased and purrs when affectionate. Its fickleness is very popular among some." =>
    "Araña si algo le disgusta y ronronea cuando está cariñoso. Su carácter voluble es muy popular entre algunos.",
  "It is a brazen brute that barges its way into another Pokémon's nest and claims it as its own." =>
    "Es un bruto descarado que irrumpe en el nido de otro Pokémon y se apropia de él.",
  "It emits cries by agitating an orb at the back of its throat. It moves with flouncing hops." =>
    "Emite sonidos agitando una esfera al fondo de su garganta. Se desplaza dando saltitos vivaces.",
  "It protects itself by spraying a noxious fluid from its rear. The stench lingers for 24 hours." =>
    "Se protege rociando un líquido nocivo desde su trasero. El hedor persiste durante 24 horas.",
  "It sprays a vile-smelling fluid from the tip of its tail to attack. Its range is over 160 feet." =>
    "Ataca rociando un líquido de olor repugnante desde la punta de su cola. Su alcance supera los 50 metros.",
  "Implements shaped like it were discovered in ancient tombs. It is unknown if they are related." =>
    "Se han descubierto herramientas con su forma en tumbas antiguas. Se desconoce si tienen relación con él.",
  "One caused a news sensation when it was dug up at a construction site after a 2,000-year sleep." =>
    "Uno de ellos causó sensación en las noticias al ser desenterrado en una obra tras 2.000 años de sueño.",
  "It looks as if it is always crying. It is actually adjusting its body's fluid levels by eliminating excess." =>
    "Parece estar siempre llorando, pero en realidad está regulando los niveles de fluidos de su cuerpo eliminando el exceso.",
  "It habitually mimics foes. Once mimicked, the foe cannot take its eyes off this Pokémon." =>
    "Suele imitar a sus rivales. Una vez imitado, el rival no puede apartar la vista de este Pokémon.",
  "It loves round white things. It carries an egg-shaped rock in imitation of Chansey." =>
    "Le encantan las cosas blancas y redondas. Carga una roca con forma de huevo imitando a Chansey.",
  "It can learn and speak human words. If they gather, they all learn the same saying." =>
    "Puede aprender y pronunciar palabras humanas. Si se reúnen varios, todos aprenden la misma frase.",
  "A Pokémon that was formed by 108 spirits. It is bound to a fissure in an odd keystone." =>
    "Un Pokémon formado por 108 espíritus. Está atado a una grieta en una extraña piedra clave.",
  "It nests in small, horizontal holes in cave walls. It pounces to catch prey that stray too close." =>
    "Anida en pequeños agujeros horizontales en paredes de cuevas. Salta para atrapar a las presas que se acercan demasiado.",
  "There is a long-held belief that medicine made from its scales will heal even incurable illnesses." =>
    "Existe la antigua creencia de que la medicina hecha con sus escamas cura hasta las enfermedades incurables.",
  "When it folds up its body and extends its wings, it looks like a jet plane. It flies at sonic speed." =>
    "Cuando pliega su cuerpo y extiende sus alas, parece un avión a reacción. Vuela a velocidad supersónica.",
  "It wolfs down its weight in food once a day, swallowing food whole with almost no chewing." =>
    "Devora su propio peso en comida una vez al día, tragándola entera sin apenas masticar.",
  "The aura that emanates from its body intensifies to alert others if it is afraid or sad." =>
    "El aura que emana de su cuerpo se intensifica para alertar a los demás si siente miedo o tristeza.",
  "It has the ability to sense the auras of all things. It understands human speech." =>
    "Tiene la capacidad de percibir el aura de todas las cosas. Entiende el habla humana.",
  "It lives in arid places. Instead of perspiration, it expels grainy sand from its body." =>
    "Vive en lugares áridos. En lugar de sudar, expulsa arena granulada de su cuerpo.",
  "It blasts internally stored sand from ports on its body to create a towering twister for attack." =>
    "Expulsa arena almacenada en su interior por orificios de su cuerpo para crear un tornado gigantesco con el que atacar.",
  "It grips prey with its tail claws and injects poison. It tenaciously hangs on until the poison takes." =>
    "Sujeta a sus presas con las garras de la cola e inyecta veneno. Se aferra con tenacidad hasta que el veneno hace efecto.",
  "It has the power in its clawed arms to make scrap of a car. The tips of its claws release poison." =>
    "Sus brazos con garras tienen la fuerza para hacer chatarra de un auto. La punta de sus garras libera veneno.",
  "Its cheeks hold poison sacs. It tries to catch foes off guard to jab them with toxic fingers." =>
    "Sus mejillas contienen sacos de veneno. Intenta pillar desprevenidos a sus rivales para pincharlos con sus dedos tóxicos.",
  "Its knuckle claws secrete a toxin so vile that even a scratch could prove fatal." =>
    "Las garras de sus nudillos segregan una toxina tan vil que hasta un simple rasguño puede ser mortal.",
  "It attracts prey with its sweet-smelling saliva, then chomps down. It takes a whole day to eat prey." =>
    "Atrae a sus presas con su saliva de dulce aroma y luego las muerde. Tarda un día entero en comer a su presa.",
  "After long exposure to sunlight, the patterns on its tail fins shine vividly when darkness arrives." =>
    "Tras una larga exposición al sol, los patrones de sus aletas caudales brillan intensamente al llegar la oscuridad.",
  "It lives on the deep-sea floor. It attracts prey by flashing the patterns on its four tail fins." =>
    "Vive en el fondo del mar profundo. Atrae a sus presas haciendo brillar los patrones de sus cuatro aletas caudales.",
  "A friendly Pokémon that captures the subtle flows of seawater using its two antennae." =>
    "Un Pokémon amigable que capta las sutiles corrientes del agua marina con sus dos antenas.",
  "It lives on snowy mountains. Having had little contact with humans, it is boldly inquisitive." =>
    "Vive en montañas nevadas. Al haber tenido poco contacto con humanos, es audazmente curioso.",
  "It whips up blizzards in mountains that are always buried in snow. It is the abominable snowman." =>
    "Levanta ventiscas en montañas siempre cubiertas de nieve. Es el abominable hombre de las nieves.",
  "They live in cold regions, forming groups of four or five that hunt prey with impressive coordination." =>
    "Viven en regiones frías, formando grupos de cuatro o cinco que cazan a sus presas con una coordinación impresionante.",
  "It evolved from exposure to a special magnetic field. Three units generate magnetism." =>
    "Evolucionó tras exponerse a un campo magnético especial. Tres unidades generan magnetismo.",
  "It wraps things with its extensible tongue. Getting too close to it will leave you soaked with drool." =>
    "Envuelve las cosas con su lengua extensible. Acercarse demasiado deja empapado de baba.",
  "It puts rocks in holes in its palms and uses its muscles to shoot them. Geodude are shot at rare times." =>
    "Coloca rocas en los agujeros de sus palmas y usa sus músculos para dispararlas. En raras ocasiones dispara Geodude.",
  "It ensnares prey by extending arms made of vines. Losing arms to predators does not trouble it." =>
    "Atrapa a sus presas extendiendo brazos hechos de enredaderas. Perder brazos ante depredadores no le preocupa.",
  "It pushes the tips of its two tails against the foe, then lets loose with over 20,000 volts of power." =>
    "Presiona las puntas de sus dos colas contra el rival y descarga más de 20.000 voltios de potencia.",
  "It blasts fireballs of over 3,600 degrees F from the ends of its arms. It lives in volcanic craters." =>
    "Lanza bolas de fuego de más de 2.000 °C desde las puntas de sus brazos. Vive en cráteres volcánicos.",
  "It will never appear where there is strife. Its sightings have become rare recently." =>
    "Nunca aparece donde hay conflicto. Sus avistamientos se han vuelto raros últimamente.",
  "By churning its wings, it creates shock waves that inflict critical internal injuries to foes." =>
    "Agitando sus alas crea ondas expansivas que provocan lesiones internas graves a sus rivales.",
  "Just like a plant, it uses photosynthesis. As a result, it is always enveloped in clear air." =>
    "Al igual que una planta, realiza fotosíntesis. Por eso siempre está envuelto en aire puro.",
  "As a protective technique, it can completely freeze its fur to make its hairs stand like needles." =>
    "Como técnica defensiva, puede congelar por completo su pelaje para que los pelos se erizen como agujas.",
  "It observes prey while hanging inverted from branches. When the chance presents itself, it swoops!" =>
    "Observa a sus presas colgado boca abajo de las ramas. ¡Cuando surge la oportunidad, se lanza en picada!",
  "Its impressive tusks are made of ice. The population thinned when it turned warm after the ice age." =>
    "Sus impresionantes colmillos están hechos de hielo. Su población disminuyó cuando el clima se volvió cálido tras la era glacial.",
  "Additional software was installed to make it a better Pokémon. It began acting oddly, however." =>
    "Se le instaló software adicional para convertirlo en un Pokémon mejor, pero empezó a comportarse de forma extraña.",
  "A master of courtesy and swordsmanship, it fights using extending swords on its elbows." =>
    "Un maestro de la cortesía y la esgrima, combate usando espadas extensibles en sus codos.",
  "It exudes strong magnetism from all over. It controls three small units called Mini-Noses." =>
    "Desprende un fuerte magnetismo por todo su cuerpo. Controla tres pequeñas unidades llamadas mini narices.",
  "The antenna on its head captures radio waves from the world of spirits that command it to take people there." =>
    "La antena de su cabeza capta ondas de radio del mundo de los espíritus que le ordenan llevar personas allí.",
  "It freezes foes with an icy breath nearly -60 degrees F. What seems to be its body is actually hollow." =>
    "Congela a sus rivales con un aliento helado de casi -50 °C. Lo que parece ser su cuerpo en realidad está hueco.",
  "Its body is composed of plasma. It is known to infiltrate electronic devices and wreak havoc." =>
    "Su cuerpo está compuesto de plasma. Se sabe que se infiltra en dispositivos electrónicos y causa estragos.",
  "Known as \"The Being of Knowledge.\" It is said that it can wipe out the memory of those who see its eyes." =>
    "Conocido como \"el ser del conocimiento\". Se dice que puede borrar la memoria de quien mire sus ojos.",
  "Known as \"The Being of Emotion.\" It taught humans the nobility of sorrow, pain, and joy." =>
    "Conocido como \"el ser de la emoción\". Enseñó a los humanos la nobleza de la tristeza, el dolor y la alegría.",
  "Known as \"The Being of Willpower.\" It sleeps at the bottom of a lake to keep the world in balance." =>
    "Conocido como \"el ser de la voluntad\". Duerme en el fondo de un lago para mantener el equilibrio del mundo.",
  "It has the power to control time. It appears in Sinnoh-region myths as an ancient deity." =>
    "Tiene el poder de controlar el tiempo. Aparece en los mitos de la región de Sinnoh como una deidad ancestral.",
  "It has the ability to distort space. It is described as a deity in Sinnoh-region mythology." =>
    "Tiene la capacidad de distorsionar el espacio. Se lo describe como una deidad en la mitología de la región de Sinnoh.",
  "It dwells in volcanic caves. It digs in with its cross-shaped feet to crawl on ceilings and walls." =>
    "Habita en cuevas volcánicas. Se aferra con sus patas en forma de cruz para trepar por techos y paredes.",
  "There is an enduring legend that states this Pokémon towed continents with ropes." =>
    "Existe una leyenda que perdura y que dice que este Pokémon arrastró continentes con cuerdas.",
  "A Pokémon that is said to live in a world on the reverse side of ours. It appears in an ancient cemetery." =>
    "Un Pokémon que se dice que vive en un mundo opuesto al nuestro. Aparece en un antiguo cementerio.",
  "Shiny particles are released from its wings like a veil. It is said to represent the crescent moon." =>
    "De sus alas se desprenden partículas brillantes como un velo. Se dice que representa a la luna creciente.",
  "A Pokémon that lives in warm seas. It inflates the flotation sac on its head to drift and search for food." =>
    "Un Pokémon que vive en mares cálidos. Infla el saco flotador de su cabeza para dejarse llevar por la corriente en busca de comida.",
  "Born on a cold seafloor, it will swim great distances to return to its birthplace." =>
    "Nacido en un frío fondo marino, nadará grandes distancias para regresar a su lugar de nacimiento.",
  "It can lull people to sleep and make them dream. It is active during nights of the new moon." =>
    "Puede hacer que las personas se duerman y sueñen. Se activa durante las noches de luna nueva.",
  "It lives in flower patches and avoids detection by curling up to look like a flowering plant." =>
    "Vive en campos de flores y evita ser detectado enroscándose para parecer una planta en flor.",
  "It is described in mythology as the Pokémon that shaped the universe with its 1,000 arms." =>
    "Se lo describe en la mitología como el Pokémon que dio forma al universo con sus 1.000 brazos.",
  "This Pokémon brings victory. It is said that Trainers with Victini always win, regardless of the type of encounter." =>
    "Este Pokémon trae la victoria. Se dice que los entrenadores que tienen a Victini siempre ganan, sin importar el tipo de enfrentamiento.",
  "They photosynthesize by bathing their tails in sunlight. When they are not feeling well, their tails droop." =>
    "Realizan la fotosíntesis bañando sus colas con la luz del sol. Cuando no se sienten bien, sus colas se marchitan.",
  "They avoid attacks by sinking into the shadows of thick foliage. They retaliate with masterful whipping techniques." =>
    "Evitan los ataques ocultándose entre las sombras del follaje espeso. Contraatacan con magistrales técnicas de látigo.",
  "They raise their heads to intimidate opponents, but only give it their all when fighting a powerful opponent." =>
    "Alzan la cabeza para intimidar a sus rivales, pero solo dan todo de sí cuando enfrentan a un oponente poderoso.",
  "It blows fire through its nose. When it catches a cold, the fire becomes pitch-black smoke instead." =>
    "Expulsa fuego por la nariz. Cuando se resfría, el fuego se convierte en humo negro como el carbón.",
  "Whatever it eats becomes fuel for the flame in its stomach. When it is angered, the intensity of the flame increases." =>
    "Todo lo que come se convierte en combustible para la llama de su estómago. Cuando se enfurece, la intensidad de la llama aumenta.",
  "It can throw a fire punch by setting its fists on fire with its fiery chin. It cares deeply about its friends." =>
    "Puede lanzar un puñetazo de fuego prendiendo sus puños con la llama de su mentón. Se preocupa profundamente por sus amigos.",
}

apply_dex_dict(DICT)
