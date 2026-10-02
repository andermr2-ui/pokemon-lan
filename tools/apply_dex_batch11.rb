# encoding: UTF-8
require_relative "apply_dex_common"

DICT = {
  "The grudge of a person punished for writing the king’s evil deeds upon wooden tablets has clad itself in dead leaves to become a Pokémon." =>
    "El rencor de una persona castigada por escribir las malas acciones del rey en tablillas de madera se revistió de hojas muertas para convertirse en un Pokémon.",
  "This Pokémon can control 100 tons of fallen snow. It plays around innocently by leaping in and out of avalanches it has caused." =>
    "Este Pokémon puede controlar 100 toneladas de nieve caída. Juega inocentemente saltando dentro y fuera de las avalanchas que provoca.",
  "The fear poured into an ancient ritual vessel has clad itself in rocks and dirt to become a Pokémon." =>
    "El miedo vertido en una antigua vasija ritual se revistió de roca y tierra para convertirse en un Pokémon.",
  "It controls flames burning at over 5,400 degrees Fahrenheit. It casually swims through the sea of lava it creates by melting rock and sand." =>
    "Controla llamas que arden a más de 3.000 grados Celsius. Nada tranquilamente por el mar de lava que crea al derretir roca y arena.",
  "It is possible that this is the creature listed as Roaring Moon in an expedition journal that still holds many mysteries." =>
    "Es posible que sea la criatura mencionada bajo ese nombre en un diario de expedición que aún guarda muchos misterios.",
  "It has some similarities to a mad scientist’s invention covered in a paranormal magazine." =>
    "Tiene algunas similitudes con el invento de un científico loco cubierto en una revista paranormal.",
  "This seems to be the Winged King mentioned in an old expedition journal. It was said to have split the land with its bare fists." =>
    "Parece ser el Rey Alado mencionado en un antiguo diario de expedición. Se decía que partió la tierra con sus propios puños.",
  "Much remains unknown about this creature. It resembles Cyclizar, but it is far more ruthless and powerful." =>
    "Aún se desconoce mucho sobre esta criatura. Se parece a Cyclizar, pero es mucho más despiadada y poderosa.",
  "This ferocious creature is shrouded in mystery. It's named after an aquatic monster mentioned in an old expedition journal." =>
    "Esta feroz criatura está envuelta en misterio. Su nombre proviene de un monstruo acuático mencionado en un antiguo diario de expedición.",
  "According to the few eyewitness accounts that exist, it used its shining blades to julienne large trees and boulders." =>
    "Según los pocos testimonios que existen, usaba sus relucientes cuchillas para cortar en juliana grandes árboles y peñascos.",
  "The head sticking out belongs to the fore-wyrm, while the tail belongs to the core-wyrm. The two share one apple and help each other out." =>
    "La cabeza que sobresale pertenece al dragón delantero, mientras que la cola pertenece al dragón central. Ambos comparten una manzana y se ayudan mutuamente.",
  "Supposedly, the regrets of a tea ceremony master who died before perfecting his craft lingered in some matcha and became a Pokémon." =>
    "Se supone que los remordimientos de un maestro de la ceremonia del té que murió antes de perfeccionar su arte perduraron en un matcha y se convirtieron en un Pokémon.",
  "It pretends to be tea, trying to fool people into drinking it so it can drain their life-force. Its ruse is generally unsuccessful." =>
    "Finge ser té para engañar a la gente y que lo beba, así puede drenarle la fuerza vital. Su treta generalmente no funciona.",
  "After all its muscles were stimulated by the toxic chain around its neck, Okidogi transformed and gained a powerful physique." =>
    "Después de que todos sus músculos fueron estimulados por la cadena tóxica alrededor de su cuello, Okidogi se transformó y obtuvo un físico poderoso.",
  "The chain is made from toxins that enhance capabilities. It stimulated Munkidori's brain and caused the Pokémon's psychic powers to bloom." =>
    "La cadena está hecha de toxinas que potencian las capacidades. Estimuló el cerebro de Munkidori y provocó que florecieran sus poderes psíquicos.",
  "Fezandipiti owes its beautiful looks and lovely voice to the toxic stimulants emanating from the chain wrapped around its body." =>
    "Fezandipiti debe su hermoso aspecto y su encantadora voz a los estimulantes tóxicos que emanan de la cadena que envuelve su cuerpo.",
  "This Pokémon's type changes based on which mask it's wearing. It confounds its enemies with nimble movements and kicks." =>
    "El tipo de este Pokémon cambia según la máscara que lleve puesta. Confunde a sus enemigos con movimientos ágiles y patadas.",
  "It digs holes on mountains, searching for food. It’s so durable that being caught in a cave-in won’t faze it." =>
    "Cava agujeros en las montañas buscando comida. Es tan resistente que quedar atrapado en un derrumbe no lo inmuta.",
  "Seven syrpents live inside an apple made of syrup. The syrpent in the center is the commander." =>
    "Siete melguiones viven dentro de una manzana hecha de almíbar. El melguión del centro es el comandante.",
  "There are scant few reports of this creature being sighted. One short video shows it rampaging and spouting pillars of flame." =>
    "Hay muy pocos reportes de avistamientos de esta criatura. Un breve video la muestra arrasando y expulsando columnas de fuego.",
  "It's said to incinerate everything around it with lightning launched from its fur. Very little is known about this creature." =>
    "Se dice que incinera todo a su alrededor con rayos lanzados desde su pelaje. Se sabe muy poco sobre esta criatura.",
  "It was named after a mysterious object recorded in an old book. Its body seems to be metallic." =>
    "Recibió su nombre de un objeto misterioso registrado en un libro antiguo. Su cuerpo parece ser metálico.",
  "There was supposedly an incident in which it launched shining blades to cut everything around it to pieces. Little else is known about it." =>
    "Supuestamente hubo un incidente en el que lanzó relucientes cuchillas que cortaron todo a su alrededor en pedazos. Poco más se sabe de él.",
  "Terapagos protects itself using its power to transform energy into hard crystals. This Pokémon is the source of the Terastal phenomenon." =>
    "Terapagos se protege usando su poder para transformar energía en duros cristales. Este Pokémon es el origen del fenómeno teracristal.",
  "It feeds others toxic mochi that draw out desires and capabilities. Those who eat the mochi fall under Pecharunt's control, chained to its will." =>
    "Alimenta a otros con mochis tóxicos que sacan a relucir deseos y capacidades. Quien come esos mochis cae bajo el control de Pecharunt, encadenado a su voluntad.",
  "In order to support its flower, which has grown larger due to Mega Evolution, its back and legs have become stronger." =>
    "Para sostener su flor, que ha crecido más grande debido a la megaevolución, su espalda y patas se han vuelto más fuertes.",
  "The overwhelming power that fills its entire body causes it to turn black and create intense blue flames." =>
    "El poder abrumador que llena todo su cuerpo hace que se vuelva negro y cree intensas llamas azules.",
  "Its bond with its Trainer is the source of its power. It boasts speed and maneuverability greater than that of a jet fighter." =>
    "Su vínculo con su entrenador es la fuente de su poder. Presume una velocidad y maniobrabilidad mayores que las de un caza a reacción.",
  "The cannon on its back is as powerful as a tank gun. Its tough legs and back enable it to withstand the recoil from firing the cannon." =>
    "El cañón de su espalda es tan potente como el de un tanque. Sus fuertes patas y espalda le permiten soportar el retroceso al dispararlo.",
  "Its legs have become poison stingers. It stabs its prey repeatedly with the stingers on its limbs, dealing the final blow with the stinger on its rear." =>
    "Sus patas se han convertido en aguijones venenosos. Apuñala repetidamente a sus presas con los aguijones de sus extremidades y da el golpe final con el de su cola.",
  "With its muscular strength now greatly increased, it can fly continuously for two weeks without resting." =>
    "Con su fuerza muscular ahora muy aumentada, puede volar sin parar durante dos semanas sin descansar.",
  "With its incisors, it gnaws through doors and infiltrates people's homes. Then, with a twitch of its whiskers, it steals whatever food it finds." =>
    "Con sus incisivos roe puertas para infiltrarse en las casas de la gente. Luego, con un movimiento de bigotes, roba cualquier comida que encuentre.",
  "It forms a group of Rattata, which it assumes command of. Each group has its own territory, and disputes over food happen often." =>
    "Forma un grupo de Rattata del cual asume el mando. Cada grupo tiene su propio territorio, y las disputas por comida son frecuentes.",
  "It uses psychokinesis to control electricity. It hops aboard its own tail, using psychic power to lift the tail and move about while riding it." =>
    "Usa psicoquinesis para controlar la electricidad. Se sube a su propia cola, usando poder psíquico para levantarla y desplazarse montado en ella.",
  "The skin on its back is as hard as steel. Predators go after its soft belly, so it clings to the ground desperately." =>
    "La piel de su lomo es dura como el acero. Los depredadores van tras su blando vientre, así que se aferra al suelo desesperadamente.",
  "It runs across snow-covered plains at high speeds. It developed thick, sharp claws to plow through the snow." =>
    "Corre a gran velocidad por llanuras cubiertas de nieve. Desarrolló garras gruesas y afiladas para abrirse paso entre la nieve.",
  "In hot weather, this Pokémon makes ice shards with its six tails and sprays them around to cool itself off." =>
    "En climas calurosos, este Pokémon crea esquirlas de hielo con sus seis colas y las esparce a su alrededor para refrescarse.",
  "It lives on mountains perpetually covered in snow and is revered as a deity incarnate. It appears draped in a blizzard." =>
    "Vive en montañas perpetuamente cubiertas de nieve y es venerado como una deidad encarnada. Aparece envuelto en una ventisca.",
  "Its head sports an altered form of whiskers made of metal. When in communication with its comrades, its whiskers wobble to and fro." =>
    "Su cabeza luce una forma alterada de bigotes hechos de metal. Cuando se comunica con sus compañeros, sus bigotes se agitan de un lado a otro.",
  "Its shining gold hair provides it with protection. It's reputed that keeping any of its fallen hairs will bring bad luck." =>
    "Su reluciente pelo dorado le brinda protección. Se dice que conservar alguno de sus pelos caídos trae mala suerte.",
  "It's impulsive, selfish, and fickle. It's very popular with some Trainers who like giving it the attention it needs." =>
    "Es impulsivo, egoísta y voluble. Es muy popular entre algunos entrenadores a quienes les gusta darle la atención que necesita.",
  "Living with a savage, seafaring people has toughened this Pokémon's body so much that parts of it have turned to iron." =>
    "Vivir con un pueblo marinero y salvaje ha endurecido tanto el cuerpo de este Pokémon que partes de él se han vuelto de hierro.",
  "Its round face is a symbol of wealth. Persian that have bigger, plumper faces are considered more beautiful." =>
    "Su cara redonda es un símbolo de riqueza. Los Persian con caras más grandes y rellenas se consideran más hermosos.",
  "Having traded away its muscles, Alakazam's true power has been unleashed. With its psychic powers, it can foresee all things." =>
    "Al haber renunciado a sus músculos, se ha liberado el verdadero poder de Alakazam. Con sus poderes psíquicos puede prever todas las cosas.",
  "Geodude compete against each other with headbutts. The iron sand on their heads will stick to whichever one has stronger magnetism." =>
    "Los Geodude compiten entre sí a cabezazos. La arena de hierro de sus cabezas se pega al que tenga mayor magnetismo.",
  "They eat rocks and often get into a scrap over them. The shock of Graveler smashing together causes a flash of light and a booming noise." =>
    "Comen rocas y a menudo se pelean por ellas. El choque de los Graveler al estrellarse entre sí provoca un destello de luz y un estruendo.",
  "It fires rocks charged with electricity. Even if the rock isn't fired that accurately, just grazing an opponent will cause numbness and fainting." =>
    "Dispara rocas cargadas de electricidad. Aunque el disparo no sea muy preciso, con solo rozar a un rival le provoca entumecimiento y desmayo.",
  "Its small horn hides a healing power. With a few rubs from this Pokémon's horn, any slight wound you have will be healed." =>
    "Su pequeño cuerno oculta un poder curativo. Con unos pocos roces de su cuerno, este Pokémon puede curar cualquier herida leve.",
  "Little can stand up to its psycho cut. Unleashed from this Pokémon's horn, the move will punch a hole right through a thick metal sheet." =>
    "Pocas cosas resisten su corte psíquico. Liberado desde el cuerno de este Pokémon, el movimiento puede perforar de un golpe una gruesa plancha de metal.",
  "Although this Pokémon is normally zoned out, its expression abruptly sharpens on occasion. The cause for this seems to lie in Slowpoke's diet." =>
    "Aunque este Pokémon suele estar ausente, a veces su expresión se agudiza de repente. La causa parece estar en la dieta de Slowpoke.",
  "If this Pokémon squeezes the tongue of the Shellder biting it, the Shellder will launch a toxic liquid from the tip of its shell." =>
    "Si este Pokémon aprieta la lengua del Shellder que lo muerde, el Shellder lanza un líquido tóxico desde la punta de su concha.",
  "Having been swallowed whole by Shellder, Slowbro now has an iron defense. It's pretty comfortable in there, too." =>
    "Tras ser tragado entero por Shellder, Slowbro ahora tiene una defensa de hierro. Además, se encuentra bastante cómodo ahí dentro.",
  "The stalks of leeks are thicker and longer in the Galar region. Farfetch'd that adapted to these stalks took on a unique form." =>
    "Los tallos de puerro son más gruesos y largos en la región de Galar. Los Farfetch'd que se adaptaron a estos tallos adoptaron una forma única.",
  "A Grimer, which had been brought in to solve a problem with garbage, developed over time into this form." =>
    "Un Grimer, traído para resolver un problema de basura, con el tiempo desarrolló esta forma.",
  "The garbage it eats causes continuous chemical changes in its body, which produce its exceedingly vivid coloration." =>
    "La basura que come provoca cambios químicos continuos en su cuerpo, lo que produce su coloración extremadamente vívida.",
  "The energy of Mega Evolution awakened it. It sinks into another dimension, where it keeps a patient watch for its chance to attack." =>
    "La energía de la megaevolución lo despertó. Se hunde en otra dimensión, donde vigila con paciencia su oportunidad de atacar.",
  "As it grew taller and taller, it outgrew its reliance on psychic powers, while within it awakened the power of the sleeping dragon." =>
    "A medida que crecía cada vez más alto, dejó de depender de sus poderes psíquicos, mientras que en su interior despertaba el poder del dragón dormido.",
  "Its custom is to mourn its lost companions. Mounds of dirt by the side of the road mark the graves of the Marowak." =>
    "Tiene la costumbre de llorar a sus compañeros perdidos. Los montículos de tierra al costado del camino marcan las tumbas de los Marowak.",
  "This Pokémon consumes particles that contaminate the air. Instead of leaving droppings, it expels clean air." =>
    "Este Pokémon consume partículas que contaminan el aire. En lugar de dejar excrementos, expulsa aire limpio.",
  "The explosive energy the child is bathed in causes temporary growth. The mother is beside herself with worry about it." =>
    "La energía explosiva que baña a la cría provoca un crecimiento temporal. A la madre le preocupa muchísimo.",
  "Its talent is tap-dancing. It can also manipulate temperatures to create a floor of ice, which this Pokémon can kick up to use as a barrier." =>
    "Su talento es el claqué. También puede manipular la temperatura para crear un suelo de hielo, que este Pokémon puede levantar de una patada para usarlo como barrera.",
  "It zips around at blistering speeds, looking for an opening to skewer its opponent on its giant pincers." =>
    "Se desplaza a una velocidad vertiginosa, buscando una oportunidad para ensartar a su rival con sus gigantescas pinzas.",
  "It zooms out of the water at Mach speeds. Even large ships caught in its path are split cleanly in two!" =>
    "Sale disparado del agua a velocidades supersónicas. ¡Hasta los grandes barcos que se cruzan en su camino quedan partidos limpiamente en dos!",
  "When it Mega Evolves, it becomes more vicious than ever before. Some say that's because its excess of power is causing it pain." =>
    "Cuando megaevoluciona, se vuelve más feroz que nunca. Algunos dicen que es porque el exceso de poder le provoca dolor.",
  "Its feather-like blades are composed of psychic energy and can shear through thick iron sheets as if they were paper." =>
    "Sus cuchillas en forma de pluma están compuestas de energía psíquica y pueden cortar gruesas planchas de hierro como si fueran papel.",
  "When its feathers rub together, they produce a crackling sound like the zapping of electricity. That's why this Pokémon is called Zapdos." =>
    "Cuando sus plumas se rozan, producen un chisporroteo similar a una descarga eléctrica. Por eso a este Pokémon se lo llama Zapdos.",
  "This Pokémon's sinister, flame-like aura will consume the spirit of any creature it hits. Victims become burned-out shadows of themselves." =>
    "El aura siniestra, como llamas, de este Pokémon consume el espíritu de cualquier criatura a la que golpea. Las víctimas quedan reducidas a sombras calcinadas de sí mismas.",
  "Psychic power has augmented its muscles. It has a grip strength of one ton and can sprint a hundred meters in two seconds flat!" =>
    "El poder psíquico ha potenciado sus músculos. Tiene una fuerza de agarre de una tonelada y puede correr cien metros en solo dos segundos.",
  "Despite its diminished size, its mental power has grown phenomenally. With a mere thought, it can smash a skyscraper to smithereens." =>
    "Pese a su tamaño reducido, su poder mental ha crecido enormemente. Con solo pensarlo, puede hacer añicos un rascacielos.",
  "Massive amounts of energy intensely stimulated Ampharos's cells, apparently awakening its long-sleeping dragon's blood." =>
    "Enormes cantidades de energía estimularon intensamente las células de Ampharos, despertando aparentemente su sangre de dragón largamente dormida.",
  "While chanting strange spells, this Pokémon combines its internal toxins with what it's eaten, creating strange potions." =>
    "Mientras entona extraños hechizos, este Pokémon combina sus toxinas internas con lo que ha comido, creando extrañas pociones.",
  "It's better at beating things than grasping them. When it battles for a long time, the weight of its pincers becomes too much to bear." =>
    "Es mejor golpeando cosas que agarrándolas. Cuando combate durante mucho tiempo, el peso de sus pinzas se vuelve demasiado difícil de soportar.",
  "A tremendous influx of energy builds it up, but when Mega Evolution ends, Heracross is bothered by terrible soreness in its muscles." =>
    "Una tremenda afluencia de energía lo fortalece, pero cuando termina la megaevolución, a Heracross le molesta un terrible dolor muscular.",
  "Sudden climate change wiped out this ancient kind of Corsola. This Pokémon absorbs others' life-force through its branches." =>
    "Un cambio climático repentino extinguió a esta antigua variedad de Corsola. Este Pokémon absorbe la fuerza vital de otros a través de sus ramas.",
  "Its red claws and the tips of its tail are melting from high internal temperatures that are painful to Houndoom itself." =>
    "Sus garras rojas y la punta de su cola se están derritiendo por las altas temperaturas internas, algo que resulta doloroso para el propio Houndoom.",
  "Due to the colossal power poured into it, this Pokémon's back split right open. Its destructive instincts are the only thing keeping it moving." =>
    "Debido al poder colosal que se vertió en él, la espalda de este Pokémon se partió por completo. Solo sus instintos destructivos lo mantienen en movimiento.",
  "Its restlessness has it constantly running around. If it sees another Pokémon, it will purposely run into them in order to start a fight." =>
    "Su inquietud lo hace correr constantemente. Si ve a otro Pokémon, se choca contra él a propósito para iniciar una pelea.",
  "It uses its long tongue to taunt opponents. Once the opposition is enraged, this Pokémon hurls itself at the opponent, tackling them forcefully." =>
    "Usa su larga lengua para provocar a sus rivales. Una vez que su oponente está furioso, este Pokémon se lanza contra él con un placaje contundente.",
  "Supporting a giant heavy jewel, it can't change direction very nimbly and is vulnerable to attack from behind." =>
    "Al sostener una gigantesca y pesada gema, no puede cambiar de dirección con agilidad y es vulnerable a ataques por la espalda.",
  "Its two sets of jaws thrash about violently as if they each had a will of their own. One gnash from them can turn a boulder to dust." =>
    "Sus dos pares de fauces se agitan violentamente como si cada una tuviera voluntad propia. Un solo mordisco puede convertir un peñasco en polvo.",
  "Too much electricity has built up in its body, irritating Manectric. Its explosive speed is equal to that of a lightning bolt." =>
    "Se ha acumulado demasiada electricidad en su cuerpo, irritando a Manectric. Su velocidad explosiva es equiparable a la de un rayo.",
  "The yellow patterns it bears are old scars. The energy from Mega Evolution runs through them, causing it sharp pain and suffering." =>
    "Los patrones amarillos que porta son viejas cicatrices. La energía de la megaevolución las recorre, causándole un dolor agudo y sufrimiento.",
  "This is the form Castform takes on the brightest of days. Its skin is unexpectedly hot to the touch, so approach with care." =>
    "Esta es la forma que adopta Castform en los días más soleados. Su piel está sorprendentemente caliente al tacto, así que hay que acercarse con cuidado.",
  "This is the form Castform takes when soaked with rain. When its body is compressed, water will seep out as if from a sponge." =>
    "Esta es la forma que adopta Castform cuando se empapa de lluvia. Al comprimir su cuerpo, sale agua como de una esponja.",
  "This is the form Castform takes when covered in snow. Its body becomes an ice-like material, with a temperature near -5 degrees Celsius." =>
    "Esta es la forma que adopta Castform cuando se cubre de nieve. Su cuerpo se convierte en un material similar al hielo, con una temperatura cercana a los -5 grados Celsius.",
  "Extraordinary energy amplifies its cursing power to such an extent that it can't help but curse its own Trainer." =>
    "Una energía extraordinaria amplifica tanto su poder de maldición que no puede evitar maldecir a su propio entrenador.",
  "When this Pokémon whips the winglike fur on its back as though beating its wings, it sends an intimidating aura flying at its opponents." =>
    "Cuando este Pokémon agita el pelaje alado de su espalda como si batiera alas, envía un aura intimidante hacia sus rivales.",
  "It envelops prey in its mouth, freezing them instantly. But its jaw is dislocated, so it's unable to eat them." =>
    "Envuelve a sus presas con la boca, congelándolas al instante. Pero tiene la mandíbula dislocada, así que no puede comérselas.",
  "It puts its forelegs inside its shell to streamline itself for flight. Salamence flies at high speeds over all kinds of topographical features." =>
    "Mete sus patas delanteras dentro del caparazón para volverse aerodinámico y volar. Salamence vuela a gran velocidad sobre todo tipo de terrenos.",
  "Its intellect surpasses its previous level, resulting in battles so cruel, they'll make you want to cover your eyes." =>
    "Su intelecto supera su nivel anterior, lo que da lugar a batallas tan crueles que dan ganas de taparse los ojos.",
  "After absorbing plenty of sunlight, Cherrim takes this form. It's full of energy while it's like this, and its liveliness will go on until sundown." =>
    "Tras absorber abundante luz solar, Cherrim adopta esta forma. Está lleno de energía mientras la mantiene, y su vitalidad continúa hasta el atardecer.",
  "Its appearance changes depending on the environment. One theory suggests that living in cold seas causes Shellos to take on this form." =>
    "Su apariencia cambia según el entorno. Una teoría sugiere que vivir en mares fríos hace que Shellos adopte esta forma.",
  "Its body is covered in a sticky slime. It's very susceptible to dehydration, so it can't spend too much time on land." =>
    "Su cuerpo está cubierto de una baba pegajosa. Es muy propenso a deshidratarse, así que no puede pasar mucho tiempo en tierra.",
  "It swings its ears like whips and strikes its enemies with them. It has an intensely combative disposition." =>
    "Agita sus orejas como látigos y golpea a sus enemigos con ellas. Tiene un temperamento intensamente combativo.",
  "Its vaunted wings become scythes, sending it mad with rage. It swings its scythes wildly and slices the ground to pieces." =>
    "Sus alegadas alas se convierten en guadañas, y esto lo vuelve loco de furia. Blande sus guadañas salvajemente y corta el suelo en pedazos.",
  "It readies itself to face its enemies by focusing its mental energies. Its fighting style can be summed up in a single word: heartless." =>
    "Se prepara para enfrentar a sus enemigos concentrando sus energías mentales. Su estilo de combate se resume en una sola palabra: despiadado.",
  "This Rotom has possessed a convection microwave oven that uses a special motor. It also has a flair for manipulating flames." =>
    "Este Rotom ha poseído un horno microondas de convección que usa un motor especial. También tiene talento para manipular llamas.",
  "This form of Rotom enjoys coming up with water-based pranks. Be careful with it if you don't want your room flooded." =>
    "Esta forma de Rotom disfruta ideando bromas con agua. Hay que tener cuidado con él si no querés que se inunde tu habitación.",
  "Rotom assumes this form when it takes over a refrigerator powered by a special motor. It battles by spewing cold air." =>
    "Rotom adopta esta forma cuando toma el control de un refrigerador con un motor especial. Combate expulsando aire frío.",
  "In this form, Rotom applies its new power over wind to its love of pranks. It will happily blow away any important documents it can find." =>
    "En esta forma, Rotom aplica su nuevo poder sobre el viento a su amor por las bromas. Se divierte volando cualquier documento importante que encuentre.",
}

apply_dex_dict(DICT)
