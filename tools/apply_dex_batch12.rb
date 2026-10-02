# encoding: UTF-8
require_relative "apply_dex_common"

DICT = {
  "This is Rotom after it's seized control of a lawn mower that has a special motor. As it mows down grass, it scatters the clippings everywhere." =>
    "Este es Rotom tras tomar el control de una cortadora de césped con un motor especial. Mientras corta el pasto, esparce los recortes por todas partes.",
  "Even Basculin, which devours everything it can with its huge jaws, is nothing more than food to organisms stronger than itself." =>
    "Incluso Basculin, que devora todo lo que puede con sus enormes mandíbulas, no es más que comida para organismos más fuertes que él.",
  "The colder they get, the more energetic they are. They freeze their breath to make snowballs, using them as ammo for playful snowball fights." =>
    "Cuanto más frío tienen, más enérgicos se vuelven. Congelan su aliento para hacer bolas de nieve y las usan como munición en divertidas guerras de nieve.",
  "When wounded, it stops moving. It goes as still as stone to meditate, sharpening its mind and spirit." =>
    "Cuando está herido, deja de moverse. Se queda tan quieto como una piedra para meditar, agudizando su mente y espíritu.",
  "On days when blizzards blow through, it comes down to where people live. It stashes food in the snowball on its head, taking it home for later." =>
    "En los días de ventisca baja a donde vive la gente. Guarda comida en la bola de nieve de su cabeza para llevarla a casa más tarde.",
  "Anger has reignited its atrophied flame sac. This Pokémon spews fire everywhere as it rampages indiscriminately." =>
    "La ira ha reencendido su atrofiado saco de fuego. Este Pokémon escupe fuego por todas partes mientras arrasa sin distinción.",
  "A clay slab with cursed engravings took possession of a Yamask. The slab is said to be absorbing the Yamask's dark power." =>
    "Una losa de arcilla con grabados malditos poseyó a un Yamask. Se dice que la losa absorbe el poder oscuro de Yamask.",
  "Its conspicuous lips lure prey in as it lies in wait in the mud. When prey gets close, Stunfisk clamps its jagged steel fins down on them." =>
    "Sus llamativos labios atraen a sus presas mientras espera oculto en el barro. Cuando la presa se acerca, Stunfisk la atrapa con sus dentadas aletas de acero.",
  "It has foreseen that a world of truth will arrive for people and Pokémon. It strives to protect that future." =>
    "Ha previsto que llegará un mundo de verdad para las personas y los Pokémon. Se esfuerza por proteger ese futuro.",
  "It's said that this Pokémon battles in order to protect the ideal world that will exist in the future for people and Pokémon." =>
    "Se dice que este Pokémon combate para proteger el mundo ideal que existirá en el futuro para las personas y los Pokémon.",
  "The power that lay hidden in its body now covers its horn, turning it into a sword that can slice through anything." =>
    "El poder que yacía oculto en su cuerpo ahora cubre su cuerno, convirtiéndolo en una espada capaz de cortar cualquier cosa.",
  "The flower it's holding can no longer be found blooming anywhere. It's also thought to contain terrifying power." =>
    "La flor que sostiene ya no se encuentra floreciendo en ningún lugar. También se cree que contiene un poder aterrador.",
  "Females are a bit more selfish and aggressive than males. If they don't get what they want, they will torment you with their psychic abilities." =>
    "Las hembras son un poco más egoístas y agresivas que los machos. Si no consiguen lo que quieren, te atormentarán con sus habilidades psíquicas.",
  "Once upon a time, a king with an Aegislash reigned over the land. His Pokémon eventually drained him of life, and his kingdom fell with him." =>
    "Hace mucho tiempo, un rey con un Aegislash reinó sobre la tierra. Su Pokémon finalmente le drenó la vida, y su reino cayó con él.",
  "Spirits that wander this world are placed into Pumpkaboo's body. They're then moved on to the afterlife." =>
    "Los espíritus que vagan por este mundo se depositan en el cuerpo de Pumpkaboo. Luego son trasladados al más allá.",
  "When taking spirits to the afterlife, large Pumpkaboo prefer the spirits of adults to those of children." =>
    "Al llevar espíritus al más allá, los Pumpkaboo grandes prefieren los espíritus de adultos antes que los de niños.",
  "Massive Pumpkaboo are said to be the product of areas where a great number of lost souls lingered." =>
    "Se dice que los Pumpkaboo enormes son producto de lugares donde perduró un gran número de almas perdidas.",
  "Eerie cries emanate from its body in the dead of night. The sounds are said to be the wails of spirits who are suffering in the afterlife." =>
    "De su cuerpo emanan gritos escalofriantes en plena noche. Se dice que esos sonidos son los lamentos de espíritus que sufren en el más allá.",
  "Large Gourgeist put on the guise of adults, taking the hands of children to lead them to the afterlife." =>
    "Los Gourgeist grandes adoptan la apariencia de adultos y toman de la mano a los niños para llevarlos al más allá.",
  "Supersized Gourgeist aren't picky. They will forcefully drag anyone off to the afterlife." =>
    "Los Gourgeist descomunales no son exigentes: arrastran a cualquiera al más allá por la fuerza.",
  "This is Zygarde when about 10% of its pieces have been assembled. It leaps at its opponent's chest and sinks its sharp fangs into them." =>
    "Este es Zygarde cuando aproximadamente el 10% de sus piezas se han ensamblado. Salta al pecho de su rival y le clava sus afilados colmillos.",
  "This is Zygarde's perfected form. From the orifice on its chest, it radiates high-powered energy that eliminates everything." =>
    "Esta es la forma perfeccionada de Zygarde. Desde el orificio de su pecho irradia energía de alto poder que elimina todo a su paso.",
  "It creates an electric charge by rubbing its feathers together. It dances over to its enemies and delivers shocking electrical punches." =>
    "Crea una carga eléctrica frotando sus plumas entre sí. Baila hacia sus enemigos y les propina golpes eléctricos impactantes.",
  "This Oricorio relaxes by swaying gently. This increases its psychic energy, which it then fires at its enemies." =>
    "Este Oricorio se relaja meciéndose suavemente. Esto aumenta su energía psíquica, que luego dispara contra sus enemigos.",
  "It summons the dead with its dreamy dancing. From their malice, it draws power with which to curse its enemies." =>
    "Invoca a los muertos con su danza onírica. De su malicia extrae el poder con el que maldice a sus enemigos.",
  "It goads its enemies into attacking, withstands the hits, and in return, delivers a headbutt, crushing their bones with its rocky mane." =>
    "Provoca a sus enemigos para que ataquen, resiste los golpes y, a cambio, da un cabezazo que les tritura los huesos con su melena rocosa.",
  "Bathed in the setting sun of evening, Lycanroc has undergone a special kind of evolution. An intense fighting spirit underlies its calmness." =>
    "Bañado por el sol del atardecer, Lycanroc ha sufrido un tipo especial de evolución. Bajo su calma se esconde un intenso espíritu de lucha.",
  "Weak Wishiwashi school together to concentrate their power. Their united force makes them the demon of the sea, feared near and far." =>
    "Los débiles Wishiwashi se agrupan en cardúmenes para concentrar su poder. Su fuerza unida los convierte en el demonio del mar, temido en todas partes.",
  "If its core stays exposed, it will soon die off. It's possible that it may survive if it's put into a Poké Ball quickly enough." =>
    "Si su núcleo permanece expuesto, morirá pronto. Es posible que sobreviva si se lo mete en una Poké Ball con suficiente rapidez.",
  "Sad that its true identity may be exposed, Mimikyu will mercilessly seek revenge on any opponent that breaks its neck." =>
    "Apenado de que su verdadera identidad pueda revelarse, Mimikyu busca venganza sin piedad contra cualquier rival que le rompa el cuello.",
  "This is Necrozma's form while it's absorbing the power of Solgaleo, making it extremely ferocious and impossible to control." =>
    "Esta es la forma de Necrozma mientras absorbe el poder de Solgaleo, lo que lo vuelve extremadamente feroz e imposible de controlar.",
  "Lunala no longer has a will of its own. Now under the control of Necrozma, it continuously expels all of its energy." =>
    "Lunala ya no tiene voluntad propia. Ahora bajo el control de Necrozma, expulsa continuamente toda su energía.",
  "The light pouring out from all over its body affects living things and nature, impacting them in various ways." =>
    "La luz que brota de todo su cuerpo afecta a los seres vivos y a la naturaleza de diversas maneras.",
  "This gorgeous Magearna looks as it did at the time of its invention. Its luxurious decoration pleased the king's daughter." =>
    "Este magnífico Magearna luce como en el momento de su invención. Su lujosa decoración complació a la hija del rey.",
  "Cramorant's gluttony led it to try to swallow an Arrokuda whole, which in turn led to Cramorant getting an Arrokuda stuck in its throat." =>
    "La glotonería de Cramorant lo llevó a intentar tragarse un Arrokuda entero, y eso hizo que se le quedara atascado en la garganta.",
  "This Cramorant has accidentally gotten a Pikachu lodged in its gullet. Cramorant is choking a little, but it isn't really bothered." =>
    "Este Cramorant accidentalmente se atragantó con un Pikachu. Le cuesta un poco respirar, pero no parece importarle demasiado.",
  "Capable of generating 15,000 volts of electricity, this Pokémon looks down on all that would challenge it." =>
    "Capaz de generar 15.000 voltios de electricidad, este Pokémon menosprecia a todo el que se atreva a desafiarlo.",
  "The swirl pattern in this Pokémon's body is its weakness. If it gets stirred, the swirl loses its shape, and Sinistea gets dizzy." =>
    "El patrón en espiral del cuerpo de este Pokémon es su punto débil. Si se lo revuelve, la espiral pierde su forma y Sinistea se marea.",
  "Trainers Polteageist trusts will be allowed to experience its distinctive flavor and aroma firsthand by sampling just a tiny bit of its tea." =>
    "A los entrenadores en quienes confía, Polteageist les permite experimentar en persona su sabor y aroma característicos probando solo un poco de su té.",
  "The cells that compose its cream fluctuated suddenly during evolution, giving the cream a sweet and tart flavor." =>
    "Las células que componen su crema fluctuaron repentinamente durante la evolución, dándole a la crema un sabor dulce y ácido.",
  "The cells that compose its cream fluctuated suddenly during evolution, giving the cream an aromatic flavor." =>
    "Las células que componen su crema fluctuaron repentinamente durante la evolución, dándole a la crema un sabor aromático.",
  "The cells that compose its cream fluctuated suddenly during evolution, giving the cream a refreshing flavor." =>
    "Las células que componen su crema fluctuaron repentinamente durante la evolución, dándole a la crema un sabor refrescante.",
  "The cells that compose its cream fluctuated suddenly during evolution, giving the cream a sour flavor." =>
    "Las células que componen su crema fluctuaron repentinamente durante la evolución, dándole a la crema un sabor agrio.",
  "The cells that compose its cream fluctuated suddenly during evolution, giving the cream a salty flavor." =>
    "Las células que componen su crema fluctuaron repentinamente durante la evolución, dándole a la crema un sabor salado.",
  "The cells that compose its cream fluctuated suddenly during evolution, giving the cream a mixed flavor." =>
    "Las células que componen su crema fluctuaron repentinamente durante la evolución, dándole a la crema un sabor mixto.",
  "The cells that compose its cream fluctuated suddenly during evolution, giving the cream a bitter flavor." =>
    "Las células que componen su crema fluctuaron repentinamente durante la evolución, dándole a la crema un sabor amargo.",
  "The cells that compose its cream fluctuated suddenly during evolution, giving the cream a complex flavor." =>
    "Las células que componen su crema fluctuaron repentinamente durante la evolución, dándole a la crema un sabor complejo.",
  "The ice covering this Pokémon's face has shattered, revealing a slightly worried expression that many people are enamored with." =>
    "El hielo que cubría el rostro de este Pokémon se ha hecho añicos, revelando una expresión ligeramente preocupada que enamora a mucha gente.",
  "They diligently serve people and Pokémon so they can gather feelings of gratitude. The females are particularly good at babysitting." =>
    "Sirven diligentemente a personas y Pokémon para recolectar sentimientos de gratitud. Las hembras son especialmente buenas cuidando niños.",
  "Hunger hormones affect its temperament. Until its hunger is appeased, it gets up to all manner of evil deeds." =>
    "Las hormonas del hambre afectan su temperamento. Hasta que sacia su hambre, comete todo tipo de fechorías.",
  "Able to cut down anything with a single strike, it became known as the Fairy King's Sword, and it inspired awe in friend and foe alike." =>
    "Capaz de cortar cualquier cosa de un solo golpe, se lo conoció como la Espada del Rey Hada, e inspiraba temor tanto en aliados como en enemigos.",
  "Its ability to deflect any attack led to it being known as the Fighting Master's Shield. It was feared and respected by all." =>
    "Su capacidad de desviar cualquier ataque hizo que se lo conociera como el Escudo del Maestro de Combate. Todos lo temían y respetaban.",
  "It's believed that this Pokémon modeled its fighting style on the flow of a river—sometimes rapid, sometimes calm." =>
    "Se cree que este Pokémon basó su estilo de combate en el fluir de un río: a veces rápido, a veces calmo.",
  "According to lore, this Pokémon showed no mercy to those who got in its way, yet it would heal its opponents' wounds after battle." =>
    "Según la leyenda, este Pokémon no mostraba piedad con quienes se interponían en su camino, pero curaba las heridas de sus rivales después del combate.",
  "Legend says that by using its power to see all events from past to future, this Pokémon saved the creatures of a forest from a meteorite strike." =>
    "La leyenda cuenta que, usando su poder para ver todos los sucesos del pasado al futuro, este Pokémon salvó a las criaturas de un bosque del impacto de un meteorito.",
  "They patrol their territory in pairs. I believe the igneous rock components in the fur of this species are the result of volcanic activity in its habitat." =>
    "Patrullan su territorio en parejas. Creo que los componentes de roca ígnea en el pelaje de esta especie son resultado de la actividad volcánica de su hábitat.",
  "Snaps at its foes with fangs cloaked in blazing flame. Despite its bulk, it deftly feints every which way, leading opponents on a deceptively merry chase as it all but dances around them." =>
    "Muerde a sus rivales con colmillos envueltos en llamas ardientes. Pese a su corpulencia, finge con destreza en todas direcciones, llevando a sus rivales en una persecución engañosamente alegre mientras prácticamente baila a su alrededor.",
  "An enigmatic Pokémon that happens to bear a resemblance to a Poké Ball. When excited, it discharges the electric current it has stored in its belly, then lets out a great, uproarious laugh." =>
    "Un enigmático Pokémon que resulta parecerse a una Poké Ball. Cuando se excita, descarga la corriente eléctrica almacenada en su vientre y suelta una gran carcajada estruendosa.",
  "The tissue on the surface of its body is curiously similar in composition to an Apricorn. When irritated, this Pokémon lets loose an electric current equal to 20 lightning bolts." =>
    "El tejido de la superficie de su cuerpo es curiosamente similar en composición a una baya Apricorn. Cuando se irrita, este Pokémon libera una corriente eléctrica equivalente a 20 rayos.",
  "This kind of Tauros, known as the Combat Breed, is distinguished by its thick, powerful muscles and its fierce disposition." =>
    "Este tipo de Tauros, conocido como la raza de combate, se distingue por sus músculos gruesos y poderosos y su temperamento feroz.",
  "People call this kind of Tauros the Blaze Breed due to the hot air it snorts from its nostrils. Its three tails are intertwined." =>
    "La gente llama a este tipo de Tauros la raza ígnea debido al aire caliente que resopla por las fosas nasales. Sus tres colas están entrelazadas.",
  "It swims by jetting water from its horns. The most notable characteristic of the Aqua Breed is its high body fat, which allows it to float easily." =>
    "Nada expulsando agua por sus cuernos. La característica más notable de la raza acuática es su alto contenido de grasa corporal, que le permite flotar con facilidad.",
  "Said to purify lost, forsaken souls with its flames and guide them to the afterlife. I believe its form has been influenced by the energy of the sacred mountain towering at Hisui's center." =>
    "Se dice que purifica con sus llamas a las almas perdidas y abandonadas, guiándolas al más allá. Creo que su forma ha sido influenciada por la energía de la montaña sagrada que se alza en el centro de Hisui.",
  "After losing a territorial struggle, Wooper began living on land. The Pokémon changed over time, developing a poisonous film to protect its body." =>
    "Tras perder una lucha territorial, Wooper comenzó a vivir en tierra. Con el tiempo, este Pokémon cambió y desarrolló una película venenosa para proteger su cuerpo.",
  "Fishers detest this troublesome Pokémon because it sprays poison from its spines, getting it everywhere. A different form of Qwilfish lives in other regions." =>
    "Los pescadores detestan a este problemático Pokémon porque rocía veneno desde sus púas, ensuciando todo. En otras regiones vive una forma distinta de Qwilfish.",
  "Its sturdy, curved claws are ideal for traversing precipitous cliffs. From the tips of these claws drips a venom that infiltrates the nerves of any prey caught in Sneasel's grasp." =>
    "Sus fuertes garras curvas son ideales para atravesar acantilados escarpados. De la punta de esas garras gotea un veneno que se infiltra en los nervios de cualquier presa atrapada por Sneasel.",
  "Radiant light caused Dialga to take on a form bearing a striking resemblance to the creator Pokémon. Dialga now wields such colossal strength that one must conclude this is its true form." =>
    "Una luz radiante hizo que Dialga adoptara una forma con un parecido sorprendente al Pokémon creador. Dialga ahora posee una fuerza tan colosal que uno debe concluir que esta es su verdadera forma.",
  "It soars across the sky in a form that greatly resembles the creator of all things. Perhaps this imitation of appearance is Palkia's strategy for gaining Arceus's powers." =>
    "Surca el cielo con una forma que se asemeja enormemente al creador de todas las cosas. Quizás esta imitación de apariencia sea la estrategia de Palkia para obtener los poderes de Arceus.",
  "Hard of heart and deft of blade, this rare form of Samurott is a product of the Pokémon's evolution in the region of Hisui. Its turbulent blows crash into foes like ceaseless pounding waves." =>
    "De corazón duro y espada diestra, esta rara forma de Samurott es producto de la evolución del Pokémon en la región de Hisui. Sus turbulentos golpes se estrellan contra sus rivales como olas incesantes.",
  "They suspect that its well-developed legs are the result of a life spent on mountains covered in deep snow. The scent it exudes from its flower crown heartens those in proximity." =>
    "Se sospecha que sus patas muy desarrolladas son resultado de una vida pasada en montañas cubiertas de nieve profunda. El aroma que desprende su corona de flores anima a quienes están cerca.",
  "Though it differs from other Basculin in several respects, including demeanor—this one is gentle—people have categorized it as a regional form given the vast array of shared qualities." =>
    "Aunque difiere de otros Basculin en varios aspectos, incluido su temperamento (este es dócil), se lo ha clasificado como una forma regional dada la gran cantidad de rasgos compartidos.",
  "A once-departed soul, returned to life in Hisui. Derives power from resentment, which rises as energy atop its head and takes on the forms of foes. In this way, Zorua vents lingering malice." =>
    "Un alma que en su día partió, devuelta a la vida en Hisui. Deriva su poder del rencor, que se eleva como energía sobre su cabeza y adopta la forma de sus enemigos. Así, Zorua desahoga su malicia persistente.",
  "With its disheveled white fur, it looks like an embodiment of death. Heedless of its own safety, Zoroark attacks its nemeses with a bitter energy so intense, it lacerates Zoroark's own body." =>
    "Con su pelaje blanco despeinado, parece la encarnación de la muerte. Sin importarle su propia seguridad, Zoroark ataca a sus némesis con una energía amarga tan intensa que le lacera su propio cuerpo.",
  "Screaming a bloodcurdling battle cry, this huge and ferocious bird Pokémon goes out on the hunt. It blasts lakes with shock waves, then scoops up any prey that float to the water's surface." =>
    "Lanzando un grito de guerra escalofriante, este enorme y feroz Pokémon pájaro sale de cacería. Golpea lagos con ondas expansivas y luego recoge a las presas que flotan a la superficie.",
  "A creature given to melancholy. I suspect its metallic shell developed as a result of the mucus on its skin reacting with the iron in Hisui's water." =>
    "Una criatura propensa a la melancolía. Sospecho que su caparazón metálico se desarrolló al reaccionar el moco de su piel con el hierro del agua de Hisui.",
  "Able to freely control the hardness of its metallic shell. It loathes solitude and is extremely clingy—it will fume and run riot if those dearest to it ever leave its side." =>
    "Capaz de controlar libremente la dureza de su caparazón metálico. Detesta la soledad y es extremadamente dependiente: se enfurece y se descontrola si quienes más quiere se alejan de su lado.",
  "The armor of ice covering its lower jaw puts steel to shame and can shatter rocks with ease. This Pokémon barrels along steep mountain paths, cleaving through the deep snow." =>
    "La armadura de hielo que cubre su mandíbula inferior avergüenza al acero y puede hacer añicos rocas con facilidad. Este Pokémon avanza a toda velocidad por empinados senderos montañosos, atravesando la nieve profunda.",
  "The air stored inside the rachises of Decidueye's feathers insulates the Pokémon against Hisui's extreme cold. This is firm proof that evolution can be influenced by environment." =>
    "El aire almacenado dentro de los raquis de las plumas de Decidueye lo aísla del frío extremo de Hisui. Esta es una prueba firme de que la evolución puede verse influenciada por el entorno.",
  "A different guise from its feminine humanoid form. From the clouds, it descends upon those who treat any form of life with disrespect and metes out wrathful, ruthless punishment." =>
    "Una apariencia distinta de su forma humanoide femenina. Desde las nubes, desciende sobre quienes tratan con falta de respeto cualquier forma de vida e impone un castigo despiadado y furioso.",
  "This is a meticulous Pokémon that likes to keep things tidy. It shrouds itself in a floral aroma that soothes the Pokémon around it." =>
    "Este es un Pokémon meticuloso al que le gusta mantener todo ordenado. Se envuelve en un aroma floral que calma a los Pokémon de su alrededor.",
  "This species’ differing colors and patterns are apparently the result of Tatsugiri changing itself to suit the preferences of the prey it lures in." =>
    "Los distintos colores y patrones de esta especie son, al parecer, resultado de que Tatsugiri se transforma según las preferencias de la presa que quiere atraer.",
  "Bird Pokémon are its main prey. This Pokémon knows it’s weak, so it hunts with a partner." =>
    "Los Pokémon pájaro son su presa principal. Este Pokémon sabe que es débil, así que caza con un compañero.",
  "Blue-feathered Squawkabilly view their green- feathered counterparts as rivals, since the latter make up the largest, most powerful groups." =>
    "Los Squawkabilly de plumas azules ven a sus contrapartes de plumas verdes como rivales, ya que estas últimas forman los grupos más grandes y poderosos.",
  "The yellow Squawkabilly are especially fierce. They've even been known to drive other bird Pokémon out of town." =>
    "Los Squawkabilly amarillos son especialmente feroces. Incluso se sabe que expulsan del pueblo a otros Pokémon pájaro.",
  "Though these Squawkabilly are the fewest in number, they have no trouble living in towns since they blend in with the white buildings." =>
    "Aunque estos Squawkabilly son los menos numerosos, no tienen problema en vivir en los pueblos, ya que se camuflan con los edificios blancos.",
  "This Pokémon was born from passion that seeped into a coin. It wanders, apparently seeking to return to the treasure chest it once inhabited." =>
    "Este Pokémon nació de la pasión que se filtró en una moneda. Vaga, al parecer buscando regresar al cofre del tesoro que una vez habitó.",
  "It sprinkles some of its powdery body onto food and drains the life-force from those who so much as lick it." =>
    "Esparce parte de su cuerpo en polvo sobre la comida y drena la fuerza vital de quien apenas la lama.",
  "It lives inside a superb teacup that was crafted by a potter of great renown. Collectors positively adore this Pokémon." =>
    "Vive dentro de una excelsa taza de té creada por un alfarero de gran renombre. Los coleccionistas adoran a este Pokémon.",
  "This form excels in both attack and defense. It ceaselessly unleashes moves like a spring gushes water." =>
    "Esta forma destaca tanto en ataque como en defensa. Desata movimientos sin cesar, como un manantial que brota agua.",
  "This form is the most aggressive, bombarding enemies with the intensity of flames blazing within a hearth." =>
    "Esta forma es la más agresiva, bombardeando a los enemigos con la intensidad de las llamas que arden en un hogar.",
  "This form has excellent defenses, absorbing impacts solidly like the cornerstones that support houses." =>
    "Esta forma tiene excelentes defensas, absorbiendo impactos con solidez como las piedras angulares que sostienen las casas.",
  "The shell is made of crystallized Terastal energy. When struck by a move, this shell absorbs the move’s energy and transfers it to Terapagos." =>
    "El caparazón está hecho de energía teracristal cristalizada. Cuando lo golpea un movimiento, este caparazón absorbe la energía del movimiento y se la transfiere a Terapagos.",
  "In this form, Terapagos resembles the world as the ancients saw it, and its Terastal energy is abnormally amplified." =>
    "En esta forma, Terapagos se asemeja al mundo tal como lo veían los antiguos, y su energía teracristal está anormalmente amplificada.",
  "The cap this Pikachu wears is filled with memories of this Pokémon and its partner traveling across lots of different regions together." =>
    "La gorra que lleva este Pikachu está llena de recuerdos de este Pokémon y su compañero viajando juntos por muchas regiones distintas.",
  "The cap this Pikachu wears is filled with memories of this Pokémon and its partner traveling across the Hoenn region together." =>
    "La gorra que lleva este Pikachu está llena de recuerdos de este Pokémon y su compañero viajando juntos por la región de Hoenn.",
  "The cap this Pikachu wears is filled with memories of this Pokémon and its partner traveling across the Sinnoh region together." =>
    "La gorra que lleva este Pikachu está llena de recuerdos de este Pokémon y su compañero viajando juntos por la región de Sinnoh.",
  "The cap this Pikachu wears is filled with memories of this Pokémon and its partner traveling across the Unova region together." =>
    "La gorra que lleva este Pikachu está llena de recuerdos de este Pokémon y su compañero viajando juntos por la región de Unova.",
  "The cap this Pikachu wears is filled with memories of this Pokémon and its partner traveling across the Kalos region together." =>
    "La gorra que lleva este Pikachu está llena de recuerdos de este Pokémon y su compañero viajando juntos por la región de Kalos.",
  "The cap this Pikachu wears is filled with memories of this Pokémon and its partner traveling across the Alola region together." =>
    "La gorra que lleva este Pikachu está llena de recuerdos de este Pokémon y su compañero viajando juntos por la región de Alola.",
  "The cap this Pikachu wears is filled with memories of this Pokémon traveling together with its partner, whom it met in a fateful encounter." =>
    "La gorra que lleva este Pikachu está llena de recuerdos de este Pokémon viajando junto a su compañero, a quien conoció en un encuentro del destino.",
  "The cap this Pikachu wears is filled with memories of this Pokémon and its partner traveling across the world together." =>
    "La gorra que lleva este Pikachu está llena de recuerdos de este Pokémon y su compañero viajando juntos por todo el mundo.",
}

apply_dex_dict(DICT)
