# encoding: UTF-8
require_relative "apply_moves_common"

NAMES = {
  "Freezing Glare" => "Mirada Helada",
  "Psychic" => "Psíquico",
  "Psychic Fangs" => "Colmillo Psíquico",
  "Eerie Spell" => "Hechizo Siniestro",
  "Expanding Force" => "Fuerza Expansiva",
  "Extrasensory" => "Premonición",
  "Hyperspace Hole" => "Hoyo Hiperespacial",
  "Psyshock" => "Psicocorte",
  "Zen Headbutt" => "Cabezazo Zen",
  "Luster Purge" => "Depuración",
  "Mist Ball" => "Bola Niebla",
  "Psycho Cut" => "Psicocorte",
  "Psybeam" => "Rayo Psíquico",
  "Heart Stamp" => "Marca Corazón",
  "Confusion" => "Confusión",
  "Stored Power" => "Poder Reserva",
  "Mirror Coat" => "Manto Espejo",
  "Psywave" => "Psicoonda",
  "Agility" => "Agilidad",
  "Ally Switch" => "Cambio de Aliado",
  "Amnesia" => "Amnesia",
  "Barrier" => "Barrera",
  "Calm Mind" => "Paz Mental",
  "Cosmic Power" => "Poder Cósmico",
  "Gravity" => "Gravedad",
  "Guard Split" => "Reparto Guardia",
  "Guard Swap" => "Cambio Guardia",
  "Heal Block" => "Anticura",
  "Heal Pulse" => "Pulso Cura",
  "Healing Wish" => "Deseo Cura",
  "Heart Swap" => "Cambio de Ánimo",
  "Hypnosis" => "Hipnosis",
  "Imprison" => "Sello",
  "Instruct" => "Orden",
  "Kinesis" => "Cinesis",
  "Light Screen" => "Pantalla de Luz",
  "Lunar Dance" => "Danza Lunar",
  "Magic Coat" => "Capa Mágica",
  "Magic Powder" => "Polvo Mágico",
  "Magic Room" => "Sala Mágica",
  "Meditate" => "Meditación",
  "Miracle Eye" => "Ojo Milagroso",
  "Power Split" => "Reparto Poder",
  "Power Swap" => "Cambio Poder",
  "Power Trick" => "Truco de Fuerza",
  "Psychic Terrain" => "Campo Psíquico",
  "Psycho Shift" => "Psicocambio",
  "Reflect" => "Reflejo",
  "Rest" => "Descanso",
  "Role Play" => "Imitación",
  "Skill Swap" => "Cambio de Facultades",
  "Speed Swap" => "Cambio Velocidad",
  "Telekinesis" => "Telequinesis",
  "Teleport" => "Teletransporte",
  "Trick" => "Truco",
  "Trick Room" => "Espacio Raro",
  "Wonder Room" => "Zona Extraña",
  "Head Smash" => "Cabeza Yunque",
  "Rock Wrecker" => "Destructor",
  "Meteor Beam" => "Rayo Meteórico",
  "Diamond Storm" => "Tempestad de Diamantes",
  "Stone Edge" => "Roca Afilada",
  "Power Gem" => "Gema Poder",
  "Rock Slide" => "Avalancha",
  "Ancient Power" => "Poder Pasado",
  "Rock Tomb" => "Tumba de Rocas",
  "Rock Throw" => "Lanzarrocas",
  "Smack Down" => "Golpe Certero",
  "Accelerock" => "Aceleroca",
  "Rollout" => "Rodada",
  "Rock Blast" => "Pedrada",
  "Rock Polish" => "Pulir",
  "Sandstorm" => "Tormenta de Arena",
  "Stealth Rock" => "Trampa Rocas",
  "Tar Shot" => "Chapapote",
  "Wide Guard" => "Vasta Guardia",
  "Doom Desire" => "Deseo Oculto",
  "Steel Beam" => "Rayo Acero",
  "Steel Roller" => "Rodillo de Acero",
  "Behemoth Bash" => "Golpe Titánico",
  "Behemoth Blade" => "Espada Titánica",
  "Iron Tail" => "Cola Férrea",
  "Sunsteel Strike" => "Meteoimpacto",
  "Meteor Mash" => "Puño Meteoro",
  "Anchor Shot" => "Ancla",
  "Flash Cannon" => "Foco Resplandor",
  "Iron Head" => "Cabeza de Hierro",
  "Smart Strike" => "Estocada Certera",
  "Steel Wing" => "Ala de Acero",
  "Double Iron Bash" => "Doble Golpe Férreo",
  "Mirror Shot" => "Disparo Espejo",
  "Magnet Bomb" => "Bomba Imán",
  "Gear Grind" => "Corte Zahareño",
  "Metal Claw" => "Garra Metal",
  "Bullet Punch" => "Puño Bala",
  "Gyro Ball" => "Giro Bola",
  "Heavy Slam" => "Peso Pesado",
  "Metal Burst" => "Carga Metálica",
  "Autotomize" => "Autotomía",
  "Gear Up" => "Sobremarcha",
  "Iron Defense" => "Defensa Férrea",
  "King's Shield" => "Escudo Real",
  "Metal Sound" => "Sonido Metálico",
  "Shift Gear" => "Cambio de Marcha",
  "Hydro Cannon" => "Hidrocañón",
  "Water Spout" => "Chorro de Agua",
  "Hydro Pump" => "Hidrobomba",
  "Origin Pulse" => "Pulso Primigenio",
  "Steam Eruption" => "Erupción Vapor",
  "Crabhammer" => "Martillazo",
  "Aqua Tail" => "Cola de Agua",
  "Muddy Water" => "Agua Lodosa",
  "Sparkling Aria" => "Aria Reluciente",
  "Surf" => "Surf",
  "Fishious Rend" => "Corte de Agallas",
  "Liquidation" => "Frenesí de Agua",
  "Dive" => "Buceo",
  "Scald" => "Escaldar",
  "Snipe Shot" => "Disparo Certero",
  "Water Pledge" => "Voto Agua",
  "Waterfall" => "Cascada",
  "Razor Shell" => "Concha Filo",
  "Brine" => "Salmuera",
  "Bubble Beam" => "Rayo Burbuja",
  "Octazooka" => "Pistola Tinta",
  "Flip Turn" => "Salto Cambio",
  "Water Pulse" => "Hidropulso",
  "Aqua Jet" => "Chorro de Agua Acelerado",
  "Bubble" => "Burbuja",
  "Water Gun" => "Pistola Agua",
  "Clamp" => "Tenaza",
  "Whirlpool" => "Remolino",
  "Surging Strikes" => "Ataques Torrenciales",
  "Water Shuriken" => "Shuriken de Agua",
  "Aqua Ring" => "Hidroanillo",
  "Life Dew" => "Rocío Vital",
  "Rain Dance" => "Danza Lluvia",
  "Soak" => "Empapar",
  "Water Sport" => "Hidrochorro",
  "Withdraw" => "Refugio",
}

