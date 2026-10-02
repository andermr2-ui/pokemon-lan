# encoding: UTF-8
require_relative "apply_dex_common"

DICT = {
  "They appear in great numbers at electric power plants. Because they feed on electricity, they cause massive and chaotic blackouts in nearby cities." =>
    "Aparecen en grandes cantidades en las centrales eléctricas. Como se alimentan de electricidad, provocan apagones masivos y caóticos en las ciudades cercanas.",
  "It consists of six eggs that care for each other. The eggs attract each other and spin around. When cracks increasingly appear, it is close to evolution." =>
    "Consiste en seis huevos que se cuidan entre sí. Los huevos se atraen entre ellos y giran. Cuando empiezan a aparecer más grietas, está cerca de evolucionar.",
  "Originally from the tropics, Exeggutor's heads grow larger with exposure to bright sunlight. It is said that when the heads fall, they group to form an Exeggcute." =>
    "Originario de los trópicos, las cabezas de Exeggutor crecen más al exponerse a la luz solar intensa. Se dice que cuando las cabezas caen, se agrupan para formar un Exeggcute.",
  "It pines for the mother it will never see again. Seeing a likeness of its mother in the full moon, it cries. The stains on the skull it wears are from its tears." =>
    "Añora a la madre que nunca volverá a ver. Al ver su semejanza en la luna llena, llora. Las manchas del cráneo que lleva puesto son de sus lágrimas.",
  "A Marowak is the evolved form of a Cubone that has grown tough by overcoming the grief of losing its mother. Its tempered and hardened spirit is not easily broken." =>
    "Marowak es la forma evolucionada de un Cubone que se ha endurecido al superar el dolor de perder a su madre. Su espíritu templado y curtido no se quiebra fácilmente.",
  "Its legs freely stretch and contract. Using these springlike limbs, it bowls over foes with devastating kicks. After battle, it rubs down its tired legs." =>
    "Sus piernas se estiran y contraen libremente. Usando estas extremidades elásticas, derriba a sus rivales con patadas devastadoras. Después del combate, se frota las piernas cansadas.",
  "A Hitmonchan is said to possess the spirit of a boxer who aimed to become the world champion. Having an indomitable spirit means that it will never give up." =>
    "Se dice que Hitmonchan posee el espíritu de un boxeador que aspiraba a ser campeón mundial. Tener un espíritu indomable significa que nunca se rendirá.",
  "Whenever it sees something unfamiliar, it always licks the object because it memorizes things by texture and taste. It is somewhat put off by sour things." =>
    "Cada vez que ve algo desconocido, siempre lo lame, porque memoriza las cosas por su textura y sabor. Le desagradan un poco las cosas ácidas.",
  "Getting up close to a Koffing will give you a chance to observe, through its thin skin, the toxic gases swirling inside. It blows up at the slightest stimulation." =>
    "Si te acercas a un Koffing, podrás observar, a través de su fina piel, los gases tóxicos arremolinándose en su interior. Explota ante el más mínimo estímulo.",
  "By diluting its toxic gases with a special process, the highest grade of perfume can be made. To Weezing, gases emanating from garbage are the ultimate feast." =>
    "Diluyendo sus gases tóxicos mediante un proceso especial, se puede fabricar el perfume de más alta calidad. Para Weezing, los gases que emanan de la basura son el festín definitivo.",
  "Once it starts running, it doesn't stop. Its tiny brain makes it so stupid that it can't remember why it started running in the first place." =>
    "Una vez que empieza a correr, no se detiene. Su diminuto cerebro lo hace tan torpe que no recuerda por qué empezó a correr en primer lugar.",
  "Its horn, which rotates like a drill, destroys tall buildings with one strike. It stands on its hind legs, and its brain is well developed." =>
    "Su cuerno, que gira como un taladro, destruye edificios altos de un solo golpe. Se yergue sobre sus patas traseras, y su cerebro está bien desarrollado.",
  "Chansey lay nutritionally excellent eggs every day. The eggs are so delicious, they are eagerly devoured by even those who have lost their appetite." =>
    "Chansey pone huevos nutricionalmente excelentes todos los días. Los huevos son tan deliciosos que hasta quienes han perdido el apetito los devoran con ansia.",
  "Its vines snap off easily and painlessly if they are grabbed, allowing it to make a quick getaway. The lost vines are replaced by new growth the very next day." =>
    "Sus lianas se desprenden fácil e indoloramente si se las agarra, lo que le permite escapar rápidamente. Las lianas perdidas se reemplazan con nuevo crecimiento al día siguiente.",
  "If you come across a young Kangaskhan playing by itself, never try to catch it. The baby's parent is sure to be in the area, and it will become violently enraged." =>
    "Si te encuentras con un joven Kangaskhan jugando solo, nunca intentes atraparlo. Seguro que su madre está cerca, y se pondrá violentamente furiosa.",
  "By cleverly flicking the fins on its back side to side, it moves in any direction while facing forward. It spits ink to escape if it senses danger." =>
    "Agitando con astucia las aletas de su espalda de un lado a otro, se mueve en cualquier dirección mientras mira hacia delante. Escupe tinta para escapar si detecta peligro.",
  "The poisonous barbs all over its body are highly valued as ingredients for making traditional herbal medicine. It shows no mercy to anything approaching its nest." =>
    "Las púas venenosas que cubren todo su cuerpo son muy valoradas como ingredientes para la medicina herbal tradicional. No muestra piedad con nada que se acerque a su nido.",
  "In the springtime, schools of Goldeen can be seen swimming up falls and rivers. It metes out staggering damage with its single horn." =>
    "En primavera, se pueden ver bancos de Goldeen nadando río arriba por cascadas y ríos. Inflige un daño asombroso con su único cuerno.",
  "It punches holes in boulders on stream- beds. This is a clever innovation that prevents its eggs from being attacked or washed away by the current." =>
    "Perfora agujeros en las rocas del lecho de los ríos. Es un ingenioso método que evita que sus huevos sean atacados o arrastrados por la corriente.",
  "It gathers with others in the night and makes its red core glow on and off with the twinkling stars. It can regenerate limbs if they are severed from its body." =>
    "Se junta con otros de noche y hace que su núcleo rojo brille y se apague al ritmo del centelleo de las estrellas. Puede regenerar sus extremidades si son separadas de su cuerpo.",
  "People in ancient times imagined that Starmie were transformed from the reflections of stars that twinkled on gentle waves at night." =>
    "En la antigüedad, la gente imaginaba que los Starmie se formaban a partir de los reflejos de las estrellas que centelleaban sobre las suaves olas de noche.",
  "A Mr. Mime is a master of pantomime. It can convince others that something unseeable actually exists. Once believed, the imaginary object does become real." =>
    "Mr. Mime es un maestro de la pantomima. Puede convencer a los demás de que algo invisible existe de verdad. Una vez que se cree en ello, el objeto imaginario se vuelve real.",
  "Its blindingly fast speed adds to the sharpness of its twin forearm scythes. The scythes can slice through thick logs in one wicked stroke." =>
    "Su velocidad cegadora se suma al filo de sus dos guadañas en los antebrazos. Las guadañas pueden cortar troncos gruesos de un solo tajo brutal.",
  "A Jynx sashays rhythmically as if it were dancing. Its motions are so bouncingly alluring, people seeing it are compelled to shake their hips without noticing." =>
    "Jynx se contonea rítmicamente como si estuviera bailando. Sus movimientos son tan seductores y saltarines que quienes la ven se ven obligados a mover las caderas sin darse cuenta.",
  "When a storm approaches, it competes with others to scale heights that are likely to be stricken by lightning. Some towns use Electabuzz as lightning rods." =>
    "Cuando se acerca una tormenta, compite con otros para escalar a las alturas más propensas a ser alcanzadas por un rayo. Algunos pueblos usan a Electabuzz como pararrayos.",
  "In battle, it blows out intense flames from all over its body to intimidate its foe. These fiery bursts create heat waves that ignite grass and trees." =>
    "En combate, expulsa llamas intensas por todo el cuerpo para intimidar a su rival. Estas ráfagas de fuego crean olas de calor que incendian hierbas y árboles.",
  "Their pincers are strong enough to shatter thick logs. Because they dislike cold, Pinsir burrow and sleep under the ground on chilly nights." =>
    "Sus pinzas son lo bastante fuertes como para hacer añicos troncos gruesos. Como no soportan el frío, los Pinsir se entierran y duermen bajo tierra en las noches heladas.",
  "It is not satisfied unless it is rampaging at all times. If there is no opponent for Tauros to battle, it will charge at thick trees and knock them down to calm itself." =>
    "No se siente satisfecho a menos que esté siempre arrasando con todo. Si no hay ningún rival contra el que combatir, Tauros embestirá árboles gruesos y los derribará para calmarse.",
  "Its swimming muscles are weak, so it is easily washed away by currents. In places where water pools, you can see many Magikarp deposited there by the flow." =>
    "Sus músculos para nadar son débiles, así que las corrientes lo arrastran con facilidad. En los lugares donde se acumula el agua, se pueden ver muchos Magikarp depositados ahí por la corriente.",
  "It is an extremely vicious and violent Pokémon. When humans begin to fight, it will appear and burn everything to the ground with intensely hot flames." =>
    "Es un Pokémon extremadamente violento y feroz. Cuando los humanos empiezan a pelear, aparece y lo arrasa todo con llamas intensamente calientes.",
  "People have driven Lapras almost to the point of extinction. In the evenings, it is said to sing plaintively as it seeks what few others of its kind still remain." =>
    "Los humanos han llevado a Lapras casi a la extinción. Se dice que, al anochecer, canta con tristeza mientras busca a los pocos que quedan de su especie.",
  "A Ditto rearranges its cell structure to transform itself. However, if it tries to change based on its memory, it will get details wrong." =>
    "Ditto reorganiza su estructura celular para transformarse. Sin embargo, si intenta cambiar basándose en su memoria, se equivocará en algunos detalles.",
  "An Eevee has an unstable genetic makeup that suddenly mutates due to its environment. Radiation from various stones causes this Pokémon to evolve." =>
    "Eevee tiene una composición genética inestable que muta de repente debido a su entorno. La radiación de diversas piedras hace que este Pokémon evolucione.",
  "Vaporeon underwent a spontaneous mutation and grew fins and gills that allow them to live underwater. They have the ability to freely control water." =>
    "Vaporeon sufrió una mutación espontánea y desarrolló aletas y branquias que le permiten vivir bajo el agua. Tiene la capacidad de controlar el agua a voluntad.",
  "Its cells generate weak power that is amplified by its fur's static electricity to drop thunderbolts. The bristling fur is made of electrically charged needles." =>
    "Sus células generan una energía débil que se amplifica con la electricidad estática de su pelaje para lanzar rayos. Su pelo erizado está formado por agujas cargadas eléctricamente.",
  "Flareon's fluffy fur releases heat into the air so that its body does not get excessively hot. Its body temperature can rise to a maximum of 1,650 degrees F." =>
    "El mullido pelaje de Flareon libera calor al aire para que su cuerpo no se caliente en exceso. Su temperatura corporal puede llegar hasta los 900 grados centígrados.",
  "It is capable of reverting itself entirely back to program data in order to enter cyberspace. A Porygon is copy-protected so it cannot be duplicated." =>
    "Es capaz de convertirse por completo de nuevo en datos de programa para entrar en el ciberespacio. Porygon tiene protección contra copia, así que no se puede duplicar.",
  "One of the ancient and long-since-extinct Pokémon that have been regenerated from fossils by humans. If attacked, it withdraws into its hard shell." =>
    "Uno de los Pokémon antiguos y extintos desde hace mucho tiempo que los humanos han regenerado a partir de fósiles. Si lo atacan, se retrae dentro de su dura concha.",
  "An Omastar uses its tentacles to capture its prey. It is believed to have become extinct because its shell grew too large, making its movements slow and ponderous." =>
    "Omastar usa sus tentáculos para atrapar a sus presas. Se cree que se extinguió porque su concha creció demasiado, volviendo sus movimientos lentos y torpes.",
  "This Pokémon has been regenerated from a fossil. However, in rare cases, living examples have been discovered. Kabuto have not changed for 300 million years." =>
    "Este Pokémon ha sido regenerado a partir de un fósil. Sin embargo, en raras ocasiones se han descubierto ejemplares vivos. Los Kabuto no han cambiado en 300 millones de años.",
  "Kabutops once swam underwater to hunt for prey. It was apparently evolving from being a water dweller to living on land as evident from changes in its gills and legs." =>
    "Kabutops solía nadar bajo el agua para cazar presas. Al parecer estaba evolucionando de habitante acuático a terrestre, como demuestran los cambios en sus branquias y patas.",
  "Aerodactyl is a Pokémon from the age of dinosaurs. It was regenerated from DNA extracted from amber. It is imagined to have been the king of the skies." =>
    "Aerodactyl es un Pokémon de la era de los dinosaurios. Fue regenerado a partir de ADN extraído del ámbar. Se imagina que fue el rey de los cielos.",
  "Snorlax's typical day consists of nothing more than eating and sleeping. It is such a docile Pokémon that there are children who use its big belly as a place to play." =>
    "El día típico de Snorlax consiste solo en comer y dormir. Es un Pokémon tan dócil que hay niños que usan su enorme barriga como lugar de juego.",
  "Articuno is a legendary bird Pokémon that can control ice. The flapping of its wings chills the air. As a result, it is said that when this Pokémon flies, snow will fall." =>
    "Articuno es un legendario Pokémon pájaro que puede controlar el hielo. El aleteo de sus alas enfría el aire. Como resultado, se dice que cuando este Pokémon vuela, cae nieve.",
  "Zapdos is a legendary bird Pokémon that has the ability to control electricity. It usually lives in thunderclouds. It gains power if it is stricken by lightning bolts." =>
    "Zapdos es un legendario Pokémon pájaro con la capacidad de controlar la electricidad. Suele vivir en nubes de tormenta. Gana poder si es alcanzado por rayos.",
  "Moltres is a legendary bird Pokémon that can control fire. If injured, it is said to dip its body in the molten magma of a volcano to burn and heal itself." =>
    "Moltres es un legendario Pokémon pájaro que puede controlar el fuego. Si resulta herido, se dice que sumerge su cuerpo en el magma fundido de un volcán para quemarse y curarse.",
  "A Dratini continually molts and sloughs off its old skin. It does so because the life energy within its body steadily builds to reach uncontrollable levels." =>
    "Dratini muda constantemente y se desprende de su piel vieja. Lo hace porque la energía vital dentro de su cuerpo se acumula constantemente hasta alcanzar niveles incontrolables.",
  "A Dragonair stores an enormous amount of energy inside its body. It is said to alter the weather around it by loosing energy from the crystals on its neck and tail." =>
    "Dragonair almacena una enorme cantidad de energía dentro de su cuerpo. Se dice que altera el clima a su alrededor liberando energía de los cristales de su cuello y su cola.",
  "It can circle the globe in just 16 hours. It is a kindhearted Pokémon that leads lost and foundering ships in a storm to the safety of land." =>
    "Puede dar la vuelta al mundo en solo 16 horas. Es un Pokémon de buen corazón que guía a los barcos perdidos y a la deriva en una tormenta hasta la seguridad de tierra firme.",
  "A Pokémon that was created by genetic manipulation. However, even though the scientific power of humans made its body, they failed to give it a warm heart." =>
    "Un Pokémon creado mediante manipulación genética. Sin embargo, aunque el poder científico de los humanos creó su cuerpo, no lograron darle un corazón cálido.",
  "A Mew is said to possess the genes of all Pokémon. It is capable of making itself invisible at will, so it entirely avoids notice even if it approaches people." =>
    "Se dice que Mew posee los genes de todos los Pokémon. Es capaz de volverse invisible a voluntad, así que pasa completamente desapercibido incluso si se acerca a las personas.",
  "It waves its leaf around to keep foes at bay. However, a sweet fragrance also wafts from the leaf, creating a friendly atmosphere that becalms the battlers." =>
    "Agita su hoja para mantener a raya a sus rivales. Sin embargo, de la hoja también emana una fragancia dulce que crea un ambiente amistoso que calma a los combatientes.",
  "A Bayleef's neck is ringed by curled-up leaves. Inside each leaf is a small tree shoot. The fragrance of this shoot makes people peppy." =>
    "El cuello de Bayleef está rodeado de hojas enrolladas. Dentro de cada hoja hay un pequeño brote de árbol. La fragancia de este brote anima a las personas.",
  "The fragrance of a Meganium's flower soothes and calms emotions. In battle, it gives off more of its becalming scent to blunt the foe's fighting spirit." =>
    "La fragancia de la flor de Meganium calma y sosiega las emociones. En combate, desprende más de su aroma tranquilizador para apagar el espíritu de lucha del rival.",
  "It flares flames from its back to protect itself. The fire burns vigorously if the Pokémon is angry. When it is tired, it sputters with incomplete combustion." =>
    "Hace arder llamas desde su espalda para protegerse. El fuego arde con fuerza si el Pokémon está enfadado. Cuando está cansado, chisporrotea con una combustión incompleta.",
  "It intimidates foes with intense gusts of flames and superheated air. Its quick nimbleness lets it dodge attacks even while scorching an enemy." =>
    "Intimida a sus rivales con intensas ráfagas de llamas y aire sobrecalentado. Su rapidez y agilidad le permiten esquivar ataques mientras abrasa a un enemigo.",
  "It can hide behind a shimmering heat haze that it creates using its intense flames. Typhlosion create blazing explosive blasts that burn everything to cinders." =>
    "Puede esconderse tras una neblina de calor resplandeciente que crea con sus intensas llamas. Typhlosion genera explosiones ardientes que reducen todo a cenizas.",
  "Despite its small body, Totodile's jaws are very powerful. While it may think it is just playfully nipping, its bite has enough strength to cause serious injury." =>
    "A pesar de su pequeño cuerpo, las mandíbulas de Totodile son muy poderosas. Aunque él crea que solo está mordisqueando en broma, su mordida tiene fuerza suficiente para causar heridas graves.",
  "Once its jaws clamp down on its foe, it will absolutely not let go. Because the tips of its fangs are forked back like fishhooks, they become irremovably embedded." =>
    "Una vez que sus mandíbulas se cierran sobre su rival, no lo soltará bajo ningún concepto. Como las puntas de sus colmillos están curvadas hacia atrás como anzuelos, quedan clavadas sin posibilidad de zafarse.",
  "It opens its huge mouth to intimidate enemies. In battle, it runs using its thick and powerful hind legs to charge the foe with incredible speed." =>
    "Abre su enorme boca para intimidar a los enemigos. En combate, corre usando sus gruesas y poderosas patas traseras para embestir al rival a una velocidad increíble.",
  "They take turns standing guard when it is time to sleep. The sentry awakens the others if it senses danger. If one gets separated, it turns sleepless with fear." =>
    "Se turnan para hacer guardia a la hora de dormir. El centinela despierta a los demás si detecta peligro. Si uno se separa del grupo, el miedo le impide dormir.",
  "A Furret has a very slim build. When under attack, it can squirm through narrow spaces and get away. In spite of its short limbs, it is very nimble and fleet." =>
    "Furret tiene una constitución muy delgada. Cuando es atacado, puede escabullirse por espacios estrechos y escapar. A pesar de sus extremidades cortas, es muy ágil y veloz.",
  "It has an internal organ that senses the earth's rotation. Using this special organ, a Hoothoot begins hooting at precisely the same time every day." =>
    "Tiene un órgano interno que detecta la rotación de la Tierra. Usando este órgano especial, Hoothoot empieza a ulular exactamente a la misma hora todos los días.",
  "It unfailingly catches prey in darkness. Noctowl owe their success to superior vision that allows them to see in minimal light, and to their supple and silent wings." =>
    "Atrapa a sus presas sin fallar en la oscuridad. Noctowl debe su éxito a una vista superior que le permite ver con muy poca luz, y a sus alas flexibles y silenciosas.",
  "Ledyba communicate using a fluid that they secrete from where the legs join the body. They are said to convey feelings to others by altering the fluid's scent." =>
    "Los Ledyba se comunican usando un fluido que segregan en la unión de las patas con el cuerpo. Se dice que transmiten sentimientos a los demás alterando el aroma del fluido.",
  "It is said that in lands with clean air, where the stars fill the sky, there live many Ledian. For good reason, they use the light of the stars as energy." =>
    "Se dice que en tierras de aire limpio, donde el cielo se llena de estrellas, viven muchos Ledian. Y no es casualidad, ya que usan la luz de las estrellas como energía.",
  "The web it spins can be considered its second nervous system. It is said that a Spinarak determines its prey by the tiny vibrations it feels through the web." =>
    "La telaraña que teje puede considerarse su segundo sistema nervioso. Se dice que Spinarak determina a sus presas por las diminutas vibraciones que siente a través de la telaraña.",
  "Its feet are tipped with tiny hooked claws that enable it to scuttle on ceilings and vertical walls. It constricts its foe with thin and strong silk webbing." =>
    "Sus patas terminan en pequeñas garras curvadas que le permiten correr por techos y paredes verticales. Constriñe a su rival con una fina y resistente telaraña de seda.",
  "Over the course of evolution, its hind legs turned into wings. By alternately resting its front and rear wings, it can fly all day without having to stop." =>
    "A lo largo de su evolución, sus patas traseras se convirtieron en alas. Al descansar alternativamente sus alas delanteras y traseras, puede volar todo el día sin tener que parar.",
  "When it senses danger, it discharges positive and negative electricity from its two antennae. It lives in depths beyond sunlight's reach." =>
    "Cuando detecta peligro, descarga electricidad positiva y negativa desde sus dos antenas. Vive en profundidades donde no llega la luz del sol.",
  "The light-emitting orbs on its back are very bright. They are formed from a part of its dorsal fin. This Pokémon illuminates the inky darkness of deep seas." =>
    "Las esferas luminosas de su espalda son muy brillantes. Se forman a partir de una parte de su aleta dorsal. Este Pokémon ilumina la oscuridad más profunda de los mares.",
  "It is still inept at retaining electricity. When it is startled, it discharges power accidentally. It gets better at holding power as it grows older." =>
    "Todavía no es capaz de retener bien la electricidad. Cuando se asusta, descarga energía por accidente. Con la edad, va mejorando su capacidad para retener la energía.",
  "On nights with many shooting stars, Cleffa can be seen dancing in a ring. They dance until daybreak, when they quench their thirst with the morning dew." =>
    "En las noches con muchas estrellas fugaces, se puede ver a los Cleffa bailando en corro. Bailan hasta el amanecer, cuando calman su sed con el rocío de la mañana.",
  "Its soft and pliable body is very bouncy. When it sings continuously with all its might, its body steadily turns a deepening pink color." =>
    "Su cuerpo blando y flexible es muy elástico. Cuando canta sin parar con todas sus fuerzas, su cuerpo se va tiñendo de un rosa cada vez más intenso.",
  "As its energy, it uses the feelings of compassion and pleasure exuded by people and Pokémon. It stores up happy feelings in its shell, then shares them out." =>
    "Usa como energía los sentimientos de compasión y alegría que desprenden las personas y los Pokémon. Almacena sentimientos felices en su cáscara y luego los comparte.",
  "It is said to be a Pokémon that brings good fortune. When it spots someone who is pure of heart, a Togetic appears and shares its happiness with that person." =>
    "Se dice que es un Pokémon que trae buena fortuna. Cuando ve a alguien de corazón puro, Togetic aparece y comparte su felicidad con esa persona.",
  "It runs up short trees that grow on the savanna to peck at new shoots. A Natu's eyes look as if they are always observing something." =>
    "Sube corriendo por los árboles pequeños que crecen en la sabana para picotear los brotes nuevos. Los ojos de Natu parecen estar siempre observando algo.",
  "It has the enigmatic power of foreseeing the future. Some people in different lands have long believed that Xatu are emissaries from another world." =>
    "Posee el enigmático poder de predecir el futuro. Desde hace mucho, en distintas tierras se cree que los Xatu son emisarios de otro mundo.",
  "Its fluffy wool rubs together and builds a static charge. The more energy is charged, the more brightly the lightbulb at the tip of its tail glows." =>
    "Su mullida lana se frota entre sí y genera carga estática. Cuanta más energía acumula, con más fuerza brilla la bombilla en la punta de su cola.",
  "Its fleece quality changes to generate strong static electricity with a small amount of wool. The bare, slick parts of its hide are shielded against electricity." =>
    "La calidad de su lana cambia para generar una fuerte electricidad estática con poca cantidad de pelo. Las partes desnudas y lisas de su piel están protegidas contra la electricidad.",
  "It gives off so much light that it can be seen even from space. People in the old days used its light to send signals back and forth with others far away." =>
    "Desprende tanta luz que se puede ver incluso desde el espacio. En la antigüedad, la gente usaba su luz para enviarse señales entre lugares lejanos.",
  "Its flower petals deepen in color through exposure to sunlight. When cloudy weather persists, it does a dance that is thought to be a sun-summoning ritual." =>
    "Los pétalos de su flor se oscurecen al exponerse a la luz solar. Cuando el clima nublado persiste, realiza un baile que se cree que es un ritual para invocar al sol.",
  "Its body is covered with water-repellent fur. Because of the fur, it can swim through water at high speed without being slowed by the water's resistance." =>
    "Su cuerpo está cubierto de un pelaje que repele el agua. Gracias a ese pelaje, puede nadar a gran velocidad sin que la resistencia del agua lo frene.",
  "It lives in water virtually all day long. Its body color and pattern act as camouflage that makes it tough for enemies to spot in water." =>
    "Vive prácticamente todo el día en el agua. El color y el patrón de su cuerpo actúan como camuflaje, dificultando que los enemigos lo detecten en el agua.",
  "It mimics a tree to avoid being attacked by enemies. But since its forelegs remain green throughout the year, it is easily identified as a fake in the winter." =>
    "Imita a un árbol para evitar ser atacado por sus enemigos. Pero como sus patas delanteras se mantienen verdes durante todo el año, se lo identifica fácilmente como falso en invierno.",
  "The curled hair on its head proves its status as a king. It is said that the longer and curlier the hair, the more respect it earns from its peers." =>
    "El pelo rizado de su cabeza demuestra su estatus de rey. Se dice que cuanto más largo y rizado sea el pelo, más respeto gana entre sus semejantes.",
  "This Pokémon drifts and floats with the wind. If it senses the approach of strong winds, a Hoppip links leaves with others to prepare against being blown away." =>
    "Este Pokémon se deja llevar y flota con el viento. Si detecta la llegada de vientos fuertes, Hoppip entrelaza sus hojas con las de otros para no salir volando.",
  "It blossoms when the temperature rises above 64 degrees F. Because its flower's blooming changes with the temperature, it is sometimes used as a thermometer." =>
    "Florece cuando la temperatura supera los 18 grados centígrados. Como la floración de su flor cambia con la temperatura, a veces se usa como termómetro.",
  "Jumpluff ride warm southern winds to cross the sea and fly to foreign lands. This Pokémon lands when it encounters cold air while it is floating." =>
    "Los Jumpluff aprovechan los cálidos vientos del sur para cruzar el mar y volar hacia tierras extranjeras. Este Pokémon aterriza cuando se encuentra con aire frío mientras flota.",
  "Its tail ends with a dexterous, handlike appendage. However, because it uses the tail so much, Aipom's real hands have become rather clumsy." =>
    "Su cola termina en un apéndice hábil con forma de mano. Sin embargo, de tanto usar la cola, las manos de verdad de Aipom se han vuelto bastante torpes.",
  "Sunkern try to minimize movement to conserve the nutrients they have stored in their bodies for evolution. They will not eat, subsisting only on morning dew." =>
    "Los Sunkern intentan minimizar el movimiento para conservar los nutrientes que tienen almacenados en el cuerpo para la evolución. No comen, y subsisten solo con el rocío de la mañana.",
  "Sunflora convert solar energy into nutrition. They are highly active in the warm daytime but suddenly stop moving as soon as the sun sets." =>
    "Los Sunflora convierten la energía solar en nutrientes. Son muy activos durante el cálido día, pero dejan de moverse de repente en cuanto se pone el sol.",
  "It can see 360 degrees without moving its eyes. It is a great flier capable of making sudden stops and turning midair to quickly chase down targeted prey." =>
    "Puede ver en 360 grados sin mover los ojos. Es un gran volador capaz de detenerse en seco y girar en pleno vuelo para perseguir rápidamente a su presa.",
  "Wooper usually live in water but come out onto land seeking food occasionally. On land, they coat their bodies with a gooey, toxic film." =>
    "Los Wooper suelen vivir en el agua, pero a veces salen a tierra en busca de comida. En tierra, cubren su cuerpo con una película tóxica y viscosa.",
  "A Quagsire hunts by leaving its mouth wide open in water and waiting for its prey to blunder in. Because it doesn't move, it does not get very hungry." =>
    "Quagsire caza dejando la boca bien abierta en el agua y esperando a que sus presas caigan por error dentro. Como no se mueve, no le da mucha hambre.",
  "An Espeon is extremely loyal to any trainer it considers to be worthy. It is said to have developed precognitive powers to protect its trainer from harm." =>
    "Espeon es extremadamente leal a cualquier entrenador que considere digno. Se dice que desarrolló poderes de precognición para proteger a su entrenador de cualquier daño.",
  "Umbreon evolved from exposure to the moon's energy pulses. It lurks in darkness and waits for its foes to move. The rings on its body glow when it leaps to attack." =>
    "Umbreon evolucionó al exponerse a los pulsos de energía de la luna. Acecha en la oscuridad y espera a que sus rivales se muevan. Los anillos de su cuerpo brillan cuando salta al ataque.",
  "Murkrow were feared as the alleged bearers of ill fortune. It shows strong interest in anything that sparkles. It will even try to steal rings from women." =>
    "Se temía a los Murkrow por considerarlos portadores de mala suerte. Muestra un gran interés por cualquier cosa que brille. Incluso intentará robar anillos a las mujeres.",
  "It undertakes research every day to solve the mysteries of the world. However, it apparently forgets everything if the Shellder on its head comes off." =>
    "Investiga todos los días para resolver los misterios del mundo. Sin embargo, al parecer se olvida de todo si el Shellder de su cabeza se desprende.",
  "A Misdreavus frightens people with a creepy, sobbing cry. It apparently uses its red spheres to absorb the fear of foes as its nutrition." =>
    "Misdreavus asusta a la gente con un espeluznante llanto. Al parecer, usa sus esferas rojas para absorber el miedo de sus rivales como alimento.",
}

apply_dex_dict(DICT)
