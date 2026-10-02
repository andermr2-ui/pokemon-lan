# encoding: UTF-8
require_relative "apply_moves_common"

NAMES = {
  "Grav Apple" => "Manzana Grav",
  "Seed Bomb" => "Bomba Germen",
  "Horn Leech" => "Cuerno Cepa",
  "Grassy Glide" => "Deslizamiento Herbal",
  "Trop Kick" => "Patada Tropical",
  "Leaf Tornado" => "Tornado de Hojas",
  "Magical Leaf" => "Hoja Mágica",
  "Needle Arm" => "Brazo Pincho",
  "Razor Leaf" => "Hoja Afilada",
  "Vine Whip" => "Látigo Cepa",
  "Snap Trap" => "Trampa Cepo",
  "Bullet Seed" => "Semilla Bala",
  "Grass Knot" => "Hierba Lazo",
  "Aromatherapy" => "Aromaterapia",
  "Cotton Guard" => "Guardia Algodón",
  "Cotton Spore" => "Espora Algodón",
  "Forest's Curse" => "Maldición Silvestre",
  "Grass Whistle" => "Silbato",
  "Grassy Terrain" => "Campo de Hierba",
  "Ingrain" => "Arraigo",
  "Jungle Healing" => "Cura Salvaje",
  "Leech Seed" => "Drenadoras",
  "Sleep Powder" => "Somnífero",
  "Spiky Shield" => "Púa Escudo",
  "Spore" => "Espora",
  "Strength Sap" => "Absorbe Fuerza",
  "Stun Spore" => "Paralizador",
  "Synthesis" => "Síntesis",
  "Worry Seed" => "Semilla Zozobra",
  "Precipice Blades" => "Filo de Roca",
  "Earthquake" => "Terremoto",
  "High Horsepower" => "Fuerza Equina",
  "Earth Power" => "Tierra Viva",
  "Land's Wrath" => "Ira de la Tierra",
  "Thousand Arrows" => "Mil Flechas",
  "Thousand Waves" => "Mil Olas",
  "Dig" => "Excavar",
  "Drill Run" => "Barrena",
  "Stomping Tantrum" => "Pisotón Furia",
  "Scorching Sands" => "Arena Abrasadora",
  "Bone Club" => "Hueso Palo",
  "Mud Bomb" => "Bomba Fango",
  "Bulldoze" => "Terrapiés",
  "Mud Shot" => "Disparo Lodo",
  "Bonemerang" => "Huesomerang",
  "Sand Tomb" => "Sepulcro de Arena",
  "Bone Rush" => "Palazo",
  "Mud-Slap" => "Bofetón Lodo",
  "Fissure" => "Fisura",
  "Magnitude" => "Magnitud",
  "Mud Sport" => "Chapoteo Lodo",
  "Rototiller" => "Motocultor",
  "Sand Attack" => "Ataque Arena",
  "Shore Up" => "Terraplén",
  "Spikes" => "Púas",
  "Freeze Shock" => "Impacto Gélido",
  "Ice Burn" => "Quemadura Gélida",
  "Glacial Lance" => "Lanza Glacial",
  "Blizzard" => "Ventisca",
  "Ice Hammer" => "Martillo Hielo",
  "Ice Beam" => "Rayo Hielo",
  "Icicle Crash" => "Carámbano",
  "Ice Punch" => "Puño Hielo",
  "Freeze-Dry" => "Criodesecación",
  "Aurora Beam" => "Rayo Aurora",
  "Glaciate" => "Glaciación",
  "Ice Fang" => "Colmillo Hielo",
  "Avalanche" => "Alud",
  "Frost Breath" => "Aliento Helado",
  "Icy Wind" => "Viento Hielo",
  "Ice Shard" => "Fragmento de Hielo",
  "Powder Snow" => "Nieve Polvo",
  "Ice Ball" => "Bola Hielo",
  "Icicle Spear" => "Carámbano Aguja",
  "Triple Axel" => "Triple Salchow",
  "Sheer Cold" => "Frío Polar",
  "Aurora Veil" => "Velo Aurora",
  "Hail" => "Granizo",
  "Haze" => "Neblina",
  "Mist" => "Neblina Blanca",
  "Explosion" => "Explosión",
  "Self-Destruct" => "Autodestrucción",
  "Giga Impact" => "Culmen",
  "Hyper Beam" => "Hiperrayo",
  "Boomburst" => "Estruendo",
  "Last Resort" => "Último Recurso",
  "Skull Bash" => "Cabezazo",
  "Double-Edge" => "Doble Filo",
  "Head Charge" => "Golpe Cabeza",
  "Mega Kick" => "Megapatada",
  "Multi-Attack" => "Ataque Múltiple",
  "Techno Blast" => "Tecno Shock",
  "Thrash" => "Desenfreno",
  "Egg Bomb" => "Bomba Huevo",
  "Judgment" => "Juicio",
  "Hyper Voice" => "Vozarrón",
  "Revelation Dance" => "Danza Reveladora",
  "Rock Climb" => "Escalada",
  "Take Down" => "Derribo",
  "Uproar" => "Escándalo",
  "Body Slam" => "Golpe Cuerpo",
  "Extreme Speed" => "Velocidad Extrema",
  "Hyper Fang" => "Hipercolmillo",
  "Mega Punch" => "Mega Puño",
  "Razor Wind" => "Viento Cortante",
  "Slam" => "Golpazo",
  "Strength" => "Fuerza",
  "Tri Attack" => "Triataque",
  "Crush Claw" => "Garra Brutal",
  "Relic Song" => "Canto Vetusto",
  "Chip Away" => "Erosión",
  "Dizzy Punch" => "Puño Mareo",
  "Facade" => "Fachada",
  "Headbutt" => "Cabezazo",
  "Retaliate" => "Represalia",
  "Secret Power" => "Points Ocultos",
  "Slash" => "Cuchillada",
  "Smelling Salts" => "Sales Aromáticas",
  "Horn Attack" => "Ataque Cuerno",
  "Stomp" => "Pisotón",
  "Covet" => "Antojo",
  "Hidden Power" => "Poder Oculto",
  "Round" => "Turno",
  "Swift" => "Golpe Aéreo",
  "Vise Grip" => "Compresión",
  "Cut" => "Corte",
  "Rapid Spin" => "Giro Rápido",
  "Snore" => "Ronquido",
  "Terrain Pulse" => "Pulso de Campo",
  "Weather Ball" => "Meteorobola",
  "Echoed Voice" => "Grito Eco",
  "Fake Out" => "Sorpresa",
  "False Swipe" => "Falso Tortazo",
  "Hold Back" => "Contención",
  "Pay Day" => "Ojo de Águila",
  "Pound" => "Placaje",
  "Quick Attack" => "Ataque Rápido",
  "Double Hit" => "Golpe Doble",
  "Feint" => "Amago",
  "Tail Slap" => "Golpe Cola",
  "Rage" => "Furia",
  "Spike Cannon" => "Cañón Púas",
  "Comet Punch" => "Puño Cometa",
}

