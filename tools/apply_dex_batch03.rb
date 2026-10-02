# encoding: UTF-8
require_relative "apply_dex_common"

DICT = {
  "This Pokémon is shaped like ancient text characters. Although research is ongoing, it is a mystery as to which came first, the ancient writings or the various Unown." =>
    "Este Pokémon tiene la forma de caracteres de una escritura antigua. Aunque la investigación continúa, sigue siendo un misterio qué apareció primero, si los escritos antiguos o los distintos Unown.",
  "Usually docile, a Wobbuffet strikes back ferociously if its black tail is attacked. It makes its lair in caves where it waits for nightfall." =>
    "Normalmente dócil, Wobbuffet contraataca con ferocidad si le atacan la cola negra. Hace su guarida en cuevas, donde espera a que caiga la noche.",
  "A Girafarig is an herbivore--it eats grass and tree shoots. While it is eating, its tail makes chewing and swallowing motions as if it were also eating." =>
    "Girafarig es herbívoro: come hierba y brotes de árboles. Mientras come, su cola hace movimientos de masticar y tragar, como si también estuviera comiendo.",
  "A Pineco hangs from a tree branch and waits for prey. While eating, if it is disturbed by someone shaking its tree, it falls on the ground and explodes." =>
    "Pineco cuelga de la rama de un árbol y espera a sus presas. Si mientras come alguien sacude su árbol y lo molesta, cae al suelo y explota.",
  "It keeps itself inside its steel shell. The shell is opened when it is catching prey, but it is so quick that the shell's inside cannot be seen." =>
    "Se mantiene dentro de su caparazón de acero. El caparazón se abre cuando atrapa a sus presas, pero es tan rápido que no se puede ver el interior.",
  "Its drill-tipped tail is used to burrow into the ground backwards. This Pokémon is known to make its nest in complex shapes deep under the ground." =>
    "Usa su cola con punta de taladro para excavar en el suelo hacia atrás. Se sabe que este Pokémon hace su nido con formas complejas en las profundidades de la tierra.",
  "It glides without making a single sound. It grasps the face of its foe using its hind and large front claws, then stabs with its poison barb." =>
    "Planea sin hacer el más mínimo ruido. Agarra la cara de su rival con sus garras traseras y sus grandes garras delanteras, y luego lo apuñala con su aguijón venenoso.",
  "Steelix live even further underground than Onix. This Pokémon is known to dig toward the earth's core, reaching a depth of over six-tenths of a mile underground." =>
    "Los Steelix viven aún más profundo bajo tierra que los Onix. Se sabe que este Pokémon excava hacia el núcleo terrestre, alcanzando profundidades de más de un kilómetro.",
  "By baring its fangs and making a scary face, it sends smaller Pokémon scurrying in terror. The Snubbull does seem a little sad at making its foes flee." =>
    "Al mostrar los colmillos y poner cara de miedo, hace que los Pokémon más pequeños huyan aterrorizados. Snubbull parece entristecerse un poco al hacer huir a sus rivales.",
  "It has a particularly well-developed lower jaw. The huge fangs are heavy, causing it to tilt its head. Unless it is startled, it will not try to bite." =>
    "Tiene la mandíbula inferior particularmente desarrollada. Sus enormes colmillos pesan tanto que hacen que incline la cabeza. A menos que se asuste, no intentará morder.",
  "A Qwilfish uses the pressure of water it swallows to shoot toxic quills all at once from all over its body. It finds swimming to be somewhat challenging." =>
    "Qwilfish usa la presión del agua que traga para disparar de golpe púas tóxicas por todo su cuerpo. Nadar le resulta bastante difícil.",
  "A Scizor has a body with the hardness of steel. It is not easily fazed by ordinary sorts of attacks. It flaps its wings to regulate its body temperature." =>
    "Scizor tiene un cuerpo con la dureza del acero. No se inmuta fácilmente ante ataques comunes. Agita las alas para regular la temperatura de su cuerpo.",
  "A Shuckle hides under rocks, keeping its body concealed inside its shell while eating stored berries. The berries mix with its body fluids to become a juice." =>
    "Shuckle se esconde bajo las rocas, manteniendo su cuerpo oculto dentro de su concha mientras come las bayas que ha almacenado. Las bayas se mezclan con sus fluidos corporales y se convierten en zumo.",
  "They gather in forests seeking the sweet sap of trees. It is completely clad in a steel-hard shell. It is proud of its horn, which it uses to fling foes." =>
    "Se reúnen en los bosques en busca de la dulce savia de los árboles. Está completamente cubierto de un caparazón tan duro como el acero. Está orgulloso de su cuerno, con el que lanza a sus rivales por los aires.",
  "A Sneasel scales trees by punching its hooked claws into the bark. It seeks out unguarded nests and steals eggs for food while the parents are away." =>
    "Sneasel escala árboles clavando sus garras curvadas en la corteza. Busca nidos desprotegidos y roba huevos para comer mientras los padres no están.",
  "It licks its palms that are sweetened by being soaked in honey. A Teddiursa makes its own honey by blending fruits and pollen collected by Beedrill." =>
    "Se lame las palmas, endulzadas al haberlas remojado en miel. Teddiursa hace su propia miel mezclando frutas y polen recolectado por Beedrill.",
  "In forests, it is said that there are many streams and towering trees where an Ursaring gathers food. It walks through its forest collecting food every day." =>
    "Se dice que en los bosques hay muchos arroyos y árboles imponentes donde Ursaring recolecta comida. Camina por su bosque recolectando alimento todos los días.",
  "It is a species of Pokémon that lives in volcanic areas. If its body cools, its skin hardens and immobilizes it. To avoid that, it sleeps near magma." =>
    "Es una especie de Pokémon que vive en zonas volcánicas. Si su cuerpo se enfría, su piel se endurece y lo inmoviliza. Para evitarlo, duerme cerca del magma.",
  "The shell on its back is made of hardened magma. Tens of thousands of years spent living in volcanic craters have turned Magcargo's bodies into magma." =>
    "La concha de su espalda está hecha de magma endurecido. Decenas de miles de años viviendo en cráteres volcánicos han convertido el cuerpo de Magcargo en magma.",
  "It roots for food by rubbing its snout against the ground. Its favorite food is a mushroom that grows under dried grass. It occasionally roots out hot springs." =>
    "Busca comida frotando el hocico contra el suelo. Su comida favorita es un hongo que crece bajo la hierba seca. En ocasiones, desentierra aguas termales.",
  "A Piloswine is covered by a thick coat of long hair for enduring freezing cold. It uses its tusks to dig up food that has been buried under ice." =>
    "Piloswine está cubierto por un espeso pelaje largo para soportar el frío glacial. Usa sus colmillos para desenterrar comida enterrada bajo el hielo.",
  "Corsola live in warm southern seas. If the sea becomes polluted, the beautiful coral stalks become discolored and crumble away in tatters." =>
    "Los Corsola viven en cálidos mares del sur. Si el mar se contamina, sus hermosos tallos de coral se decoloran y se desmoronan en pedazos.",
  "A Remoraid uses its abdominal muscles to forcefully expel swallowed water, then shoot down flying prey. When evolution approaches, it travels down rivers." =>
    "Remoraid usa sus músculos abdominales para expulsar con fuerza el agua tragada, derribando así a sus presas voladoras. Cuando se acerca su evolución, viaja río abajo.",
  "It ensnares its foe with its suction- cupped tentacles before delivering the finishing blow. If the foe turns out to be too strong, it spews ink to escape." =>
    "Atrapa a su rival con sus tentáculos con ventosas antes de asestar el golpe final. Si el rival resulta ser demasiado fuerte, escupe tinta para escapar.",
  "It carries food bundled up in its tail. There was a famous explorer who managed to scale Mt. Everest thanks to a Delibird sharing its food." =>
    "Lleva comida envuelta en su cola. Hubo un famoso explorador que logró escalar el Everest gracias a que un Delibird compartió su comida con él.",
  "On sunny days, schools of Mantine can be seen elegantly leaping over the waves. It is not bothered by the Remoraid that hitches rides." =>
    "En los días soleados, se pueden ver bancos de Mantine saltando con elegancia sobre las olas. No le molesta que los Remoraid se suban a su lomo para viajar gratis.",
  "A Pokémon that has a body and wings of steel. People in the past used feathers fallen from Skarmory to make swords and knives." =>
    "Un Pokémon con cuerpo y alas de acero. En el pasado, la gente usaba las plumas caídas de Skarmory para fabricar espadas y cuchillos.",
  "Houndour communicate with each other using a variety of cries to corner their prey. This Pokémon's remarkable teamwork is simply unparalleled." =>
    "Los Houndour se comunican entre sí usando una variedad de aullidos para acorralar a sus presas. El extraordinario trabajo en equipo de este Pokémon no tiene igual.",
  "In a Houndoom pack, the one with its horns raked sharply back serves a leadership role. They choose their leader by fighting among themselves." =>
    "En una manada de Houndoom, el que tiene los cuernos curvados marcadamente hacia atrás ejerce el papel de líder. Eligen a su líder peleando entre ellos.",
  "It sleeps quietly, deep on the seafloor. When it comes up to the surface, it creates a huge whirlpool that can swallow even ships." =>
    "Duerme tranquilamente en las profundidades del fondo marino. Cuando sube a la superficie, crea un enorme remolino capaz de engullir incluso barcos.",
  "Phanpy's big ears serve as broad fans. When it becomes hot, it flaps the ears busily to cool down. Even the young are very strong." =>
    "Las grandes orejas de Phanpy funcionan como amplios abanicos. Cuando hace calor, las agita afanosamente para refrescarse. Incluso las crías son muy fuertes.",
  "A Donphan is so strong it can easily haul a dump truck. Its hide has toughened to a rock-hard state. An ordinary sort of attack won't even leave a scratch." =>
    "Donphan es tan fuerte que puede arrastrar un camión volquete sin esfuerzo. Su piel se ha endurecido hasta volverse dura como una roca. Un ataque común ni siquiera le dejaría un rasguño.",
  "It was created by humans using the power of science. It has been given artificial intelligence that enables it to learn new gestures and emotions on its own." =>
    "Fue creado por humanos usando el poder de la ciencia. Se le ha dado una inteligencia artificial que le permite aprender gestos y emociones nuevas por su cuenta.",
  "Stantler's magnificent antlers were once traded at high prices as works of art. As a result, this Pokémon was hunted close to extinction." =>
    "Las magníficas astas de Stantler se comerciaban antaño a precios elevados como obras de arte. Como resultado, este Pokémon fue cazado hasta casi extinguirse.",
  "A Smeargle marks its territory using a fluid that leaks out from the tip of its tail. About 5,000 different marks left by this Pokémon have been found." =>
    "Smeargle marca su territorio usando un fluido que gotea de la punta de su cola. Se han encontrado unas 5000 marcas distintas dejadas por este Pokémon.",
  "Tyrogue become stressed out if they do not get to train every day. When raising this Pokémon, the trainer must establish a regular training schedule." =>
    "Los Tyrogue se estresan si no pueden entrenar todos los días. Al criar a este Pokémon, el entrenador debe establecer un horario de entrenamiento regular.",
  "Its technique of kicking while spinning is a remarkable mix of both offense and defense. Hitmontop travel faster spinning than they do walking." =>
    "Su técnica de patear mientras gira es una notable combinación de ataque y defensa. Los Hitmontop se desplazan más rápido girando que caminando.",
  "It actively runs about, but also falls often. Whenever it falls, it will check its reflection on a lake's surface to make sure its face hasn't become dirty." =>
    "Corre de un lado a otro con energía, pero también se cae a menudo. Cada vez que se cae, comprueba su reflejo en la superficie de un lago para asegurarse de que no se ha ensuciado la cara.",
  "If it touches metal and discharges the electricity it has stored in its body, an Elekid begins swinging its arms in circles to recharge itself." =>
    "Si toca metal y descarga la electricidad que tiene almacenada en el cuerpo, Elekid empieza a mover los brazos en círculos para recargarse.",
  "If a Magby is spouting yellow flames from its mouth, it is in good health. When it is fatigued, black smoke will be mixed in with the flames." =>
    "Si Magby expulsa llamas amarillas por la boca, es señal de buena salud. Cuando está fatigado, se mezcla humo negro con las llamas.",
  "It gives over five gallons of milk daily. Its sweet milk is enjoyed by children and adults alike. People who can't drink milk turn it into yogurt and eat it instead." =>
    "Da más de veinte litros de leche al día. Su dulce leche es disfrutada tanto por niños como por adultos. Quienes no pueden beber leche la convierten en yogur y la comen así.",
  "If it senses sadness with its fluffy fur, a Blissey will rush over to the sad person, however far away, to share an egg of happiness that brings a smile to any face." =>
    "Si detecta tristeza con su suave pelaje, Blissey corre hacia la persona triste, por lejos que esté, para compartir un huevo de la felicidad que hace sonreír a cualquiera.",
  "Raikou embodies the speed of lightning. Its roars send shock waves shuddering through the air and ground as if lightning bolts were crashing down." =>
    "Raikou encarna la velocidad del rayo. Sus rugidos envían ondas expansivas que estremecen el aire y la tierra, como si cayeran rayos.",
  "Entei embodies the passion of magma. It is thought to have been born in the eruption of a volcano. It blasts fire that consumes all that it touches." =>
    "Entei encarna la pasión del magma. Se cree que nació en la erupción de un volcán. Lanza fuego que consume todo lo que toca.",
  "Suicune embodies the compassion of a pure spring of water. It runs across the land with gliding elegance. It has the power to purify dirty water." =>
    "Suicune encarna la compasión de un manantial de agua pura. Recorre la tierra con una elegancia deslizante. Tiene el poder de purificar el agua sucia.",
  "A Larvitar is born deep under the ground. It must eat its way through the soil above and reach the surface for it to see its parents' faces." =>
    "Larvitar nace en las profundidades de la tierra. Debe comerse la tierra que tiene encima y llegar a la superficie para poder ver el rostro de sus padres.",
  "A Pupitar creates a gas inside its body that it ejects under compression to propel itself like a jet. Its body can withstand a collision with solid steel." =>
    "Pupitar genera un gas dentro de su cuerpo que expulsa a presión para propulsarse como un reactor. Su cuerpo puede resistir una colisión con acero sólido.",
  "A Tyranitar is so overwhelmingly powerful, it can bring down a whole mountain to make its nest. It roams in mountains seeking new opponents to fight." =>
    "Tyranitar es tan abrumadoramente poderoso que puede derribar una montaña entera para hacer su nido. Vaga por las montañas en busca de nuevos rivales contra los que combatir.",
  "Lugia is so powerful even a light fluttering of its wings can blow apart houses. As a result, it chooses to live out of sight deep under the sea." =>
    "Lugia es tan poderoso que un simple aleteo suave puede destrozar casas. Por eso, elige vivir oculto en las profundidades del mar.",
  "Its feathers--which glow in seven colors depending on the angle at which light strikes them--are thought to bring joy. It is said to live at the foot of a rainbow." =>
    "Se cree que sus plumas, que brillan en siete colores según el ángulo en que las golpea la luz, traen alegría. Se dice que vive al pie de un arcoíris.",
  "This Pokémon came from the future by crossing over time. It is thought that so long as Celebi appears, a bright and shining future awaits us." =>
    "Este Pokémon vino del futuro cruzando el tiempo. Se piensa que, mientras Celebi siga apareciendo, nos espera un futuro brillante y radiante.",
  "It makes its nest in a giant tree in the forest. It ferociously guards against anything nearing its territory. It is said to be the protector of the trees." =>
    "Hace su nido en un árbol gigantesco del bosque. Defiende ferozmente su territorio de cualquier cosa que se acerque. Se dice que es el protector de los árboles.",
  "Leaves grow out of this Pokémon's body. They help obscure a Grovyle from the eyes of its enemies while it is in a thickly overgrown forest." =>
    "A este Pokémon le crecen hojas del cuerpo. Le ayudan a ocultarse de los ojos de sus enemigos mientras está en un bosque densamente cubierto de vegetación.",
  "In the jungle, its power is without equal. This Pokémon carefully grows trees and plants. It regulates its body temperature by basking in sunlight." =>
    "En la jungla, su poder no tiene igual. Este Pokémon cuida con esmero árboles y plantas. Regula su temperatura corporal tomando el sol.",
  "If attacked, it strikes back by spitting balls of fire it forms in its stomach. A Torchic dislikes darkness because it can't see its surroundings." =>
    "Si lo atacan, contraataca escupiendo bolas de fuego que forma en su estómago. A Torchic no le gusta la oscuridad porque no puede ver sus alrededores.",
  "It lashes out with 10 kicks per second. Its strong fighting instinct compels it to keep up its offensive until the opponent gives up." =>
    "Ataca con 10 patadas por segundo. Su fuerte instinto de lucha lo empuja a seguir a la ofensiva hasta que el rival se rinde.",
  "It learns martial arts that use punches and kicks. Every several years, its old feathers burn off, and new, supple feathers grow back in their place." =>
    "Aprende artes marciales que usan puñetazos y patadas. Cada varios años, sus plumas viejas se queman, y en su lugar crecen plumas nuevas y flexibles.",
  "On land, it can powerfully lift large boulders by planting its four feet and heaving. It sleeps by burying itself in soil at the water's edge." =>
    "En tierra, puede levantar con fuerza grandes rocas plantando sus cuatro patas y haciendo palanca. Duerme enterrándose en el barro junto al agua.",
  "Its toughened hind legs enable it to stand upright. Because it weakens if its skin dries out, it replenishes fluids by playing in mud." =>
    "Sus fuertes patas traseras le permiten mantenerse erguido. Como se debilita si su piel se seca, recupera fluidos jugando en el barro.",
  "If it senses the approach of a storm and a tidal wave, it protects its seaside nest by piling up boulders. It swims as fast as a jet ski." =>
    "Si detecta la llegada de una tormenta y un maremoto, protege su nido costero apilando rocas. Nada tan rápido como una moto acuática.",
  "It savagely threatens foes with bared fangs. It chases after fleeing targets tenaciously. It turns tail and runs, however, if the foe strikes back." =>
    "Amenaza salvajemente a sus rivales mostrando los colmillos. Persigue con tenacidad a los objetivos que huyen. Sin embargo, si el rival contraataca, sale corriendo.",
  "In the wild, Mightyena live in a pack. They never defy their leader's orders. They defeat foes with perfectly coordinated teamwork." =>
    "En la naturaleza, los Mightyena viven en manada. Nunca desobedecen las órdenes de su líder. Derrotan a sus rivales con un trabajo en equipo perfectamente coordinado.",
  "Rubbing its nose against the ground, it always wanders about back and forth in search of something. It is distinguished by the zigzag footprints it leaves." =>
    "Frotando la nariz contra el suelo, siempre deambula de un lado a otro en busca de algo. Se distingue por las huellas en zigzag que deja.",
  "It is exceedingly fast if it only has to run in a straight line. When it spots pond- dwelling prey underwater, it quickly leaps in and catches it with its sharp claws." =>
    "Es extremadamente rápido si solo tiene que correr en línea recta. Cuando ve una presa acuática bajo el agua de un estanque, salta rápidamente y la atrapa con sus afiladas garras.",
  "It sticks to tree branches and eats leaves. The thread it spits from its mouth becomes gooey when it touches air and slows the movement of its foes." =>
    "Se pega a las ramas de los árboles y come hojas. El hilo que escupe de su boca se vuelve pegajoso al contacto con el aire y ralentiza el movimiento de sus rivales.",
  "It prepares for evolution using the energy it stored while it was a Wurmple. It keeps watch over the surroundings with its two eyes." =>
    "Se prepara para evolucionar usando la energía que almacenó cuando era Wurmple. Vigila sus alrededores con sus dos ojos.",
  "Its colorfully patterned wings are its most prominent feature. It flies through flower-covered fields collecting pollen. It attacks ferociously when angered." =>
    "Sus alas de colores vivos son su rasgo más llamativo. Vuela por campos cubiertos de flores recolectando polen. Ataca con ferocidad cuando se enfada.",
  "To avoid detection by its enemies, it hides motionlessly beneath large leaves and in the gaps of branches. It also attaches dead leaves to its body for camouflage." =>
    "Para evitar que sus enemigos lo detecten, se esconde inmóvil bajo hojas grandes y en los huecos entre ramas. También se pega hojas muertas al cuerpo para camuflarse.",
  "It is a nocturnal Pokémon that flies from fields and mountains to the attraction of streetlights at night. It looses highly toxic powder from its wings." =>
    "Es un Pokémon nocturno que vuela desde campos y montañas atraído por las farolas de noche. Libera un polvo altamente tóxico desde sus alas.",
  "This Pokémon lives in ponds with clean water. It is known to ferry small Pokémon across ponds by carrying them on the broad leaf on its head." =>
    "Este Pokémon vive en estanques de agua limpia. Se sabe que transporta a Pokémon pequeños a través de los estanques, llevándolos sobre la ancha hoja de su cabeza.",
  "In the evening, it takes great delight in popping out of rivers and startling people. It feeds on aquatic moss that grows on rocks in the riverbed." =>
    "Al anochecer, disfruta mucho saliendo de los ríos de sopetón para asustar a la gente. Se alimenta del musgo acuático que crece en las rocas del lecho del río.",
  "When it hears festive music, all the cells in its body become stimulated, and it begins moving in rhythm. It does not quail even when it faces a tough opponent." =>
    "Cuando escucha música festiva, todas las células de su cuerpo se estimulan y empieza a moverse al ritmo. No se acobarda ni siquiera ante un rival duro.",
  "It hangs off branches and absorbs nutrients. When it finishes eating, its body becomes so heavy that it drops to the ground with a thump." =>
    "Cuelga de las ramas y absorbe nutrientes. Cuando termina de comer, su cuerpo se vuelve tan pesado que cae al suelo con un golpe seco.",
  "A forest-dwelling Pokémon that is skilled at climbing trees. Its long and pointed nose is its weak point. It loses power if the nose is gripped." =>
    "Un Pokémon que habita en los bosques y es hábil trepando árboles. Su larga y puntiaguda nariz es su punto débil. Pierde fuerza si se la agarran.",
  "It is said to arrive on chilly, wintry winds. Feared from long ago as the guardian of forests, this Pokémon lives in a deep forest where people do not venture." =>
    "Se dice que llega con los fríos vientos invernales. Temido desde antaño como el guardián de los bosques, este Pokémon vive en un bosque profundo donde la gente no se aventura.",
  "Although it is small, it is very courageous. It will take on a larger Skarmory on an equal footing. However, its will weakens if it becomes hungry." =>
    "Aunque es pequeño, es muy valiente. Se enfrenta de igual a igual a un Skarmory mucho más grande. Sin embargo, su voluntad flaquea si tiene hambre.",
  "A Swellow dives upon prey from far above. It never misses its targets. It takes to the skies in search of lands with a warm climate." =>
    "Swellow se lanza en picado sobre sus presas desde las alturas. Nunca falla el blanco. Surca los cielos en busca de tierras con clima cálido.",
  "It makes its nest on a sheer cliff at the edge of the sea. It has trouble keeping its wings flapping in flight. Instead, it soars on updrafts." =>
    "Hace su nido en un acantilado escarpado a orillas del mar. Le cuesta mantener el aleteo en vuelo. En su lugar, planea sobre corrientes ascendentes.",
  "It skims the tops of waves as it flies. When it spots prey, it uses its large beak to scoop up the victim with water. It protects its eggs in its beak." =>
    "Roza la cresta de las olas mientras vuela. Cuando detecta una presa, usa su gran pico para atraparla junto con agua. Protege sus huevos dentro del pico.",
  "A Ralts has the power to sense the emotions of people and Pokémon with the horns on its head. It takes cover if it senses any hostility." =>
    "Ralts tiene el poder de detectar las emociones de personas y Pokémon con los cuernos de su cabeza. Se cubre si detecta hostilidad.",
  "A Kirlia has the psychic power to create a rip in the dimensions and see into the future. It is said to dance with pleasure on sunny mornings." =>
    "Kirlia tiene el poder psíquico de crear una grieta entre dimensiones y ver el futuro. Se dice que baila de alegría en las mañanas soleadas.",
  "It apparently does not feel the pull of gravity because it supports itself with psychic power. It will give its life to protect its trainer." =>
    "Al parecer no siente el tirón de la gravedad, porque se sostiene con poder psíquico. Dará su vida para proteger a su entrenador.",
  "They gather on puddles after evening downpours, gliding across the surface of water as if sliding. It secretes honey with a sweet aroma from its head." =>
    "Se reúnen en los charcos después de los chaparrones vespertinos, deslizándose por la superficie del agua como patinando. Segrega miel de aroma dulce desde su cabeza.",
  "It intimidates foes with the large eyelike patterns on its antennae. Because it can't fly if its wings get wet, it shelters from rain under large trees and eaves." =>
    "Intimida a sus rivales con los grandes patrones parecidos a ojos en sus antenas. Como no puede volar si se le mojan las alas, se resguarda de la lluvia bajo árboles grandes y aleros.",
  "It loves to eat damp, composted soil in forests. If you enter a forest after a long rain, you can see many Shroomish feasting on composted soil." =>
    "Le encanta comer tierra húmeda y compostada en los bosques. Si entras en un bosque tras una larga lluvia, puedes ver a muchos Shroomish dándose un festín con tierra compostada.",
  "It scatters spores from holes in the cap on its head. It loves warm and humid climates. It feeds on trees and plants in fields and forests." =>
    "Esparce esporas desde los agujeros del sombrero de su cabeza. Le encantan los climas cálidos y húmedos. Se alimenta de árboles y plantas en campos y bosques.",
  "It sleeps virtually all day and night long. It doesn't change its nest its entire life, but it sometimes travels great distances by swimming in rivers." =>
    "Duerme prácticamente todo el día y toda la noche. No cambia de nido en toda su vida, pero a veces viaja grandes distancias nadando por los ríos.",
  "It can't keep still because its blood boils with energy. It runs through the fields and mountains all day to calm itself. If it doesn't, it can't sleep at night." =>
    "No puede quedarse quieto porque su sangre hierve de energía. Corre por campos y montañas todo el día para calmarse. Si no lo hace, no puede dormir de noche.",
  "Hordes of Slaking gather around trees when fruits come into season. They wait around patiently for ripened fruits to fall out of the trees." =>
    "Multitudes de Slaking se reúnen alrededor de los árboles cuando llega la temporada de frutas. Esperan pacientemente a que la fruta madura caiga de los árboles.",
  "It makes its nest at the roots of a mighty tree. Using its whiskerlike antennae, it probes its surroundings in the pitch-black darkness of soil." =>
    "Hace su nido en las raíces de un árbol imponente. Usando sus antenas como bigotes, explora sus alrededores en la más absoluta oscuridad de la tierra.",
  "Because it darts about vigorously at high speed, it is very difficult to see. Hearing its distinctive cries for too long induces a headache." =>
    "Como se mueve vigorosamente a gran velocidad, es muy difícil de ver. Escuchar sus característicos chillidos durante demasiado tiempo provoca dolor de cabeza.",
  "A peculiar Pokémon that floats in air even though its wings remain completely still. The inside of its body is hollow and utterly dark." =>
    "Un Pokémon peculiar que flota en el aire aunque sus alas permanecen completamente inmóviles. El interior de su cuerpo está hueco y sumido en la más completa oscuridad.",
  "Its cries equal a jet plane in volume. It inhales through its ear canals. Because of this system, it can cry continually without having to catch its breath." =>
    "Sus gritos igualan en volumen a un avión a reacción. Inhala a través de los conductos auditivos. Gracias a este sistema, puede gritar sin parar sin tener que tomar aire.",
  "It positions the round speakers on its head to assail foes with ultrasonic waves at massive volume. It builds power by stomping the ground." =>
    "Coloca los altavoces redondos de su cabeza para atacar a sus rivales con ondas ultrasónicas a un volumen enorme. Acumula poder pisoteando el suelo.",
  "It has sound-generating organs all over its body. It communicates with others by adjusting the tone and volume of the cries it emits." =>
    "Tiene órganos generadores de sonido por todo el cuerpo. Se comunica con otros ajustando el tono y el volumen de los gritos que emite.",
  "It loves to toughen up its body above all else. If you hear quaking rumbles in a cave, it is the sound of Makuhita undertaking strenuous training." =>
    "Le encanta fortalecer su cuerpo por encima de todo. Si oyes retumbos que hacen temblar una cueva, es el sonido de Makuhita entrenando duro.",
  "It has the habit of challenging others without hesitation to tests of strength. It's been known to stand on train tracks and stop trains using forearm thrusts." =>
    "Tiene la costumbre de retar a otros sin dudar a pruebas de fuerza. Se sabe que se ha plantado en las vías del tren y ha detenido trenes con empujones de antebrazo.",
  "Its tail, which is packed with nutrition, is very bouncy like a rubber ball. On sunny days they gather at the edge of water and splash about for fun." =>
    "Su cola, repleta de nutrientes, es muy elástica como una pelota de goma. En los días soleados, se reúnen junto al agua y chapotean por diversión.",
  "Its body emits a powerful magnetism. It feeds on prey that is pulled in by the force. Its magnetism is stronger in cold seasons." =>
    "Su cuerpo emite un poderoso magnetismo. Se alimenta de las presas que atrae con esa fuerza. Su magnetismo es más fuerte en las temporadas frías.",
}

apply_dex_dict(DICT)
