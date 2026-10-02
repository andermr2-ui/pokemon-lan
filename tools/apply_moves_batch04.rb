# encoding: UTF-8
require_relative "apply_moves_common"

NAMES = {
  "Fury Swipes" => "Arañazo Furia",
  "Barrage" => "Andanada",
  "Bind" => "Ligadura",
  "Double Slap" => "Doble Bofetón",
  "Fury Attack" => "Ataque Furia",
  "Wrap" => "Envolver",
  "Constrict" => "Constricción",
  "Bide" => "Aguante",
  "Crush Grip" => "Puño Brutal",
  "Endeavor" => "Esfuerzo",
  "Flail" => "Coletazo",
  "Frustration" => "Frustración",
  "Guillotine" => "Guillotina",
  "Horn Drill" => "Taladradora",
  "Natural Gift" => "Don Natural",
  "Present" => "Regalo",
  "Return" => "Retribución",
  "Sonic Boom" => "Onda Sónica",
  "Spit Up" => "Escupir",
  "Super Fang" => "Colmillo Rabioso",
  "Trump Card" => "As Oculto",
  "Wring Out" => "Estrujón",
  "Acupressure" => "Acupresión",
  "After You" => "Cede Paso",
  "Assist" => "Ayuda",
  "Attract" => "Atracción",
  "Baton Pass" => "Relevo",
  "Belly Drum" => "Tambor",
  "Bestow" => "Regala Objeto",
  "Block" => "Bloqueo",
  "Camouflage" => "Camuflaje",
  "Captivate" => "Cautivar",
  "Celebrate" => "Celebrar",
  "Confide" => "Confidencia",
  "Conversion" => "Transformación",
  "Conversion 2" => "Transformación 2",
  "Copycat" => "Copión",
  "Court Change" => "Cambiacancha",
  "Defense Curl" => "Rizo Defensa",
  "Disable" => "Anulación",
  "Double Team" => "Doble Equipo",
  "Encore" => "Otra Vez",
  "Endure" => "Aguante",
  "Entrainment" => "Al Unísono",
  "Flash" => "Destello",
  "Focus Energy" => "Foco Energía",
  "Follow Me" => "Aquí Estoy",
  "Foresight" => "Profecía",
  "Glare" => "Malos Ojos",
  "Growl" => "Gruñido",
  "Growth" => "Crecimiento",
  "Happy Hour" => "Ganancia",
  "Harden" => "Fortaleza",
  "Heal Bell" => "Cascabel Cura",
  "Helping Hand" => "Ayuda",
  "Hold Hands" => "Ir de la Mano",
  "Howl" => "Aullido",
  "Laser Focus" => "Enfoque Láser",
  "Leer" => "Gruñido",
  "Lock-On" => "Fijar Blanco",
  "Lovely Kiss" => "Beso Encantador",
  "Lucky Chant" => "Buena Suerte",
  "Me First" => "Yo Primero",
  "Mean Look" => "Mal de Ojo",
  "Metronome" => "Metrónomo",
  "Milk Drink" => "Muu Leche",
  "Mimic" => "Mimético",
  "Mind Reader" => "Telépata",
  "Minimize" => "Reducción",
  "Morning Sun" => "Sol Matinal",
  "Nature Power" => "Fuerza Natural",
  "Noble Roar" => "Rugido Noble",
  "Odor Sleuth" => "Rastreo",
  "Pain Split" => "Malapata",
  "Perish Song" => "Canto Mortal",
  "Play Nice" => "Buen Rollo",
  "Protect" => "Protección",
  "Psych Up" => "Táctica",
  "Recover" => "Recuperación",
  "Recycle" => "Reciclaje",
  "Reflect Type" => "Adaptación Tipo",
  "Refresh" => "Renovación",
  "Roar" => "Rugido",
  "Safeguard" => "Velo Sagrado",
  "Scary Face" => "Cara Susto",
  "Screech" => "Chirrido",
  "Sharpen" => "Angular",
  "Shell Smash" => "Excoraza",
  "Simple Beam" => "Onda Simple",
  "Sing" => "Canto",
  "Sketch" => "Esquema",
  "Slack Off" => "Descanso",
  "Sleep Talk" => "Sonámbulo",
  "Smokescreen" => "Pantalla de Humo",
  "Soft-Boiled" => "Amortiguador",
  "Splash" => "Salpicadura",
  "Spotlight" => "Foco",
  "Stockpile" => "Reserva",
  "Stuff Cheeks" => "Carrilludo",
  "Substitute" => "Sustituto",
  "Supersonic" => "Ultrasonido",
  "Swagger" => "Contoneo",
  "Swallow" => "Tragar",
  "Sweet Scent" => "Dulce Aroma",
  "Swords Dance" => "Danza Espada",
  "Tail Whip" => "Látigo",
  "Tearful Look" => "Ojos Llorosos",
  "Teatime" => "Hora del Té",
  "Teeter Dance" => "Baile Amago",
  "Tickle" => "Cosquillas",
  "Transform" => "Transformación",
  "Whirlwind" => "Vendaval",
  "Wish" => "Deseo",
  "Work Up" => "Calentamiento",
  "Yawn" => "Bostezo",
  "Belch" => "Eructo",
  "Gunk Shot" => "Disparo Lodo",
  "Sludge Wave" => "Onda Tóxica",
  "Shell Side Arm" => "Concha Compuesta",
  "Sludge Bomb" => "Bomba Lodo",
  "Poison Jab" => "Puya Nociva",
  "Cross Poison" => "Veneno Cruzado",
  "Sludge" => "Lodo",
  "Venoshock" => "Vil Veneno",
  "Clear Smog" => "Nieblatóxica",
  "Poison Fang" => "Colmillo Veneno",
  "Poison Tail" => "Cola Veneno",
  "Acid" => "Ácido",
  "Acid Spray" => "Ácido Líquido",
  "Smog" => "Polución",
  "Poison Sting" => "Picotazo Veneno",
  "Acid Armor" => "Armadura Ácida",
  "Baneful Bunker" => "Búnker Dañino",
  "Coil" => "Enrosque",
  "Corrosive Gas" => "Gas Corrosivo",
  "Gastro Acid" => "Jugo Gástrico",
  "Poison Gas" => "Gas Venenoso",
  "Poison Powder" => "Polvo Veneno",
  "Purify" => "Purificar",
  "Toxic" => "Tóxico",
  "Toxic Spikes" => "Púas Tóxicas",
  "Toxic Thread" => "Hilo Venenoso",
  "Venom Drench" => "Empapa Veneno",
  "Prismatic Laser" => "Láser Prisma",
  "Psycho Boost" => "Psicoataque",
  "Future Sight" => "Premonición",
  "Synchronoise" => "Sincrorruido",
  "Dream Eater" => "Come Sueños",
  "Photon Geyser" => "Géiser Fotónico",
  "Psystrike" => "Psicocorte",
}

