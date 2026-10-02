# encoding: UTF-8
require_relative "apply_moves_common"

NAMES = {
  "Moonlight" => "Luz Lunar",
  "Sweet Kiss" => "Beso Dulce",
  "Focus Punch" => "Puño Certero",
  "Meteor Assault" => "Asalto Meteorito",
  "High Jump Kick" => "Ataque Salto Alto",
  "Close Combat" => "Golpe Cercano",
  "Focus Blast" => "Onda Certera",
  "Superpower" => "Fuerza Bruta",
  "Cross Chop" => "Golpe Kárate Cruzado",
  "Dynamic Punch" => "Puño Dínamo",
  "Flying Press" => "Plancha Voladora",
  "Hammer Arm" => "Brazo Martillo",
  "Jump Kick" => "Patada Salto",
  "Sacred Sword" => "Espada Santa",
  "Thunderous Kick" => "Patada Atronadora",
  "Secret Sword" => "Espada Secreta",
  "Sky Uppercut" => "Gancho Alto",
  "Aura Sphere" => "Esfera Aural",
  "Body Press" => "Golpe de Cuerpo",
  "Submission" => "Sumisión",
  "Brick Break" => "Golpe Kárate",
  "Drain Punch" => "Puño Drenaje",
  "Vital Throw" => "Tiro Vital",
  "Wake-Up Slap" => "Bofetón Despertador",
  "Low Sweep" => "Golpe Bajo",
  "Circle Throw" => "Lanzamiento Circular",
  "Force Palm" => "Palma Fuerza",
  "Revenge" => "Venganza",
  "Rolling Kick" => "Patada Giratoria",
  "Storm Throw" => "Golpe Tormenta",
  "Karate Chop" => "Golpe Kárate",
  "Mach Punch" => "Puño Mach",
  "Power-Up Punch" => "Golpe Envión",
  "Rock Smash" => "Golpe Roca",
  "Vacuum Wave" => "Onda Vacío",
  "Double Kick" => "Doble Patada",
  "Arm Thrust" => "Golpes Furia",
  "Triple Kick" => "Triple Patada",
  "Counter" => "Contraataque",
  "Final Gambit" => "Envite Final",
  "Low Kick" => "Patada Baja",
  "Reversal" => "Inversión",
  "Seismic Toss" => "Movimiento Sísmico",
  "Bulk Up" => "Corpulencia",
  "Coaching" => "Amaestrar",
  "Detect" => "Detección",
  "Mat Block" => "Bloqueo",
  "No Retreat" => "Sin Escapatoria",
  "Octolock" => "Pulpo Presa",
  "Quick Guard" => "Anticipo",
  "V-create" => "V Creación",
  "Blast Burn" => "Anillo Ígneo",
  "Eruption" => "Erupción",
  "Mind Blown" => "Cabeza Explosiva",
  "Shell Trap" => "Trampa Concha",
  "Blue Flare" => "Fuego Azul",
  "Burn Up" => "Combustión",
  "Overheat" => "Sofoco",
  "Flare Blitz" => "Envite Ígneo",
  "Pyro Ball" => "Bola Ígnea",
  "Fire Blast" => "Llamarada",
  "Fusion Flare" => "Llama Fusión",
  "Inferno" => "Infierno",
  "Magma Storm" => "Tormenta Volcánica",
  "Sacred Fire" => "Fuego Sagrado",
  "Searing Shot" => "Onda Ígnea",
  "Heat Wave" => "Onda Ígnea",
  "Flamethrower" => "Lanzallamas",
  "Blaze Kick" => "Patada Ígnea",
  "Fiery Dance" => "Baile Ardiente",
  "Fire Lash" => "Látigo Ígneo",
  "Fire Pledge" => "Voto Fuego",
  "Lava Plume" => "Erupción Lava",
  "Fire Punch" => "Puño Fuego",
  "Mystical Fire" => "Fuego Místico",
  "Burning Jealousy" => "Envidia Ardiente",
  "Flame Burst" => "Llamarada Explosiva",
  "Fire Fang" => "Colmillo Ígneo",
  "Flame Wheel" => "Rueda Fuego",
  "Incinerate" => "Incineración",
  "Flame Charge" => "Carga Ígnea",
  "Ember" => "Ascuas",
  "Fire Spin" => "Giro Fuego",
  "Heat Crash" => "Golpe Calor",
  "Sunny Day" => "Día Soleado",
  "Will-O-Wisp" => "Fuego Fatuo",
  "Sky Attack" => "Ataque Aéreo",
  "Brave Bird" => "Pico Taladro Bravo",
  "Dragon Ascent" => "Vuelo de Dragón",
  "Hurricane" => "Vendaval",
  "Aeroblast" => "Aeroembate",
  "Beak Blast" => "Pico Cañón",
  "Fly" => "Vuelo",
  "Bounce" => "Rebote",
  "Drill Peck" => "Pico Taladro",
  "Oblivion Wing" => "Ala del Olvido",
  "Air Slash" => "Ala de Corte",
  "Chatter" => "Cotorreo",
  "Aerial Ace" => "Golpe Aéreo",
  "Air Cutter" => "Corte Aéreo",
  "Pluck" => "Saqueo",
  "Sky Drop" => "Captura",
  "Wing Attack" => "Ataque Ala",
  "Acrobatics" => "Acróbata",
  "Dual Wingbeat" => "Doble Alada",
  "Gust" => "Tornado",
  "Peck" => "Picotazo",
  "Defog" => "Niebla Clara",
  "Feather Dance" => "Baile de Plumas",
  "Mirror Move" => "Mismo Ataque",
  "Roost" => "Respiro",
  "Tailwind" => "Viento Afín",
  "Astral Barrage" => "Andanada Astral",
  "Shadow Force" => "Golpe Umbrío",
  "Poltergeist" => "Poltergeist",
  "Moongeist Beam" => "Rayo Umbrío",
  "Phantom Force" => "Golpe Fantasma",
  "Spectral Thief" => "Ladrón Fantasma",
  "Shadow Bone" => "Hueso Sombra",
  "Shadow Ball" => "Bola Sombra",
  "Spirit Shackle" => "Grillete Espiritual",
  "Shadow Claw" => "Garra Umbría",
  "Hex" => "Infortunio",
  "Ominous Wind" => "Viento Aciago",
  "Shadow Punch" => "Puño Sombra",
  "Shadow Sneak" => "Sombra Vil",
  "Astonish" => "Asombro",
  "Lick" => "Lengüetazo",
  "Night Shade" => "Espectro",
  "Confuse Ray" => "Rayo Confuso",
  "Curse" => "Maldición",
  "Destiny Bond" => "Vínculo Destino",
  "Grudge" => "Rencor",
  "Nightmare" => "Infortunio Onírico",
  "Spite" => "Rencor",
  "Trick-or-Treat" => "Truco o Trato",
  "Frenzy Plant" => "Planta Feroz",
  "Leaf Storm" => "Tormenta de Hojas",
  "Solar Blade" => "Espada Solar",
  "Petal Dance" => "Danza Pétalo",
  "Power Whip" => "Latigazo",
  "Seed Flare" => "Destello Semilla",
  "Solar Beam" => "Rayo Solar",
  "Wood Hammer" => "Martillo Bosque",
  "Energy Ball" => "Energibola",
  "Leaf Blade" => "Hoja Aguda",
  "Petal Blizzard" => "Ventisca de Pétalos",
  "Apple Acid" => "Ácido Manzana",
  "Drum Beating" => "Golpe de Tambor",
  "Grass Pledge" => "Voto Planta",
}

