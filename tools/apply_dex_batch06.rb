# encoding: UTF-8
require_relative "apply_dex_common"

DICT = {
  "The scalchop on its stomach is made from the same elements as claws. It detaches the scalchop for use as a blade." =>
    "La valva de su estómago está hecha de los mismos elementos que las garras. La desprende para usarla como cuchilla.",
  "Scalchop techniques differ from one Dewott to another. It never neglects maintaining its scalchops." =>
    "Las técnicas con la valva varían de un Dewott a otro. Nunca descuida el mantenimiento de sus valvas.",
  "Part of the armor on its anterior legs becomes a giant sword. Its cry alone is enough to intimidate most enemies." =>
    "Parte de la armadura de sus patas delanteras se convierte en una espada gigante. Solo su grito basta para intimidar a la mayoría de sus enemigos.",
  "Extremely cautious, they take shifts to maintain a constant watch of their nest. They feel insecure without a lookout." =>
    "Extremadamente precavidos, se turnan para vigilar su nido sin descanso. Se sienten inseguros sin un vigía.",
  "They make the patterns on their bodies shine in order to threaten predators. Keen eyesight lets them see in the dark." =>
    "Hacen brillar los patrones de su cuerpo para amenazar a los depredadores. Su aguda vista les permite ver en la oscuridad.",
  "The long hair around its face provides an amazing radar that lets it sense subtle changes in its surroundings." =>
    "El pelo largo alrededor de su rostro funciona como un radar asombroso que le permite percibir cambios sutiles en su entorno.",
  "It loyally follows its Trainer's orders. For ages, they have helped Trainers raise Pokémon." =>
    "Sigue con lealtad las órdenes de su entrenador. Desde hace generaciones han ayudado a los entrenadores a criar Pokémon.",
  "This extremely wise Pokémon excels at rescuing people stranded at sea or in the mountains." =>
    "Este Pokémon extremadamente sabio destaca en el rescate de personas varadas en el mar o en las montañas.",
  "Its cute act is a ruse. When victims let down their guard, they find their items taken. It attacks with sharp claws." =>
    "Su actitud tierna es una treta. Cuando sus víctimas bajan la guardia, descubren que les robaron sus objetos. Ataca con garras afiladas.",
  "Stealthily, it sneaks up on its target, striking from behind before its victim has a chance to react." =>
    "Se acerca sigilosamente a su objetivo y golpea por la espalda antes de que su víctima pueda reaccionar.",
  "It shares the leaf on its head with weary-looking Pokémon. These leaves are known to relieve stress." =>
    "Comparte la hoja de su cabeza con Pokémon que se ven agotados. Se sabe que estas hojas alivian el estrés.",
  "Ill tempered, it fights by swinging its barbed tail around wildly. The leaf growing on its head is very bitter." =>
    "De mal genio, combate agitando salvajemente su cola con púas. La hoja que le crece en la cabeza es muy amarga.",
  "This Pokémon lives in caves in volcanoes. The fire within the tuft on its head can reach 600º F." =>
    "Este Pokémon vive en cuevas volcánicas. El fuego de su cabeza puede alcanzar los 315 °C.",
  "A flame burns inside its body. It scatters embers from its head and tail to sear its opponents." =>
    "Una llama arde dentro de su cuerpo. Esparce brasas desde su cabeza y cola para abrasar a sus rivales.",
  "It does not thrive in dry environments. It keeps itself damp by shooting water stored in its head tuft from its tail." =>
    "No prospera en ambientes secos. Se mantiene húmedo lanzando por la cola el agua almacenada en el penacho de su cabeza.",
  "The high-pressure water expelled from its tail is so powerful, it can destroy a concrete wall." =>
    "El agua a alta presión que expulsa por la cola es tan potente que puede destruir un muro de hormigón.",
  "It eats the dreams of people and Pokémon. When it eats a pleasant dreams, it expels pink-colored mist." =>
    "Se alimenta de los sueños de personas y Pokémon. Cuando come un sueño placentero, expulsa una neblina rosada.",
  "With the mist from its forehead, it can create shapes of things from dreams it has eaten." =>
    "Con la neblina de su frente puede crear formas de cosas provenientes de los sueños que ha comido.",
  "These Pokémon live in cities. They are accustomed to people. Flocks often gather in parks and plazas." =>
    "Estos Pokémon viven en ciudades y están acostumbrados a las personas. Suelen reunirse en bandadas en parques y plazas.",
  "Many people believe that, deep in the forest where Tranquill live, there is a peaceful place where there is no war." =>
    "Mucha gente cree que, en lo profundo del bosque donde viven los Tranquill, existe un lugar de paz donde no hay guerra.",
  "Males have plumage on their heads. They will never let themselves feel close to anyone other than their Trainers." =>
    "Los machos tienen plumaje en la cabeza. Nunca se permiten sentir apego por nadie que no sea su entrenador.",
  "When thunderclouds cover the sky, it will appear. It can catch lightning with its mane and store the electricity." =>
    "Aparece cuando el cielo se cubre de nubes de tormenta. Puede atrapar rayos con su melena y almacenar la electricidad.",
  "This ill-tempered Pokémon is dangerous because when it's angry, it shoots lightning from its mane in all directions." =>
    "Este Pokémon de mal genio es peligroso porque, cuando se enoja, dispara rayos en todas direcciones desde su melena.",
  "They were discovered a hundred years ago in an earthquake fissure. Inside each one is an energy core." =>
    "Fueron descubiertos hace cien años en una grieta provocada por un terremoto. En su interior hay un núcleo de energía.",
  "Because its energy was too great to be contained, the energy leaked and formed orange crystals." =>
    "Como su energía era demasiado grande para contenerla, se filtró y formó cristales anaranjados.",
  "The solar energy absorbed by its body's orange crystals is magnified internally and fired from its mouth." =>
    "La energía solar que absorben los cristales anaranjados de su cuerpo se amplifica internamente y se dispara por su boca.",
  "Suction from its nostrils enables it to stick to cave walls during sleep. It leaves a heart-shaped mark behind." =>
    "La succión de sus fosas nasales le permite adherirse a las paredes de las cuevas mientras duerme. Deja una marca en forma de corazón.",
  "Anyone who comes into contact with the ultrasonic waves emitted by a courting male experiences a positive mood shift." =>
    "Cualquiera que entre en contacto con las ondas ultrasónicas que emite un macho cortejando experimenta un cambio de humor positivo.",
  "It makes its way swiftly through the soil by putting both claws together and rotating at high speed." =>
    "Se abre paso velozmente por la tierra juntando sus garras y girando a gran velocidad.",
  "More than 300 feet below the surface, they build mazelike nests. Their activity can be destructive to subway tunnels." =>
    "A más de 90 metros bajo la superficie construyen nidos laberínticos. Su actividad puede llegar a dañar túneles de metro.",
  "Its auditory sense is astounding. It has a radar-like ability to understand its surrounding through slight sounds." =>
    "Su oído es asombroso. Tiene una habilidad similar a un radar para comprender su entorno a través de sonidos leves.",
  "These Pokémon appear at building sites and help out with construction. They always carry squared logs." =>
    "Estos Pokémon aparecen en obras de construcción y ayudan con el trabajo. Siempre cargan troncos cuadrados.",
  "They strengthen their bodies by carrying steel beams. They show off their big muscles to their friends." =>
    "Fortalecen su cuerpo cargando vigas de acero. Presumen sus grandes músculos ante sus amigos.",
  "They use concrete pillars as walking canes. They know moves that enable them to swing the pillars freely in battle." =>
    "Usan pilares de hormigón como bastones. Conocen movimientos que les permiten blandirlos libremente en batalla.",
  "By vibrating its cheeks, it emits sound waves imperceptible to humans. It uses the rhythm of these sounds to talk." =>
    "Vibrando sus mejillas emite ondas sonoras imperceptibles para los humanos. Usa el ritmo de esos sonidos para hablar.",
  "It lives in the water and on land. It uses its long, sticky tongue to capture prey." =>
    "Vive en el agua y en tierra. Usa su larga y pegajosa lengua para capturar presas.",
  "It increases the power of its punches by vibrating the bumps on its fists. It can turn a boulder to rubble with one punch." =>
    "Aumenta la fuerza de sus golpes vibrando los bultos de sus puños. Puede reducir un peñasco a escombros de un solo puñetazo.",
  "When they encounter foes bigger than themselves, they try to throw them. They always travel in packs of five." =>
    "Cuando se topan con rivales más grandes que ellos, intentan derribarlos. Siempre viajan en grupos de cinco.",
  "Tying their belts gets them pumped and makes their punches more destructive. Disturbing their training angers them." =>
    "Atarse el cinturón los llena de energía y vuelve sus golpes más destructivos. Interrumpir su entrenamiento los enfurece.",
  "This Pokémon makes clothes for itself. It chews up leaves and sews them with sticky thread extruded from its mouth." =>
    "Este Pokémon se fabrica su propia ropa. Mastica hojas y las cose con un hilo pegajoso que expulsa por la boca.",
  "It protects itself from the cold by wrapping up in leaves. It stays on the move, eating leaves in forests." =>
    "Se protege del frío envolviéndose en hojas. Se mantiene en movimiento comiendo hojas en los bosques.",
  "It keeps its eggs warm with heat from fermenting leaves. It also uses leaves to make warm wrappings for Sewaddle." =>
    "Mantiene calientes sus huevos con el calor de hojas en fermentación. También usa hojas para hacer abrigos cálidos para los Sewaddle.",
  "It discovers what is going on around it by using the feelers on its head and tail. It is brutally aggresive." =>
    "Descubre lo que ocurre a su alrededor usando las antenas de su cabeza y cola. Es brutalmente agresivo.",
  "It is usually motionless, but when attacked, it rotates at high speed and then crashes into its opponent." =>
    "Suele estar inmóvil, pero cuando es atacado gira a gran velocidad y embiste a su rival.",
  "Highly aggressive, it uses the claws near its neck to dig into its opponents and poison them." =>
    "Muy agresivo, usa las garras cercanas a su cuello para clavarlas en sus rivales y envenenarlos.",
  "They go wherever the wind takes them. On rainy days, their bodies are heavier, so they take shelter beneath big trees." =>
    "Van a donde el viento los lleva. En días de lluvia su cuerpo pesa más, así que se refugian bajo grandes árboles.",
  "Riding whirlwinds, they appear. These Pokémon sneak through gaps into houses and cause all sorts of mischief." =>
    "Aparecen montados en remolinos de viento. Estos Pokémon se cuelan por rendijas en las casas y causan todo tipo de travesuras.",
  "Since they prefer moist, nutrient-rich soil, the areas where Petilil live are known to be good for growing plants." =>
    "Como prefieren un suelo húmedo y rico en nutrientes, se sabe que las zonas donde viven los Petilil son buenas para cultivar plantas.",
  "The fragrance of the garland on its head has a relaxing effect. It withers if a Trainer does not take good care of it." =>
    "La fragancia de la guirnalda de su cabeza tiene un efecto relajante. Se marchita si un entrenador no la cuida bien.",
  "Savage, violent Pokémon, red and blue Basculin are always fighting each other over territory." =>
    "Pokémon salvajes y violentos, los Basculin rojos y azules siempre luchan entre sí por el territorio.",
  "It moves along below the sand's surface, except for its nose and eyes. A dark membrane shields its eyes from the sun." =>
    "Se desplaza bajo la superficie de la arena, dejando solo la nariz y los ojos afuera. Una membrana oscura protege sus ojos del sol.",
  "The special membrane covering its eyes can sense the heat of objects, so it can see its surroundings, even in darkness." =>
    "La membrana especial que cubre sus ojos puede percibir el calor de los objetos, por lo que puede ver su entorno incluso en la oscuridad.",
  "It can expand the focus of its eyes, enabling it to see objects in the far distance as if it were using binoculars." =>
    "Puede ampliar el enfoque de sus ojos, lo que le permite ver objetos a gran distancia como si usara binoculares.",
  "Darumaka's droppings are hot, so people used to put them in their clothes to keep themselves warm." =>
    "Los excrementos de Darumaka están calientes, así que la gente solía guardarlos en su ropa para mantenerse abrigada.",
  "When weakened in battle, it transforms into a stone statue. Then it sharpens its mind and fights on mentally." =>
    "Cuando se debilita en batalla, se transforma en una estatua de piedra. Entonces agudiza su mente y sigue combatiendo mentalmente.",
  "Arid regions are their habitat. They move rhythmically, making a sound similar to maracas." =>
    "Su hábitat son las regiones áridas. Se mueven rítmicamente, produciendo un sonido similar al de las maracas.",
  "It makes a hole in a suitable rock. If that rock breaks, the Pokémon remains agitated until it locates a replacement." =>
    "Hace un agujero en una roca adecuada. Si esa roca se rompe, el Pokémon permanece agitado hasta encontrar un reemplazo.",
  "It possesses legs of enormous strength, enabling it to carry heavy slabs for many days, even when crossing arid land." =>
    "Posee patas de enorme fuerza que le permiten cargar losas pesadas durante muchos días, incluso al cruzar tierras áridas.",
  "It immediately headbutts anyone that makes eye contact with it. Its skull is massively thick." =>
    "Da un cabezazo de inmediato a quien lo mire a los ojos. Su cráneo es enormemente grueso.",
  "It can smash concrete blocks with its kicking attacks. The one with the biggest crest is the group leader." =>
    "Puede destrozar bloques de hormigón con sus patadas. El que tiene la cresta más grande es el líder del grupo.",
  "The guardians of an ancient city, they use their psychic power to attack enemies that invade their territory." =>
    "Guardianes de una antigua ciudad, usan su poder psíquico para atacar a los enemigos que invaden su territorio.",
  "These Pokémon arose from the spirits of people interred in graves in past ages. Each retains memories of its former life." =>
    "Estos Pokémon surgieron de los espíritus de personas enterradas en tumbas de épocas pasadas. Cada uno conserva recuerdos de su vida anterior.",
  "They pretend to be elaborate coffins to teach lessons to grave robbers. Their bodies are covered in pure gold." =>
    "Fingen ser ataúdes elaborados para dar una lección a los profanadores de tumbas. Sus cuerpos están cubiertos de oro puro.",
  "About 100 million years ago, these Pokémon swam in oceans. It is thought they also went on land to attack prey." =>
    "Hace unos 100 millones de años, estos Pokémon nadaban en los océanos. Se cree que también salían a tierra para atacar a sus presas.",
  "Incredible jaw strength enables them to chew up steel beams and rocks along with their prey." =>
    "La increíble fuerza de su mandíbula les permite masticar vigas de acero y rocas junto con sus presas.",
  "Revived from a fossil, this Pokémon is thought to be the ancestor of all bird Pokémon." =>
    "Resucitado a partir de un fósil, se cree que este Pokémon es el ancestro de todos los Pokémon pájaro.",
  "It runs better than it flies. It catches prey by running at speeds comparable to those of an automobile." =>
    "Corre mejor de lo que vuela. Atrapa a sus presas corriendo a velocidades comparables a las de un automóvil.",
  "The combination of garbage bags and industrial waste caused the chemical reaction that crated this Pokémon." =>
    "La combinación de bolsas de basura y residuos industriales provocó la reacción química que creó a este Pokémon.",
  "They absorb garbage and make it part of their bodies. They shoot a poisonous liquid from their right-hand fingertips." =>
    "Absorben basura y la incorporan a su cuerpo. Disparan un líquido venenoso desde las puntas de los dedos de su mano derecha.",
  "To protect themselves from danger, they hide their true identities by transforming into people and Pokémon." =>
    "Para protegerse del peligro, ocultan su verdadera identidad transformándose en personas y Pokémon.",
  "Each has the ability to fool a large group of people simultaneously. They protect their lair with illusory scenery." =>
    "Cada uno tiene la capacidad de engañar a un gran grupo de personas al mismo tiempo. Protegen su guarida con escenarios ilusorios.",
  "These Pokémon prefer a tidy habitat. They are always sweeping and dusting, using their tails as brooms." =>
    "Estos Pokémon prefieren un hábitat ordenado. Siempre están barriendo y quitando el polvo, usando sus colas como escobas.",
  "Their white fur feels amazing to touch. Their fur repels dust and prevents static electricity from building up." =>
    "Su pelaje blanco es una maravilla al tacto. Repele el polvo y evita que se acumule electricidad estática.",
  "They intently observe both Trainers and Pokémon. Apparently, they are looking at something that only Gothita can see." =>
    "Observan atentamente tanto a entrenadores como a Pokémon. Al parecer, miran algo que solo Gothita puede ver.",
  "Starlight is the source of their power. At night, they mark star positions by using psychic power to float stones." =>
    "La luz de las estrellas es la fuente de su poder. De noche marcan la posición de las estrellas haciendo flotar piedras con poder psíquico.",
  "They can predict the future from the placement and movement of the stars. They can see Trainers' life spans." =>
    "Pueden predecir el futuro a partir de la posición y el movimiento de las estrellas. Pueden ver la esperanza de vida de los entrenadores.",
  "Because their bodies are enveloped in a special liquid, they can survive in any environment." =>
    "Como su cuerpo está envuelto en un líquido especial, pueden sobrevivir en cualquier entorno.",
  "When their brains, now divided in two, are thinking the same thoughts, these Pokémon exhibit their maximum power." =>
    "Cuando sus cerebros, ahora divididos en dos, piensan lo mismo, estos Pokémon muestran su máximo poder.",
  "These remarkably intelligent Pokémon fight by controlling arms that can grip with rock-crushing power." =>
    "Estos Pokémon, notablemente inteligentes, combaten controlando brazos capaces de sujetar con una fuerza que tritura rocas.",
  "When attacked, it uses its feathers to splash water, escaping under cover of the spray." =>
    "Cuando es atacado, usa sus plumas para salpicar agua y escapa bajo la cobertura del rocío.",
  "It administers sharp, powerful pecks with its bill. It whips its long neck to deliver forceful repeated strikes." =>
    "Da picotazos agudos y potentes con su pico. Azota su largo cuello para dar golpes repetidos con fuerza.",
  "This Pokémon formed from icicles bathed in energy from the morning sun. It sleeps buried in snow." =>
    "Este Pokémon se formó a partir de carámbanos bañados por la energía del sol de la mañana. Duerme enterrado en la nieve.",
  "It conceals itself from enemy eyes by creating many small ice particles and hiding among them." =>
    "Se oculta de la vista de sus enemigos creando muchas partículas de hielo pequeñas y escondiéndose entre ellas.",
  "If both heads get angry simultaneously, this Pokémon expels a blizzard, burying everything in snow." =>
    "Si sus dos cabezas se enfurecen al mismo tiempo, este Pokémon expulsa una ventisca que lo entierra todo en nieve.",
  "The turning of the seasons changes the color and scent of this Pokémon's fur. People use it to mark the seasons." =>
    "El cambio de estaciones altera el color y el aroma del pelaje de este Pokémon. La gente lo usa para marcar las estaciones.",
  "The plants growing on its horns change according to the season. The leaders of the herd possess magnificent horns." =>
    "Las plantas que crecen en sus cuernos cambian según la estación. Los líderes de la manada poseen cuernos magníficos.",
  "They live on treetops and glide using the inside of a cape-like membrane while discharging electricity." =>
    "Viven en las copas de los árboles y planean usando el interior de una membrana en forma de capa mientras descargan electricidad.",
  "When they feel threatened, they spit an acidic liquid to drive attackers away. This Pokémon targets Shelmet." =>
    "Cuando se sienten amenazados, escupen un líquido ácido para ahuyentar a sus atacantes. Este Pokémon tiene como objetivo a Shelmet.",
  "These Pokémon evolve by wearing the shell covering of a Shelmet. The steel armor protects their whole body." =>
    "Estos Pokémon evolucionan al ponerse el caparazón de un Shelmet. La armadura de acero protege todo su cuerpo.",
  "For some reason, this Pokémon resembles a Poké Ball. They release poison spores to repel those who try to catch them." =>
    "Por alguna razón, este Pokémon se parece a una Poké Ball. Libera esporas venenosas para ahuyentar a quienes intentan capturarlo.",
  "They show off their Poké Ball caps to lure prey, but very few Pokémon are fooled by this." =>
    "Muestran sus sombreros con forma de Poké Ball para atraer presas, pero muy pocos Pokémon caen en el engaño.",
  "They paralyze prey with poison, then drag them down to their lairs, five miles below the surface." =>
    "Paralizan a sus presas con veneno y luego las arrastran hasta sus guaridas, ocho kilómetros bajo la superficie.",
  "They propel themselves by expelling absorbed seawater from their bodies. Their favorite food is life energy." =>
    "Se propulsan expulsando el agua de mar que absorben en su cuerpo. Su alimento favorito es la energía vital.",
  "Floating in the open sea is how they live. When they find a wounded Pokémon, they embrace it and bring it to shore." =>
    "Viven flotando en mar abierto. Cuando encuentran a un Pokémon herido, lo abrazan y lo llevan hasta la costa.",
  "They attach themselves to large-bodied Pokémon and absorb static electricity, which they store in an electric pouch." =>
    "Se aferran a Pokémon de cuerpo grande y absorben electricidad estática, que almacenan en una bolsa eléctrica.",
  "They employ an electrically charged web to trap their prey. While it is immobilized by shock, they leisurely consume it." =>
    "Usan una telaraña cargada de electricidad para atrapar a sus presas. Mientras están inmovilizadas por la descarga, las devoran con calma.",
  "They stick their spikes into cave walls and absorb the minerals they find in the rock." =>
    "Clavan sus púas en las paredes de las cuevas y absorben los minerales que encuentran en la roca.",
  "They attach themselves to cave ceilings, firing steel spikes at targets passing beneath them." =>
    "Se adhieren a los techos de las cuevas y disparan púas de acero a los objetivos que pasan por debajo.",
  "Interlocking two bodies and spinning around generates the energy they need to live." =>
    "Al engranar dos cuerpos y girar generan la energía que necesitan para vivir.",
  "Spinning minigears are rotated at high speed and repeatedly fired away. It is dangerous if the gears don't return." =>
    "Hace girar minirruedas dentadas a gran velocidad y las dispara repetidamente. Es peligroso si los engranajes no vuelven.",
}

apply_dex_dict(DICT)
