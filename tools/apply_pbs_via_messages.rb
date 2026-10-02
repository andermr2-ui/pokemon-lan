# Traduce movimientos, objetos, tipos de entrenador, nombres de entrenador y
# frases de derrota SIN tocar PBS -- todos estos campos pasan por
# pbGetMessageFromHash(MessageTypes::CATEGORIA, @real_campo_en_ingles), el
# mismo mecanismo de messages_es_game.dat que ya usamos para SCRIPT_TEXTS.
# Evita depender de que el compilador de PBS corra (requiere $DEBUG activo,
# que esta build no tiene).

MOVE_NAMES          = 5
MOVE_DESCRIPTIONS   = 6
ITEM_NAMES          = 7
ITEM_NAME_PLURALS   = 8
ITEM_DESCRIPTIONS   = 9
TRAINER_TYPE_NAMES  = 13
TRAINER_NAMES       = 14
TRAINER_SPEECHES_LOSE = 23

MOVES = {
  "Tackle" => "Placaje",
  "Growl" => "Gruñido",
  "Poison Sting" => "Picotazo Veneno",
  "Absorb" => "Absorción",
  "String Shot" => "Disparo Demora",
  "Fury Cutter" => "Corte Furia",
  "Leafage" => "Follaje",
  "Growth" => "Desarrollo",
  "Scratch" => "Arañazo",
  "Leer" => "Malicioso",
}
MOVE_DESCS = {
  "A physical attack in which the user charges and slams into the target with its whole body." => "Ataque físico en el que el usuario carga y golpea al objetivo con todo su cuerpo.",
  "The user growls in an endearing way, making the foe less wary. The foe's Attack stat is lowered." => "El usuario gruñe de forma entrañable, haciendo que el rival baje la guardia. El Ataque del rival se reduce.",
  "The user stabs the target with a poisonous stinger. This may also poison the target." => "El usuario clava al objetivo un aguijón venenoso. También puede envenenar al objetivo.",
  "A nutrient-draining attack. The user's HP is restored by half the damage taken by the target." => "Ataque que drena nutrientes. Los PS del usuario se restauran a la mitad del daño infligido al objetivo.",
  "The foe is bound with silk blown from the user's mouth. This silk reduces the target's Speed." => "El rival queda atado con hilo de seda que sale de la boca del usuario. Este hilo reduce la Velocidad del objetivo.",
  "The target is slashed with scythes or claws. Its power increases if it hits in succession." => "Se ataca al objetivo con guadañas o garras. Su potencia aumenta si acierta varias veces seguidas.",
  "The user attacks by pelting the target with leaves." => "El usuario ataca arrojando hojas al objetivo.",
  "The user's body grows all at once, raising the Atk and Sp. Atk stats." => "El cuerpo del usuario crece de golpe, aumentando el Ataque y el Ataque Especial.",
  "Hard, pointed, and sharp claws rake the target to inflict damage." => "Garras duras, puntiagudas y afiladas rasgan al objetivo para infligir daño.",
  "The user gains an intimidating leer with sharp eyes. The target's Defense stat is reduced." => "El usuario mira de forma intimidante con ojos afilados. La Defensa del objetivo se reduce.",
}

ITEM_NAMES_DICT = {
  "Poké Ball" => "Poké Ball",
  "Potion" => "Poción",
  "Antidote" => "Antídoto",
  "Paralyze Heal" => "Antiparalizador",
  "Awakening" => "Despertar",
  "Burn Heal" => "Pomada Antiquemazón",
  "Ice Heal" => "Antihielo",
  "Full Heal" => "Cura Total",
}
ITEM_PLURALS_DICT = {
  "Poké Balls" => "Poké Balls",
  "Potions" => "Pociones",
  "Antidotes" => "Antídotos",
  "Paralyze Heals" => "Antiparalizadores",
  "Awakenings" => "Despertares",
  "Burn Heals" => "Pomadas Antiquemazón",
  "Ice Heals" => "Antihielos",
  "Full Heals" => "Curas Totales",
}
ITEM_DESCS = {
  "A device for catching wild Pokémon. It is thrown like a ball at the target. It is designed as a capsule system." => "Aparato para capturar Pokémon salvajes. Se lanza como una pelota hacia el objetivo. Está diseñada como un sistema de cápsulas.",
  "A spray-type medicine for treating wounds. It can be used to restore 20 HP to a single Pokémon." => "Medicina en espray para tratar heridas. Puede usarse para restaurar 20 PS a un solo Pokémon.",
  "A spray-type medicine. It lifts the effect of poison from one Pokémon." => "Medicina en espray. Elimina el efecto del veneno de un Pokémon.",
  "A spray-type medicine. It eliminates paralysis from a single Pokémon." => "Medicina en espray. Cura a un Pokémon paralizado.",
  "A spray-type medicine. It awakens a Pokémon from the clutches of sleep." => "Medicina en espray. Despierta a un Pokémon de las garras del sueño.",
  "A spray-type medicine. It heals a single Pokémon that is suffering from a burn." => "Medicina en espray. Cura a un solo Pokémon que sufre una quemadura.",
  "A spray-type medicine. It defrosts a Pokémon that has been frozen solid." => "Medicina en espray. Descongela a un Pokémon que está congelado.",
  "A spray-type medicine. It heals all the status problems of a single Pokémon." => "Medicina en espray. Cura todos los problemas de estado de un solo Pokémon.",
}