DESCS = {
  "The user restores its own HP. The amount of HP regained varies with the weather." =>
    "El usuario restaura sus propios PS. La cantidad recuperada varía según el clima.",
  "The user kisses the target with a sweet, angelic cuteness that causes confusion." =>
    "El usuario besa al objetivo con una dulce ternura angelical que causa confusión.",
  "The user focuses its mind before launching a punch. It will fail if the user is hit before it is used." =>
    "El usuario concentra su mente antes de lanzar un puñetazo. Falla si el usuario es golpeado antes de usarlo.",
  "The user attacks wildly with its thick leek. The user can't move on the next turn." =>
    "El usuario ataca salvajemente con su grueso puerro. No puede moverse en el siguiente turno.",
  "The target is attacked with a knee kick from a jump. If it misses, the user is hurt instead." =>
    "El objetivo recibe una patada de rodilla desde un salto. Si falla, el usuario se lastima en su lugar.",
  "The user fights the foe up close without guarding itself. It also cuts the user's Defense and Sp. Def." =>
    "El usuario pelea de cerca contra el rival sin protegerse. También reduce su propia Defensa y Defensa Especial.",
  "The user heightens its mental focus and unleashes its power. It may also lower the target's Sp. Def." =>
    "El usuario intensifica su concentración mental y libera su poder. También puede bajar la Defensa Especial del objetivo.",
  "The user attacks the target with great power. However, it also lowers the user's Attack and Defense." =>
    "El usuario ataca al objetivo con gran poder. Sin embargo, también baja su propio Ataque y Defensa.",
  "The user delivers a double chop with its forearms crossed. Critical hits land more easily." =>
    "El usuario asesta un doble golpe con los antebrazos cruzados. Los golpes críticos son más probables.",
  "The user punches the target with full, concentrated power. It confuses the target if it hits." =>
    "El usuario golpea al objetivo con toda su fuerza concentrada. Lo confunde si acierta.",
  "The user dives down onto the target from the sky. This move is Fighting and Flying type simultaneously." =>
    "El usuario se lanza en picada contra el objetivo desde el cielo. Es de tipo Lucha y Volador a la vez.",
  "The user swings and hits with its strong and heavy fist. It lowers the user's Speed, however." =>
    "El usuario balancea y golpea con su puño fuerte y pesado. Sin embargo, baja su propia Velocidad.",
  "The user jumps up high, then strikes with a kick. If the kick misses, the user hurts itself." =>
    "El usuario salta muy alto y luego golpea con una patada. Si falla, se lastima a sí mismo.",
  "The user attacks by slicing with its long horns. The target's stat changes don't affect the damage." =>
    "El usuario ataca cortando con sus largos cuernos. Los cambios de estadísticas del objetivo no afectan el daño.",
  "Overwhelms the target with lightning-like movement, then kicks. Lowers the target's Defense stat." =>
    "Abruma al objetivo con un movimiento veloz como un rayo y luego patea. Baja la Defensa del objetivo.",
  "The user cuts with its long horn. The odd power contained in it does physical damage to the foe." =>
    "El usuario corta con su largo cuerno. El extraño poder que contiene causa daño físico al rival.",
  "The user attacks the target with an uppercut thrown skyward with force." =>
    "El usuario ataca al objetivo con un gancho lanzado con fuerza hacia el cielo.",
  "The user looses a blast of aura power from deep within its body. This move is certain to hit." =>
    "El usuario libera una explosión de poder aural desde lo profundo de su cuerpo. Este movimiento nunca falla.",
  "The user attacks by slamming its body into the target. Power increases the higher the user's Defense is." =>
    "El usuario ataca estrellando su cuerpo contra el objetivo. El poder aumenta cuanto mayor sea su Defensa.",
  "The user grabs the target and recklessly dives for the ground. It also hurts the user slightly." =>
    "El usuario agarra al objetivo y se lanza imprudentemente contra el suelo. También se lastima un poco.",
  "The user attacks with a swift chop. It can also break any barrier such as Light Screen and Reflect." =>
    "El usuario ataca con un golpe veloz. También puede romper barreras como Pantalla de Luz y Reflejo.",
  "An energy-draining punch. The user's HP is restored by half the damage taken by the target." =>
    "Un puñetazo que drena energía. Los PS del usuario se restauran a la mitad del daño infligido.",
  "The user attacks last. In return, this throw move is guaranteed not to miss." =>
    "El usuario ataca en último lugar. A cambio, este lanzamiento nunca falla.",
  "This attack inflicts big damage on a sleeping target. It also wakes the target up, however." =>
    "Este ataque inflige mucho daño a un objetivo dormido. Sin embargo, también lo despierta.",
  "The user attacks the target's legs swiftly, reducing the target's Speed stat." =>
    "El usuario ataca velozmente las piernas del objetivo, reduciendo su Velocidad.",
  "The user throws the target and drags out another Pokémon in its party. In the wild, the battle ends." =>
    "El usuario lanza al objetivo y saca a otro Pokémon de su equipo. En estado salvaje, el combate termina.",
  "The target is attacked with a shock wave. It may also leave the target with paralysis." =>
    "El objetivo recibe una onda expansiva. También puede dejarlo paralizado.",
  "An attack move that inflicts double the damage if the user has been hurt by the foe in the same turn." =>
    "Un ataque que inflige el doble de daño si el usuario fue lastimado por el rival en el mismo turno.",
  "The user lashes out with a quick, spinning kick. It may also make the target flinch." =>
    "El usuario arremete con una rápida patada giratoria. También puede hacer que el objetivo se amedrente.",
  "The user strikes the target with a fierce blow. This attack always results in a critical hit." =>
    "El usuario golpea al objetivo con un golpe feroz. Este ataque siempre resulta en un golpe crítico.",
  "The target is attacked with a sharp chop. Critical hits land more easily." =>
    "El objetivo recibe un golpe afilado. Los golpes críticos son más probables.",
  "The user throws a punch at blinding speed. It is certain to strike first." =>
    "El usuario lanza un puñetazo a una velocidad cegadora. Siempre golpea primero.",
  "Striking opponents repeatedly makes the user's fists harder, raising the user's Attack stat." =>
    "Golpear repetidamente a los rivales endurece los puños del usuario, subiendo su Ataque.",
  "The user attacks with a punch that can shatter a rock. It may also lower the foe's Defense stat." =>
    "El usuario ataca con un puñetazo capaz de hacer añicos una roca. También puede bajar la Defensa del rival.",
  "The user whirls its fists to send a wave of pure vacuum at the target. This move always goes first." =>
    "El usuario gira sus puños para enviar una onda de vacío puro contra el objetivo. Siempre actúa primero.",
  "The target is quickly kicked twice in succession using both feet." =>
    "El objetivo recibe dos rápidas patadas seguidas usando ambos pies.",
  "The user looses a flurry of open-palmed arm thrusts that hit two to five times in a row." =>
    "El usuario libera una ráfaga de golpes de palma abierta que impactan de dos a cinco veces seguidas.",
  "A consecutive three-kick attack that becomes more powerful with each successive hit." =>
    "Un ataque consecutivo de tres patadas que se vuelve más poderoso con cada golpe.",
  "A retaliation move that counters any physical attack, inflicting double the damage taken." =>
    "Un movimiento de represalia que contrarresta cualquier ataque físico, infligiendo el doble del daño recibido.",
  "The user risks all to attack the foe. The user faints but does damage equal to its HP." =>
    "El usuario arriesga todo para atacar al rival. Queda fuera de combate, pero causa un daño igual a sus PS.",
  "A powerful low kick that makes the foe fall over. It inflicts greater damage on heavier foes." =>
    "Una poderosa patada baja que hace caer al rival. Causa más daño cuanto más pesado sea.",
  "An all-out attack that becomes more powerful the less HP the user has." =>
    "Un ataque total que se vuelve más poderoso cuanto menos PS tenga el usuario.",
  "The target is thrown using the power of gravity. It inflicts damage equal to the user's level." =>
    "El objetivo es lanzado usando el poder de la gravedad. Inflige un daño igual al nivel del usuario.",
  "The user tenses its muscles to bulk up its body, boosting both its Attack and Defense stats." =>
    "El usuario tensa sus músculos para fortalecer su cuerpo, subiendo su Ataque y Defensa.",
  "The user properly coaches its ally Pokémon, boosting their Attack and Defense stats." =>
    "El usuario entrena adecuadamente a su Pokémon aliado, subiendo su Ataque y Defensa.",
  "It enables the user to evade all attacks. Its chance of failing rises if it is used in succession." =>
    "Permite al usuario evadir todos los ataques. Su probabilidad de fallar aumenta si se usa seguidas veces.",
  "Using a pulled-up mat as a shield, the user protects itself and its allies from damaging moves." =>
    "Usando una alfombra levantada como escudo, el usuario se protege a sí mismo y a sus aliados de movimientos dañinos.",
  "This move raises all the user's stats but prevents the user from switching out or fleeing." =>
    "Este movimiento sube todas las estadísticas del usuario, pero le impide cambiar de Pokémon o huir.",
  "Locks the target in and prevents it from fleeing. Also lowers the target's Defense and Sp. Def each turn." =>
    "Inmoviliza al objetivo e impide que huya. También baja su Defensa y Defensa Especial cada turno.",
  "The user protects itself and its allies from priority moves. If may fail if used in succession." =>
    "El usuario se protege a sí mismo y a sus aliados de movimientos con prioridad. Puede fallar si se usa seguidas veces.",
  "With a fiery forehead, the user hurls itself at the foe. It lowers the user's Defense, Sp. Def, and Speed." =>
    "Con la frente en llamas, el usuario se lanza contra el rival. Baja su propia Defensa, Defensa Especial y Velocidad.",
  "The target is razed by a fiery explosion. The user must rest on the next turn, however." =>
    "El objetivo es arrasado por una explosión ígnea. Sin embargo, el usuario debe descansar el siguiente turno.",
  "The user attacks in an explosive fury. The lower the user's HP, the less powerful this attack becomes." =>
    "El usuario ataca con furia explosiva. Cuanto más bajos estén sus PS, menos poderoso será este ataque.",
  "The user attacks everything by causing its own head to explode. This also damages the user." =>
    "El usuario ataca todo haciendo explotar su propia cabeza. Esto también lo daña a él mismo.",
  "The user sets a shell trap. If it is hit by a physical move, the trap explodes and hurt the attacker." =>
    "El usuario coloca una trampa concha. Si recibe un movimiento físico, la trampa explota y daña al atacante.",
  "The user attacks by engulfing the foe in a beautiful, yet intense, blue flame. It may also burn the foe." =>
    "El usuario ataca envolviendo al rival en una llama azul hermosa pero intensa. También puede quemarlo.",
  "To inflict massive damage, the user burns itself out. The user will no longer be Fire type." =>
    "Para infligir un daño masivo, el usuario se consume por completo. Deja de ser de tipo Fuego.",
  "The user attacks the target at full power. The attack's recoil sharply reduces the user's Sp. Atk stat." =>
    "El usuario ataca al objetivo a plena potencia. El retroceso reduce considerablemente su propio Ataque Especial.",
  "The user cloaks itself in fire and charges at the foe. The user also takes damage and may burn the target." =>
    "El usuario se envuelve en fuego y carga contra el rival. También recibe daño y puede quemarlo.",
  "Attacks by igniting a small stone and launching it as a fiery ball. May also burn the target." =>
    "Ataca encendiendo una pequeña piedra y lanzándola como una bola de fuego. Puede quemar al objetivo.",
  "The foe is attacked with an intense blast of all-consuming fire. It may also leave the target with a burn." =>
    "El rival recibe una intensa ráfaga de fuego consumidor. También puede dejarlo quemado.",
  "The user brings down a giant flame. It does more damage if influenced by an enormous thunderbolt." =>
    "El usuario hace caer una llama gigante. Causa más daño si está influenciada por un rayo enorme.",
  "The user attacks by engulfing the target in an intense fire. It leaves the target with a burn." =>
    "El usuario ataca envolviendo al objetivo en un fuego intenso. Lo deja quemado.",
  "The target becomes trapped within a maelstrom of fire that rages for four to five turns." =>
    "El objetivo queda atrapado en un torbellino de fuego que arde durante cuatro o cinco turnos.",
  "The target is razed with a mystical fire of great intensity. It may also leave the target with a burn." =>
    "El objetivo es arrasado con un fuego místico de gran intensidad. También puede dejarlo quemado.",
  "An inferno of scarlet flames torches everything around the user. It may leave the foe with a burn." =>
    "Un infierno de llamas escarlata quema todo alrededor del usuario. Puede dejar al rival quemado.",
  "The user attacks by exhaling hot breath on the opposing team. It may also leave targets with a burn." =>
    "El usuario ataca exhalando aliento caliente sobre el equipo rival. También puede dejar quemados a los objetivos.",
  "The target is scorched with an intense blast of fire. It may also leave the target with a burn." =>
    "El objetivo es abrasado con una intensa ráfaga de fuego. También puede dejarlo quemado.",
  "The user launches a kick with a high critical-hit ratio. It may also leave the target with a burn." =>
    "El usuario lanza una patada con una alta probabilidad de golpe crítico. También puede dejar quemado al objetivo.",
  "Cloaked in flames, the user dances and flaps its wings. It may also raise the user's Sp. Atk stat." =>
    "Envuelto en llamas, el usuario danza y bate sus alas. También puede subir su propio Ataque Especial.",
  "The user strikes the target with a burning lash. This also lowers the target's Defense stat." =>
    "El usuario golpea al objetivo con un latigazo ardiente. Esto también baja su Defensa.",
  "A column of fire hits opposing Pokémon. When used with its Grass equivalent, it makes a sea of fire." =>
    "Una columna de fuego golpea a los Pokémon rivales. Usado junto a su equivalente de Planta, crea un mar de fuego.",
  "An inferno of scarlet flames torches everything around the user. It may leave targets with a burn." =>
    "Un infierno de llamas escarlata quema todo alrededor del usuario. Puede dejar quemados a los objetivos.",
  "The target is punched with a fiery fist. It may leave the target with a burn." =>
    "El objetivo recibe un puñetazo ardiente. Puede dejarlo quemado.",
  "The user attacks by breathing a special, hot fire. This also lowers the target's Sp. Atk stat." =>
    "El usuario ataca exhalando un fuego especial y caliente. Esto también baja el Ataque Especial del objetivo.",
  "The user attacks with energy from jealousy. This burns all foes that had their stats boosted this turn." =>
    "El usuario ataca con energía nacida de la envidia. Quema a todos los rivales que subieron sus estadísticas este turno.",
  "The user attacks the foe with a bursting flame. It also damages Pokémon next to the target." =>
    "El usuario ataca al rival con una llama que estalla. También daña a los Pokémon junto al objetivo.",
  "The user bites with flame-cloaked fangs. It may also make the target flinch or leave it burned." =>
    "El usuario muerde con colmillos envueltos en llamas. También puede hacer que se amedrente o quede quemado.",
  "The user cloaks itself in fire and charges at the target. It may also leave the target with a burn." =>
    "El usuario se envuelve en fuego y carga contra el objetivo. También puede dejarlo quemado.",
  "The user attacks the foe with fire. The target's held Berry becomes burnt up and unusable." =>
    "El usuario ataca al rival con fuego. La baya que lleva el objetivo se quema y queda inutilizable.",
  "The user cloaks itself in flame and attacks. Building up more power, it raises the user's Speed stat." =>
    "El usuario se envuelve en llamas y ataca. Al acumular más poder, sube su propia Velocidad.",
  "The target is attacked with small flames. It may also leave the target with a burn." =>
    "El objetivo recibe pequeñas llamas. También puede dejarlo quemado.",
  "The target becomes trapped within a fierce vortex of fire that rages for four to five turns." =>
    "El objetivo queda atrapado en un feroz vórtice de fuego que arde durante cuatro o cinco turnos.",
  "The user slams the foe with its flaming body. The heavier the user is, the greater the damage." =>
    "El usuario golpea al rival con su cuerpo en llamas. Cuanto más pesado sea el usuario, mayor será el daño.",
  "The user intensifies the sun for five turns, powering up Fire-type moves." =>
    "El usuario intensifica el sol durante cinco turnos, potenciando los movimientos de tipo Fuego.",
  "The user shoots a sinister, bluish-white flame at the target to inflict a burn." =>
    "El usuario dispara una siniestra llama blanquiazul contra el objetivo para causarle una quemadura.",
  "A second-turn attack move where critical hits land more easily. It may also make the target flinch." =>
    "Un ataque de dos turnos donde los golpes críticos son más probables. También puede hacer que el objetivo se amedrente.",
  "The user tucks in its wings and charges from a low altitude. The user also takes serious damage." =>
    "El usuario recoge sus alas y carga desde baja altitud. También sufre un daño considerable.",
  "The user soars upward and drops at high speeds. Its Defense and Sp. Def stats are lowered." =>
    "El usuario se eleva y desciende a gran velocidad. Su Defensa y Defensa Especial bajan.",
  "The user wraps its foe in a fierce wind that flies up into the sky. It may also confuse the foe." =>
    "El usuario envuelve al rival en un viento feroz que se eleva hacia el cielo. También puede confundirlo.",
  "A vortex of air is shot at the target to inflict damage. Critical hits land more easily." =>
    "Se dispara un vórtice de aire contra el objetivo para infligir daño. Los golpes críticos son más probables.",
  "The user heats up its beak before attacking. Making contact in this time results in a burn." =>
    "El usuario calienta su pico antes de atacar. El contacto durante ese momento causa una quemadura.",
  "The user soars, then strikes on the second turn. It can also be used for flying to any familiar town." =>
    "El usuario se eleva y golpea en el segundo turno. También puede usarse para volar a cualquier pueblo conocido.",
  "The user bounces up high, then drops on the foe on the second turn. It may also paralyze the foe." =>
    "El usuario rebota muy alto y luego cae sobre el rival en el segundo turno. También puede paralizarlo.",
  "A corkscrewing attack with the sharp beak acting as a drill." =>
    "Un ataque en espiral con el pico afilado actuando como un taladro.",
  "The user absorbs its target's HP. The user's HP is restored by over half of the damage dealt." =>
    "El usuario absorbe los PS de su objetivo. Sus propios PS se restauran más de la mitad del daño causado.",
  "The user attacks with a blade of air that slices even the sky. It may also make the target flinch." =>
    "El usuario ataca con una hoja de aire que corta hasta el cielo. También puede hacer que el objetivo se amedrente.",
  "The user attacks using a sound wave based on words it has learned. It may also confuse the target." =>
    "El usuario ataca usando una onda sonora basada en palabras que aprendió. También puede confundir al objetivo.",
  "The user confounds the foe with speed, then slashes. The attack lands without fail." =>
    "El usuario confunde al rival con su velocidad y luego corta. El ataque nunca falla.",
  "The user launches razor-like wind to slash the opposing team. Critical hits land more easily." =>
    "El usuario lanza un viento cortante como una cuchilla contra el equipo rival. Los golpes críticos son más probables.",
  "The user pecks the target. If the target is holding a Berry, the user eats it and gains its effect." =>
    "El usuario picotea al objetivo. Si lleva una baya, el usuario se la come y obtiene su efecto.",
  "The user takes the foe into the sky, then drops it on the next turn. The foe cannot attack while airborne." =>
    "El usuario lleva al rival al cielo y lo deja caer en el siguiente turno. No puede atacar mientras está en el aire.",
  "The target is struck with large, imposing wings spread wide to inflict damage." =>
    "El objetivo recibe el golpe de grandes e imponentes alas desplegadas para infligir daño.",
  "The user nimbly strikes the foe. This attack does more damage if the user is not holding an item." =>
    "El usuario golpea ágilmente al rival. Causa más daño si el usuario no lleva ningún objeto.",
  "The user slams the target with its wings. The target is hit twice in a row." =>
    "El usuario golpea al objetivo con sus alas. El objetivo recibe dos golpes seguidos.",
  "A gust of wind is whipped up by wings and launched at the target to inflict damage." =>
    "Se genera una ráfaga de viento con las alas y se lanza contra el objetivo para infligir daño.",
  "The target is jabbed with a sharply pointed beak or horn." =>
    "El objetivo recibe un golpe con un pico o cuerno afilado.",
  "A strong wind blows away the foe's obstacles such as Light Screen. It also lowers their evasion." =>
    "Un fuerte viento se lleva los obstáculos del rival, como Pantalla de Luz. También baja su evasión.",
  "The user covers the target's body with a mass of down that harshly lowers its Attack stat." =>
    "El usuario cubre el cuerpo del objetivo con una masa de plumón que baja severamente su Ataque.",
  "The user counters the target by mimicking the target's last move." =>
    "El usuario contraataca imitando el último movimiento usado por el objetivo.",
  "The user lands and rests its body. It restores the user's HP by up to half of its max HP." =>
    "El usuario aterriza y descansa su cuerpo. Restaura hasta la mitad de sus PS máximos.",
  "The user whips up a turbulent whirlwind that ups the Speed of all party Pokémon for four turns." =>
    "El usuario genera un turbulento torbellino que sube la Velocidad de todo su equipo durante cuatro turnos.",
  "The user attacks by sending a frightful amount of small ghosts at opposing Pokémon." =>
    "El usuario ataca enviando una cantidad aterradora de pequeños fantasmas contra los Pokémon rivales.",
  "The user disappears, then strikes the foe on the second turn. It hits even if the foe protects itself." =>
    "El usuario desaparece y golpea al rival en el segundo turno. Golpea incluso si el rival se protege.",
  "Attacks the target by controlling its item. The move fails if the target doesn't have an item." =>
    "Ataca al objetivo controlando su objeto. Falla si el objetivo no lleva ningún objeto.",
  "The user emits a sinister ray. This move can be used on the target regardless of its Abilities." =>
    "El usuario emite un rayo siniestro. Puede usarse sobre el objetivo sin importar su habilidad.",
  "The user vanishes somewhere, then strikes on the next turn. Hits through protections." =>
    "El usuario desaparece y golpea en el siguiente turno. Atraviesa las protecciones.",
  "The user hides in the target's shadow, steals the target's stat boosts, and then attacks." =>
    "El usuario se oculta en la sombra del objetivo, le roba sus subidas de estadísticas y luego ataca.",
  "The user beats the target with a bone containing a spirit. May lower the target's Defense stat." =>
    "El usuario golpea al objetivo con un hueso que contiene un espíritu. Puede bajar su Defensa.",
  "The user hurls a shadowy blob at the target. It may also lower the target's Sp. Def stat." =>
    "El usuario lanza una masa sombría contra el objetivo. También puede bajar su Defensa Especial.",
  "The user attacks while also stitching the target's shadow to the ground to prevent it fleeing." =>
    "El usuario ataca mientras clava la sombra del objetivo al suelo para impedir que huya.",
  "The user slashes with a sharp claw made from shadows. Critical hits land more easily." =>
    "El usuario corta con una garra afilada hecha de sombras. Los golpes críticos son más probables.",
  "This relentless attack does massive damage to a target affected by status problems." =>
    "Este implacable ataque causa un daño masivo a un objetivo afectado por problemas de estado.",
  "The user blasts the target with a gust of repulsive wind. It may also raise all the user's stats at once." =>
    "El usuario ataca al objetivo con una ráfaga de viento repulsivo. También puede subir todas sus propias estadísticas.",
  "The user throws a punch from the shadows. The punch lands without fail." =>
    "El usuario lanza un puñetazo desde las sombras. El golpe nunca falla.",
  "The user extends its shadow and attacks the target from behind. This move always goes first." =>
    "El usuario extiende su sombra y ataca al objetivo por detrás. Siempre actúa primero.",
  "The user attacks the target while shouting in a startling fashion. It may also make the target flinch." =>
    "El usuario ataca al objetivo gritando de forma sobresaltante. También puede hacer que se amedrente.",
  "The target is licked with a long tongue, causing damage. It may also leave the target with paralysis." =>
    "El objetivo recibe un lengüetazo con una lengua larga, causando daño. También puede dejarlo paralizado.",
  "The user makes the foe see a frightening mirage. It inflicts damage matching the user's level." =>
    "El usuario hace que el rival vea un espejismo aterrador. Inflige un daño igual al nivel del usuario.",
  "The target is exposed to a sinister ray that triggers confusion." =>
    "El objetivo queda expuesto a un rayo siniestro que provoca confusión.",
  "A move that works differently for the Ghost type than for all the other types." =>
    "Un movimiento que funciona de forma distinta para el tipo Fantasma que para los demás tipos.",
  "When this move is used, if the user faints, the foe that landed the knockout hit also faints." =>
    "Cuando se usa este movimiento, si el usuario queda fuera de combate, el rival que lo derrotó también cae.",
  "If the user faints, the user's grudge fully depletes the PP of the foe's move that knocked it out." =>
    "Si el usuario queda fuera de combate, su rencor agota por completo los PP del movimiento rival que lo derrotó.",
  "A sleeping target sees a nightmare that inflicts some damage every turn." =>
    "Un objetivo dormido sufre una pesadilla que inflige algo de daño cada turno.",
  "The user unleashes its grudge on the move last used by the target by cutting 4 PP from it." =>
    "El usuario descarga su rencor sobre el último movimiento usado por el objetivo, quitándole 4 PP.",
  "The user takes the target trick-or-treating. This adds Ghost type to the target's type." =>
    "El usuario lleva al objetivo a pedir dulces. Esto añade el tipo Fantasma al tipo del objetivo.",
  "The user slams the target with an enormous tree. The user can't move on the next turn." =>
    "El usuario golpea al objetivo con un árbol enorme. No puede moverse en el siguiente turno.",
  "A storm of sharp is whipped up. The attack's recoil harshly reduces the user's Sp. Atk stat." =>
    "Se levanta una tormenta de hojas afiladas. El retroceso reduce severamente el Ataque Especial del usuario.",
  "The user gathers light energy into a blade, attacking the target on the next turn." =>
    "El usuario reúne energía luminosa en una hoja, atacando al objetivo en el siguiente turno.",
  "The user attacks by scattering petals for two to three turns. The user then becomes confused." =>
    "El usuario ataca esparciendo pétalos durante dos o tres turnos. Luego queda confundido.",
  "The user violently whirls its vines or tentacles to harshly lash the target." =>
    "El usuario agita violentamente sus enredaderas o tentáculos para azotar con fuerza al objetivo.",
  "The user generates a shock wave from within its body. It may harshly lower the target's Sp. Def." =>
    "El usuario genera una onda expansiva desde su interior. Puede bajar severamente la Defensa Especial del objetivo.",
  "A two-turn attack. The user gathers light, then blasts a bundled beam on the second turn." =>
    "Un ataque de dos turnos. El usuario reúne luz y luego dispara un rayo concentrado en el segundo turno.",
  "The user slams its rugged body into the target to attack. The user also sustains serious damage." =>
    "El usuario estrella su rudo cuerpo contra el objetivo para atacar. También sufre un daño considerable.",
  "The user draws power from nature and fires it at the target. It may also lower the target's Sp. Def." =>
    "El usuario extrae poder de la naturaleza y lo dispara contra el objetivo. También puede bajar su Defensa Especial.",
  "The user handles a sharp leaf like a sword and attacks by slashing. It has a high critical-hit ratio." =>
    "El usuario maneja una hoja afilada como una espada y ataca cortando. Tiene una alta probabilidad de golpe crítico.",
  "The user stirs up a violent petal blizzard and attacks everything around it." =>
    "El usuario provoca una violenta ventisca de pétalos y ataca todo a su alrededor.",
  "Attacks with an acidic liquid created from tart apples. This also lowers the target's Sp. Def." =>
    "Ataca con un líquido ácido creado a partir de manzanas agrias. Esto también baja la Defensa Especial del objetivo.",
  "The user plays its drum, controlling roots to attack. This also lowers the target's Speed stat." =>
    "El usuario toca su tambor, controlando raíces para atacar. Esto también baja la Velocidad del objetivo.",
  "A column of grass hits the foes. When used with its water equivalent, it creates a vast swamp." =>
    "Una columna de hierba golpea a los rivales. Usado junto a su equivalente de Agua, crea un vasto pantano.",
}

apply_moves_dict(5, NAMES)
apply_moves_dict(6, DESCS)
