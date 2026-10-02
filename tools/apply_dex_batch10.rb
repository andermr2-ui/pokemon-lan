# encoding: UTF-8
require_relative "apply_dex_common"

DICT = {
  "It is believed that the swampy terrain of its ancient home region that gave Ursaluna its burly physique and newfound capacity to manipulate peat at will." =>
    "Se cree que el terreno pantanoso de su antigua región natal le dio a Ursaluna su corpulento físico y su nueva capacidad de manipular turba a voluntad.",
  "Clads itself in the souls of comrades that perished before fulfilling their goals of journeying upstream. No other species throughout other aquatic environments is Basculegion’s equal." =>
    "Se reviste con las almas de compañeros que perecieron antes de cumplir su meta de nadar río arriba. Ninguna otra especie en otros entornos acuáticos iguala a Basculegion.",
  "Because of Sneasler’s virulent poison and daunting physical prowess, no other species could hope to best it on frozen highlands. Preferring solitude, this species does not form packs." =>
    "Debido al virulento veneno y la imponente fuerza física de Sneasler, ninguna otra especie podría superarlo en las tierras altas heladas. Al preferir la soledad, esta especie no forma manadas.",
  "Its lancelike spikes and savage temperament have earned it the nickname \"sea fiend.\" It slurps up poison to nourish itself." =>
    "Sus púas en forma de lanza y su temperamento salvaje le han valido el apodo de \"demonio marino\". Sorbe veneno para alimentarse.",
  "When it flies to this land from across the sea, the bitter winter comes to an end. According to legend, this Pokémon's love gives rise to the budding of fresh life across Hisui." =>
    "Cuando vuela hasta esta tierra desde el otro lado del mar, el crudo invierno llega a su fin. Según la leyenda, el amor de este Pokémon da origen al brote de nueva vida en toda Hisui.",
  "The sweet scent its body gives off mesmerizes those around it. The scent grows stronger when this Pokémon is in the sun." =>
    "El dulce aroma que desprende su cuerpo hipnotiza a quienes lo rodean. El aroma se intensifica cuando este Pokémon está al sol.",
  "Floragato deftly wields the vine hidden beneath its long fur, slamming the hard flower bud against its opponents." =>
    "Floragato maneja con destreza la enredadera oculta bajo su largo pelaje, golpeando a sus rivales con su duro capullo de flor.",
  "This Pokémon uses the reflective fur lining its cape to camouflage the stem of its flower, creating the illusion that the flower is floating." =>
    "Este Pokémon usa el pelaje reflectante que recubre su capa para camuflar el tallo de su flor, creando la ilusión de que la flor flota.",
  "It lies on warm rocks and uses the heat absorbed by its square-shaped scales to create fire energy." =>
    "Se tiende sobre rocas cálidas y usa el calor que absorben sus escamas cuadradas para crear energía ígnea.",
  "The combination of Crocalor’s fire energy and overflowing vitality has caused an egg-shaped fireball to appear on the Pokémon’s head." =>
    "La combinación de la energía ígnea de Crocalor y su desbordante vitalidad ha hecho que aparezca una bola de fuego con forma de huevo en su cabeza.",
  "The fiery bird changes shape when Skeledirge sings. Rumor has it that the bird was born when the fireball on Skeledirge’s head gained a soul." =>
    "El ave de fuego cambia de forma cuando Skeledirge canta. Se rumorea que el ave nació cuando la bola de fuego de la cabeza de Skeledirge obtuvo un alma.",
  "This Pokémon migrated to Paldea from distant lands long ago. The gel secreted by its feathers repels water and grime." =>
    "Este Pokémon migró a Paldea desde tierras lejanas hace mucho tiempo. El gel que segregan sus plumas repele el agua y la suciedad.",
  "These Pokémon constantly run through shallow waters to train their legs, then compete with each other to see which of them kicks most gracefully." =>
    "Estos Pokémon corren constantemente por aguas poco profundas para entrenar las piernas, y luego compiten entre sí para ver quién patea con más gracia.",
  "A single kick from a Quaquaval can send a truck rolling. This Pokémon uses its powerful legs to perform striking dances from far-off lands." =>
    "Una sola patada de Quaquaval puede hacer volcar un camión. Este Pokémon usa sus poderosas piernas para ejecutar llamativas danzas de tierras lejanas.",
  "It searches for food all day. It possesses a keen sense of smell but doesn’t use it for anything other than foraging." =>
    "Busca comida todo el día. Posee un olfato agudo, pero no lo usa para nada más que buscar alimento.",
  "It entrances female Pokémon with the sweet, alluring scent that wafts from all over its body." =>
    "Hipnotiza a las Pokémon hembra con el dulce y seductor aroma que desprende de todo su cuerpo.",
  "The ball of threads wrapped around its body is elastic enough to deflect the scythes of Scyther, this Pokémon’s natural enemy." =>
    "La bola de hilos que envuelve su cuerpo es lo bastante elástica como para desviar las guadañas de Scyther, su enemigo natural.",
  "It clings to branches and ceilings using its threads and moves without a sound. It takes out its prey before the prey even notices it." =>
    "Se aferra a ramas y techos usando sus hilos y se mueve sin hacer ruido. Elimina a sus presas antes de que estas lo noten.",
  "It has its third set of legs folded up. When it’s in a tough spot, this Pokémon jumps over 30 feet using the strength of its legs." =>
    "Mantiene plegado su tercer par de patas. Cuando está en apuros, este Pokémon salta más de 9 metros usando la fuerza de sus patas.",
  "When it decides to fight all out, it stands on its previously folded legs to enter Showdown Mode. It neutralizes its enemies in short order." =>
    "Cuando decide luchar con todo, se apoya en sus patas antes plegadas para entrar en modo de combate. Neutraliza a sus enemigos en poco tiempo.",
  "It has underdeveloped electric sacs on its cheeks. These sacs can produce electricity only if Pawmi rubs them furiously with the pads on its forepaws." =>
    "Tiene sacos eléctricos subdesarrollados en las mejillas. Estos sacos solo producen electricidad si Pawmi los frota furiosamente con las almohadillas de sus patas delanteras.",
  "When its group is attacked, Pawmo is the first to leap into battle, defeating enemies with a fighting technique that utilizes electric shocks." =>
    "Cuando atacan a su grupo, Pawmo es el primero en saltar a la batalla, derrotando enemigos con una técnica de combate que usa descargas eléctricas.",
  "This Pokémon normally is slow to react, but once it enters battle, it will strike down its enemies with lightning-fast movements." =>
    "Este Pokémon normalmente reacciona con lentitud, pero una vez que entra en batalla, derriba a sus enemigos con movimientos veloces como el rayo.",
  "Exhibiting great teamwork, they use their incisors to cut pieces out of any material that might be useful for a nest, then make off with them." =>
    "Mostrando un gran trabajo en equipo, usan sus incisivos para cortar trozos de cualquier material útil para un nido y se los llevan.",
  "They build huge nests with many rooms that are used for different purposes, such as eating and sleeping." =>
    "Construyen enormes nidos con muchas habitaciones que usan para distintos propósitos, como comer y dormir.",
  "This Pokémon is smooth and moist to the touch. Yeast in Fidough’s breath induces fermentation in the Pokémon’s vicinity." =>
    "Este Pokémon es suave y húmedo al tacto. La levadura del aliento de Fidough induce la fermentación en sus alrededores.",
  "The pleasant aroma that emanates from this Pokémon’s body helps wheat grow, so Dachsbun has been treasured by farming villages." =>
    "El agradable aroma que emana del cuerpo de este Pokémon ayuda a crecer al trigo, por lo que Dachsbun ha sido muy valorado en los pueblos agrícolas.",
  "It protects itself from enemies by emitting oil from the fruit on its head. This oil is bitter and astringent enough to make someone flinch." =>
    "Se protege de sus enemigos emitiendo aceite desde el fruto de su cabeza. Este aceite es lo bastante amargo y astringente como para hacer retroceder a cualquiera.",
  "Dolliv shares its tasty, fresh-scented oil with others. This species has coexisted with humans since times long gone." =>
    "Dolliv comparte con otros su sabroso aceite de fresco aroma. Esta especie convive con los humanos desde tiempos remotos.",
  "This calm Pokémon is very compassionate. It will share its delicious, nutrient-rich oil with weakened Pokémon." =>
    "Este Pokémon tranquilo es muy compasivo. Comparte su delicioso aceite, rico en nutrientes, con Pokémon debilitados.",
  "These Pokémon prefer to live in cities. They form flocks based on the color of their feathers, and they fight over territory." =>
    "Estos Pokémon prefieren vivir en ciudades. Forman bandadas según el color de sus plumas y luchan por el territorio.",
  "It was born in a layer of rock salt deep under the earth. This species was particularly treasured in the old days, as they would share precious salt." =>
    "Nació en una capa de sal de roca en las profundidades de la tierra. Esta especie era muy valorada antiguamente, ya que compartía su preciada sal.",
  "This Pokémon dry cures its prey by spraying salt over them. The curing process steals away the water in the prey’s body." =>
    "Este Pokémon cura en seco a sus presas rociándolas con sal. El proceso de curado extrae el agua del cuerpo de la presa.",
  "Garganacl will rub its fingertips together and sprinkle injured Pokémon with salt. Even severe wounds will promptly heal afterward." =>
    "Garganacl frota las puntas de sus dedos y espolvorea sal sobre los Pokémon heridos. Incluso las heridas graves sanan rápidamente después.",
  "Burnt charcoal came to life and became a Pokémon. Possessing a fiery fighting spirit, Charcadet will battle even tough opponents." =>
    "Carbón quemado cobró vida y se convirtió en un Pokémon. Con un espíritu de lucha ardiente, Charcadet combate incluso contra rivales duros.",
  "Armarouge evolved through the use of a set of armor that belonged to a distinguished warrior. This Pokémon is incredibly loyal." =>
    "Armarouge evolucionó al usar una armadura que perteneció a un guerrero distinguido. Este Pokémon es increíblemente leal.",
  "The fiery blades on its arms burn fiercely with the lingering resentment of a sword wielder who fell before accomplishing their goal." =>
    "Las llameantes cuchillas de sus brazos arden con fiereza por el resentimiento persistente de un espadachín que cayó antes de cumplir su meta.",
  "Tadbulb shakes its tail to generate electricity. If it senses danger, it will make its head blink on and off to alert its allies." =>
    "Tadbulb agita la cola para generar electricidad. Si percibe peligro, hace parpadear su cabeza para alertar a sus aliados.",
  "When this Pokémon expands and contracts its wobbly body, the belly-button dynamo in its stomach produces a huge amount of electricity." =>
    "Cuando este Pokémon expande y contrae su cuerpo tembloroso, la dinamo de su ombligo produce una enorme cantidad de electricidad.",
  "When its wings catch the wind, the bones within produce electricity. This Pokémon dives into the ocean, catching prey by electrocuting them." =>
    "Cuando sus alas atrapan el viento, los huesos en su interior producen electricidad. Este Pokémon se sumerge en el océano y atrapa presas electrocutándolas.",
  "Kilowattrel inflates its throat sac to amplify its electricity. By riding the wind, this Pokémon can fly over 430 miles in a day." =>
    "Kilowattrel infla el saco de su garganta para amplificar su electricidad. Aprovechando el viento, este Pokémon puede volar más de 690 km en un día.",
  "It always scowls in an attempt to make opponents take it seriously, but even crying children will burst into laughter when they see Maschiff’s face." =>
    "Siempre frunce el ceño para intentar que sus rivales lo tomen en serio, pero hasta un niño llorando estalla en carcajadas al ver la cara de Maschiff.",
  "This Pokémon can store energy in its large dewlap. Mabosstiff unleashes this energy all at once to blow away enemies." =>
    "Este Pokémon puede almacenar energía en su gran papada. Mabosstiff libera esa energía de golpe para arrasar con sus enemigos.",
  "Though usually a mellow Pokémon, it will sink its sharp, poison-soaked front teeth into any that anger it, causing paralysis in the object of its ire." =>
    "Aunque suele ser un Pokémon tranquilo, hunde sus afilados dientes delanteros, empapados en veneno, en cualquiera que lo enfurezca, causando parálisis en el objeto de su ira.",
  "The color of the poisonous saliva depends on what the Pokémon eats. Grafaiai covers its fingers in its saliva and draws patterns on trees in forests." =>
    "El color de su saliva venenosa depende de lo que come el Pokémon. Grafaiai cubre sus dedos con saliva y dibuja patrones en los árboles del bosque.",
  "A soul unable to move on to the afterlife was blown around by the wind until it got tangled up with dried grass and became a Pokémon." =>
    "Un alma incapaz de pasar al más allá fue arrastrada por el viento hasta enredarse con hierba seca y convertirse en un Pokémon.",
  "It will open the branches of its head to envelop its prey. Once it absorbs all the life energy it needs, it expels the prey and discards it." =>
    "Abre las ramas de su cabeza para envolver a su presa. Una vez que absorbe toda la energía vital que necesita, la expulsa y la desecha.",
  "Toedscool lives in muggy forests. The flaps that fall from its body are chewy and very delicious." =>
    "Toedscool vive en bosques húmedos. Las solapas que se le caen del cuerpo son masticables y muy sabrosas.",
  "These Pokémon gather into groups and form colonies deep within forests. They absolutely hate it when strangers approach." =>
    "Estos Pokémon se reúnen en grupos y forman colonias en lo profundo de los bosques. Odian que se les acerquen desconocidos.",
  "Klawf hangs upside-down from cliffs, waiting for prey. But Klawf can’t remain in this position for long because its blood rushes to its head." =>
    "Klawf cuelga boca abajo de los acantilados esperando a sus presas. Pero no puede mantener esa posición mucho tiempo porque la sangre se le sube a la cabeza.",
  "The more sunlight this Pokémon bathes in, the more spicy chemicals are produced by its body, and thus the spicier its moves become." =>
    "Cuanta más luz solar recibe este Pokémon, más sustancias picantes produce su cuerpo, y por lo tanto más picantes se vuelven sus movimientos.",
  "The red head converts spicy chemicals into fire energy and blasts the surrounding area with a super spicy stream of flame." =>
    "La cabeza roja convierte las sustancias picantes en energía ígnea y arrasa la zona con un chorro de llamas súper picante.",
  "This Pokémon creates a mud ball by mixing sand and dirt with psychic energy. It treasures its mud ball more than its own life." =>
    "Este Pokémon crea una bola de barro mezclando arena y tierra con energía psíquica. Valora su bola de barro más que su propia vida.",
  "The body that supports the ball barely moves. Therefore, it is thought that the true body of this Pokémon is actually inside the ball." =>
    "El cuerpo que sostiene la bola apenas se mueve. Por eso se cree que el verdadero cuerpo de este Pokémon está en realidad dentro de la bola.",
  "Flittle’s toes levitate about half an inch above the ground because of the psychic power emitted from the frills on the Pokémon’s belly." =>
    "Los dedos de Flittle levitan cerca de un centímetro sobre el suelo debido al poder psíquico que emiten los volantes de su vientre.",
  "It immobilizes opponents by bathing them in psychic power from its large eyes. Despite its appearance, it has a vicious temperament." =>
    "Inmoviliza a sus rivales bañándolos en poder psíquico desde sus grandes ojos. Pese a su apariencia, tiene un temperamento feroz.",
  "It swings its handmade hammer around to protect itself, but the hammer is often stolen by Pokémon that eat metal." =>
    "Blande su martillo hecho a mano para protegerse, pero a menudo se lo roban Pokémon que comen metal.",
  "This Pokémon will attack groups of Pawniard and Bisharp, gathering metal from them in order to create a large and sturdy hammer." =>
    "Este Pokémon ataca grupos de Pawniard y Bisharp, recolectando metal de ellos para crear un martillo grande y resistente.",
  "This intelligent Pokémon has a very daring disposition. It knocks rocks into the sky with its hammer, aiming for flying Corviknight." =>
    "Este Pokémon inteligente tiene un carácter muy audaz. Golpea rocas hacia el cielo con su martillo, apuntando a los Corviknight que vuelan.",
  "This Pokémon can pick up the scent of a Veluza just over 65 feet away and will hide itself in the sand." =>
    "Este Pokémon puede detectar el olor de un Veluza a más de 20 metros de distancia y se esconde en la arena.",
  "It has a vicious temperament, contrary to what its appearance may suggest. It wraps its long bodies around prey, then drags the prey into its den." =>
    "Tiene un temperamento feroz, contrario a lo que sugiere su apariencia. Envuelve a sus presas con sus largos cuerpos y las arrastra hasta su guarida.",
  "It gathers things up in an apron made from shed feathers added to the Pokémon’s chest feathers, then drops those things from high places for fun." =>
    "Recoge cosas en un delantal hecho de plumas mudadas añadidas a las plumas de su pecho, y las deja caer desde las alturas por diversión.",
  "It likes playing with others of its kind using the water ring on its tail. It uses ultrasonic waves to sense the emotions of other living creatures." =>
    "Le gusta jugar con otros de su especie usando el anillo de agua de su cola. Usa ondas ultrasónicas para percibir las emociones de otras criaturas vivas.",
  "This Pokémon changes its appearance if it hears its allies calling for help. Palafin will never show anybody its moment of transformation." =>
    "Este Pokémon cambia de apariencia si oye a sus aliados pedir ayuda. Palafin nunca le muestra a nadie su momento de transformación.",
  "It is said that this Pokémon was born when an unknown poison Pokémon entered and inspirited an engine left at a scrap-processing factory." =>
    "Se dice que este Pokémon nació cuando un desconocido Pokémon veneno entró y poseyó un motor abandonado en una fábrica de chatarra.",
  "It creates a gas out of poison and minerals from rocks. It then detonates the gas in its cylinders— now numbering eight—to generate energy." =>
    "Crea un gas a partir de veneno y minerales de rocas. Luego detona ese gas en sus cilindros, ahora ocho, para generar energía.",
  "Apparently Cyclizar has been allowing people to ride on its back since ancient times. Depictions of this have been found in 10,000-year-old murals." =>
    "Al parecer, Cyclizar permite que la gente monte en su lomo desde tiempos antiguos. Se han hallado representaciones de esto en murales de 10.000 años de antigüedad.",
  "When attacked, this Pokémon will wield the tendrils on its body like fists and pelt the opponent with a storm of punches." =>
    "Cuando lo atacan, este Pokémon usa los zarcillos de su cuerpo como puños y golpea a su rival con una lluvia de puñetazos.",
  "It absorbs nutrients from cave walls. The petals it wears are made of crystallized poison." =>
    "Absorbe nutrientes de las paredes de las cuevas. Los pétalos que lleva están hechos de veneno cristalizado.",
  "When this Pokémon detects danger, it will open up its crystalline petals and fire beams from its conical body." =>
    "Cuando este Pokémon detecta peligro, abre sus pétalos cristalinos y dispara rayos desde su cuerpo cónico.",
  "It is said that a dog Pokémon that died in the wild without ever interacting with a human was reborn as this Pokémon." =>
    "Se dice que un Pokémon perro que murió en estado salvaje sin haber interactuado nunca con un humano renació como este Pokémon.",
  "Houndstone spends most of its time sleeping in graveyards. Among all the dog Pokémon, this one is most loyal to its master." =>
    "Houndstone pasa la mayor parte del tiempo durmiendo en cementerios. De entre todos los Pokémon perro, es el más leal a su amo.",
  "This Pokémon apparently ties the base of its neck into a knot so that energy stored in its belly does not escape from its beak." =>
    "Al parecer, este Pokémon anuda la base de su cuello para que la energía almacenada en su vientre no se escape por el pico.",
  "This species left the ocean and began living on land a very long time ago. It seems to be closely related to Wailmer." =>
    "Esta especie abandonó el océano y comenzó a vivir en tierra hace muchísimo tiempo. Parece estar estrechamente emparentada con Wailmer.",
  "This Pokémon wanders around snowy, icy areas. It protects its body with powerful muscles and a thick layer of fat under its skin." =>
    "Este Pokémon vaga por zonas nevadas y heladas. Protege su cuerpo con músculos poderosos y una gruesa capa de grasa bajo la piel.",
  "When Veluza discards unnecessary flesh, its mind becomes honed and its psychic power increases. The spare flesh has a mild but delicious flavor." =>
    "Cuando Veluza desecha carne innecesaria, su mente se agudiza y su poder psíquico aumenta. La carne sobrante tiene un sabor suave pero delicioso.",
  "This Pokémon is a glutton, but it’s bad at getting food. It teams up with a Tatsugiri to catch prey." =>
    "Este Pokémon es un glotón, pero es malo consiguiendo comida. Se asocia con un Tatsugiri para atrapar presas.",
  "This is a small dragon Pokémon. It lives inside the mouth of Dondozo to protect itself from enemies on the outside." =>
    "Este es un pequeño Pokémon dragón. Vive dentro de la boca de Dondozo para protegerse de los enemigos del exterior.",
  "When its anger rose beyond a critical point, this Pokémon gained power that is unfettered by the limits of its physical body." =>
    "Cuando su ira superó un punto crítico, este Pokémon obtuvo un poder que no está limitado por su cuerpo físico.",
  "When attacked, this Pokémon will retaliate by sticking thick spines out from its body. It’s a risky move that puts everything on the line." =>
    "Cuando lo atacan, este Pokémon contraataca sacando gruesas púas de su cuerpo. Es un movimiento arriesgado que lo apuesta todo.",
  "Now that the brain waves from the head and tail are synced up, the psychic power of this Pokémon is 10 times stronger than Girafarig’s." =>
    "Ahora que las ondas cerebrales de la cabeza y la cola están sincronizadas, el poder psíquico de este Pokémon es 10 veces más fuerte que el de Girafarig.",
  "This Pokémon uses its hard tail to make its nest by boring holes into bedrock deep underground. The nest can reach lengths of over six miles." =>
    "Este Pokémon usa su dura cola para hacer su nido perforando el lecho rocoso en las profundidades subterráneas. El nido puede alcanzar más de 10 kilómetros de longitud.",
  "Only a Bisharp that stands above all others in its vast army can evolve into Kingambit." =>
    "Solo un Bisharp que se alce por encima de todos los demás en su vasto ejército puede evolucionar a Kingambit.",
  "Sightings of this Pokémon have occurred in recent years. The name Great Tusk was taken from a creature listed in a certain book." =>
    "En los últimos años se han reportado avistamientos de este Pokémon. Su nombre proviene de una criatura mencionada en cierto libro.",
  "There has been only one reported sighting of this Pokémon. It resembles a mysterious creature depicted in an old expedition journal." =>
    "Solo se ha reportado un avistamiento de este Pokémon. Se asemeja a una misteriosa criatura descrita en un antiguo diario de expedición.",
  "It is possible that the creature listed as Brute Bonnet in a certain book could actually be this Pokémon." =>
    "Es posible que la criatura mencionada en cierto libro sea en realidad este Pokémon.",
  "This Pokémon has characteristics similar to those of Flutter Mane, a creature mentioned in a certain book." =>
    "Este Pokémon tiene características similares a las de una criatura mencionada en cierto libro.",
  "This mysterious Pokémon has some similarities to a creature that an old book introduced as Slither Wing." =>
    "Este misterioso Pokémon tiene algunas similitudes con una criatura que un antiguo libro presentó bajo ese nombre.",
  "No records exist of this Pokémon being caught. Data is lacking, but the Pokémon’s traits match up with a creature shown in an expedition journal." =>
    "No existen registros de que se haya capturado a este Pokémon. Faltan datos, pero sus rasgos coinciden con una criatura mostrada en un diario de expedición.",
  "This Pokémon closely resembles a scientific weapon that a paranormal magazine claimed was sent to this planet by aliens." =>
    "Este Pokémon se parece mucho a un arma científica que, según una revista paranormal, fue enviada a este planeta por extraterrestres.",
  "Its shape is similar to a robot featured in a paranormal magazine article. The robot was said to have been created by an ancient civilization." =>
    "Su forma se asemeja a un robot presentado en un artículo de una revista paranormal. Se decía que ese robot fue creado por una civilización antigua.",
  "It is very similar to a cyborg covered exclusively by a paranormal magazine. The cyborg was said to be the modified form of a certain athlete." =>
    "Se parece mucho a un cíborg cubierto en exclusiva por una revista paranormal. Se decía que era la forma modificada de cierto atleta.",
  "It resembles a certain Pokémon introduced in a paranormal magazine, described as the offspring of a Hydreigon that fell in love with a robot." =>
    "Se asemeja a cierto Pokémon presentado en una revista paranormal, descrito como el fruto de un Hydreigon que se enamoró de un robot.",
  "This Pokémon resembles an unknown object described in a paranormal magazine as a UFO sent to observe humanity." =>
    "Este Pokémon se parece a un objeto desconocido descrito en una revista paranormal como un OVNI enviado para observar a la humanidad.",
  "It has some similarities to a Pokémon introduced in a dubious magazine as a Tyranitar from one billion years into the future." =>
    "Tiene algunas similitudes con un Pokémon presentado en una revista dudosa como un Tyranitar proveniente de mil millones de años en el futuro.",
  "Frigibax absorbs heat through its dorsal fin and converts the heat into ice energy. The higher the temperature, the more energy Frigibax stores." =>
    "Frigibax absorbe calor a través de su aleta dorsal y lo convierte en energía helada. Cuanto más alta es la temperatura, más energía almacena.",
  "Arctibax freezes the air around it, protecting its face with an ice mask and turning its dorsal fin into a blade of ice." =>
    "Arctibax congela el aire a su alrededor, protegiendo su rostro con una máscara de hielo y convirtiendo su aleta dorsal en una hoja de hielo.",
  "This Pokémon blasts cryogenic air out from its mouth. This air can instantly freeze even liquid-hot lava." =>
    "Este Pokémon expulsa aire criogénico por la boca. Ese aire puede congelar instantáneamente incluso la lava líquida y ardiente.",
  "This Pokémon was born inside a treasure chest about 1,500 years ago. It sucks the life-force out of scoundrels who try to steal the treasure." =>
    "Este Pokémon nació dentro de un cofre del tesoro hace unos 1.500 años. Le succiona la fuerza vital a los sinvergüenzas que intentan robar el tesoro.",
  "Its body seems to be made up of 1,000 coins. This Pokémon gets along well with others and is quick to make friends with anybody." =>
    "Su cuerpo parece estar compuesto de 1.000 monedas. Este Pokémon se lleva bien con los demás y hace amigos con facilidad.",
}

apply_dex_dict(DICT)