DESCS = {
  "The user inflicts damage by dropping an apple from high above. This also lowers the target's Defense." =>
    "El usuario inflige daño dejando caer una manzana desde gran altura. Esto también baja la Defensa del objetivo.",
  "The user slams a barrage of hard-shelled seeds down on the target from above." =>
    "El usuario deja caer una lluvia de semillas de cáscara dura sobre el objetivo desde arriba.",
  "The user drains the foe's energy with its horns. The user's HP is restored by half the damage inflicted." =>
    "El usuario drena la energía del rival con sus cuernos. Sus PS se restauran a la mitad del daño causado.",
  "Gliding on the ground, the user attacks the target. This move always goes first on Grassy Terrain." =>
    "Deslizándose por el suelo, el usuario ataca al objetivo. Siempre actúa primero en el Campo de Hierba.",
  "The user lands an intense tropical kick on the target. This also lowers the target's Attack stat." =>
    "El usuario asesta una intensa patada tropical al objetivo. Esto también baja su Ataque.",
  "The user attacks its foe by encircling it in sharp leaves. This attack may also lower the foe's accuracy." =>
    "El usuario ataca al rival rodeándolo de hojas afiladas. También puede bajar su precisión.",
  "The user scatters curious leaves that chase the target. This attack will not miss." =>
    "El usuario esparce curiosas hojas que persiguen al objetivo. Este ataque nunca falla.",
  "The user attacks by wildly swinging its thorny arms. It may also make the target flinch." =>
    "El usuario ataca agitando salvajemente sus brazos espinosos. También puede hacer que el objetivo se amedrente.",
  "Sharp-edged leaves are launched to slash at the opposing team. Critical hits land more easily." =>
    "Se lanzan hojas de bordes afilados para cortar al equipo rival. Los golpes críticos son más probables.",
  "The target is struck with slender, whiplike vines to inflict damage." =>
    "El objetivo recibe el golpe de delgadas enredaderas parecidas a un látigo.",
  "The user snares the target in a snap trap for four to five turns." =>
    "El usuario atrapa al objetivo en una trampa cepo durante cuatro o cinco turnos.",
  "The user forcefully shoots seeds at the target. Two to five seeds are shot in rapid succession." =>
    "El usuario dispara semillas con fuerza contra el objetivo. Se disparan de dos a cinco semillas rápidamente.",
  "The user snares the target with grass and trips it. The heavier the target, the greater the damage." =>
    "El usuario atrapa al objetivo con hierba y lo hace tropezar. Cuanto más pesado sea, mayor será el daño.",
  "The user releases a soothing scent that heals all status problems affecting the user's party." =>
    "El usuario libera un aroma relajante que cura todos los problemas de estado de su equipo.",
  "The user protects itself by wrapping its body in soft cotton, drastically raising its Defense stat." =>
    "El usuario se protege envolviendo su cuerpo en algodón suave, subiendo drásticamente su Defensa.",
  "The user releases cotton-like spores that cling to the foe, harshly reducing its Speed stat." =>
    "El usuario libera esporas parecidas al algodón que se adhieren al rival, reduciendo severamente su Velocidad.",
  "The user puts a forest curse on the target. The target is now Grass type as well." =>
    "El usuario impone una maldición silvestre sobre el objetivo. Ahora también es de tipo Planta.",
  "The user plays a pleasant melody that lulls the target into a deep sleep." =>
    "El usuario toca una melodía agradable que sume al objetivo en un sueño profundo.",
  "The user turns the ground to grass for five turns. Grounded Pokémon restore a little HP every turn." =>
    "El usuario convierte el suelo en hierba durante cinco turnos. Los Pokémon en tierra recuperan algo de PS cada turno.",
  "The user lays roots that restore its HP on every turn. Because it is rooted, it can't switch out." =>
    "El usuario echa raíces que restauran sus PS cada turno. Como está enraizado, no puede cambiar de Pokémon.",
  "The user becomes one with the jungle, and restores HP and cures status conditions of itself and allies." =>
    "El usuario se vuelve uno con la jungla, y restaura PS y cura problemas de estado propios y de sus aliados.",
  "A seed is planted on the target. It steals some HP from the target every turn." =>
    "Se planta una semilla en el objetivo. Le roba algo de PS cada turno.",
  "The user scatters a big cloud of sleep-inducing dust around the target." =>
    "El usuario esparce una gran nube de polvo somnífero alrededor del objetivo.",
  "Protects the user from attacks. Also damages attackers that make contact with the user." =>
    "Protege al usuario de los ataques. También daña a los atacantes que hacen contacto con él.",
  "The user scatters bursts of spores that induce sleep." =>
    "El usuario esparce ráfagas de esporas que inducen el sueño.",
  "The user restores its HP by the target's Attack stat amount. Then lowers the target's Attack stat." =>
    "El usuario restaura sus PS según el valor de Ataque del objetivo. Luego baja el Ataque del objetivo.",
  "The user scatters a cloud of paralyzing powder. It may leave the target with paralysis." =>
    "El usuario esparce una nube de polvo paralizante. Puede dejar al objetivo paralizado.",
  "A seed that causes worry is planted on the foe. It prevents sleep by making its Ability Insomnia." =>
    "Se planta en el rival una semilla que causa preocupación. Impide el sueño al darle la habilidad Insomnio.",
  "The user attacks its foes by manifesting the power of the land in fearsome blades of stone." =>
    "El usuario ataca a sus rivales manifestando el poder de la tierra en temibles hojas de piedra.",
  "The user sets off an earthquake that strikes every Pokémon around it." =>
    "El usuario provoca un terremoto que golpea a todos los Pokémon a su alrededor.",
  "The user fiercely attacks the target using its entire body." =>
    "El usuario ataca ferozmente al objetivo usando todo su cuerpo.",
  "The user makes the ground under the foe erupt with power. It may also lower the target's Sp. Def." =>
    "El usuario hace que el suelo bajo el rival estalle con poder. También puede bajar su Defensa Especial.",
  "The user gathers the energy of the land and focuses that power on foes to damage them." =>
    "El usuario reúne la energía de la tierra y enfoca ese poder en los rivales para dañarlos.",
  "This move also hits Pokémon that are in the air. Those Pokémon are knocked down to the ground." =>
    "Este movimiento también golpea a los Pokémon que están en el aire, derribándolos al suelo.",
  "The user attacks with a wave that crawls along the ground. Those it hits can't flee from battle." =>
    "El usuario ataca con una onda que se arrastra por el suelo. Quien reciba el golpe no puede huir del combate.",
  "The user burrows, then attacks on the second turn. It can also be used to exit dungeons." =>
    "El usuario se entierra y ataca en el segundo turno. También puede usarse para salir de mazmorras.",
  "The user crashes into its target while rotating its body like a drill. Critical hits land more easily." =>
    "El usuario se estrella contra su objetivo girando su cuerpo como un taladro. Los golpes críticos son más probables.",
  "The user attacks driven by frustration. Power increases if the user's previous move failed." =>
    "El usuario ataca impulsado por la frustración. El poder aumenta si su movimiento anterior falló.",
  "The user throws scorching sand at the target to attack. This may also burn the target." =>
    "El usuario lanza arena abrasadora contra el objetivo para atacar. También puede quemarlo.",
  "The user clubs the target with a bone. It may also make the target flinch." =>
    "El usuario golpea al objetivo con un hueso. También puede hacer que se amedrente.",
  "The user launches a hard-packed mud ball to attack. It may also lower the target's accuracy." =>
    "El usuario lanza una bola de barro compactado para atacar. También puede bajar la precisión del objetivo.",
  "The user strikes everything around it by stomping on the ground. It reduces hit Pokémon's Speed." =>
    "El usuario golpea todo a su alrededor pisando el suelo. Reduce la Velocidad de los Pokémon golpeados.",
  "The user attacks by hurling a blob of mud at the target. It also reduces the target's Speed." =>
    "El usuario ataca lanzando una masa de barro contra el objetivo. También reduce su Velocidad.",
  "The user throws the bone it holds. The bone loops to hit the target twice, coming and going." =>
    "El usuario lanza el hueso que sostiene. El hueso gira y golpea al objetivo dos veces, de ida y vuelta.",
  "The user traps the target inside a harshly raging sandstorm for four to five turns." =>
    "El usuario atrapa al objetivo dentro de una furiosa tormenta de arena durante cuatro o cinco turnos.",
  "The user strikes the target with a hard bone two to five times in a row." =>
    "El usuario golpea al objetivo con un hueso duro de dos a cinco veces seguidas.",
  "The user hurls mud in the target's face to inflict damage and lower its accuracy." =>
    "El usuario lanza barro a la cara del objetivo para infligir daño y bajar su precisión.",
  "The user opens up a fissure in the ground and drops the foe in. The target instantly faints if it hits." =>
    "El usuario abre una fisura en el suelo y hace caer al rival dentro. El objetivo queda fuera de combate al instante si acierta.",
  "The user looses a ground-shaking quake affecting everyone around the user. Its power varies." =>
    "El usuario libera un temblor que sacude el suelo afectando a todos a su alrededor. Su poder varía.",
  "The user covers itself with mud. It weakens Electric-type moves while the user is in the battle." =>
    "El usuario se cubre de barro. Debilita los movimientos de tipo Eléctrico mientras esté en combate.",
  "The user tills the soil to encourage plant growth. This raises the Attack and Sp. Atk of Grass types." =>
    "El usuario labra la tierra para fomentar el crecimiento de las plantas. Sube el Ataque y Ataque Especial de los tipo Planta.",
  "Sand is hurled in the target's face, reducing its accuracy." =>
    "Se lanza arena a la cara del objetivo, reduciendo su precisión.",
  "The user regains up to half of its max HP. It restores more HP in a sandstorm." =>
    "El usuario recupera hasta la mitad de sus PS máximos. Recupera más PS durante una tormenta de arena.",
  "The user lays a trap of spikes at the foe's feet. The trap hurts foes that switch into battle." =>
    "El usuario coloca una trampa de púas a los pies del rival. La trampa daña a quienes entren en combate.",
  "On the second turn, the user hits the foe with electrically charged ice. It may also paralyze the foe." =>
    "En el segundo turno, el usuario golpea al rival con hielo cargado de electricidad. También puede paralizarlo.",
  "On the second turn, an ultracold, freezing wind surrounds the foe. This may leave it with a burn." =>
    "En el segundo turno, un viento ultrafrío y helado rodea al rival. Puede dejarlo quemado.",
  "The user attacks by hurling a blizzard-cloaked icicle lance at opposing Pokémon." =>
    "El usuario ataca lanzando una lanza de carámbano envuelta en ventisca contra los Pokémon rivales.",
  "A howling blizzard is summoned to strike the opposing team. It may also freeze them solid." =>
    "Se invoca una ventisca aulladora que golpea al equipo rival. También puede congelarlos por completo.",
  "The user swings and hits with its strong, heavy fist. It lowers the user's Speed, however." =>
    "El usuario balancea y golpea con su puño fuerte y pesado. Sin embargo, baja su propia Velocidad.",
  "The target is struck with an icy-cold beam of energy. It may also freeze the target solid." =>
    "El objetivo recibe un rayo de energía helada. También puede congelarlo por completo.",
  "The user attacks by harshly dropping an icicle onto the foe. It may also make the target flinch." =>
    "El usuario ataca dejando caer bruscamente un carámbano sobre el rival. También puede hacer que se amedrente.",
  "The target is punched with an icy fist. It may also leave the target frozen." =>
    "El objetivo recibe un puñetazo helado. También puede dejarlo congelado.",
  "The user rapidly cools the target. This may freeze the target. Is super-effective on Water types." =>
    "El usuario enfría rápidamente al objetivo. Puede congelarlo. Es súper efectivo contra los tipo Agua.",
  "The target is hit with a rainbow-colored beam. This may also lower the target's Attack stat." =>
    "El objetivo recibe un rayo de colores arcoíris. También puede bajar su Ataque.",
  "The user attacks by blowing freezing cold air at the foe. This attack reduces the targets' Speed stat." =>
    "El usuario ataca soplando aire helado sobre el rival. Este ataque reduce la Velocidad de los objetivos.",
  "The user bites with cold-infused fangs. It may also make the target flinch or leave it frozen." =>
    "El usuario muerde con colmillos infundidos de frío. También puede hacer que se amedrente o quede congelado.",
  "An attack move that inflicts double the damage if the user has been hurt by the foe in the same turn." =>
    "Un ataque que inflige el doble de daño si el usuario fue lastimado por el rival en el mismo turno.",
  "The user blows a cold breath on the target. This attack always results in a critical hit." =>
    "El usuario sopla un aliento frío sobre el objetivo. Este ataque siempre resulta en un golpe crítico.",
  "The user attacks with a gust of chilled air. It also lowers the targets' Speed stat." =>
    "El usuario ataca con una ráfaga de aire helado. También baja la Velocidad de los objetivos.",
  "The user flash freezes chunks of ice and hurls them at the target. This move always goes first." =>
    "El usuario congela trozos de hielo instantáneamente y los lanza contra el objetivo. Siempre actúa primero.",
  "The user attacks with a chilling gust of powdery snow. It may also freeze the targets." =>
    "El usuario ataca con una ráfaga helada de nieve en polvo. También puede congelar a los objetivos.",
  "The user continually rolls into the target over five turns. It becomes stronger each time it hits." =>
    "El usuario rueda continuamente contra el objetivo durante cinco turnos. Se vuelve más fuerte con cada golpe.",
  "The user launches sharp icicles at the target. It strikes two to five times in a row." =>
    "El usuario lanza carámbanos afilados contra el objetivo. Golpea de dos a cinco veces seguidas.",
  "A consecutive three-kick attack that becomes more powerful with each successful hit." =>
    "Un ataque consecutivo de tres patadas que se vuelve más poderoso con cada golpe exitoso.",
  "The foe is attacked with a blast of absolute-zero cold. The target instantly faints if it hits." =>
    "El rival recibe una ráfaga de frío absoluto. El objetivo queda fuera de combate al instante si acierta.",
  "This move reduces damage from attacks for five turns. This can be used only in a hailstorm." =>
    "Este movimiento reduce el daño de los ataques durante cinco turnos. Solo puede usarse durante una granizada.",
  "The user summons a hail storm lasting five turns. It damages all Pokémon except the Ice type." =>
    "El usuario invoca una granizada que dura cinco turnos. Daña a todos los Pokémon excepto a los de tipo Hielo.",
  "The user creates a haze that eliminates every stat change among all the Pokémon engaged in battle." =>
    "El usuario crea una neblina que elimina todos los cambios de estadísticas de los Pokémon en combate.",
  "The user cloaks its body with a white mist that prevents any of its stats from being cut for five turns." =>
    "El usuario envuelve su cuerpo en una niebla blanca que impide que le bajen las estadísticas durante cinco turnos.",
  "The user explodes to inflict damage on those around it. The user faints upon using this move." =>
    "El usuario explota para infligir daño a quienes lo rodean. Queda fuera de combate al usar este movimiento.",
  "The user blows up to inflict damage on all Pokémon in battle. The user faints upon using this move." =>
    "El usuario estalla para infligir daño a todos los Pokémon en combate. Queda fuera de combate al usarlo.",
  "The user charges at the target using every bit of its power. The user must rest on the next turn." =>
    "El usuario carga contra el objetivo usando hasta el último de sus poderes. Debe descansar el siguiente turno.",
  "The foe is attacked with a powerful beam. The user must rest on the next turn to regain its energy." =>
    "El rival recibe un poderoso rayo. El usuario debe descansar el siguiente turno para recuperar energía.",
  "The user attacks everything around it with the destructive power of a terrible, explosive sound." =>
    "El usuario ataca todo a su alrededor con el poder destructivo de un sonido terrible y explosivo.",
  "This move can be used only after the user has used all the other moves it knows in the battle." =>
    "Este movimiento solo puede usarse después de que el usuario haya usado todos los demás movimientos que conoce en el combate.",
  "The user tucks in its head to raise its Defense in the first turn, then rams the foe on the next turn." =>
    "El usuario recoge la cabeza para subir su Defensa en el primer turno, y embiste al rival en el siguiente.",
  "A reckless, life-risking tackle. It also damages the user by a fairly large amount, however." =>
    "Un placaje temerario que arriesga la vida. Sin embargo, también causa un daño considerable al usuario.",
  "The user charges its head into the foe, using its powerful guard hair. The user also takes damage." =>
    "El usuario embiste con la cabeza contra el rival, usando su poderoso pelaje protector. También recibe daño.",
  "The target is attacked by a kick launched with muscle-packed power." =>
    "El objetivo recibe una patada lanzada con un poder muscular tremendo.",
  "Cloaking itself in high energy, the user slams into the target. This move's type depends on the held memory." =>
    "Envolviéndose en energía intensa, el usuario embiste al objetivo. El tipo de este movimiento depende del disco que lleve.",
  "The user fires a beam of light at its target. The type changes depending on the Drive the user holds." =>
    "El usuario dispara un haz de luz contra su objetivo. El tipo cambia según el módulo que lleve.",
  "The user rampages and attacks for two to three turns. It then becomes confused, however." =>
    "El usuario se descontrola y ataca durante dos o tres turnos. Sin embargo, después queda confundido.",
  "A large egg is hurled at the target with maximum force to inflict damage." =>
    "Se lanza un gran huevo contra el objetivo con máxima fuerza para infligir daño.",
  "The user releases countless shots of light. Its type varies with the kind of Plate the user is holding." =>
    "El usuario libera incontables disparos de luz. Su tipo varía según la placa que lleve.",
  "The user lets loose a horribly echoing shout with the power to inflict damage." =>
    "El usuario suelta un grito con un eco horrible capaz de infligir daño.",
  "The user attacks the target by dancing very hard. The user's type determines the type of this move." =>
    "El usuario ataca al objetivo bailando con intensidad. El tipo del usuario determina el tipo de este movimiento.",
  "The user attacks the target by smashing into it with incredible force. It may also confuse the target." =>
    "El usuario ataca al objetivo estrellándose contra él con una fuerza increíble. También puede confundirlo.",
  "A reckless, full-body charge attack for slamming into the foe. It also damages the user a little." =>
    "Un ataque temerario con todo el cuerpo para embestir al rival. También causa algo de daño al usuario.",
  "The user attacks in an uproar for three turns. Over that time, no one can fall asleep." =>
    "El usuario ataca en un alboroto durante tres turnos. Durante ese tiempo, nadie puede quedarse dormido.",
  "The user drops onto the target with its full body weight. It may leave the target with paralysis." =>
    "El usuario cae sobre el objetivo con todo el peso de su cuerpo. Puede dejarlo paralizado.",
  "The user charges the target at blinding speed. This attack always goes before any other move." =>
    "El usuario carga contra el objetivo a una velocidad cegadora. Este ataque siempre actúa antes que cualquier otro.",
  "The user bites hard on the target with its sharp front fangs. It may also make the target flinch." =>
    "El usuario muerde con fuerza al objetivo con sus afilados colmillos frontales. También puede hacer que se amedrente.",
  "The target is slugged by a punch thrown with muscle-packed power." =>
    "El objetivo recibe un puñetazo lanzado con un poder muscular tremendo.",
  "A two-turn attack. Blades of wind hit the foe on the second turn. Critical hits land more easily." =>
    "Un ataque de dos turnos. Cuchillas de viento golpean al rival en el segundo turno. Los golpes críticos son más probables.",
  "The target is slammed with a long tail, vines, etc., to inflict damage." =>
    "El objetivo recibe el golpe de una larga cola, enredaderas, etc., para infligir daño.",
  "The target is slugged with a punch thrown at maximum power. It can also be used to move heavy boulders." =>
    "El objetivo recibe un puñetazo lanzado a máxima potencia. También puede usarse para mover grandes peñascos.",
  "The user strikes with a simultaneous three-beam attack. May also paralyze, burn, or freeze the target." =>
    "El usuario golpea con un ataque simultáneo de tres rayos. Puede paralizar, quemar o congelar al objetivo.",
  "The user slashes the target with hard and sharp claws. It may also lower the target's Defense." =>
    "El usuario corta al objetivo con garras duras y afiladas. También puede bajar su Defensa.",
  "An ancient song appeals to the hearts of those listening. It may also induce sleep." =>
    "Una canción ancestral conmueve el corazón de quienes la escuchan. También puede inducir el sueño.",
  "Seeking an opening, the user strikes continually. The foe's stat changes don't affect the damage." =>
    "Buscando una abertura, el usuario golpea continuamente. Los cambios de estadísticas del rival no afectan el daño.",
  "The target is hit with rhythmically launched punches that may also leave it confused." =>
    "El objetivo recibe puñetazos lanzados con ritmo que también pueden dejarlo confundido.",
  "An attack move that doubles its power if the user is poisoned, burned, or has paralysis." =>
    "Un ataque que duplica su poder si el usuario está envenenado, quemado o paralizado.",
  "The user sticks out its head and attacks by charging into the foe. It may also make the target flinch." =>
    "El usuario saca la cabeza y ataca embistiendo al rival. También puede hacer que se amedrente.",
  "Gets revenge for a fainted ally. If an ally fainted in the last turn, this attack's damage increases." =>
    "Se venga por un aliado derrotado. Si un aliado cayó en el último turno, el daño de este ataque aumenta.",
  "The user attacks with a secret power. Its added effects vary depending on the user's environment." =>
    "El usuario ataca con un poder secreto. Sus efectos adicionales varían según el entorno del usuario.",
  "The target is attacked with a slash of claws or blades. Critical hits land more easily." =>
    "El objetivo recibe un tajo de garras o cuchillas. Los golpes críticos son más probables.",
  "This attack inflicts double damage on a paralyzed foe. It also cures the target's paralysis, however." =>
    "Este ataque inflige el doble de daño a un rival paralizado. Sin embargo, también cura su parálisis.",
  "The target is jabbed with a sharply pointed horn to inflict damage." =>
    "El objetivo recibe el golpe de un cuerno afilado para infligir daño.",
  "The target is stomped with a big foot. It may also make the target flinch." =>
    "El objetivo recibe un pisotón con un gran pie. También puede hacer que se amedrente.",
  "The user endearingly approaches the target, then steals the target's held item." =>
    "El usuario se acerca al objetivo de forma entrañable y luego le roba el objeto que lleva.",
  "A unique attack that varies in type and intensity depending on the Pokémon using it." =>
    "Un ataque único que varía en tipo e intensidad según el Pokémon que lo use.",
  "The user attacks with a song. Others can join in the Round and make the attack do greater damage." =>
    "El usuario ataca con una canción. Otros pueden unirse al turno y hacer que el ataque cause más daño.",
  "Star-shaped rays are shot at the opposing team. This attack never misses." =>
    "Se disparan rayos con forma de estrella contra el equipo rival. Este ataque nunca falla.",
  "The target is gripped and squeezed from both sides to inflict damage." =>
    "El objetivo es sujetado y apretado desde ambos lados para infligir daño.",
  "The target is cut with a scythe or a claw. It can also be used to cut down thin trees." =>
    "El objetivo recibe un corte de guadaña o garra. También puede usarse para talar árboles delgados.",
  "A spin attack that raises the user's Speed and eliminates the effects of Bind, Spikes, etc." =>
    "Un ataque giratorio que sube la Velocidad del usuario y elimina los efectos de Ligadura, Púas, etc.",
  "An attack that can be used only if the user is asleep. The harsh noise may also make the target flinch." =>
    "Un ataque que solo puede usarse si el usuario está dormido. El fuerte ruido también puede hacer que el objetivo se amedrente.",
  "Utilizes the power of the terrain to attack. This move's type and power vary with the terrain." =>
    "Utiliza el poder del campo para atacar. El tipo y poder de este movimiento varían según el campo.",
  "An attack move that varies in power and type depending on the weather." =>
    "Un movimiento de ataque que varía en poder y tipo según el clima.",
  "The user attacks the foe with an echoing voice. If this move is used every turn, it does greater damage." =>
    "El usuario ataca al rival con una voz que hace eco. Si se usa cada turno, causa más daño.",
  "An attack that hits first and makes the target flinch. It only works the first turn the user is in battle." =>
    "Un ataque que golpea primero y hace que el objetivo se amedrente. Solo funciona el primer turno del usuario en combate.",
  "A restrained attack that prevents the target from fainting. The target is left with at least 1 HP." =>
    "Un ataque contenido que impide que el objetivo quede fuera de combate. Le queda al menos 1 PS.",
  "The user holds back when it attacks, and the target is left with at least 1 HP." =>
    "El usuario se contiene al atacar, y al objetivo le queda al menos 1 PS.",
  "Numerous coins are hurled at the target to inflict damage. Money is earned after battle." =>
    "Se lanzan numerosas monedas contra el objetivo para infligir daño. Se gana dinero después del combate.",
  "The target is physically pounded with a long tail or a foreleg, etc." =>
    "El objetivo recibe un golpe físico con una larga cola, una pata delantera, etc.",
  "The user lunges at the target at a speed that makes it almost invisible. It is sure to strike first." =>
    "El usuario se lanza contra el objetivo a una velocidad que lo vuelve casi invisible. Siempre golpea primero.",
  "Hard, pointed, and sharp claws rake the target to inflict damage." =>
    "Garras duras, puntiagudas y afiladas rasgan al objetivo para infligir daño.",
  "A physical attack in which the user charges and slams into the target with its whole body." =>
    "Un ataque físico en el que el usuario carga y se estrella contra el objetivo con todo su cuerpo.",
  "The user slams the target with a long tail, vines, or tentacle. The target is hit twice in a row." =>
    "El usuario golpea al objetivo con una larga cola, enredaderas o tentáculo. Recibe dos golpes seguidos.",
  "An attack that hits a target using Protect or Detect. It also lifts the effects of those moves." =>
    "Un ataque que golpea a un objetivo que usa Protección o Detección. También anula los efectos de esos movimientos.",
  "The user attacks by striking the target with its hard tail. It hits the Pokémon two to five times in a row." =>
    "El usuario ataca golpeando al objetivo con su dura cola. Golpea de dos a cinco veces seguidas.",
  "As long as this move is in use, the user's Attack rises each time the user is hit in battle." =>
    "Mientras se use este movimiento, el Ataque del usuario sube cada vez que es golpeado en combate.",
  "Sharp spikes are shot at the target in rapid succession. They hit two to five times in a row." =>
    "Se disparan púas afiladas contra el objetivo en rápida sucesión. Golpean de dos a cinco veces seguidas.",
  "The target is hit with a flurry of punches that strike two to five times in a row." =>
    "El objetivo recibe una ráfaga de puñetazos que golpean de dos a cinco veces seguidas.",
}

apply_moves_dict(5, NAMES)
apply_moves_dict(6, DESCS)
