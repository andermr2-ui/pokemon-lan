# encoding: UTF-8
require_relative "apply_dex_common"

DICT = {
  "This artificial Pokémon, constructed more than 500 years ago, can understand human speech but cannot itself speak." =>
    "Este Pokémon artificial, construido hace más de 500 años, puede entender el habla humana pero no puede hablar.",
  "Able to conceal itself in shadows, it never appears before humans, so its very existence was the stuff of myth." =>
    "Capaz de ocultarse en las sombras, nunca se muestra ante los humanos, por lo que su propia existencia era considerada un mito.",
  "An Ultra Beast that lives in a different world, it cackles wildly as it sprays its opponents with poison from the needles on its head." =>
    "Un ultraente que vive en otro mundo; suelta carcajadas salvajes mientras rocía veneno a sus rivales desde las púas de su cabeza.",
  "One kind of Ultra Beast, it fires a glowing, venomous liquid from its needles. This liquid is also immensely adhesive." =>
    "Un tipo de ultraente que dispara un líquido venenoso y brillante desde sus púas. Ese líquido, además, es enormemente adhesivo.",
  "When stone walls started moving and attacking, the brute's true identity was this mysterious life-form, which brings to mind an Ultra Beast." =>
    "Cuando muros de piedra comenzaron a moverse y atacar, la verdadera identidad de la bestia resultó ser esta misteriosa forma de vida, que recuerda a un ultraente.",
  "It slithers toward people. Then, without warning, it triggers the explosion of its own head. It's apparently one kind of Ultra Beast." =>
    "Se desliza hacia las personas y, sin previo aviso, detona su propia cabeza. Al parecer, es un tipo de ultraente.",
  "It approaches its enemies at the speed of lightning, then tears them limb from limb with its sharp claws." =>
    "Se acerca a sus enemigos a la velocidad del rayo y luego los despedaza con sus afiladas garras.",
  "It melts particles of iron and other metals found in the subsoil, so it can absorb them into its body of molten steel." =>
    "Funde partículas de hierro y otros metales que encuentra en el subsuelo para absorberlas en su cuerpo de acero fundido.",
  "Revered long ago for its capacity to create iron from nothing, for some reason it has come back to life after 3,000 years." =>
    "Venerado en la antigüedad por su capacidad de crear hierro de la nada, por alguna razón ha vuelto a la vida tras 3.000 años.",
  "When it uses its special stick to strike up a beat, the sound waves produced carry revitalizing energy to the plants and flowers in the area." =>
    "Cuando usa su palo especial para marcar un ritmo, las ondas sonoras que produce llevan energía revitalizante a las plantas y flores de la zona.",
  "When it's drumming out rapid beats in battle, it gets so caught up in the rhythm that it won't even notice that it's already knocked out its opponent." =>
    "Cuando marca ritmos rápidos en batalla, se deja llevar tanto por el ritmo que ni siquiera nota que ya dejó fuera de combate a su rival.",
  "By drumming, it taps into the power of its special tree stump. The roots of the stump follow its direction in battle." =>
    "Al tocar el tambor, aprovecha el poder de su tocón especial. Las raíces del tocón siguen sus órdenes en batalla.",
  "A warm-up of running around gets fire energy coursing through this Pokémon's body. Once that happens, it's ready to fight at full power." =>
    "Un calentamiento corriendo hace que la energía ígnea recorra el cuerpo de este Pokémon. Una vez que eso ocurre, está listo para combatir a plena potencia.",
  "It kicks berries right off the branches of trees and then juggles them with its feet, practicing its footwork." =>
    "Patea bayas directamente de las ramas de los árboles y luego las hace malabares con los pies, practicando su juego de piernas.",
  "It juggles a pebble with its feet, turning it into a burning soccer ball. Its shots strike opponents hard and leave them scorched." =>
    "Hace malabares con una piedrecita usando los pies, convirtiéndola en un balón de fútbol en llamas. Sus disparos golpean con fuerza a sus rivales y los dejan chamuscados.",
  "When scared, this Pokémon cries. Its tears pack the chemical punch of 100 onions, and attackers won't be able to resist weeping." =>
    "Cuando se asusta, este Pokémon llora. Sus lágrimas tienen la potencia química de 100 cebollas, y sus atacantes no podrán evitar llorar.",
  "A clever combatant, this Pokémon battles using water balloons created with moisture secreted from its palms." =>
    "Un combatiente astuto, este Pokémon lucha usando globos de agua creados con la humedad que segregan sus palmas.",
  "It has many hidden capabilities, such as fingertips that can shoot water and a membrane on its back that it can use to glide through the air." =>
    "Tiene muchas capacidades ocultas, como puntas de los dedos que disparan agua y una membrana en la espalda que usa para planear por el aire.",
  "It eats berries nonstop—a habit that has made it more resilient than it looks. It'll show up on farms, searching for yet more berries." =>
    "Come bayas sin parar, un hábito que lo ha vuelto más resistente de lo que parece. Aparece en granjas buscando aún más bayas.",
  "It stashes berries in its tail - so many berries that they fall out constantly. But this Pokémon is a bit slow-witted, so it doesn't notice the loss." =>
    "Guarda bayas en su cola, tantas que se le caen constantemente. Pero este Pokémon es un poco despistado y no nota la pérdida.",
  "Jumping nimbly about, this small-bodied Pokémon takes advantage of even the slightest opportunity to disorient larger opponents." =>
    "Saltando con agilidad, este Pokémon de cuerpo pequeño aprovecha la más mínima oportunidad para desorientar a rivales más grandes.",
  "Smart enough to use tools in battle, these Pokémon have been seen picking up rocks and flinging them or using ropes to wrap up enemies." =>
    "Lo bastante listos como para usar herramientas en batalla, se los ha visto recoger rocas para lanzarlas o usar cuerdas para atar a sus enemigos.",
  "This Pokémon reigns supreme in the skies. The black luster of its steel body could drive terror into the heart of any foe." =>
    "Este Pokémon reina en los cielos. El brillo negro de su cuerpo de acero puede infundir terror en el corazón de cualquier rival.",
  "Often found in gardens, this Pokémon has hairs on its body that it uses to assess its surroundings." =>
    "Se lo encuentra a menudo en jardines. Este Pokémon tiene pelos en el cuerpo que usa para evaluar su entorno.",
  "It barely moves, but it's still alive. Hiding in its shell without food or water seems to have awakened its psychic powers." =>
    "Apenas se mueve, pero sigue vivo. Esconderse en su caparazón sin comer ni beber parece haber despertado sus poderes psíquicos.",
  "It's famous for its high level of intelligence, and the large size of its brain is proof that it also possesses immense psychic power." =>
    "Es famoso por su alto nivel de inteligencia, y el gran tamaño de su cerebro demuestra que también posee un inmenso poder psíquico.",
  "Aided by the soft pads on its feet, it silently raids the food stores of other Pokémon. It survives off its ill-gotten gains." =>
    "Con la ayuda de las suaves almohadillas de sus patas, saquea silenciosamente las reservas de comida de otros Pokémon. Sobrevive de lo que roba.",
  "It secretly marks potential targets with a scent. By following the scent, it stalks its targets and steals from them when they least expect it." =>
    "Marca en secreto a sus posibles objetivos con un aroma. Siguiendo ese aroma, los acecha y les roba cuando menos lo esperan.",
  "It anchors itself in the ground with its single leg, then basks in the sun. After absorbing enough sunlight, its petals spread as it blooms brilliantly." =>
    "Se ancla al suelo con su única pata y se asolea. Tras absorber suficiente luz solar, sus pétalos se abren en una floración brillante.",
  "The seeds attached to its cotton fluff are full of nutrients. It spreads them on the wind so that plants and other Pokémon can benefit from them." =>
    "Las semillas adheridas a su pelusa de algodón están llenas de nutrientes. Las esparce con el viento para que plantas y otros Pokémon se beneficien de ellas.",
  "Its curly fleece is such an effective cushion that this Pokémon could fall off a cliff and stand right back up at the bottom, unharmed." =>
    "Su lana rizada amortigua tan bien que este Pokémon podría caer de un acantilado y levantarse ileso al llegar abajo.",
  "Its majestic horns are meant only to impress the opposite gender. They never see use in battle." =>
    "Sus majestuosos cuernos solo sirven para impresionar al sexo opuesto. Nunca se usan en batalla.",
  "It starts off battles by attacking with its rock-hard horn, but as soon as the opponent flinches, this Pokémon bites down and never lets go." =>
    "Comienza las batallas atacando con su cuerno duro como roca, pero en cuanto su rival se acobarda, este Pokémon muerde y nunca suelta.",
  "With jaws that can shear through steel rods, this highly aggressive Pokémon chomps down on its unfortunate prey." =>
    "Con mandíbulas capaces de cortar varillas de acero, este Pokémon sumamente agresivo muerde a sus desafortunadas presas.",
  "This gluttonous Pokémon only assists people with their work because it wants treats. As it runs, it crackles with electricity." =>
    "Este Pokémon glotón solo ayuda a las personas con su trabajo porque quiere golosinas. Mientras corre, chisporrotea electricidad.",
  "This Pokémon generates electricity and channels it into its legs to keep them going strong. Boltund can run nonstop for three full days." =>
    "Este Pokémon genera electricidad y la canaliza hacia sus patas para mantenerlas fuertes. Boltund puede correr sin parar durante tres días enteros.",
  "Most of its body has the same composition as coal. Fittingly, this Pokémon was first discovered in coal mines about 400 years ago." =>
    "La mayor parte de su cuerpo tiene la misma composición que el carbón. Como era de esperar, este Pokémon fue descubierto por primera vez en minas de carbón hace unos 400 años.",
  "By rapidly rolling its legs, it can travel at over 18 mph. The temperature of the flames it breathes exceeds 1,000 degrees Celsius." =>
    "Al hacer rodar rápidamente sus patas, puede desplazarse a más de 29 km/h. La temperatura de las llamas que exhala supera los 1.000 grados Celsius.",
  "While it's engaged in battle, its mountain of coal will burn bright red, sending off sparks that scorch the surrounding area." =>
    "Mientras combate, su montaña de carbón arde con un rojo intenso, despidiendo chispas que chamuscan la zona.",
  "It spends its entire life inside an apple. It hides from its natural enemies, bird Pokémon, by pretending it's just an apple and nothing more." =>
    "Pasa toda su vida dentro de una manzana. Se esconde de sus enemigos naturales, los Pokémon pájaro, fingiendo ser solo una manzana.",
  "It ate a sour apple, and that induced its evolution. In its cheeks, it stores an acid capable of causing chemical burns." =>
    "Comió una manzana agria y eso indujo su evolución. En sus mejillas almacena un ácido capaz de causar quemaduras químicas.",
  "Its body is covered in sweet nectar, and the skin on its back is especially yummy. Children used to have it as a snack." =>
    "Su cuerpo está cubierto de dulce néctar, y la piel de su espalda es especialmente sabrosa. Antes los niños lo comían como bocadillo.",
  "It spews sand from its nostrils. While the enemy is blinded, it burrows into the ground to hide." =>
    "Expulsa arena por las fosas nasales. Mientras su enemigo queda cegado, se entierra para esconderse.",
  "Its unique style of coiling allows it to blast sand out of its sand sac more efficiently." =>
    "Su peculiar forma de enroscarse le permite expulsar arena de su saco de arena con mayor eficiencia.",
  "It's so strong that it can knock out some opponents in a single hit, but it also may forget what it's battling midfight." =>
    "Es tan fuerte que puede dejar fuera de combate a algunos rivales de un solo golpe, pero también puede olvidar contra quién lucha en pleno combate.",
  "If it sees any movement around it, this Pokémon charges for it straightaway, leading with its sharply pointed jaw. It's very proud of that jaw." =>
    "Si ve algún movimiento a su alrededor, este Pokémon carga de inmediato con su afilada mandíbula por delante. Está muy orgulloso de esa mandíbula.",
  "This Pokémon has a jaw that's as sharp as a spear and as strong as steel. Apparently Barraskewda's flesh is surprisingly tasty, too." =>
    "Este Pokémon tiene una mandíbula tan afilada como una lanza y tan fuerte como el acero. Al parecer, la carne de Barraskewda también es sorprendentemente sabrosa.",
  "It manipulates the chemical makeup of its poison to produce electricity. The voltage is weak, but it can cause a tingling paralysis." =>
    "Manipula la composición química de su veneno para producir electricidad. El voltaje es débil, pero puede causar un cosquilleo paralizante.",
  "When this Pokémon sounds as if it's strumming a guitar, it's actually clawing at the protrusions on its chest to generate electricity." =>
    "Cuando este Pokémon suena como si estuviera rasgueando una guitarra, en realidad está rascando las protuberancias de su pecho para generar electricidad.",
  "It stores flammable gas in its body and uses it to generate heat. The yellow sections on its belly get particularly hot." =>
    "Almacena gas inflamable en su cuerpo y lo usa para generar calor. Las secciones amarillas de su vientre se calientan especialmente.",
  "While its burning body is already dangerous on its own, this excessively hostile Pokémon also has large and very sharp fangs." =>
    "Aunque su cuerpo en llamas ya es peligroso de por sí, este Pokémon, sumamente hostil, también tiene colmillos grandes y muy afilados.",
  "It's very curious, but its means of investigating things is to try to punch them with its tentacles. The search for food is what brings it onto land." =>
    "Es muy curioso, pero su forma de investigar las cosas es intentar golpearlas con sus tentáculos. La búsqueda de comida es lo que lo lleva a tierra firme.",
  "A body made up of nothing but muscle makes the grappling moves this Pokémon performs with its tentacles tremendously powerful." =>
    "Un cuerpo hecho puramente de músculo hace que las llaves de lucha que ejecuta con sus tentáculos sean tremendamente poderosas.",
  "The teacup in which this Pokémon makes its home is a famous piece of antique tableware. Many forgeries are in circulation." =>
    "La taza de té en la que vive este Pokémon es una famosa pieza de vajilla antigua. Circulan muchas falsificaciones.",
  "This species lives in antique teapots. Most pots are forgeries, but on rare occasions, an authentic work is found." =>
    "Esta especie vive en teteras antiguas. La mayoría son falsificaciones, pero en raras ocasiones se encuentra una pieza auténtica.",
  "Via the protrusion on its head, it senses other creatures' emotions. If you don't have a calm disposition, it will never warm up to you." =>
    "A través de la protuberancia de su cabeza, percibe las emociones de otras criaturas. Si no tenés un temperamento tranquilo, nunca te tomará confianza.",
  "Using the braids on its head, it pummels foes to get them to quiet down. One blow from those braids would knock out a professional boxer." =>
    "Con las trenzas de su cabeza golpea a sus rivales para que se callen. Un golpe de esas trenzas dejaría fuera de combate a un boxeador profesional.",
  "It emits psychic power strong enough to cause headaches as a deterrent to the approach of others." =>
    "Emite un poder psíquico lo bastante fuerte como para causar dolores de cabeza y disuadir a otros de acercarse.",
  "Through its nose, it sucks in the emanations produced by people and Pokémon when they feel annoyed. It thrives off this negative energy." =>
    "Por la nariz aspira las emanaciones que producen personas y Pokémon cuando se sienten molestos. Prospera con esa energía negativa.",
  "With sly cunning, it tries to lure people into the woods. Some believe it to have the power to make crops grow." =>
    "Con astucia taimada, intenta atraer a las personas hacia el bosque. Algunos creen que tiene el poder de hacer crecer los cultivos.",
  "Its hairs work like muscle fibers. When its hairs unfurl, they latch on to opponents, ensnaring them as tentacles would." =>
    "Su pelo funciona como fibras musculares. Cuando se despliega, se adhiere a sus rivales y los atrapa como si fueran tentáculos.",
  "It evolved after experiencing numerous fights. While crossing its arms, it lets out a shout that would make any opponent flinch." =>
    "Evolucionó tras vivir numerosas peleas. Mientras cruza los brazos, suelta un grito que haría acobardar a cualquier rival.",
  "What appears to be an iron helmet is actually hardened hair. This Pokémon lives for the thrill of battle." =>
    "Lo que parece un casco de hierro en realidad es pelo endurecido. Este Pokémon vive por la emoción del combate.",
  "Its shell is overflowing with its heightened otherworldly energy. The ectoplasm serves as protection for this Pokémon's core spirit." =>
    "Su caparazón rebosa de su intensificada energía de ultratumba. El ectoplasma protege el espíritu central de este Pokémon.",
  "After deflecting attacks with its hard leaf shield, it strikes back with its sharp leek stalk. The leek stalk is both weapon and food." =>
    "Tras desviar ataques con su duro escudo de hoja, contraataca con su afilado tallo de puerro. El puerro le sirve tanto de arma como de alimento.",
  "Its amusing movements make it very popular. It releases its psychic power from the pattern on its belly." =>
    "Sus divertidos movimientos lo hacen muy popular. Libera su poder psíquico desde el patrón de su vientre.",
  "A powerful curse was woven into an ancient painting. After absorbing the spirit of a Yamask, the painting began to move." =>
    "Una poderosa maldición fue tejida en una pintura antigua. Tras absorber el espíritu de un Yamask, la pintura comenzó a moverse.",
  "This Pokémon was born from sweet-smelling particles in the air. Its body is made of cream." =>
    "Este Pokémon nació de partículas de dulce aroma en el aire. Su cuerpo está hecho de crema.",
  "When Alcremie is content, the cream it secretes from its hands becomes sweeter and richer." =>
    "Cuando Alcremie está contento, la crema que segrega de sus manos se vuelve más dulce y sabrosa.",
  "The six of them work together as one Pokémon. Teamwork is also their battle strategy, and they constantly change their formation as they fight." =>
    "Los seis trabajan juntos como un solo Pokémon. El trabajo en equipo también es su estrategia de combate, y cambian de formación constantemente mientras luchan.",
  "It stores electricity in each spine. Even if one gets broken off, it still continues to emit electricity for at least three hours." =>
    "Almacena electricidad en cada púa. Incluso si una se rompe, sigue emitiendo electricidad durante al menos tres horas.",
  "It spits out thread imbued with a frigid sort of energy and uses it to tie its body to branches, disguising itself as an icicle while it sleeps." =>
    "Escupe un hilo impregnado de una energía gélida y lo usa para atarse a las ramas, disfrazándose de carámbano mientras duerme.",
  "It shows no mercy to any who desecrate fields and mountains. It will fly around on its icy wings, causing a blizzard to chase offenders away." =>
    "No muestra piedad con quienes profanan campos y montañas. Vuela con sus alas heladas, provocando una ventisca para ahuyentar a los infractores.",
  "Once a year, on a specific date and at a specific time, they gather out of nowhere and form up in a circle." =>
    "Una vez al año, en una fecha y hora específicas, se reúnen de la nada y forman un círculo.",
  "It drifted in on the flow of ocean waters from a frigid place. It keeps its head iced constantly to make sure it stays nice and cold." =>
    "Llegó a la deriva por las corrientes oceánicas desde un lugar helado. Mantiene su cabeza congelada constantemente para asegurarse de estar bien frío.",
  "It uses the horns on its head to sense the emotions of others. Males will act as valets for those they serve, looking after their every need." =>
    "Usa los cuernos de su cabeza para percibir las emociones de los demás. Los machos actúan como asistentes de quienes sirven, atendiendo cada una de sus necesidades.",
  "As it eats the seeds stored up in its pocket-like pouches, this Pokémon is not just satisfying its constant hunger. It's also generating electricity." =>
    "Mientras come las semillas almacenadas en sus bolsas, este Pokémon no solo satisface su hambre constante, sino que también genera electricidad.",
  "It digs up the ground with its trunk. It's also very strong, being able to carry loads of over five tons without any problem at all." =>
    "Excava el suelo con su trompa. Además es muy fuerte, capaz de cargar más de cinco toneladas sin ningún problema.",
  "These Pokémon live in herds. Their trunks have incredible grip strength, strong enough to crush giant rocks into powder." =>
    "Estos Pokémon viven en manadas. Sus trompas tienen una fuerza de agarre increíble, capaz de pulverizar rocas gigantes.",
  "In ancient times, it was unbeatable thanks to its powerful lower body, but it went extinct anyway after it depleted all its plant-based food sources." =>
    "En la antigüedad era invencible gracias a la fuerza de su tren inferior, pero aun así se extinguió tras agotar todas sus fuentes de alimento vegetal.",
  "The shaking of its freezing upper half is what generates its electricity. It has a hard time walking around." =>
    "El temblor de su gélida mitad superior es lo que genera su electricidad. Le cuesta mucho caminar.",
  "Powerful legs and jaws made it the apex predator of its time. Its own overhunting of its prey was what drove it to extinction." =>
    "Sus poderosas patas y mandíbulas lo convirtieron en el depredador dominante de su época. Su propia caza excesiva de presas fue lo que lo llevó a la extinción.",
  "Though it's able to capture prey by freezing its surroundings, it has trouble eating the prey afterward because its mouth is on top of its head." =>
    "Aunque es capaz de capturar presas congelando su entorno, luego tiene problemas para comerlas porque su boca está en la parte superior de la cabeza.",
  "Its body resembles polished metal, and it's both lightweight and strong. The only drawback is that it rusts easily." =>
    "Su cuerpo se asemeja a metal pulido, y es a la vez ligero y resistente. El único inconveniente es que se oxida con facilidad.",
  "After being reborn as a ghost Pokémon, Dreepy wanders the areas it used to inhabit back when it was alive in prehistoric seas." =>
    "Tras renacer como Pokémon fantasma, Dreepy vaga por las zonas que solía habitar cuando estaba vivo en mares prehistóricos.",
  "It's capable of flying faster than 120 mph. It battles alongside Dreepy and dotes on them until they successfully evolve." =>
    "Es capaz de volar a más de 190 km/h. Combate junto a Dreepy y los cuida hasta que logran evolucionar.",
  "When it isn't battling, it keeps Dreepy in the holes on its horns. Once a fight starts, it launches the Dreepy like supersonic missiles." =>
    "Cuando no combate, guarda a los Dreepy en los huecos de sus cuernos. En cuanto empieza una pelea, los lanza como misiles supersónicos.",
  "Known as a legendary hero, this Pokémon absorbs metal particles, transforming them into a weapon it uses to battle." =>
    "Conocido como un héroe legendario, este Pokémon absorbe partículas de metal y las transforma en un arma que usa para combatir.",
  "This Pokémon slept for aeons while in the form of a statue. It was asleep for so long, people forgot that it ever existed." =>
    "Este Pokémon durmió durante eones con forma de estatua. Durmió tanto tiempo que la gente olvidó que había existido.",
  "The core on its chest absorbs energy emanating from the lands of the Galar region. This energy is what allows Eternatus to stay active." =>
    "El núcleo de su pecho absorbe la energía que emana de las tierras de la región de Galar. Esa energía es lo que permite a Eternatus mantenerse activo.",
  "Kubfu trains hard to perfect its moves. The moves it masters will determine which form it takes when it evolves." =>
    "Kubfu entrena duro para perfeccionar sus movimientos. Los movimientos que domine determinarán qué forma adoptará al evolucionar.",
  "Inhabiting the mountains of a distant region, this Pokémon races across sheer cliffs, training its legs and refining its moves." =>
    "Habitando las montañas de una región lejana, este Pokémon corre por acantilados escarpados, entrenando sus piernas y refinando sus movimientos.",
  "Once the vines on Zarude's body tear off, they become nutrients in the soil. This helps the plants of the forest grow." =>
    "Cuando las enredaderas del cuerpo de Zarude se desprenden, se convierten en nutrientes del suelo, lo cual ayuda a crecer a las plantas del bosque.",
  "This Pokémon is a cluster of electrical energy. It's said that removing the rings on Regieleki's body will unleash the Pokémon's latent power." =>
    "Este Pokémon es un cúmulo de energía eléctrica. Se dice que quitar los anillos del cuerpo de Regieleki liberaría su poder latente.",
  "Its body is composed of crystallized dragon energy. Regidrago is said to have the powers of every dragon Pokémon." =>
    "Su cuerpo está compuesto de energía dragón cristalizada. Se dice que Regidrago posee los poderes de todos los Pokémon dragón.",
  "Glastrier has tremendous physical strength, and the mask of ice covering its face is 100 times harder than diamond." =>
    "Glastrier tiene una fuerza física tremenda, y la máscara de hielo que cubre su rostro es 100 veces más dura que el diamante.",
  "As it dashes through the night, Spectrier absorbs the life-force of sleeping creatures. It craves silence and solitude." =>
    "Mientras corre por la noche, Spectrier absorbe la fuerza vital de las criaturas dormidas. Anhela el silencio y la soledad.",
  "Calyrex is a merciful Pokémon, capable of providing healing and blessings. It reigned over the Galar region in times of yore." =>
    "Calyrex es un Pokémon misericordioso, capaz de sanar y dar bendiciones. Reinó sobre la región de Galar en tiempos remotos.",
  "The black orbs shine with an uncanny light when the Pokémon is erecting invisible barriers. The fur shed from its beard retains heat well and is a highly useful material for winter clothing" =>
    "Los orbes negros brillan con una luz inquietante cuando el Pokémon erige barreras invisibles. El pelo que muda de su barba retiene bien el calor y es un material muy útil para ropa de invierno.",
  "A violent creature that fells towering trees with its crude axes and shields itself with hard stone. If one should chance upon this Pokémon in the wilds, one's only recourse is to flee." =>
    "Una criatura violenta que derriba árboles imponentes con sus toscas hachas y se protege con piedra dura. Si uno se topa con este Pokémon en estado salvaje, su único recurso es huir.",
}

apply_dex_dict(DICT)