DESCS = {
  "The user shoots its psychic power from its eyes to attack. This may also leave the target frozen." =>
    "El usuario dispara su poder psíquico desde los ojos para atacar. También puede dejar al objetivo congelado.",
  "The target is hit by a strong telekinetic force. It may also reduce the target's Sp. Def stat." =>
    "El objetivo recibe el golpe de una fuerte fuerza telequinética. También puede reducir su Defensa Especial.",
  "The user bites the target using psychic capabilities. This can also destroy Light Screen and Reflect." =>
    "El usuario muerde al objetivo usando poderes psíquicos. También puede destruir Pantalla de Luz y Reflejo.",
  "The user attacks with tremendous psychic power. This also removes 3 PP from the target's last move." =>
    "El usuario ataca con un tremendo poder psíquico. También le quita 3 PP al último movimiento del objetivo.",
  "The user attacks the target with psychic power. Powers up and hits all foes on Psychic Terrain." =>
    "El usuario ataca al objetivo con poder psíquico. Se potencia y golpea a todos los rivales en Campo Psíquico.",
  "The user attacks with an odd, unseeable power. It may also make the target flinch." =>
    "El usuario ataca con un extraño poder invisible. También puede hacer que el objetivo se amedrente.",
  "Using a hyperspace hole, the user appears right next to the target and strikes. Skips protections." =>
    "Usando un hoyo hiperespacial, el usuario aparece justo al lado del objetivo y golpea. Ignora las protecciones.",
  "The user materializes an odd psychic wave to attack the target. This attack does physical damage." =>
    "El usuario materializa una extraña onda psíquica para atacar al objetivo. Este ataque causa daño físico.",
  "The user focuses its willpower to its head and attacks the foe. It may also make the target flinch." =>
    "El usuario concentra su fuerza de voluntad en la cabeza y ataca al rival. También puede hacer que se amedrente.",
  "The user lets loose a damaging burst of light. It may also reduce the target's Sp. Def stat." =>
    "El usuario libera una ráfaga dañina de luz. También puede reducir la Defensa Especial del objetivo.",
  "A mistlike flurry of down envelops and damages the target. It may also lower the target's Sp. Atk." =>
    "Una ráfaga de plumón nebuloso envuelve y daña al objetivo. También puede bajar su Ataque Especial.",
  "The user tears at the target with blades formed by psychic power. Critical hits land more easily." =>
    "El usuario desgarra al objetivo con cuchillas formadas por poder psíquico. Los golpes críticos son más probables.",
  "The target is attacked with a peculiar ray. It may also cause confusion." =>
    "El objetivo recibe un rayo peculiar. También puede causar confusión.",
  "The user unleashes a vicious blow after its cute act makes the foe less wary. It may also cause flinching." =>
    "El usuario asesta un golpe feroz después de que su actitud tierna baje la guardia del rival. También puede hacer que se amedrente.",
  "The target is hit by a weak telekinetic force. It may also leave the target confused." =>
    "El objetivo recibe una débil fuerza telequinética. También puede dejarlo confundido.",
  "The user attacks with stored power. The more the user's stats are raised, the greater the damage." =>
    "El usuario ataca con poder acumulado. Cuanto más hayan subido sus estadísticas, mayor será el daño.",
  "A retaliation move that counters any special attack, inflicting double the damage taken." =>
    "Un movimiento de represalia que contrarresta cualquier ataque especial, infligiendo el doble del daño recibido.",
  "The target is attacked with an odd psychic wave. The attack varies in intensity." =>
    "El objetivo recibe una extraña onda psíquica. El ataque varía en intensidad.",
  "The user relaxes and lightens its body to move faster. It sharply boosts the Speed stat." =>
    "El usuario relaja y aligera su cuerpo para moverse más rápido. Sube considerablemente su Velocidad.",
  "The user teleports using a strange power and switches its place with one of its allies." =>
    "El usuario se teletransporta usando un extraño poder e intercambia su lugar con uno de sus aliados.",
  "The user temporarily empties its mind to forget its concerns. It sharply raises the user's Sp. Def stat." =>
    "El usuario vacía temporalmente su mente para olvidar sus preocupaciones. Sube considerablemente su Defensa Especial.",
  "The user throws up a sturdy wall that sharply raises its Defense stat." =>
    "El usuario levanta un muro resistente que sube considerablemente su Defensa.",
  "The user quietly focuses its mind and calms its spirit to raise its Sp. Atk and Sp. Def stats." =>
    "El usuario se concentra en silencio y calma su espíritu para subir su Ataque Especial y Defensa Especial.",
  "The user absorbs a mystical power from space to raise its Defense and Sp. Def stats." =>
    "El usuario absorbe un poder místico del espacio para subir su Defensa y Defensa Especial.",
  "Gravity is intensified for five turns, making moves involving flying unusable and negating Levitation." =>
    "La gravedad se intensifica durante cinco turnos, inutilizando movimientos de vuelo y anulando la Levitación.",
  "The user employs its psychic power to average its Defense and Sp. Def stats with those of its target." =>
    "El usuario usa su poder psíquico para promediar su Defensa y Defensa Especial con las del objetivo.",
  "The user employs its psychic power to switch changes to its Defense and Sp. Def with the target." =>
    "El usuario usa su poder psíquico para intercambiar los cambios de Defensa y Defensa Especial con el objetivo.",
  "For five turns, the foe is prevented from using any moves, Abilities, or held items that recover HP." =>
    "Durante cinco turnos, el rival no puede usar movimientos, habilidades ni objetos que recuperen PS.",
  "The user emits a healing pulse which restores the target's HP by up to half of its max HP." =>
    "El usuario emite un pulso curativo que restaura hasta la mitad de los PS máximos del objetivo.",
  "The user faints. In return, the Pokémon taking its place will have its HP restored and status cured." =>
    "El usuario queda fuera de combate. A cambio, el Pokémon que lo reemplace tendrá sus PS restaurados y su estado curado.",
  "The user employs its psychic power to switch stat changes with the target." =>
    "El usuario usa su poder psíquico para intercambiar los cambios de estadísticas con el objetivo.",
  "The user employs hypnotic suggestion to make the target fall into a deep sleep." =>
    "El usuario emplea sugestión hipnótica para hacer que el objetivo caiga en un sueño profundo.",
  "If the foe knows any move also known by the user, the foe is prevented from using it." =>
    "Si el rival conoce algún movimiento que también conoce el usuario, se le impide usarlo.",
  "The user instructs the target to use the target's last move again." =>
    "El usuario ordena al objetivo que vuelva a usar su último movimiento.",
  "The user distracts the target by bending a spoon. It lowers the target's accuracy." =>
    "El usuario distrae al objetivo doblando una cuchara. Baja su precisión.",
  "A wondrous wall of light is put up to suppress damage from special attacks for five turns." =>
    "Se levanta un maravilloso muro de luz que reduce el daño de ataques especiales durante cinco turnos.",
  "The user faints. In return, the Pokémon taking its place will have its status and HP fully restored." =>
    "El usuario queda fuera de combate. A cambio, el Pokémon que lo reemplace tendrá su estado y PS totalmente restaurados.",
  "A barrier reflects back to the target moves like Leech Seed and moves that damage status." =>
    "Una barrera refleja de vuelta al objetivo movimientos como Drenadoras y otros que dañan mediante estados.",
  "The user scatters a cloud of magic powder that changes the target to Psychic type." =>
    "El usuario esparce una nube de polvo mágico que cambia al objetivo a tipo Psíquico.",
  "The user creates a bizarre area in which Pokémon's held items lose their effects for five turns." =>
    "El usuario crea una zona extraña en la que los objetos de los Pokémon pierden su efecto durante cinco turnos.",
  "The user meditates to awaken the power deep within its body and raise its Attack stat." =>
    "El usuario medita para despertar el poder que yace en lo profundo de su cuerpo y sube su Ataque.",
  "Enables the user to hit a Dark type with any type of move. It also enables the user to hit an evasive foe." =>
    "Permite al usuario golpear a un tipo Siniestro con cualquier movimiento. También permite golpear a un rival evasivo.",
  "The user employs its psychic power to average its Attack and Sp. Atk stats with those of the target." =>
    "El usuario usa su poder psíquico para promediar su Ataque y Ataque Especial con los del objetivo.",
  "The user employs its psychic power to switch changes to its Attack and Sp. Atk with the target." =>
    "El usuario usa su poder psíquico para intercambiar los cambios de Ataque y Ataque Especial con el objetivo.",
  "The user employs its psychic power to switch its Attack with its Defense stat." =>
    "El usuario usa su poder psíquico para intercambiar su Ataque con su Defensa.",
  "Protects grounded Pokémon from priority moves and powers up Psychic-type moves for five turns." =>
    "Protege a los Pokémon en tierra de movimientos con prioridad y potencia los movimientos de tipo Psíquico durante cinco turnos.",
  "Using its psychic power of suggestion, the user transfers its status problems to the target." =>
    "Usando su poder psíquico de sugestión, el usuario transfiere sus problemas de estado al objetivo.",
  "A wondrous wall of light is put up to suppress damage from physical attacks for five turns." =>
    "Se levanta un maravilloso muro de luz que reduce el daño de ataques físicos durante cinco turnos.",
  "The user goes to sleep for two turns. It fully restores the user's HP and heals any status problem." =>
    "El usuario se duerme durante dos turnos. Restaura por completo sus PS y cura cualquier problema de estado.",
  "The user mimics the target completely, copying the target's natural Ability." =>
    "El usuario imita al objetivo por completo, copiando su habilidad natural.",
  "The user employs its psychic power to exchange Abilities with the target." =>
    "El usuario usa su poder psíquico para intercambiar habilidades con el objetivo.",
  "The user exchanges Speed stats with the target." => "El usuario intercambia su Velocidad con la del objetivo.",
  "The user makes the target float with its psychic power. The target is easier to hit for three turns." =>
    "El usuario hace flotar al objetivo con su poder psíquico. Es más fácil de golpear durante tres turnos.",
  "The user switches place with a party Pokémon. Also warps to the last Pokémon Center visited." =>
    "El usuario cambia de lugar con un Pokémon de su equipo. También se teletransporta al último Centro Pokémon visitado.",
  "The user catches the target off guard and swaps its held item with its own." =>
    "El usuario toma desprevenido al objetivo e intercambia su objeto con el propio.",
  "The user creates a bizarre area in which slower Pokémon get to move first for five turns." =>
    "El usuario crea una zona extraña en la que los Pokémon más lentos actúan primero durante cinco turnos.",
  "The user creates a bizarre area in which Pokémon's Defense and Sp. Def stats are swapped for 5 turns." =>
    "El usuario crea una zona extraña en la que se intercambian la Defensa y Defensa Especial durante 5 turnos.",
  "The user attacks the foe with a hazardous, full-power headbutt. The user also takes terrible damage." =>
    "El usuario ataca al rival con un peligroso cabezazo a plena potencia. También sufre un daño terrible.",
  "The user launches a huge boulder at the target to attack. It must rest on the next turn, however." =>
    "El usuario lanza un enorme peñasco contra el objetivo para atacar. Sin embargo, debe descansar el siguiente turno.",
  "Gathers space power and boosts its Sp. Atk stat on the first turn, attacks on the next turn." =>
    "Reúne poder espacial y sube su Ataque Especial en el primer turno, y ataca en el siguiente.",
  "The user whips up a storm of diamonds to damage foes. This may also sharply raise the user's Defense stat." =>
    "El usuario levanta una tormenta de diamantes para dañar a los rivales. También puede subir considerablemente su Defensa.",
  "The user stabs the foe with sharpened stones from below. It has a high critical-hit ratio." =>
    "El usuario apuñala al rival con piedras afiladas desde abajo. Tiene una alta probabilidad de golpe crítico.",
  "The user attacks with a ray of light that sparkles as if it were made of gemstones." =>
    "El usuario ataca con un rayo de luz que brilla como si estuviera hecho de gemas.",
  "Large boulders are hurled at the foes to inflict damage. It may also make the targets flinch." =>
    "Se lanzan grandes peñascos contra los rivales para infligir daño. También puede hacer que se amedrenten.",
  "The user attacks with a prehistoric power. It may also raise all the user's stats at once." =>
    "El usuario ataca con un poder prehistórico. También puede subir todas sus propias estadísticas de golpe.",
  "Boulders are hurled at the target. It also lowers the target's Speed by preventing its movement." =>
    "Se lanzan peñascos contra el objetivo. También baja su Velocidad al impedir su movimiento.",
  "The user picks up and throws a small rock at the target to attack." =>
    "El usuario recoge y lanza una pequeña roca contra el objetivo para atacar.",
  "The user throws a stone or projectile to attack. A flying Pokémon will fall to the ground when hit." =>
    "El usuario lanza una piedra o proyectil para atacar. Un Pokémon que vuela cae al suelo si es golpeado.",
  "The user smashes into the target at high speed. This move always goes first." =>
    "El usuario se estrella contra el objetivo a gran velocidad. Siempre actúa primero.",
  "The user continually rolls into the target over five turns. It becomes stronger each time it hits." =>
    "El usuario rueda continuamente contra el objetivo durante cinco turnos. Se vuelve más fuerte con cada golpe.",
  "The user hurls hard rocks at the target. Two to five rocks are launched in quick succession." =>
    "El usuario lanza rocas duras contra el objetivo. Se lanzan de dos a cinco rocas rápidamente.",
  "The user polishes its body to reduce drag. It can sharply raise the Speed stat." =>
    "El usuario pule su cuerpo para reducir la resistencia. Puede subir considerablemente su Velocidad.",
  "Summons a five-turn sandstorm to hurt all combatants except the Rock, Ground, and Steel types." =>
    "Invoca una tormenta de arena de cinco turnos que daña a todos los combatientes excepto a los tipo Roca, Tierra y Acero.",
  "The user lays a trap of levitating stones around the foe. The trap hurts foes that switch into battle." =>
    "El usuario coloca una trampa de piedras levitantes alrededor del rival. Daña a quien entre en combate.",
  "Pours sticky tar over the target, lowering its Speed and making it weaker to Fire-type moves." =>
    "Vierte alquitrán pegajoso sobre el objetivo, bajando su Velocidad y debilitándolo ante movimientos de tipo Fuego.",
  "The user and its allies are protected from wide-ranging attacks for a turn. May fail if used in succession." =>
    "El usuario y sus aliados quedan protegidos de ataques de gran alcance durante un turno. Puede fallar si se usa seguidas veces.",
  "Two turns after this move is used, the user blasts the target with a concentrated bundle of light." =>
    "Dos turnos después de usar este movimiento, el usuario dispara al objetivo un haz concentrado de luz.",
  "The user fires a beam of steel that it collected from its entire body. This also damages the user." =>
    "El usuario dispara un rayo de acero que reunió de todo su cuerpo. Esto también lo daña a él mismo.",
  "The user attacks while destroying the terrain. This move fails when the ground isn't a terrain." =>
    "El usuario ataca mientras destruye el campo. Este movimiento falla si el suelo no tiene un campo activo.",
  "The user becomes a gigantic shield and slams into the target." =>
    "El usuario se convierte en un escudo gigantesco y embiste al objetivo.",
  "The user becomes a gigantic sword and cuts the target." =>
    "El usuario se convierte en una espada gigantesca y corta al objetivo.",
  "The target is slammed with a steel-hard tail. It may also lower the target's Defense stat." =>
    "El objetivo recibe el golpe de una cola dura como el acero. También puede bajar su Defensa.",
  "The user slams into the target with the force of a meteor. Can't be stopped by the target's Ability." =>
    "El usuario embiste al objetivo con la fuerza de un meteoro. No puede ser detenido por la habilidad del objetivo.",
  "The target is hit with a hard punch fired like a meteor. It may also raise the user's Attack." =>
    "El objetivo recibe un fuerte puñetazo disparado como un meteoro. También puede subir el Ataque del usuario.",
  "The user entangles the target with its anchor chain. The target becomes unable to flee." =>
    "El usuario enreda al objetivo con su cadena de ancla. Ya no puede huir.",
  "The user gathers all its light energy and releases it at once. It may also lower the target's Sp. Def stat." =>
    "El usuario reúne toda su energía luminosa y la libera de golpe. También puede bajar la Defensa Especial del objetivo.",
  "The foe slams the target with its steel-hard head. It may also make the target flinch." =>
    "El rival golpea al objetivo con su cabeza dura como el acero. También puede hacer que se amedrente.",
  "The user stabs the target with a sharp horn. This attack never misses." =>
    "El usuario apuñala al objetivo con un cuerno afilado. Este ataque nunca falla.",
  "The target is hit with wings of steel. It may also raise the user's Defense stat." =>
    "El objetivo recibe el golpe de alas de acero. También puede subir la Defensa del usuario.",
  "The user rotates, centering the hex nut in its chest, and then strikes twice. May cause flinching." =>
    "El usuario gira, centrando la tuerca de su pecho, y luego golpea dos veces. Puede hacer que el objetivo se amedrente.",
  "The user looses a flash of energy from its polished body. It may also lower the target's accuracy." =>
    "El usuario libera un destello de energía desde su cuerpo pulido. También puede bajar la precisión del objetivo.",
  "The user launches steel bombs that stick to the target. This attack will not miss." =>
    "El usuario lanza bombas de acero que se adhieren al objetivo. Este ataque nunca falla.",
  "The user attacks by throwing two steel gears at its target." =>
    "El usuario ataca lanzando dos engranajes de acero contra su objetivo.",
  "The target is raked with steel claws. It may also raise the user's Attack stat." =>
    "El objetivo recibe zarpazos de garras de acero. También puede subir el Ataque del usuario.",
  "The user strikes the target with tough punches as fast as bullets. This move always goes first." =>
    "El usuario golpea al objetivo con fuertes puñetazos veloces como balas. Siempre actúa primero.",
  "The user tackles the target with a high-speed spin. The slower the user, the greater the damage." =>
    "El usuario embiste al objetivo con un giro a alta velocidad. Cuanto más lento sea el usuario, mayor será el daño.",
  "The user slams into the foe with its heavy body. The heavier the user, the greater the damage." =>
    "El usuario golpea al rival con su cuerpo pesado. Cuanto más pesado sea el usuario, mayor será el daño.",
  "The user retaliates with much greater power against the target that last inflicted damage on it." =>
    "El usuario toma represalias con mucho más poder contra quien último le infligió daño.",
  "The user sheds part of its body to make itself lighter and sharply raise its Speed stat." =>
    "El usuario se desprende de parte de su cuerpo para volverse más liviano y subir considerablemente su Velocidad.",
  "The user engages its gears to raise the Attack and Sp. Atk of allies with the Plus or Minus Ability." =>
    "El usuario activa sus engranajes para subir el Ataque y Ataque Especial de aliados con las habilidades Más o Menos.",
  "The user hardens its body's surface like iron, sharply raising its Defense stat." =>
    "El usuario endurece la superficie de su cuerpo como el hierro, subiendo considerablemente su Defensa.",
  "Protects itself from damage. It also harshly lowers the Attack of attackers that make contact." =>
    "Se protege del daño. También baja severamente el Ataque de quienes lo golpean por contacto.",
  "A horrible sound like scraping metal harshly reduces the target's Sp. Def stat." =>
    "Un sonido horrible parecido al roce de metal reduce severamente la Defensa Especial del objetivo.",
  "The user rotates its gears, raising its Attack and sharply raising its Speed." =>
    "El usuario hace girar sus engranajes, subiendo su Ataque y considerablemente su Velocidad.",
  "The target is hit with a watery blast. The user must rest on the next turn, however." =>
    "El objetivo recibe una ráfaga acuosa. Sin embargo, el usuario debe descansar el siguiente turno.",
  "The user spouts water to damage the foe. The lower the user's HP, the less powerful it becomes." =>
    "El usuario expulsa agua para dañar al rival. Cuanto más bajos estén sus PS, menos poderoso será.",
  "The target is blasted by a huge volume of water launched under great pressure." =>
    "El objetivo recibe un enorme volumen de agua lanzado a gran presión.",
  "The user attacks opposing Pokémon with countless beams of light that glow a deep and brilliant blue." =>
    "El usuario ataca a los Pokémon rivales con incontables rayos de luz que brillan de un azul profundo e intenso.",
  "The user immerses the target in superheated steam. This may also leave the target with a burn." =>
    "El usuario sumerge al objetivo en vapor sobrecalentado. También puede dejarlo quemado.",
  "The target is hammered with a large pincer. Critical hits land more easily." =>
    "El objetivo recibe un martillazo de una gran pinza. Los golpes críticos son más probables.",
  "The user attacks by swinging its tail as if it were a vicious wave in a raging storm." =>
    "El usuario ataca agitando su cola como si fuera una ola feroz en una tormenta furiosa.",
  "The user attacks by shooting muddy water at the opposing team. It may also lower the target's accuracy." =>
    "El usuario ataca disparando agua lodosa contra el equipo rival. También puede bajar su precisión.",
  "The user bursts into song, emitting many bubbles. Any burnt Pokémon will be healed by these bubbles." =>
    "El usuario estalla en canto, emitiendo muchas burbujas. Cualquier Pokémon quemado se cura con estas burbujas.",
  "It swamps the area around the user with a giant wave. It can also be used for crossing water." =>
    "Inunda el área alrededor del usuario con una ola gigante. También puede usarse para cruzar el agua.",
  "The user rends the target with its hard gills. Power doubles if the user moves first." =>
    "El usuario desgarra al objetivo con sus duras agallas. El poder se duplica si el usuario actúa primero.",
  "The user slams into the target using a full-force blast of water. May lower the target's Defense." =>
    "El usuario embiste al objetivo con un chorro de agua a toda potencia. Puede bajar su Defensa.",
  "Diving on the first turn, the user rises and hits on the next turn. It can be used to dive in the ocean." =>
    "El usuario se sumerge en el primer turno, emerge y golpea en el siguiente. También puede usarse para bucear en el océano.",
  "The user shoots boiling hot water at its target. It may also leave the target with a burn." =>
    "El usuario dispara agua hirviendo contra su objetivo. También puede dejarlo quemado.",
  "The user ignores any effects that redirect moves, allowing this move to hit the chosen target." =>
    "El usuario ignora cualquier efecto que redirija movimientos, permitiendo que este golpee al objetivo elegido.",
  "A column of water strikes the target. When combined with its fire equivalent, it makes a rainbow." =>
    "Una columna de agua golpea al objetivo. Combinado con su equivalente de fuego, crea un arcoíris.",
  "The user charges at the target and may make it flinch. It can also be used to climb a waterfall." =>
    "El usuario carga contra el objetivo y puede hacer que se amedrente. También puede usarse para escalar una cascada.",
  "The user cuts the foe with sharp shells. It may also lower the target's Defense stat." =>
    "El usuario corta al rival con conchas afiladas. También puede bajar su Defensa.",
  "If the target's HP is down to about half, this attack will hit with double the power." =>
    "Si los PS del objetivo están a la mitad o menos, este ataque golpea con el doble de poder.",
  "A spray of bubbles is forcefully ejected at the target. It may also lower its Speed stat." =>
    "Se expulsa con fuerza un chorro de burbujas contra el objetivo. También puede bajar su Velocidad.",
  "The user attacks by spraying ink in the foe's face or eyes. It may also lower the target's accuracy." =>
    "El usuario ataca rociando tinta en la cara u ojos del rival. También puede bajar su precisión.",
  "After making its attack, the user rushes back to switch places with a party Pokémon in waiting." =>
    "Tras atacar, el usuario regresa a toda prisa para cambiar de lugar con un Pokémon en espera.",
  "The user attacks the target with a pulsing blast of water. It may also confuse the target." =>
    "El usuario ataca al objetivo con una ráfaga pulsante de agua. También puede confundirlo.",
  "The user lunges at the target at a speed that makes it almost invisible. It is sure to strike first." =>
    "El usuario se lanza contra el objetivo a una velocidad que lo vuelve casi invisible. Siempre golpea primero.",
  "A spray of countless bubbles is jetted at the opposing team. It may also lower the targets' Speed stats." =>
    "Se lanza un chorro de incontables burbujas contra el equipo rival. También puede bajar su Velocidad.",
  "The target is blasted with a forceful shot of water." => "El objetivo recibe un potente chorro de agua.",
  "The target is clamped and squeezed by the user's very thick and sturdy shell for four to five turns." =>
    "El objetivo queda atrapado y apretado por el caparazón grueso y resistente del usuario durante cuatro o cinco turnos.",
  "Traps foes in a violent swirling whirlpool for four to five turns." =>
    "Atrapa a los rivales en un violento remolino durante cuatro o cinco turnos.",
  "Hits three times in a row with mastery of the Water style. This attack always deals critical hits." =>
    "Golpea tres veces seguidas con el dominio del estilo Agua. Este ataque siempre resulta en golpes críticos.",
  "The user hits the target with throwing stars 2-5 times in a row. This move always goes first." =>
    "El usuario golpea al objetivo con shuriken de dos a cinco veces seguidas. Siempre actúa primero.",
  "The user envelops itself in a veil made of water. It regains some HP on every turn." =>
    "El usuario se envuelve en un velo de agua. Recupera algo de PS cada turno.",
  "The user scatters mysterious water around and restores the HP of itself and its allies." =>
    "El usuario esparce un agua misteriosa y restaura los PS propios y los de sus aliados.",
  "The user summons a heavy rain that falls for five turns, powering up Water-type moves." =>
    "El usuario invoca una fuerte lluvia que cae durante cinco turnos, potenciando los movimientos de tipo Agua.",
  "The user shoots a torrent of water at the target and changes the target's type to Water." =>
    "El usuario dispara un torrente de agua contra el objetivo y cambia su tipo a Agua.",
  "The user soaks itself with water. The move weakens Fire-type moves while the user is in the battle." =>
    "El usuario se empapa de agua. El movimiento debilita los movimientos de tipo Fuego mientras esté en combate.",
  "The user withdraws its body into its hard shell, raising its Defense stat." =>
    "El usuario retrae su cuerpo dentro de su duro caparazón, subiendo su Defensa.",
}

apply_moves_dict(5, NAMES)
apply_moves_dict(6, DESCS)