TRAINER_TYPES = {
  "Pokémon Trainer" => "Entrenador Pokémon",
  "Rival" => "Rival",
  "Aroma Lady" => "Dama Aroma",
  "Beauty" => "Bella",
  "Biker" => "Motorista",
  "Bird Keeper" => "Ornitólogo",
  "Bug Catcher" => "Insectólogo",
  "Burglar" => "Ladrón",
  "Channeler" => "Médium",
  "Chill Guy" => "Tío Zen",
  "Cue Ball" => "Calvorota",
  "Engineer" => "Ingeniero",
  "Electrician" => "Electricista",
  "Fisherman" => "Pescador",
  "Gambler" => "Apostador",
  "Gentleman" => "Caballero",
  "Hiker" => "Montañero",
  "Juggler" => "Malabarista",
  "Lady" => "Dama",
  "Painter" => "Pintora",
  "Poké Maniac" => "Poké Maníaco",
  "Pokémon Breeder" => "Criador Pokémon",
  "Professor" => "Profesor",
  "Rocker" => "Rockero",
  "Ruin Maniac" => "Arqueólogo",
  "Sailor" => "Marinero",
  "Scientist" => "Científico",
  "Super Nerd" => "Empollón",
  "Tamer" => "Domador",
  "Black Belt" => "Cinturón Negro",
  "Crush Girl" => "Karateca",
  "Camper" => "Campista",
  "Picnicker" => "Excursionista",
  "Cool Trainer" => "Entrenador Experto",
  "Youngster" => "Chico",
  "Lass" => "Chica",
  "Pokémon Ranger" => "Ranger Pokémon",
  "Psychic" => "Psíquico",
  "Swimmer" => "Nadador",
  "Tuber" => "Bañista",
  "Officer" => "Oficial",
  "Cool Couple" => "Pareja Guay",
  "Crush Kin" => "Familia Forzuda",
  "Sis and Bro" => "Hermanos",
  "Twins" => "Gemelas",
  "Young Couple" => "Pareja Joven",
  "Team Rocket" => "Team Rocket",
  "Rocket Boss" => "Jefe del Team Rocket",
  "Gym Leader" => "Líder de Gimnasio",
  "Elite Four" => "Alto Mando",
  "Champion" => "Campeón",
  "Ex-Champion" => "Ex Campeón",
  "Hoenn Champion" => "Campeón de Hoenn",
  "Sinnoh Champion" => "Campeón de Sinnoh",
  "Alola Champion" => "Campeón de Alola",
  "Team Rocket Scientist" => "Científico del Team Rocket",
  "Mega Trainer" => "Mega Entrenador",
  "Neckbeard" => "Friki Barbudo",
  "Elder" => "Anciano",
}

TRAINER_NAMES_DICT = {
  "Zeke" => "Xarly",
}

TRAINER_LOSE_TEXTS = {
  "Nooooooooooo!!!" => "¡Noooooooooo!!!",
  "There goes my pocket money..." => "Ahí se fue mi dinero de bolsillo...",
  "You could´ve held back..." => "Podrías haberte contenido...",
  "You´re spider-tastic!" => "¡Vaya telarañazo!",
  "You are ready!" => "¡Estás listo!",
}

def merge!(hash, dict)
  added = 0
  dict.each do |k, v|
    added += 1 unless hash.key?(k)
    hash[k] = v
  end
  added
end

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  report = []
  [
    [MOVE_NAMES, MOVES], [MOVE_DESCRIPTIONS, MOVE_DESCS],
    [ITEM_NAMES, ITEM_NAMES_DICT], [ITEM_NAME_PLURALS, ITEM_PLURALS_DICT], [ITEM_DESCRIPTIONS, ITEM_DESCS],
    [TRAINER_TYPE_NAMES, TRAINER_TYPES], [TRAINER_NAMES, TRAINER_NAMES_DICT],
    [TRAINER_SPEECHES_LOSE, TRAINER_LOSE_TEXTS],
  ].each do |idx, dict|
    data[idx] ||= {}
    added = merge!(data[idx], dict)
    report << "cat#{idx}: +#{added}"
  end
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: #{report.join(', ')}"
end