DESCS = {
  "The target is raked with sharp claws or scythes for two to five times in quick succession." =>
    "El objetivo recibe zarpazos de garras o guadañas afiladas de dos a cinco veces seguidas rápidamente.",
  "Round objects are hurled at the target to strike two to five times in a row." =>
    "Se lanzan objetos redondos contra el objetivo, golpeando de dos a cinco veces seguidas.",
  "Things such as long bodies or tentacles are used to bind and squeeze the foe for four to five turns." =>
    "Se usan cuerpos largos o tentáculos para atar y apretar al rival durante cuatro o cinco turnos.",
  "The target is slapped repeatedly, back and forth, two to five times in a row." =>
    "El objetivo recibe bofetadas repetidas, de ida y vuelta, de dos a cinco veces seguidas.",
  "The target is jabbed repeatedly with a horn or beak two to five times in a row." =>
    "El objetivo recibe golpes repetidos con un cuerno o pico de dos a cinco veces seguidas.",
  "A long body or vines are used to wrap and squeeze the target for four to five turns." =>
    "Se usa un cuerpo largo o enredaderas para envolver y apretar al objetivo durante cuatro o cinco turnos.",
  "The foe is attacked with long, creeping tentacles or vines. It may also lower the target's Speed." =>
    "El rival recibe el ataque de largos tentáculos o enredaderas. También puede bajar su Velocidad.",
  "The user endures attacks for two turns, then strikes back to cause double the damage taken." =>
    "El usuario aguanta ataques durante dos turnos y luego contraataca causando el doble del daño recibido.",
  "The target is crushed with great force. The attack is more powerful the more HP the target has left." =>
    "El objetivo es aplastado con gran fuerza. El ataque es más poderoso cuantos más PS le queden.",
  "An attack move that cuts down the target's HP to equal the user's HP." =>
    "Un ataque que reduce los PS del objetivo hasta igualar los del usuario.",
  "The user flails about aimlessly to attack. It becomes more powerful the less HP the user has." =>
    "El usuario se agita sin control para atacar. Es más poderoso cuanto menos PS le queden.",
  "A full-power attack that grows more powerful the less the user likes its Trainer." =>
    "Un ataque a máxima potencia que se vuelve más fuerte cuanto menos le agrade su entrenador al usuario.",
  "A vicious, tearing attack with big pincers. The target will faint instantly if this attack hits." =>
    "Un ataque feroz de desgarro con grandes pinzas. El objetivo queda fuera de combate al instante si acierta.",
  "The user stabs the foe with a horn that rotates like a drill. If it hits, the target faints instantly." =>
    "El usuario apuñala al rival con un cuerno que gira como un taladro. Si acierta, el objetivo cae al instante.",
  "The user draws power to attack by using its held Berry. The Berry determines its type and power." =>
    "El usuario extrae poder de su baya para atacar. La baya determina su tipo y poder.",
  "The user attacks by giving the target a gift with a hidden trap. It restores HP sometimes, however." =>
    "El usuario ataca dando al objetivo un regalo con una trampa oculta. A veces restaura PS en su lugar.",
  "A full-power attack that grows more powerful the more the user likes its Trainer." =>
    "Un ataque a máxima potencia que se vuelve más fuerte cuanto más le agrade su entrenador al usuario.",
  "The target is hit with a destructive shock wave that always inflicts 20 HP damage." =>
    "El objetivo recibe una onda expansiva destructiva que siempre inflige 20 PS de daño.",
  "The power stored using the move Stockpile is released all at once in an attack." =>
    "El poder acumulado con el movimiento Reserva se libera de una vez en un ataque.",
  "The user chomps hard on the target with its sharp front fangs. It cuts the target's HP to half." =>
    "El usuario muerde con fuerza al objetivo con sus afilados colmillos frontales. Reduce sus PS a la mitad.",
  "The fewer PP this move has, the greater its attack power." =>
    "Cuantos menos PP tenga este movimiento, mayor será su poder de ataque.",
  "The user powerfully wrings the foe. The more HP the foe has, the greater this attack's power." =>
    "El usuario estruja con fuerza al rival. Cuantos más PS tenga, mayor será el poder de este ataque.",
  "The user applies pressure to stress points, sharply boosting one of its stats." =>
    "El usuario aplica presión en puntos de tensión, subiendo considerablemente una de sus estadísticas al azar.",
  "The user helps the target and makes it use its move right after the user." =>
    "El usuario ayuda al objetivo y hace que use su movimiento justo después del usuario.",
  "The user hurriedly and randomly uses a move among those known by other Pokémon in the party." =>
    "El usuario usa apresurada y aleatoriamente un movimiento conocido por otro Pokémon de su equipo.",
  "If it is the opposite gender of the user, the target becomes infatuated and less likely to attack." =>
    "Si es del género opuesto al del usuario, el objetivo se enamora y es menos propenso a atacar.",
  "The user switches places with a party Pokémon in waiting, passing along any stat changes." =>
    "El usuario cambia de lugar con un Pokémon en espera de su equipo, transmitiéndole sus cambios de estadísticas.",
  "The user maximizes its Attack stat in exchange for HP equal to half its max HP." =>
    "El usuario maximiza su Ataque a cambio de PS equivalentes a la mitad de sus PS máximos.",
  "The user passes its held item to the target when the target isn't holding an item." =>
    "El usuario le entrega su objeto al objetivo cuando este no lleva ningún objeto.",
  "The user blocks the target's way with arms spread wide to prevent escape." =>
    "El usuario bloquea el paso del objetivo con los brazos extendidos para impedir que huya.",
  "The user's type is changed depending on its environment, such as at water's edge, in grass, or in a cave." =>
    "El tipo del usuario cambia según su entorno, como a orillas del agua, en hierba o en una cueva.",
  "If it is the opposite gender of the user, the target is charmed into harshly lowering its Sp. Atk stat." =>
    "Si es del género opuesto al del usuario, el objetivo queda encantado y su Ataque Especial baja severamente.",
  "The Pokémon congratulates you on your special day!" => "¡El Pokémon te felicita en tu día especial!",
  "The user tells the target a secret. The target loses focus and its Sp. Atk stat is lowered." =>
    "El usuario le cuenta un secreto al objetivo. Pierde la concentración y su Ataque Especial baja.",
  "The user changes its type to become the same type as one of its moves." =>
    "El usuario cambia su tipo para volverse del mismo tipo que uno de sus movimientos.",
  "The user changes its type to make itself resistant to the type of the attack the opponent used last." =>
    "El usuario cambia su tipo para volverse resistente al tipo del último ataque que usó el rival.",
  "The user mimics the move used immediately before it. The move fails if no other move has been used yet." =>
    "El usuario imita el movimiento usado inmediatamente antes que él. Falla si aún no se usó ningún movimiento.",
  "With its mysterious power, the user swaps the effects on either side of the field." =>
    "Con su poder misterioso, el usuario intercambia los efectos de ambos lados del campo.",
  "The user curls up to conceal weak spots and raise its Defense stat." =>
    "El usuario se hace un ovillo para ocultar sus puntos débiles y subir su Defensa.",
  "For four turns, this move prevents the target from using the move it last used." =>
    "Durante cuatro turnos, este movimiento impide que el objetivo use el último movimiento que usó.",
  "By moving rapidly, the user makes illusory copies of itself to raise its evasiveness." =>
    "Moviéndose rápidamente, el usuario crea copias ilusorias de sí mismo para subir su evasión.",
  "The user compels the target to keep using only the move it last used for three turns." =>
    "El usuario obliga al objetivo a seguir usando solo su último movimiento durante tres turnos.",
  "The user endures any attack with at least 1 HP. Its chance of failing rises if it is used in succession." =>
    "El usuario resiste cualquier ataque con al menos 1 PS. Su probabilidad de fallar aumenta si se usa seguidas veces.",
  "The user dances to compel the target to mimic it, making the target's Ability the same as the user's." =>
    "El usuario baila para obligar al objetivo a imitarlo, haciendo que su habilidad sea igual a la del usuario.",
  "The user flashes a light that cuts the target's accuracy. It can also be used to illuminate caves." =>
    "El usuario destella una luz que reduce la precisión del objetivo. También puede usarse para iluminar cuevas.",
  "The user takes a deep breath and focuses so that critical hits land more easily." =>
    "El usuario respira hondo y se concentra para que los golpes críticos sean más probables.",
  "The user draws attention to itself, making all targets take aim only at the user." =>
    "El usuario llama la atención sobre sí mismo, haciendo que todos los objetivos apunten solo a él.",
  "Enables the user to hit a Ghost type with any kind of move. It also enables the user to hit an evasive foe." =>
    "Permite al usuario golpear a un tipo Fantasma con cualquier movimiento. También permite golpear a un rival evasivo.",
  "The user intimidates the target with the pattern on its belly to cause paralysis." =>
    "El usuario intimida al objetivo con el patrón de su vientre para causarle parálisis.",
  "The user growls in an endearing way, making the foe less wary. The foe's Attack stat is lowered." =>
    "El usuario gruñe de forma entrañable, haciendo que el rival baje la guardia. Su Ataque baja.",
  "The user's body grows all at once, raising the Atk and Sp. Atk stats." =>
    "El cuerpo del usuario crece de golpe, subiendo su Ataque y Ataque Especial.",
  "Using Happy Hour doubles the amount of prize money received after battle." =>
    "Usar este movimiento duplica la cantidad de dinero ganado tras el combate.",
  "The user stiffens all the muscles in its body to raise its Defense stat." =>
    "El usuario tensa todos los músculos de su cuerpo para subir su Defensa.",
  "The user makes a soothing bell chime to heal the status problems of all the party Pokémon." =>
    "El usuario hace sonar una campana relajante que cura los problemas de estado de todo su equipo.",
  "The user assists an ally by boosting the power of its attack." =>
    "El usuario ayuda a un aliado potenciando el poder de su ataque.",
  "The user and an ally hold hands. This makes them very happy." =>
    "El usuario y un aliado se toman de las manos. Esto los hace muy felices.",
  "The user howls loudly to raise the spirit of itself and allies, boosting their Attack stats." =>
    "El usuario aúlla fuerte para levantar el ánimo propio y el de sus aliados, subiendo su Ataque.",
  "The user focuses intensely. The attack on the next turn always results in a critical hit." =>
    "El usuario se concentra intensamente. El ataque del siguiente turno siempre resulta en un golpe crítico.",
  "The user gains an intimidating leer with sharp eyes. The target's Defense stat is reduced." =>
    "El usuario mira de forma intimidante con ojos afilados. La Defensa del objetivo se reduce.",
  "The user takes sure aim at the target. It ensures the next attack does not fail to hit the target." =>
    "El usuario apunta con seguridad al objetivo. Asegura que el siguiente ataque no falle contra él.",
  "With a scary face, the user tries to force a kiss on the target. If it suceeds, the target falls asleep." =>
    "Con una cara aterradora, el usuario intenta forzar un beso al objetivo. Si lo logra, se queda dormido.",
  "The user chants an incantation toward the sky, preventing the foe from landing critical hits." =>
    "El usuario entona un cántico hacia el cielo, evitando que el rival dé golpes críticos.",
  "The user tries to cut ahead of the foe to steal and use the foe's intended move with greater power." =>
    "El usuario intenta adelantarse al rival para robar y usar el movimiento que este pensaba usar, con más poder.",
  "The user pins the target with a dark, arresting look. The target becomes unable to flee." =>
    "El usuario fija al objetivo con una mirada oscura y cautivante. El objetivo ya no puede huir.",
  "The user waggles a finger and stimulates its brain into randomly using nearly any move." =>
    "El usuario agita un dedo y estimula su cerebro para usar aleatoriamente casi cualquier movimiento.",
  "The user restores its own HP by up to half of its maximum HP. May also be used in the field to heal HP." =>
    "El usuario restaura hasta la mitad de sus PS máximos. También puede usarse fuera de combate para curar PS.",
  "The user copies the move last used by the foe. The move can be used until the user is switched out." =>
    "El usuario copia el último movimiento usado por el rival. Puede usarse hasta que el usuario sea cambiado.",
  "The user senses the foe's movements with its mind to ensure its next attack does not miss the foe." =>
    "El usuario percibe los movimientos del rival con su mente para asegurar que su siguiente ataque no falle.",
  "The user compresses its body to make itself look smaller, which sharply raises its evasiveness." =>
    "El usuario comprime su cuerpo para verse más pequeño, lo que sube considerablemente su evasión.",
  "An attack that makes use of nature's power. Its effects vary depending on the user's environment." =>
    "Un ataque que aprovecha el poder de la naturaleza. Sus efectos varían según el entorno del usuario.",
  "Letting out a noble roar, the user intimidates the target and lowers its Attack and Sp. Atk." =>
    "Soltando un rugido noble, el usuario intimida al objetivo y baja su Ataque y Ataque Especial.",
  "Enables the user to hit a Ghost type with any type of move. It also enables the user to hit an evasive foe." =>
    "Permite al usuario golpear a un tipo Fantasma con cualquier movimiento. También permite golpear a un rival evasivo.",
  "The user adds its HP to the target's HP, then equally shares the combined HP with the target." =>
    "El usuario suma sus PS a los del objetivo, y luego reparte los PS combinados por igual entre ambos.",
  "Any Pokémon that hears this song faints in three turns, unless it switches out of battle." =>
    "Cualquier Pokémon que oiga esta canción queda fuera de combate en tres turnos, a menos que se retire antes.",
  "The user and target become friends. The target loses its will to fight, lowering its Attack stat." =>
    "El usuario y el objetivo se hacen amigos. El objetivo pierde las ganas de pelear, y su Ataque baja.",
  "It enables the user to evade all attacks. Its chance of failing rises if it is used in succession." =>
    "Permite al usuario evadir todos los ataques. Su probabilidad de fallar aumenta si se usa seguidas veces.",
  "The user hypnotizes itself into copying any stat change made by the target." =>
    "El usuario se hipnotiza a sí mismo para copiar cualquier cambio de estadísticas del objetivo.",
  "Restoring its own cells, the user restores its own HP by half of its max HP." =>
    "Restaurando sus propias células, el usuario recupera la mitad de sus PS máximos.",
  "The user recycles a held item that has been used in battle so it can be used again." =>
    "El usuario recicla un objeto usado en combate para poder volver a usarlo.",
  "The user reflects the target's type, making it the same type as the target." =>
    "El usuario refleja el tipo del objetivo, volviéndose del mismo tipo que él.",
  "The user rests to cure itself of a poisoning, burn, or paralysis." =>
    "El usuario descansa para curarse de un envenenamiento, quemadura o parálisis.",
  "The target is scared off and replaced by another Pokémon in its party. In the wild, the battle ends." =>
    "El objetivo se asusta y es reemplazado por otro Pokémon de su equipo. En estado salvaje, el combate termina.",
  "The user creates a protective field that prevents status problems for five turns." =>
    "El usuario crea un campo protector que impide problemas de estado durante cinco turnos.",
  "The user frightens the target with a scary face to harshly reduce its Speed stat." =>
    "El usuario asusta al objetivo con una cara aterradora para reducir severamente su Velocidad.",
  "An earsplitting screech harshly reduces the target's Defense stat." =>
    "Un chirrido ensordecedor reduce severamente la Defensa del objetivo.",
  "The user reduces its polygon count to make itself more jagged, raising the Attack stat." =>
    "El usuario reduce su número de polígonos para volverse más anguloso, subiendo su Ataque.",
  "The user breaks its shell, lowering its defenses but sharply raising attacking and Speed stats." =>
    "El usuario rompe su caparazón, bajando sus defensas pero subiendo considerablemente su ataque y Velocidad.",
  "The user's mysterious psychic wave changes the target's Ability to Simple." =>
    "La misteriosa onda psíquica del usuario cambia la habilidad del objetivo a Simple.",
  "A soothing lullaby is sung in a calming voice that puts the target into a deep slumber." =>
    "Se canta una nana relajante con voz calmante que sume al objetivo en un sueño profundo.",
  "It enables the user to permanently learn the move last used by the foe. Once used, Sketch disappears." =>
    "Permite al usuario aprender permanentemente el último movimiento usado por el rival. Al usarlo, Esquema desaparece.",
  "The user slacks off, restoring its own HP by up to half of its maximum HP." =>
    "El usuario se relaja, restaurando hasta la mitad de sus PS máximos.",
  "While it is asleep, the user randomly uses one of the moves it knows." =>
    "Mientras duerme, el usuario usa aleatoriamente uno de los movimientos que conoce.",
  "The user releases an obscuring cloud of smoke or ink. It reduces the target's accuracy." =>
    "El usuario libera una nube de humo o tinta que oculta. Reduce la precisión del objetivo.",
  "The user restores its own HP by up to half of its maximum HP. May also be used in the field to heal HP." =>
    "El usuario restaura hasta la mitad de sus PS máximos. También puede usarse fuera de combate para curar PS.",
  "The user just flops and splashes around to no effect at all..." =>
    "El usuario simplemente se agita y salpica sin ningún efecto...",
  "The user shines a spotlight on the target so that only it will be attacked during the turn." =>
    "El usuario ilumina al objetivo con un foco para que solo él reciba ataques durante el turno.",
  "The user charges up power and raises both its Defense and Sp. Def. The move can be used three times." =>
    "El usuario acumula poder y sube su Defensa y Defensa Especial. Puede usarse hasta tres veces.",
  "The user eats its held Berry, then sharply raises its Defense stat." =>
    "El usuario se come su baya y luego sube considerablemente su Defensa.",
  "The user makes a copy of itself using some of its HP. The copy serves as the user's decoy." =>
    "El usuario crea una copia de sí mismo usando parte de sus PS. La copia sirve como señuelo.",
  "The user generates odd sound waves from its body. It may confuse the target." =>
    "El usuario genera extrañas ondas sonoras desde su cuerpo. Puede confundir al objetivo.",
  "The user enrages and confuses the target. However, it also sharply raises the target's Attack stat." =>
    "El usuario enfurece y confunde al objetivo. Sin embargo, también sube considerablemente su Ataque.",
  "The power stored using the move Stockpile is absorbed by the user to heal its HP." =>
    "El poder acumulado con el movimiento Reserva es absorbido por el usuario para curar sus PS.",
  "A sweet scent that lowers the foe's evasiveness. It also lures wild Pokémon if used in grass, etc." =>
    "Un dulce aroma que baja la evasión del rival. También atrae Pokémon salvajes si se usa en la hierba, etc.",
  "A frenetic dance to uplift the fighting spirit. It sharply raises the user's Attack stat." =>
    "Una danza frenética que eleva el espíritu de lucha. Sube considerablemente el Ataque del usuario.",
  "The user wags its tail cutely, making opposing Pokémon less wary and lowering their Defense stat." =>
    "El usuario agita su cola con gracia, haciendo que los rivales bajen la guardia y reduciendo su Defensa.",
  "Gets teary eyed to make the target lose its will to fight. Lowers the target's Attack and Sp. Atk." =>
    "Se pone lloroso para que el objetivo pierda las ganas de pelear. Baja su Ataque y Ataque Especial.",
  "The user has teatime with all the Pokémon in the battle. Each Pokémon eats its held Berry." =>
    "El usuario toma el té con todos los Pokémon del combate. Cada uno se come su baya.",
  "The user performs a wobbly dance that confuses the Pokémon around it." =>
    "El usuario ejecuta una danza tambaleante que confunde a los Pokémon a su alrededor.",
  "The user tickles the target into laughing, reducing its Attack and Defense stats." =>
    "El usuario hace reír al objetivo con cosquillas, reduciendo su Ataque y Defensa.",
  "The user transforms into a copy of the target right down to having the same move set." =>
    "El usuario se transforma en una copia exacta del objetivo, incluyendo sus mismos movimientos.",
  "The foe is blown away, to be replaced by another Pokémon in its party. In the wild, the battle ends." =>
    "El rival es arrastrado por el viento y reemplazado por otro Pokémon de su equipo. En estado salvaje, el combate termina.",
  "One turn after this move is used, the target's HP is restored by half the user's maximum HP." =>
    "Un turno después de usar este movimiento, los PS del objetivo se restauran a la mitad de los PS máximos del usuario.",
  "The user is roused, and its Attack and Sp. Atk stats increase." =>
    "El usuario se anima, y su Ataque y Ataque Especial aumentan.",
  "The user lets loose a huge yawn that lulls the target into falling asleep on the next turn." =>
    "El usuario suelta un enorme bostezo que hace que el objetivo se duerma en el siguiente turno.",
  "The user lets out a damaging belch at the target. The user must eat a held Berry to use this move." =>
    "El usuario suelta un eructo dañino contra el objetivo. Debe haberse comido una baya para usar este movimiento.",
  "The user shoots filthy garbage at the target to attack. It may also poison the target." =>
    "El usuario dispara basura inmunda contra el objetivo para atacar. También puede envenenarlo.",
  "It swamps the area around the user with a giant sludge wave. It may also poison those hit." =>
    "Inunda el área alrededor del usuario con una gigantesca ola de lodo. También puede envenenar a los golpeados.",
  "Inflicts physical or special damage, whichever will be more effective. May also poison the target." =>
    "Inflige daño físico o especial, el que sea más efectivo. También puede envenenar al objetivo.",
  "Unsanitary sludge is hurled at the target. It may also poison the target." =>
    "Se lanza lodo insalubre contra el objetivo. También puede envenenarlo.",
  "The target is stabbed with a tentacle or arm seeped with poison. It may also poison the target." =>
    "El objetivo recibe el golpe de un tentáculo o brazo impregnado de veneno. También puede envenenarlo.",
  "A slashing attack with a poisonous blade that may also poison the foe. Critical hits land more easily." =>
    "Un ataque cortante con una hoja venenosa que también puede envenenar al rival. Los golpes críticos son más probables.",
  "The user drenches the foe in a special poisonous liquid. Its power doubles if the target is poisoned." =>
    "El usuario empapa al rival en un líquido venenoso especial. Su poder se duplica si el objetivo está envenenado.",
  "The user attacks by throwing a clump of special mud. All status changes are returned to normal." =>
    "El usuario ataca lanzando un pegote de barro especial. Todos los cambios de estadísticas vuelven a la normalidad.",
  "The user bites the target with toxic fangs. It may also leave the target badly poisoned." =>
    "El usuario muerde al objetivo con colmillos tóxicos. También puede dejarlo gravemente envenenado.",
  "The user hits the target with its tail. It may also poison the target. Critical hits land more easily." =>
    "El usuario golpea al objetivo con su cola. También puede envenenarlo. Los golpes críticos son más probables.",
  "The foe is attacked with a spray of harsh acid. It may also lower the target's Sp. Def stat." =>
    "El rival recibe un chorro de ácido corrosivo. También puede bajar su Defensa Especial.",
  "The user spits fluid that works to melt the target. This harshly reduces the target's Sp. Def stat." =>
    "El usuario escupe un fluido que derrite al objetivo. Esto reduce severamente su Defensa Especial.",
  "The target is attacked with a discharge of filthy gases. It may also poison the target." =>
    "El objetivo recibe una descarga de gases inmundos. También puede envenenarlo.",
  "The user stabs the target with a poisonous stinger. This may also poison the target." =>
    "El usuario apuñala al objetivo con un aguijón venenoso. Esto también puede envenenarlo.",
  "The user alters its cellular structure to liquefy itself, sharply raising its Defense stat." =>
    "El usuario altera su estructura celular para licuarse, subiendo considerablemente su Defensa.",
  "Protects the user from attacks. Also poisons any attacker that makes contact with the user." =>
    "Protege al usuario de los ataques. También envenena a cualquier atacante que haga contacto con él.",
  "The user coils up and concentrates. This raises its Attack and Defense stats as well as its accuracy." =>
    "El usuario se enrosca y se concentra. Esto sube su Ataque, Defensa y también su precisión.",
  "The user surrounds everything around it with highly acidic gas and melts away items they hold." =>
    "El usuario rodea todo a su alrededor con un gas muy ácido que derrite los objetos que llevan.",
  "The user hurls up its stomach acids on the foe. The fluid negates the effect of the target's Ability." =>
    "El usuario vomita ácidos estomacales sobre el rival. El fluido anula el efecto de la habilidad del objetivo.",
  "A cloud of poison gas is sprayed in the face of opposing Pokémon. It may poison those hit." =>
    "Se rocía una nube de gas venenoso en la cara de los Pokémon rivales. Puede envenenar a los golpeados.",
  "The user scatters a cloud of poisonous dust on the target. It may poison the target." =>
    "El usuario esparce una nube de polvo venenoso sobre el objetivo. Puede envenenarlo.",
  "The user heals the target's status condition. If so, it also restores the user's own HP." =>
    "El usuario cura el problema de estado del objetivo. Si lo hace, también restaura sus propios PS.",
  "A move that leaves the target badly poisoned. Its poison damage worsens every turn." =>
    "Un movimiento que deja al objetivo gravemente envenenado. El daño del veneno empeora cada turno.",
  "The user lays a trap of poison spikes at the foe's feet. They poison foes that switch into battle." =>
    "El usuario coloca una trampa de púas venenosas a los pies del rival. Envenenan a quien entre en combate.",
  "The user shoots poisonous threads to poison the target and lower the target's Speed stat." =>
    "El usuario dispara hilos venenosos para envenenar al objetivo y bajar su Velocidad.",
  "Foes are drenched in an odd liquid that lowers the Attack, Sp. Atk, and Speed of poisoned Pokémon." =>
    "Los rivales quedan empapados en un extraño líquido que baja el Ataque, Ataque Especial y Velocidad de los envenenados.",
  "The user shoots powerful lasers using the power of a prism. The user can't move on the next turn." =>
    "El usuario dispara poderosos láseres usando el poder de un prisma. No puede moverse en el siguiente turno.",
  "The user attacks the target at full power. The attack's recoil harshly reduces the user's Sp. Atk stat." =>
    "El usuario ataca al objetivo a plena potencia. El retroceso reduce severamente su propio Ataque Especial.",
  "Two turns after this move is used, a hunk of psychic energy attacks the target." =>
    "Dos turnos después de usar este movimiento, una masa de energía psíquica ataca al objetivo.",
  "Using an odd shock wave, the user damages any Pokémon of the same type as the user." =>
    "Usando una extraña onda expansiva, el usuario daña a cualquier Pokémon del mismo tipo que él.",
  "The user eats the dreams of a sleeping foe. It absorbs half the damage caused to heal the user's HP." =>
    "El usuario devora los sueños de un rival dormido. Absorbe la mitad del daño causado para curar sus PS.",
  "The user attacks with a pillar of light. This move the higher of the user's Attack or Sp. Atk stat." =>
    "El usuario ataca con una columna de luz. Este movimiento usa el mayor entre el Ataque o el Ataque Especial del usuario.",
  "The user materializes an odd psychic wave to attack the target. This attack does physical damage." =>
    "El usuario materializa una extraña onda psíquica para atacar al objetivo. Este ataque causa daño físico.",
}

apply_moves_dict(5, NAMES)
apply_moves_dict(6, DESCS)
