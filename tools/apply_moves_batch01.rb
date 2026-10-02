# encoding: UTF-8
require_relative "apply_moves_common"

NAMES = {
  "Megahorn" => "Megacuerno",
  "Attack Order" => "Orden Ataque",
  "Bug Buzz" => "Zumbido",
  "First Impression" => "Sorpresa",
  "Pollen Puff" => "Bomba Polen",
  "Leech Life" => "Chupavidas",
  "Lunge" => "Estocada",
  "X-Scissor" => "Tijera X",
  "Signal Beam" => "Rayo Señal",
  "Skitter Smack" => "Golpe Furtivo",
  "U-turn" => "U-turn",
  "Steamroller" => "Aplanadora",
  "Bug Bite" => "Bicho Mordisco",
  "Silver Wind" => "Viento Plata",
  "Fell Stinger" => "Aguijón Letal",
  "Struggle Bug" => "Bicho Malicia",
  "Fury Cutter" => "Corte Furia",
  "Pin Missile" => "Pin Misil",
  "Twineedle" => "Doble Ataque Bicho",
  "Infestation" => "Ligadura",
  "Defend Order" => "Orden Defensa",
  "Heal Order" => "Orden Curación",
  "Powder" => "Polvo Explosivo",
  "Quiver Dance" => "Vals Ígneo",
  "Rage Powder" => "Polvo Ira",
  "Spider Web" => "Telaraña",
  "Sticky Web" => "Red Viscosa",
  "String Shot" => "Disparo Demora",
  "Tail Glow" => "Cola Brillo",
  "Hyperspace Fury" => "Furia Hiperespacial",
  "Foul Play" => "Trampa",
  "Fiery Wrath" => "Ira Abrasadora",
  "Darkest Lariat" => "Golpe Doble Siniestro",
  "Night Daze" => "Vahído Nocturno",
  "Crunch" => "Triturar",
  "Dark Pulse" => "Pulso Umbrío",
  "False Surrender" => "Falsa Sumisión",
  "Jaw Lock" => "Mordaza",
  "Throat Chop" => "Golpe Garganta",
  "Wicked Blow" => "Golpe Malicioso",
  "Lash Out" => "Arrebato",
  "Night Slash" => "Tajo Umbrío",
  "Sucker Punch" => "Golpe Bajo",
  "Knock Off" => "Robo",
  "Assurance" => "Refuerzo",
  "Bite" => "Mordisco",
  "Brutal Swing" => "Golpe Brutal",
  "Feint Attack" => "Finta",
  "Thief" => "Ladrón",
  "Snarl" => "Regañar",
  "Payback" => "Desquite",
  "Pursuit" => "Persecución",
  "Beat Up" => "Golpiza",
  "Fling" => "Lanzamiento",
  "Power Trip" => "Ostentación",
  "Punishment" => "Castigo",
  "Dark Void" => "Sumisión",
  "Embargo" => "Embargo",
  "Fake Tears" => "Falsas Lágrimas",
  "Flatter" => "Adulación",
  "Hone Claws" => "Afilar",
  "Memento" => "Legado",
  "Nasty Plot" => "Maquinación",
  "Obstruct" => "Obstrucción",
  "Parting Shot" => "Golpe de Despedida",
  "Quash" => "Anular",
  "Snatch" => "Sustracción",
  "Switcheroo" => "Cambiazo",
  "Taunt" => "Mofa",
  "Topsy-Turvy" => "Del Revés",
  "Torment" => "Tormento",
  "Eternabeam" => "Rayo Eternal",
  "Dragon Energy" => "Energidragón",
  "Roar of Time" => "Rugido Temporal",
  "Draco Meteor" => "Aliento Draco",
  "Outrage" => "Enfado",
  "Clanging Scales" => "Chirrido Metálico",
  "Core Enforcer" => "Ejecutor Nuclear",
  "Dragon Rush" => "Carga Dragón",
  "Dynamax Cannon" => "Cañón Dynamax",
  "Spacial Rend" => "Corte Espacial",
  "Dragon Hammer" => "Martillo Dragón",
  "Dragon Pulse" => "Pulso Dragón",
  "Dragon Claw" => "Garra Dragón",
  "Breaking Swipe" => "Golpe Demoledor",
  "Dragon Breath" => "Aliento de Dragón",
  "Dragon Tail" => "Cola Dragón",
  "Dragon Darts" => "Dardo Dragón",
  "Dual Chop" => "Doble Golpe Dragón",
  "Twister" => "Tornado",
  "Scale Shot" => "Disparo Escamas",
  "Dragon Rage" => "Ira Dragón",
  "Clangorous Soul" => "Alma Estridente",
  "Dragon Dance" => "Danza Dragón",
  "Bolt Strike" => "Ataque Fulgor",
  "Volt Tackle" => "Voltiotacleada",
  "Zap Cannon" => "Electrocañón",
  "Aura Wheel" => "Rueda Aural",
  "Thunder" => "Trueno",
  "Fusion Bolt" => "Rayo Fusión",
  "Plasma Fists" => "Puños Plasma",
  "Thunderbolt" => "Rayo",
  "Wild Charge" => "Carga Salvaje",
  "Bolt Beak" => "Picotazo Fulmíneo",
  "Discharge" => "Chispa",
  "Overdrive" => "Sobrecarga Sónica",
  "Thunder Cage" => "Jaula Eléctrica",
  "Zing Zap" => "Chispazo",
  "Thunder Punch" => "Puño Trueno",
  "Rising Voltage" => "Voltaje Ascendente",
  "Volt Switch" => "Voltiocambio",
  "Parabolic Charge" => "Carga Parábola",
  "Spark" => "Chispa Eléctrica",
  "Thunder Fang" => "Colmillo Rayo",
  "Shock Wave" => "Onda Voltio",
  "Electroweb" => "Electrotela",
  "Charge Beam" => "Rayo Carga",
  "Thunder Shock" => "Impactrueno",
  "Nuzzle" => "Cariñoso",
  "Electro Ball" => "Bola Voltio",
  "Charge" => "Carga",
  "Eerie Impulse" => "Impulso Misterioso",
  "Electric Terrain" => "Campo Eléctrico",
  "Electrify" => "Electrizar",
  "Ion Deluge" => "Diluvio Iónico",
  "Magnet Rise" => "Levitón",
  "Magnetic Flux" => "Flujo Magnético",
  "Thunder Wave" => "Onda Trueno",
  "Light of Ruin" => "Luz Aniquiladora",
  "Fleur Cannon" => "Floricañón",
  "Misty Explosion" => "Explosión Feérica",
  "Moonblast" => "Rayo Lunar",
  "Play Rough" => "Carantoña",
  "Strange Steam" => "Vapor Extraño",
  "Dazzling Gleam" => "Deslumbrar",
  "Spirit Break" => "Ruptura de Ánimo",
  "Draining Kiss" => "Beso Drenaje",
  "Disarming Voice" => "Voz Cautivadora",
  "Fairy Wind" => "Viento Feérico",
  "Nature's Madness" => "Enfado Natural",
  "Aromatic Mist" => "Bruma Aromática",
  "Baby-Doll Eyes" => "Ojitos Tiernos",
  "Charm" => "Encanto",
  "Crafty Shield" => "Barrera Mágica",
  "Decorate" => "Decoración",
  "Fairy Lock" => "Cepo Feérico",
  "Floral Healing" => "Cura Floral",
  "Flower Shield" => "Escudo Floral",
  "Geomancy" => "Geocontrol",
  "Misty Terrain" => "Campo de Niebla",
}

