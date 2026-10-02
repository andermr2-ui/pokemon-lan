# encoding: UTF-8
require_relative "apply_dex_common"

DICT = {
  "The gear with the red core is rotated at high speed for a rapid energy charge." =>
    "El engranaje con el núcleo rojo gira a gran velocidad para una carga de energía rápida.",
  "These Pokémon move in schools. They have an electricity-generating organ, so they discharge electricity if in danger." =>
    "Estos Pokémon se desplazan en cardúmenes. Tienen un órgano que genera electricidad y la descargan si están en peligro.",
  "These Pokémon have a big appetite. When they spot their prey, they attack it and paralyze it with electricity." =>
    "Estos Pokémon tienen un apetito voraz. Cuando avistan a su presa, la atacan y la paralizan con electricidad.",
  "With their sucker mouths, they suck in prey. Then they use their fangs to shock the prey with electricity." =>
    "Con sus bocas de ventosa succionan a sus presas. Luego usan sus colmillos para electrocutarlas.",
  "This Pokémon had never been seen until it appeared from far in the desert 50 years ago." =>
    "Este Pokémon nunca había sido visto hasta que apareció desde lo profundo del desierto hace 50 años.",
  "It uses psychic power to control an opponent's brain and tamper with its memories." =>
    "Usa su poder psíquico para controlar el cerebro de su rival y manipular sus recuerdos.",
  "While shining a light and pretending to be a guide, it leeches off the life force of any who follow it." =>
    "Mientras brilla fingiendo ser una guía, drena la energía vital de quien lo siga.",
  "It arrives near the moment of death and steals spirit from the body." =>
    "Aparece cerca del momento de la muerte y roba el espíritu del cuerpo.",
  "Being consumed in Chandelure's flame burns up the spirit, leaving the body behind." =>
    "Ser consumido por la llama de Chandelure quema el espíritu, dejando el cuerpo atrás.",
  "They mark their territory by leaving gashes in trees with their tusks. If a tusk breaks, a new one grows in quickly." =>
    "Marcan su territorio dejando marcas en los árboles con sus colmillos. Si un colmillo se rompe, otro crece rápidamente.",
  "Their tusks can shatter rocks. Territory battles between Fraxure can be intensely violent." =>
    "Sus colmillos pueden hacer añicos rocas. Las luchas territoriales entre Fraxure pueden ser extremadamente violentas.",
  "Their sturdy tusks will stay sharp even if used to cut steel beams. These Pokémon are covered in hard armor." =>
    "Sus resistentes colmillos permanecen afilados aunque se usen para cortar vigas de acero. Estos Pokémon están cubiertos de una armadura dura.",
  "Its nose is always running. It sniffs the snot back up because the mucus provides the raw material for its moves." =>
    "Siempre tiene la nariz mocosa. Se suena hacia adentro porque el moco es la materia prima de sus movimientos.",
  "It freezes its breath to create fangs and claws of ice to fight with. Cold northern areas are its habitat." =>
    "Congela su aliento para crear colmillos y garras de hielo con los que combatir. Su hábitat son las frías regiones del norte.",
  "They are born in snow clouds. They use chains made of ice crystals to capture prey." =>
    "Nacen en nubes de nieve. Usan cadenas de cristales de hielo para capturar a sus presas.",
  "It evolves when bathed in an electric-like energy along with Karrablast. The reason is still unknown." =>
    "Evoluciona al ser bañado por una energía similar a la eléctrica junto con Karrablast. Aún se desconoce el motivo.",
  "Having removed its heavy shell, it becomes very light and can fight with ninja-like movements." =>
    "Tras deshacerse de su pesado caparazón, se vuelve muy ligero y puede combatir con movimientos propios de un ninja.",
  "It conceals itself in the mud of the seashore. Then it waits. When prey touch it, it delivers a jolt of energy." =>
    "Se oculta en el barro de la orilla del mar y espera. Cuando una presa lo toca, le da una descarga de energía.",
  "They have mastered elegant combos. As they concentrate, their battle moves become swifter and more precise." =>
    "Han dominado combos elegantes. A medida que se concentran, sus movimientos de combate se vuelven más rápidos y precisos.",
  "They use the long fur on their arms as a whip to strike their opponents." =>
    "Usan el pelo largo de sus brazos como látigo para golpear a sus rivales.",
  "It races through narrow caves, using its sharp claws to catch prey. Then skin on its face is harder than a rock." =>
    "Corre por cuevas estrechas usando sus afiladas garras para atrapar presas. La piel de su rostro es más dura que una roca.",
  "These Pokémon are thought to have been created by the science of an ancient and mysterious civilization." =>
    "Se cree que estos Pokémon fueron creados por la ciencia de una antigua y misteriosa civilización.",
  "It is said that Golurk were ordered to protect people and Pokémon by the ancient people who made them." =>
    "Se dice que los antiguos que crearon a Golurk les ordenaron proteger a personas y Pokémon.",
  "They fight at Bisharp's command. They cling to their prey and inflict damage by sinking their blades into it." =>
    "Combaten a las órdenes de Bisharp. Se aferran a sus presas y les infligen daño clavándoles sus cuchillas.",
  "Bisharp pursues prey in the company of a large group of Pawniard. Then Bisharp finishes off the prey." =>
    "Bisharp persigue a sus presas acompañado de un gran grupo de Pawniard. Luego Bisharp remata a la presa.",
  "They charge wildly and headbutt everything. They headbutts have enough destructive force to derail a train." =>
    "Embisten salvajemente y dan cabezazos a todo. Sus cabezazos tienen fuerza destructiva suficiente para descarrilar un tren.",
  "They will challenge anything, even strong opponents, without fear. Their frequent fights help them become stronger." =>
    "Desafían a cualquiera, incluso a rivales fuertes, sin temor. Sus frecuentes peleas los ayudan a volverse más fuertes.",
  "The more scars they have, the more respect these brave soldiers of the sky get from their peers." =>
    "Cuantas más cicatrices tienen, más respeto reciben de sus pares estos valientes soldados del cielo.",
  "They tend to guard their posteriors with suitable bones they have found. They pursue weak Pokémon." =>
    "Suelen protegerse la retaguardia con huesos apropiados que encuentran. Persiguen a Pokémon débiles.",
  "Watching from the sky, they swoop to strike weakened Pokémon on the ground. They decorate themselves with bones." =>
    "Vigilan desde el cielo y se lanzan en picada para golpear a Pokémon debilitados en tierra. Se decoran con huesos.",
  "Using their very hot, flame-covered tongues, they burn through Durant's steel bodies and consume their insides." =>
    "Con sus lenguas cubiertas de llamas y muy calientes, queman el cuerpo de acero de Durant y devoran su interior.",
  "Durant dig nests in mountains. They build their complicated, interconnected tunnels in mazes." =>
    "Durant cava nidos en las montañas. Construyen túneles complicados e interconectados en forma de laberinto.",
  "They cannot see, so they tackle and bite to learn about their surroundings. Their bodies are covered in wounds." =>
    "No pueden ver, así que embisten y muerden para conocer su entorno. Su cuerpo está cubierto de heridas.",
  "Since their two heads do not get along and compete with each other for food, they always eat too much." =>
    "Como sus dos cabezas no se llevan bien y compiten por la comida, siempre comen demasiado.",
  "The heads on their arms do not have brains. They use all three heads to consume and destroy everything." =>
    "Las cabezas de sus brazos no tienen cerebro. Usan sus tres cabezas para devorar y destruir todo a su paso.",
  "The base of volcanoes is where they make their homes. They shoot fire from their five horns to repel attacking enemies." =>
    "Hacen su hogar en la base de los volcanes. Disparan fuego desde sus cinco cuernos para repeler a los enemigos que los atacan.",
  "A sea of fire engulfs the surroundings of their battles, since they use their six wings to scatter their ember scales." =>
    "Un mar de fuego envuelve los alrededores de sus batallas, ya que usan sus seis alas para esparcir sus escamas incandescentes.",
  "It has a body and heart of steel. Its glare is sufficient to make even an unruly Pokémon obey it." =>
    "Tiene un cuerpo y un corazón de acero. Su mirada basta para hacer obedecer incluso al Pokémon más rebelde.",
  "Its charge is strong enough to break through a giant castle wall in one blow. This Pokémon is spoken of in legends." =>
    "Su embestida es lo bastante fuerte como para derribar la muralla de un castillo gigante de un solo golpe. Este Pokémon aparece en las leyendas.",
  "Its head sprouts horns as sharp as blades. Using whirlwind-like movements, it confounds and swiftly cuts opponents." =>
    "En su cabeza le crecen cuernos afilados como cuchillas. Con movimientos como torbellinos, confunde y corta con rapidez a sus rivales.",
  "Tornadus expels massive energy from its tail, causing severe storms. Its power is great enough to blow houses away." =>
    "Tornadus expulsa una energía masiva desde su cola, provocando tormentas severas. Su poder es capaz de arrasar casas.",
  "The spikes on its tail discharge immense bolts of lightning. It flies around the Unova region firing off lightning bolts." =>
    "Las púas de su cola descargan enormes rayos. Vuela por la región de Unova disparando rayos a su paso.",
  "When Reshiram's tail flares, the heat energy moves the atmosphere and changes the world's weather." =>
    "Cuando la cola de Reshiram se enciende, la energía calorífica mueve la atmósfera y cambia el clima del mundo.",
  "This Pokémon appears in legends. In its tail, it has a giant generator that creates electricity." =>
    "Este Pokémon aparece en las leyendas. En su cola tiene un generador gigante que crea electricidad.",
  "The energy that comes pouring from its tail increases the nutrition in the soil, making crops grow to great size." =>
    "La energía que brota de su cola aumenta la nutrición del suelo, haciendo que los cultivos crezcan enormemente.",
  "It generates a powerful, freezing energy inside itself, but its body became frozen when the energy leaked out." =>
    "Genera en su interior una poderosa energía gélida, pero su cuerpo se congeló cuando esa energía se filtró hacia afuera.",
  "It crosses the world, running over the surfaces of oceans and rivers. It appears at scenic waterfronts." =>
    "Recorre el mundo corriendo sobre la superficie de océanos y ríos. Aparece en costas de gran belleza escénica.",
  "Many famous songs have been inspired by the melodies that Meloetta plays." =>
    "Muchas canciones famosas se han inspirado en las melodías que toca Meloetta.",
  "This ancient bug Pokémon was altered by Team Plasma. They upgraded the cannon on its back." =>
    "Este antiguo Pokémon bicho fue alterado por el Equipo Plasma, que mejoró el cañón de su espalda.",
  "The quills on its head are usually soft. When it flexes them, the points become so hard and sharp that they can pierce rock." =>
    "Las púas de su cabeza suelen ser blandas. Al flexionarlas, sus puntas se vuelven tan duras y afiladas que pueden perforar rocas.",
  "They strengthen their lower bodies by running into one another. They are very kind and won't start fights." =>
    "Fortalecen la parte baja de su cuerpo embistiéndose entre sí. Son muy amables y no inician peleas.",
  "Its Tackle is forceful enough to flip a 50-ton tank. It shields its allies from danger with its own body." =>
    "Su placaje es lo bastante fuerte como para volcar un tanque de 50 toneladas. Protege a sus aliados del peligro con su propio cuerpo.",
  "As it walks, it munches on a twig in place of a snack. It intimidates opponents by puffing hot air out of its ears." =>
    "Mientras camina mastica una ramita a modo de bocadillo. Intimida a sus rivales expulsando aire caliente por las orejas.",
  "When the twig is plucked from its tail, friction sets the twig alight. The flame is used to send signals to its allies." =>
    "Cuando se arranca la ramita de su cola, la fricción la enciende. Usa esa llama para enviar señales a sus aliados.",
  "It gazes into the flame at the tip of its branch to achieve a focused state, which allows it to see into the future." =>
    "Contempla la llama en la punta de su rama para alcanzar un estado de concentración que le permite ver el futuro.",
  "It protects its skin by covering its body in delicate bubbles. Beneath its happy-go-lucky air, it keeps a watchful eye on its surroundings." =>
    "Protege su piel cubriendo su cuerpo con delicadas burbujas. Bajo su aire despreocupado, vigila atentamente su entorno.",
  "It can throw bubble-covered pebbles with precise control, hitting empty cans up to a hundred feet away." =>
    "Puede lanzar guijarros cubiertos de burbujas con precisión, golpeando latas vacías a más de 30 metros de distancia.",
  "It appears and vanishes with a ninja's grace. It toys with its enemies using swift movements, while slicing them with throwing stars of sharpest water." =>
    "Aparece y desaparece con la gracia de un ninja. Juega con sus enemigos con movimientos veloces, mientras los corta con shuriken hechos del agua más afilada.",
  "It has ears like shovels. Digging holes strengthens its ears so much that they can sever thick roots effortlessly." =>
    "Tiene orejas como palas. Cavar agujeros fortalece tanto sus orejas que puede cortar raíces gruesas sin esfuerzo.",
  "As powerful as an excavator, its ears can reduce dense bedrock to rubble. When it's finished digging, it lounges lazily." =>
    "Tan potentes como una excavadora, sus orejas pueden reducir a escombros el lecho rocoso más denso. Al terminar de cavar, descansa perezosamente.",
  "These friendly Pokémon send signals to one another with beautiful chirps and tail-feather movements." =>
    "Estos amigables Pokémon se envían señales entre sí con hermosos trinos y movimientos de las plumas de la cola.",
  "From its beak, it expels embers that set the tall grass on fire. Then it pounces on the bewildered prey that pop out of the grass." =>
    "Expulsa brasas por el pico que incendian la hierba alta. Luego se abalanza sobre las presas desconcertadas que salen de entre la hierba.",
  "In the fever of an exciting battle, it showers embers from the gaps between its feathers and takes to the air." =>
    "En el fragor de una batalla emocionante, esparce brasas por los huecos entre sus plumas y remonta vuelo.",
  "When under attack from bird Pokémon, it spews a poisonous black powder that causes paralysis on contact." =>
    "Cuando lo atacan Pokémon pájaro, arroja un polvo negro venenoso que causa parálisis al contacto.",
  "It lives hidden within thicket shadows. When predators attack, it quickly bristles the fur covering its body in an effort to threaten them." =>
    "Vive oculto entre las sombras de la maleza. Cuando lo atacan depredadores, eriza rápidamente el pelaje que cubre su cuerpo para amenazarlos.",
  "Vivillon with many different patterns are found all over the world. These patterns are affected by the climate of their habitat." =>
    "Hay Vivillon con muchos patrones diferentes repartidos por todo el mundo. Estos patrones dependen del clima de su hábitat.",
  "They set off on their own from their pride and live by themselves to become stronger. These hot-blooded Pokémon are quick to fight." =>
    "Se separan de su manada y viven solos para volverse más fuertes. Estos Pokémon de sangre caliente se lanzan a pelear con facilidad.",
  "With fiery breath of more than 6,000 degrees Celsius, they viciously threaten any challenger. The females protect the pride's cubs." =>
    "Con un aliento ígneo de más de 6.000 grados Celsius, amenazan ferozmente a cualquier retador. Las hembras protegen a las crías de la manada.",
  "When it finds a flower it likes, it dwells on that flower its whole life long. It floats in the wind's embrace with an untroubled heart." =>
    "Cuando encuentra una flor que le gusta, se instala en ella para toda la vida. Flota al abrazo del viento con el corazón tranquilo.",
  "It flutters around fields of flowers and cares for flowers that are starting to wilt. It draws out the power of flowers to battle." =>
    "Revolotea por campos de flores y cuida las que empiezan a marchitarse. Extrae el poder de las flores para combatir.",
  "It claims exquisite flower gardens as its territory, and it obtains power from basking in the energy emitted by flowering plants." =>
    "Reclama exquisitos jardines florales como su territorio y obtiene poder al bañarse en la energía que emiten las plantas en flor.",
  "If it has sunshine and water, it doesn't need to eat, because it can generate energy from the leaves on its back." =>
    "Con sol y agua no necesita comer, porque puede generar energía a partir de las hojas de su lomo.",
  "It can tell how its trainer is feeling by subtle shifts in the grip on its horns. This empathetic sense lets them run as if one being." =>
    "Puede saber cómo se siente su entrenador por sutiles cambios en el agarre de sus cuernos. Este sentido empático les permite correr como si fueran uno solo.",
  "It does its best to be taken seriously by its enemies, but its glare is not sufficiently intimidating. Chewing on a leaf is its trademark." =>
    "Hace todo lo posible por ser tomado en serio por sus enemigos, pero su mirada no resulta suficientemente intimidante. Masticar una hoja es su sello distintivo.",
  "It charges ahead and bashes its opponents like a berserker, uncaring about any hits it might take. Its arms are mighty enough to snap a telephone pole." =>
    "Carga hacia adelante y golpea a sus rivales como un berserker, sin importarle los golpes que reciba. Sus brazos son lo bastante poderosos como para partir un poste telefónico.",
  "Trimming its fluffy fur not only makes it more elegant but also increases the swiftness of its movements." =>
    "Recortar su pelaje esponjoso no solo lo hace más elegante, sino que también aumenta la rapidez de sus movimientos.",
  "The organ that emits its intense psychic power is sheltered by its ears to keep power from leaking out." =>
    "El órgano que emite su intenso poder psíquico está resguardado por sus orejas para evitar que el poder se filtre.",
  "Revealing the eyelike patterns on the insides of its ears will unleash its psychic powers. It normally keeps the patterns hidden, however." =>
    "Al mostrar los patrones con forma de ojo del interior de sus orejas, libera sus poderes psíquicos. Sin embargo, normalmente los mantiene ocultos.",
  "Apparently this Pokémon is born when a departed spirit inhabits a sword. It attaches itself to people and drinks their life force." =>
    "Al parecer, este Pokémon nace cuando el espíritu de un difunto habita una espada. Se aferra a las personas y bebe su fuerza vital.",
  "The complex attack patterns of its two swords are unstoppable, even for an opponent greatly accomplished at swordplay." =>
    "Los complejos patrones de ataque de sus dos espadas son imparables, incluso para un rival muy experto en la esgrima.",
  "In this defensive stance, Aegislash uses its steel body and a force field of spectral power to reduce the damage of any attack." =>
    "En esta postura defensiva, Aegislash usa su cuerpo de acero y un campo de fuerza de poder espectral para reducir el daño de cualquier ataque.",
  "It emits a scent that enraptures those who smell it. This fragrance changes depending on what it has eaten." =>
    "Emite un aroma que cautiva a quien lo huele. Esta fragancia cambia según lo que haya comido.",
  "It devises various scents, pleasant and unpleasant, and emits scents that its enemies dislike in order to gain an edge in battle." =>
    "Idea distintos aromas, agradables y desagradables, y emite los que disgustan a sus enemigos para obtener ventaja en batalla.",
  "To entangle its opponents in battle, it extrudes white threads as sweet and sticky as cotton candy." =>
    "Para enredar a sus rivales en batalla, expulsa hilos blancos tan dulces y pegajosos como algodón de azúcar.",
  "It can distinguish the faintest of scents. It puts its sensitive sense of smell to use by helping pastry chefs in their work." =>
    "Puede distinguir los aromas más leves. Aprovecha su sensible olfato para ayudar a los reposteros en su trabajo.",
  "It flashes the light-emitting spots on its body, which drains its opponent's will to fight. It takes the opportunity to scuttle away and hide." =>
    "Hace destellar los puntos luminosos de su cuerpo, lo que le quita a su rival las ganas de pelear. Aprovecha para escabullirse y esconderse.",
  "It lures prey close with hypnotic motions, then wraps its tentacles around it before finishing it off with digestive fluids." =>
    "Atrae a sus presas con movimientos hipnóticos, las envuelve con sus tentáculos y las remata con sus jugos digestivos.",
  "They stretch and then contract, yanking their rocks along with them in bold hops. They eat seaweed that washes up on the shoreline." =>
    "Se estiran y luego se contraen, arrastrando consigo sus rocas en atrevidos saltos. Comen las algas que llegan a la orilla.",
  "Barbaracle's legs and hands have minds of their own, and they will move independently. But they usually follow the head's orders." =>
    "Las patas y manos de Barbaracle tienen voluntad propia y se mueven de forma independiente, aunque suelen seguir las órdenes de la cabeza.",
  "Camouflaged as rotten kelp, they spray liquid poison on prey that approaches unawares and then finish it off." =>
    "Camuflados como algas podridas, rocían veneno líquido sobre las presas que se acercan desprevenidas y las rematan.",
  "Their poison is strong enough to eat through the hull of a tanker, and they spit it indiscriminately at anything that enters their territory." =>
    "Su veneno es tan potente que corroe el casco de un buque cisterna, y lo escupen sin distinción a todo lo que entra en su territorio.",
  "Through controlled expulsions of internal gas, it can expel water like a pistol shot. At close distances, it can shatter rock." =>
    "Mediante expulsiones controladas de gas interno, puede disparar agua como un pistoletazo. A corta distancia puede hacer añicos una roca.",
  "By expelling water from the nozzle in the back of its claw, it can move at a speed of 60 knots." =>
    "Al expulsar agua por la boquilla de la parte trasera de su pinza, puede desplazarse a una velocidad de 60 nudos.",
  "They make their home in deserts. They can generate their energy from basking in the sun, so eating food is not a requirement." =>
    "Hacen su hogar en desiertos. Pueden generar su energía tomando el sol, así que comer no es indispensable.",
  "They flare their frills and generate energy. A single Heliolisk can generate sufficient electricity to power a skyscraper." =>
    "Despliegan sus gorgueras y generan energía. Un solo Heliolisk puede generar electricidad suficiente para alimentar un rascacielos.",
  "Its immense jaws have enough destructive force that it can chew up an automobile. It lived 100 million years ago." =>
    "Sus enormes mandíbulas tienen fuerza destructiva suficiente para triturar un automóvil. Vivió hace 100 millones de años.",
  "Thanks to its gargantuan jaws, which could shred thick metal plates as if they were paper, it was invincible in the ancient world it once inhabited." =>
    "Gracias a sus mandíbulas gigantescas, capaces de desgarrar gruesas planchas de metal como si fueran papel, era invencible en el mundo antiguo que habitó.",
  "This ancient Pokémon was restored from part of its body that had been frozen in ice for over 100 million years." =>
    "Este antiguo Pokémon fue restaurado a partir de una parte de su cuerpo que permaneció congelada en hielo durante más de 100 millones de años.",
  "Using its diamond-shaped crystals, it can instantly create a wall of ice to block an opponent's attack." =>
    "Con sus cristales en forma de diamante puede crear al instante un muro de hielo para bloquear el ataque de un rival.",
  "Its ribbonlike feelers give off an aura that weakens hostility in its prey, causing them to let down their guard. Then it attacks." =>
    "Sus antenas en forma de cinta emiten un aura que debilita la hostilidad de sus presas, haciendo que bajen la guardia. Entonces ataca.",
}

apply_dex_dict(DICT)