DESCS = {
  "Using its tough and impressive horn, the user rams into the target with no letup." =>
    "Usando su cuerno impresionante y resistente, el usuario embiste sin descanso al objetivo.",
  "The user calls out its underlings to pummel the target. Critical hits land more easily." =>
    "El usuario llama a sus subordinados para golpear al objetivo. Los golpes críticos son más probables.",
  "The user vibrates its wings to generate a damaging sound wave. It may also lower the target's Sp. Def stat." =>
    "El usuario vibra sus alas para generar una onda sonora dañina. También puede bajar el Ataque Especial del objetivo.",
  "Although this move has great power, it only works the first turn the user is in battle." =>
    "Aunque este movimiento tiene mucho poder, solo funciona el primer turno en que el usuario está en el combate.",
  "Fires an exploding pollen puff at enemies, or a HP-restoring one at allies." =>
    "Dispara una bomba de polen explosiva a los enemigos, o una que restaura PS a los aliados.",
  "The user drains the target's blood. The user's HP is restored by half the damage taken by the target." =>
    "El usuario drena la sangre del objetivo. Los PS del usuario se restauran a la mitad del daño infligido.",
  "The user makes a lunge at the target, attacking with full force. This lowers the target's Attack stat." =>
    "El usuario se lanza contra el objetivo, atacando con toda su fuerza. Esto baja el Ataque del objetivo.",
  "The user slashes at the foe by crossing its scythes or claws as if they were a pair of scissors." =>
    "El usuario ataca al rival cruzando sus guadañas o garras como si fueran tijeras.",
  "The user attacks with a sinister beam of light. It may also confuse the target." =>
    "El usuario ataca con un siniestro haz de luz. También puede confundir al objetivo.",
  "The user skitters behind the target to attack. This also lowers the target's Sp. Atk stat." =>
    "El usuario se desliza detrás del objetivo para atacar. Esto también baja su Ataque Especial.",
  "After making its attack, the user rushes back to switch places with a party Pokémon in waiting." =>
    "Tras atacar, el usuario regresa a toda prisa para cambiar de lugar con un Pokémon en espera.",
  "The user crushes its foes by rolling over them. This attack may make the target flinch." =>
    "El usuario aplasta a sus rivales rodando sobre ellos. Este ataque puede hacer que el objetivo se amedrente.",
  "The user bites the target. If the target is holding a Berry, the user eats it and gains its effect." =>
    "El usuario muerde al objetivo. Si el objetivo lleva una baya, el usuario se la come y obtiene su efecto.",
  "The foe is attacked with powdery scales blown by wind. It may also raise all the user's stats." =>
    "El rival es atacado con escamas de polvo arrastradas por el viento. También puede subir todas las estadísticas del usuario.",
  "When the user knocks out a target with this move, the user's Attack stat rises drastically." =>
    "Cuando el usuario deja fuera de combate a un objetivo con este movimiento, su Ataque sube drásticamente.",
  "While resisting, the user attacks the opposing Pokémon. The targets' Sp. Atk stat is reduced." =>
    "Resistiendo, el usuario ataca a los Pokémon rivales. Se reduce el Ataque Especial de los objetivos.",
  "The target is slashed with scythes or claws. Its power increases if it hits in succession." =>
    "El objetivo es cortado con guadañas o garras. Su poder aumenta si golpea sucesivamente.",
  "Sharp spikes are shot at the target in rapid succession. They hit two to five times in a row." =>
    "Se disparan púas afiladas contra el objetivo en rápida sucesión. Golpean de dos a cinco veces seguidas.",
  "The foe is stabbed twice by a pair of stingers. It may also poison the target." =>
    "El rival es apuñalado dos veces por un par de aguijones. También puede envenenar al objetivo.",
  "The target is infested and unable to flee for four to five turns." =>
    "El objetivo queda infestado e incapaz de huir durante cuatro o cinco turnos.",
  "The user calls out its underlings to shield its body, raising its Defense and Sp. Def stats." =>
    "El usuario llama a sus subordinados para proteger su cuerpo, subiendo su Defensa y Defensa Especial.",
  "The user calls out its underlings to heal it. The user regains up to half of its max HP." =>
    "El usuario llama a sus subordinados para curarlo. Recupera hasta la mitad de sus PS máximos.",
  "The target is covered in a powder that explodes and damages it if it uses a Fire-type move." =>
    "El objetivo queda cubierto de un polvo que explota y lo daña si usa un movimiento de tipo Fuego.",
  "The user performs a beautiful dance. It boosts the user's Sp. Atk, Sp. Def, and Speed stats." =>
    "El usuario ejecuta una hermosa danza. Sube su Ataque Especial, Defensa Especial y Velocidad.",
  "The user scatters irritating powder to draw attention to itself. Opponents aim only at the user." =>
    "El usuario esparce un polvo irritante para llamar la atención. Los rivales solo apuntan al usuario.",
  "The user ensnares the target with thin, gooey silk so it can't flee from battle." =>
    "El usuario atrapa al objetivo con una fina seda pegajosa para que no pueda huir del combate.",
  "Weaves a sticky net around the opposing team, which lowers their Speed stats upon switching in." =>
    "Teje una red pegajosa alrededor del equipo rival, que baja su Velocidad al entrar en combate.",
  "The foe is bound with silk blown from the user's mouth. This silk reduces the target's Speed." =>
    "El rival queda atado con seda que sopla el usuario por la boca. Esta seda reduce la Velocidad del objetivo.",
  "The user stares at flashing lights to focus its mind, drastically raising its Sp. Atk stat." =>
    "El usuario mira luces parpadeantes para concentrar su mente, subiendo drásticamente su Ataque Especial.",
  "Unleashes a barrage of multi-arm attacks, skipping protections. The user's Defense stat falls." =>
    "Desata una lluvia de ataques con múltiples brazos, ignorando las protecciones. Baja la Defensa del usuario.",
  "The user turns the foe's power against it. It does more damage the higher the target's Attack stat." =>
    "El usuario vuelve el poder del rival contra él. Hace más daño cuanto mayor sea el Ataque del objetivo.",
  "The user transforms its wrath into a fire-like aura to attack. This may also make foes flinch." =>
    "El usuario transforma su ira en un aura ígnea para atacar. También puede hacer que los rivales se amedrenten.",
  "The user swings both arms and hits the target. Ignores the target's stat changes." =>
    "El usuario balancea ambos brazos y golpea al objetivo. Ignora los cambios de estadísticas del objetivo.",
  "The user lets loose a pitch-black shock wave at its target. It may also lower the target's accuracy." =>
    "El usuario libera una onda expansiva completamente oscura contra su objetivo. También puede bajar su precisión.",
  "The user crunches up the target with sharp fangs. It may also lower the target's Defense stat." =>
    "El usuario tritura al objetivo con colmillos afilados. También puede bajar su Defensa.",
  "The user releases a horrible aura imbued with dark thoughts. It may also make the target flinch." =>
    "El usuario libera un aura horrible imbuida de pensamientos oscuros. También puede hacer que el objetivo se amedrente.",
  "The user pretends to bow its head, but then it stabs the target with its disheveled hair. Never misses." =>
    "El usuario finge inclinar la cabeza, pero luego apuñala al objetivo con su cabello despeinado. Nunca falla.",
  "This move prevents the user and the target from switching out until either of them faints." =>
    "Este movimiento impide que el usuario y el objetivo cambien de Pokémon hasta que uno de los dos quede fuera de combate.",
  "The user attacks the target's throat. The target cannot use sound-based moves for two turns." =>
    "El usuario ataca la garganta del objetivo. No puede usar movimientos de sonido durante dos turnos.",
  "Strikes with a fierce blow through mastery of the Dark style. Always results in a critical hit." =>
    "Golpea con un golpe feroz mediante el dominio del estilo Siniestro. Siempre resulta en un golpe crítico.",
  "The user lashes out to vent its frustration. Power is doubled if its stats dropped this turn." =>
    "El usuario arremete para desahogar su frustración. El poder se duplica si sus estadísticas bajaron este turno.",
  "The user slashes the target the instant an opportunity arises. Critical hits land more easily." =>
    "El usuario corta al objetivo en el instante en que surge una oportunidad. Los golpes críticos son más probables.",
  "This move enables the user to attack first. It fails if the target is not readying an attack, however." =>
    "Este movimiento permite al usuario atacar primero. Sin embargo, falla si el objetivo no se prepara para atacar.",
  "The user slaps down the target's held item, preventing that item from being used in the battle." =>
    "El usuario derriba el objeto que lleva el objetivo, impidiendo que se use durante el combate.",
  "If the target has already taken some damage in the same turn, this attack's power is doubled." =>
    "Si el objetivo ya recibió daño en el mismo turno, el poder de este ataque se duplica.",
  "The target is bitten with viciously sharp fangs. It may make the target flinch." =>
    "El objetivo es mordido con colmillos ferozmente afilados. Puede hacer que se amedrente.",
  "The user swings its body around violently to inflict damage on everything in its vicinity." =>
    "El usuario mueve su cuerpo violentamente para infligir daño a todo lo que lo rodea.",
  "The user draws up to the foe disarmingly, then throws a sucker punch. It hits without fail." =>
    "El usuario se acerca al rival de forma desarmante, y luego lanza un golpe sorpresa. Nunca falla.",
  "The user attacks and steals the foe's held item simultaneously. It can't steal if the user holds an item." =>
    "El usuario ataca y roba el objeto del rival al mismo tiempo. No puede robar si el usuario ya lleva un objeto.",
  "The user yells as if it is ranting about something, making the target's Sp. Atk stat decrease." =>
    "El usuario grita como si estuviera protestando por algo, haciendo bajar el Ataque Especial del objetivo.",
  "If the user moves after the target, this attack's power will be doubled." =>
    "Si el usuario actúa después del objetivo, el poder de este ataque se duplica.",
  "An attack move that inflicts double damage if used on a target that is switching out of battle." =>
    "Un ataque que inflige el doble de daño si se usa sobre un objetivo que se retira del combate.",
  "The user gets all the party Pokémon to attack the foe. The more party Pokémon, the more damage." =>
    "El usuario hace que todos los Pokémon del equipo ataquen al rival. Cuantos más haya, más daño causa.",
  "The user flings its held item at the target to attack. Its power and effects depend on the item." =>
    "El usuario lanza su objeto contra el objetivo para atacar. Su poder y efectos dependen del objeto.",
  "The user boasts of its strength. Power increases the more the user's stats are raised." =>
    "El usuario alardea de su fuerza. El poder aumenta cuanto más se hayan subido sus estadísticas.",
  "This attack's power increases the more the target has powered up with stat changes." =>
    "El poder de este ataque aumenta cuanto más se haya potenciado el objetivo con cambios de estadísticas.",
  "Opposing Pokémon are dragged into a world of total darkness that makes them sleep." =>
    "Los Pokémon rivales son arrastrados a un mundo de oscuridad total que los hace dormir.",
  "It prevents the target from using its held item. Its Trainer is also prevented from using items on it." =>
    "Impide que el objetivo use su objeto. Su entrenador tampoco puede usar objetos sobre él.",
  "The user feigns crying to fluster the target, harshly lowering its Sp. Def stat." =>
    "El usuario finge llorar para desconcertar al objetivo, bajando severamente su Defensa Especial.",
  "Flattery is used to confuse the target. However, it also raises the target's Sp. Atk stat." =>
    "Se usa la adulación para confundir al objetivo. Sin embargo, también sube su Ataque Especial.",
  "The user sharpens its claws to boost its Attack stat and accuracy." =>
    "El usuario afila sus garras para subir su Ataque y precisión.",
  "The user faints when using this move. In return, it harshly lowers the target's Attack and Sp. Atk." =>
    "El usuario queda fuera de combate al usar este movimiento. A cambio, baja severamente el Ataque y Ataque Especial del objetivo.",
  "The user stimulates its brain by thinking bad thoughts. It sharply raises the user's Sp. Atk." =>
    "El usuario estimula su cerebro pensando cosas malas. Sube considerablemente su Ataque Especial.",
  "The user protects itself from all attacks. Direct contact lowers the attacker's Defense." =>
    "El usuario se protege de todos los ataques. El contacto directo baja la Defensa del atacante.",
  "With a parting threat, the user lowers the target's Attack and Sp. Atk stats. Then it switches out." =>
    "Con una amenaza de despedida, el usuario baja el Ataque y Ataque Especial del objetivo. Luego cambia de Pokémon.",
  "The user suppresses the target and makes its move go last." =>
    "El usuario suprime al objetivo y hace que su movimiento actúe en último lugar.",
  "The user steals the effects of any healing or stat-changing move the foe attempts to use." =>
    "El usuario roba los efectos de cualquier movimiento de curación o cambio de estadísticas que el rival intente usar.",
  "The user trades held items with the target faster than the eye can follow." =>
    "El usuario intercambia objetos con el objetivo más rápido de lo que el ojo puede seguir.",
  "The target is taunted into a rage that allows it to use only attack moves for three turns." =>
    "El objetivo es provocado a la ira, lo que le permite usar solo movimientos de ataque durante tres turnos.",
  "All stat changes affecting the target turn topsy-turvy and become the opposite of what they were." =>
    "Todos los cambios de estadísticas que afectan al objetivo se invierten y se vuelven lo opuesto.",
  "The user torments and enrages the foe, making it incapable of using the same move twice in a row." =>
    "El usuario atormenta y enfurece al rival, haciendo que no pueda usar el mismo movimiento dos veces seguidas.",
  "This is Eternatus's most powerful attack in its original form. The user can't move on the next turn." =>
    "Este es el ataque más poderoso de Eternatus en su forma original. El usuario no puede moverse en el siguiente turno.",
  "Converts life-force into power to attack. The lower the user's HP, the lower the move's power." =>
    "Convierte la fuerza vital en poder para atacar. Cuanto más bajos estén los PS del usuario, menor será el poder.",
  "The user blasts the target with power that distorts even time. The user must rest on the next turn." =>
    "El usuario ataca al objetivo con un poder que distorsiona hasta el tiempo. Debe descansar el siguiente turno.",
  "Comets are summoned down from the sky. The attack's recoil harshly reduces the user's Sp. Atk stat." =>
    "Se invocan cometas desde el cielo. El retroceso del ataque reduce severamente el Ataque Especial del usuario.",
  "The user rampages and attacks for two to three turns. It then becomes confused, however." =>
    "El usuario se descontrola y ataca durante dos o tres turnos. Sin embargo, después queda confundido.",
  "The user rubs its scales and makes a huge noise. Also lowers the user's Defense stat." =>
    "El usuario frota sus escamas y hace un ruido enorme. También baja su propia Defensa.",
  "If the target has already moved this turn, the effect of its Ability is negated." =>
    "Si el objetivo ya actuó este turno, se anula el efecto de su habilidad.",
  "The user tackles the foe while exhibiting overwhelming menace. It may also make the target flinch." =>
    "El usuario embiste al rival mostrando una amenaza abrumadora. También puede hacer que se amedrente.",
  "The user unleashes a strong beam from its core." => "El usuario desata un potente rayo desde su núcleo.",
  "The user tears the target along with the space around it. Critical hits land more easily." =>
    "El usuario desgarra al objetivo junto con el espacio que lo rodea. Los golpes críticos son más probables.",
  "The user uses its body like a hammer to attack the target and inflict damage." =>
    "El usuario usa su cuerpo como un martillo para atacar al objetivo e infligir daño.",
  "The target is attacked with a shock wave generated by the user's gaping mouth." =>
    "El objetivo es atacado con una onda expansiva generada por la boca abierta del usuario.",
  "The user slashes the target with huge, sharp claws." => "El usuario corta al objetivo con enormes garras afiladas.",
  "The user swings its tough tail wildly and attacks all foes. This also lowers their Attack stats." =>
    "El usuario agita su resistente cola salvajemente y ataca a todos los rivales. Esto también baja su Ataque.",
  "The user exhales a mighty gust that inflicts damage. It may also leave the target with paralysis." =>
    "El usuario exhala una poderosa ráfaga que causa daño. También puede dejar al objetivo paralizado.",
  "The user knocks away the target and drags out another Pokémon in its party. In the wild, the battle ends." =>
    "El usuario aparta al objetivo y saca a otro Pokémon de su equipo. En estado salvaje, el combate termina.",
  "The user attacks twice using Dreepy. If there are two targets, this move hits each one once." =>
    "El usuario ataca dos veces usando a Dreepy. Si hay dos objetivos, este movimiento golpea a cada uno una vez.",
  "The user attacks its target by hitting it with brutal strikes. The target is hit twice in a row." =>
    "El usuario ataca a su objetivo con golpes brutales. El objetivo recibe dos golpes seguidos.",
  "The user whips up a vicious tornado to tear at the opposing team. It may also make targets flinch." =>
    "El usuario forma un tornado feroz para desgarrar al equipo rival. También puede hacer que los objetivos se amedrenten.",
  "Attacks by shooting scales two to five times in a row. Boosts the user's Speed but lowers its Defense." =>
    "Ataca disparando escamas de dos a cinco veces seguidas. Sube la Velocidad del usuario pero baja su Defensa.",
  "This attack hits the target with a shock wave of pure rage. This attack always inflicts 40 HP damage." =>
    "Este ataque golpea al objetivo con una onda expansiva de pura ira. Siempre inflige 40 PS de daño.",
  "The user raises all its stats by using some of its HP." =>
    "El usuario sube todas sus estadísticas usando parte de sus PS.",
  "The user vigorously performs a mystic, powerful dance that boosts its Attack and Speed stats." =>
    "El usuario ejecuta con vigor una danza mística y poderosa que sube su Ataque y Velocidad.",
  "The user charges at its foe, surrounding itself with lightning. It may also leave the target paralyzed." =>
    "El usuario carga contra su rival, rodeándose de rayos. También puede dejarlo paralizado.",
  "The user electrifies itself, then charges at the foe. It causes considerable damage to the user as well." =>
    "El usuario se electrifica y luego carga contra el rival. También causa un daño considerable al usuario.",
  "The user fires an electric blast like a cannon to inflict damage and cause paralysis." =>
    "El usuario dispara una descarga eléctrica como un cañón para infligir daño y causar parálisis.",
  "Morpeko attacks and raises its Speed with energy stored in its cheeks. Type changes with the user's form." =>
    "Morpeko ataca y sube su Velocidad con la energía almacenada en sus mejillas. El tipo cambia según su forma.",
  "A wicked thunderbolt is dropped on the foe to inflict damage. It may also leave the target paralyzed." =>
    "Se deja caer un rayo maligno sobre el rival para infligir daño. También puede dejarlo paralizado.",
  "The user throws down a giant thunderbolt. It does more damage if influenced by an enormous flame." =>
    "El usuario lanza un rayo gigante. Causa más daño si está influenciado por una llama enorme.",
  "The user attacks with electrically charged fists. Normal-type moves become Electric-type." =>
    "El usuario ataca con puños cargados de electricidad. Los movimientos de tipo Normal se vuelven de tipo Eléctrico.",
  "A strong electric blast is loosed at the target. It may also leave the target with paralysis." =>
    "Se libera una fuerte descarga eléctrica contra el objetivo. También puede dejarlo paralizado.",
  "The user shrouds itself in electricity and smashes into its foe. It also damages the user a little." =>
    "El usuario se envuelve en electricidad y se estrella contra su rival. También le causa algo de daño al usuario.",
  "Stabs the target with an electrified beak. Power is doubled if the user attacks first." =>
    "Apuñala al objetivo con un pico electrificado. El poder se duplica si el usuario ataca primero.",
  "A flare of electricity is loosed to strike the area around the user. It may also cause paralysis." =>
    "Se libera una descarga eléctrica que golpea el área alrededor del usuario. También puede causar parálisis.",
  "The user attacks all foes by twanging a guitar or bass guitar, causing a huge echo and strong vibration." =>
    "El usuario ataca a todos los rivales tocando una guitarra o bajo, provocando un gran eco y una fuerte vibración.",
  "The user traps the target in a cage of sparking electricity for four to five turns." =>
    "El usuario atrapa al objetivo en una jaula de electricidad chispeante durante cuatro o cinco turnos.",
  "A strong electric blast crashes down on the target. This may also make the target flinch." =>
    "Una fuerte descarga eléctrica cae sobre el objetivo. También puede hacer que se amedrente.",
  "The target is punched with an electrified fist. It may also leave the target with paralysis." =>
    "El objetivo recibe un puñetazo electrificado. También puede dejarlo paralizado.",
  "The user attacks with electric voltage rising from the ground. Power is doubled on Electric Terrain." =>
    "El usuario ataca con voltaje eléctrico que surge del suelo. El poder se duplica en Campo Eléctrico.",
  "The user attacks everything around it. The user's HP is restored by half the damage dealt." =>
    "El usuario ataca todo lo que lo rodea. Sus PS se restauran a la mitad del daño causado.",
  "The user throws an electrically charged tackle at the target. It may also leave the target with paralysis." =>
    "El usuario lanza un placaje cargado de electricidad contra el objetivo. También puede dejarlo paralizado.",
  "The user bites with electrified fangs. It may also make the target flinch or leave it with paralysis." =>
    "El usuario muerde con colmillos electrificados. También puede hacer que se amedrente o quede paralizado.",
  "The user strikes the target with a quick jolt of electricity. This attack cannot be evaded." =>
    "El usuario golpea al objetivo con una rápida descarga eléctrica. Este ataque no puede esquivarse.",
  "The user captures and attacks foes by using an electric net, which lowers their Speed stat." =>
    "El usuario captura y ataca a los rivales con una red eléctrica, que baja su Velocidad.",
  "The user fires a concentrated bundle of electricity. It may also raise the user's Sp. Atk stat." =>
    "El usuario dispara un haz concentrado de electricidad. También puede subir su propio Ataque Especial.",
  "A jolt of electricity is hurled at the foe to inflict damage. It may also leave the target with paralysis." =>
    "Se lanza una descarga eléctrica contra el rival para infligir daño. También puede dejarlo paralizado.",
  "The user nuzzles its electrified cheeks against the target. This also leaves the target with paralysis." =>
    "El usuario frota sus mejillas electrificadas contra el objetivo. Esto también lo deja paralizado.",
  "The user hurls an electric orb at the foe. It does more damage the faster the user is." =>
    "El usuario lanza una esfera eléctrica contra el rival. Causa más daño cuanto más rápido sea el usuario.",
  "The user boosts the power of the Electric move it uses next. It also raises the user's Sp. Def stat." =>
    "El usuario potencia el próximo movimiento de tipo Eléctrico que use. También sube su Defensa Especial.",
  "The user's body generates an eerie impulse. Harshly lowers the target's Sp. Atk stat." =>
    "El cuerpo del usuario genera un impulso misterioso. Baja severamente el Ataque Especial del objetivo.",
  "The user electrifies the ground for five turns. Pokémon on the ground no longer fall asleep." =>
    "El usuario electrifica el suelo durante cinco turnos. Los Pokémon en tierra ya no pueden quedarse dormidos.",
  "If the target uses a move after being electrified, that move becomes Electric-type." =>
    "Si el objetivo usa un movimiento tras ser electrificado, ese movimiento se vuelve de tipo Eléctrico.",
  "The user disperses electrically charged particles. Normal-type moves become Electric-type." =>
    "El usuario dispersa partículas cargadas de electricidad. Los movimientos de tipo Normal se vuelven de tipo Eléctrico.",
  "The user levitates using electrically generated magnetism for five turns." =>
    "El usuario levita usando magnetismo generado eléctricamente durante cinco turnos.",
  "Manipulates magnetic fields to raise the Defense and Sp. Def stats of allies with Plus or Minus Abilities." =>
    "Manipula campos magnéticos para subir la Defensa y Defensa Especial de aliados con las habilidades Más o Menos.",
  "A weak electric charge is launched at the target. It causes paralysis if it hits." =>
    "Se lanza una débil carga eléctrica contra el objetivo. Causa parálisis si golpea.",
  "Fires a powerful beam of light drawn from the Eternal Flower. It also damages the user a lot." =>
    "Dispara un poderoso haz de luz extraído de la Flor Eterna. También causa mucho daño al usuario.",
  "The user unleashes a strong beam. The attack's recoil harshly lowers the user's Sp. Atk stat." =>
    "El usuario desata un potente rayo. El retroceso del ataque baja severamente su propio Ataque Especial.",
  "The user attacks everything around and faints upon using this move. Power increases on Misty Terrain." =>
    "El usuario ataca todo a su alrededor y queda fuera de combate al usar este movimiento. El poder aumenta en Campo de Niebla.",
  "The user attacks by borrowing the power of the moon. This may also lower the target's Sp. Atk stat." =>
    "El usuario ataca tomando prestado el poder de la luna. También puede bajar el Ataque Especial del objetivo.",
  "The user plays rough with the target and attacks it. This may also lower the target's Attack stat." =>
    "El usuario juega bruscamente con el objetivo y lo ataca. También puede bajar su Ataque.",
  "The user attacks the target by emitting steam. This may also confuse the target." =>
    "El usuario ataca al objetivo emitiendo vapor. También puede confundirlo.",
  "The user damages opposing Pokémon by emitting a powerful flash." =>
    "El usuario daña a los Pokémon rivales emitiendo un destello poderoso.",
  "The user attacks the target with immense force. This also lowers the target's Sp. Atk stat." =>
    "El usuario ataca al objetivo con una fuerza inmensa. Esto también baja su Ataque Especial.",
  "The user steals the target's HP with a kiss. The user's HP is restored by over half of the damage dealt." =>
    "El usuario le roba PS al objetivo con un beso. Sus propios PS se restauran más de la mitad del daño causado.",
  "Letting out a charming cry, the user does emotional damage to foes. This attack never misses." =>
    "Soltando un grito encantador, el usuario causa daño emocional a los rivales. Este ataque nunca falla.",
  "The user stirs up a fairy wind and strikes the target with it." =>
    "El usuario agita un viento feérico y golpea al objetivo con él.",
  "The user hits the target with the force of nature. It halves the target's HP." =>
    "El usuario golpea al objetivo con la fuerza de la naturaleza. Reduce a la mitad los PS del objetivo.",
  "The user raises the Sp. Def stat of an ally Pokémon by using a mysterious aroma." =>
    "El usuario sube la Defensa Especial de un Pokémon aliado usando un aroma misterioso.",
  "The user stares with its baby-doll eyes, which lowers the target's Attack stat. Always goes first." =>
    "El usuario mira con sus ojos de muñeca, lo que baja el Ataque del objetivo. Siempre actúa primero.",
  "The user charmingly gazes at the foe, making it less wary. The target's Attack is harshly lowered." =>
    "El usuario mira encantadoramente al rival, haciéndolo bajar la guardia. Su Ataque se reduce severamente.",
  "The user protects itself and its allies from status moves with a mysterious power." =>
    "El usuario se protege a sí mismo y a sus aliados de movimientos de estado con un poder misterioso.",
  "The user sharply raises the target's Attack and Sp. Atk stats by decorating the target." =>
    "El usuario sube considerablemente el Ataque y Ataque Especial del objetivo decorándolo.",
  "By locking down the battlefield, the user keeps all Pokémon from fleeing during the next turn." =>
    "Al bloquear el campo de batalla, el usuario impide que todos los Pokémon huyan durante el siguiente turno.",
  "The user restores the target's HP by up to half of its max HP. It restores more HP when the terrain is grass." =>
    "El usuario restaura hasta la mitad de los PS máximos del objetivo. Restaura más PS si el terreno es de hierba.",
  "The user raises the Defense stats of all Grass-type Pokémon in battle with a mysterious power." =>
    "El usuario sube la Defensa de todos los Pokémon de tipo Planta en combate con un poder misterioso.",
  "The user absorbs energy and sharply raises its Sp. Atk, Sp. Def, and Speed stats on the next turn." =>
    "El usuario absorbe energía y sube considerablemente su Ataque Especial, Defensa Especial y Velocidad en el siguiente turno.",
  "The user covers the ground with mist for five turns. Grounded Pokémon can't gain status conditions." =>
    "El usuario cubre el suelo de niebla durante cinco turnos. Los Pokémon en tierra no pueden sufrir problemas de estado.",
}

apply_moves_dict(5, NAMES)
apply_moves_dict(6, DESCS)
