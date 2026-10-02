# encoding: UTF-8
# Categoria 2 (SPECIES_CATEGORIES): NO incluyen la palabra "Pokemon", que se
# agrega en un template separado (SCRIPT_TEXTS "{1} Pokémon", usado en
# UI_Pokedex_Entry). En español el orden se invierte ("Pokémon Semilla", no
# "Semilla Pokémon"), asi que se agrega tambien esa clave con el orden
# correcto.
DICT = {
  "Ambush" => "Emboscada",
  "Apple Hydra" => "Hidra de Manzana",
  "Axe" => "Hacha",
  "Baneful Fox" => "Zorro Maligno",
  "Battle Cry" => "Grito de Batalla",
  "Big Blade" => "Gran Espada",
  "Big Catfish" => "Gran Bagre",
  "Big Fish" => "Pez Grande",
  "Boss" => "Jefe",
  "Candy Apple" => "Manzana Caramelizada",
  "Coin Chest" => "Cofre de Monedas",
  "Coin Entity" => "Entidad de Monedas",
  "Coin Hunter" => "Cazador de Monedas",
  "Couple" => "Pareja",
  "Dancer" => "Bailarín",
  "Dolphin" => "Delfín",
  "Duckling" => "Patito",
  "Earthworm" => "Lombriz",
  "EleFrog" => "ElectroRana",
  "EleTadpole" => "ElectroRenacuajo",
  "Family" => "Familia",
  "Fire Blades" => "Espadas de Fuego",
  "Fire Child" => "Niño de Fuego",
  "Fire Croc" => "Cocodrilo de Fuego",
  "Fire Warrior" => "Guerrero de Fuego",
  "Free Climb" => "Escalada Libre",
  "Frigatebird" => "Fragata",
  "Frill" => "Gorguera",
  "Garden Eel" => "Anguila de Jardín",
  "Ghost Dog" => "Perro Fantasma",
  "Ghost Flame" => "Llama Fantasma",
  "Grass Cat" => "Gato de Planta",
  "Grasshopper" => "Saltamontes",
  "Hammer" => "Martillo",
  "Hands-On" => "Manual",
  "Hero" => "Héroe",
  "Hog" => "Cerdo",
  "Ice Dragon" => "Dragón de Hielo",
  "Ice Fin" => "Aleta de Hielo",
  "Item Drop" => "Objeto Caído",
  "Jettison" => "Expulsión",
  "Love-Hate" => "Amor-Odio",
  "Magician" => "Mago",
  "Mask" => "Máscara",
  "Matcha" => "Matcha",
  "Mellow" => "Suave",
  "Metalsmith" => "Herrero",
  "Mimicry" => "Mimetismo",
  "Multi-Cyl" => "Multicilindro",
  "Olive" => "Aceituna",
  "Ostrich" => "Avestruz",
  "Paradox" => "Paradoja",
  "Parrot" => "Loro",
  "Peat" => "Turba",
  "Pin Cluster" => "Racimo de Púas",
  "Poison Fish" => "Pez Veneno",
  "Practicing" => "Aprendiz",
  "Rage Monkey" => "Mono de la Ira",
  "Rascal" => "Bribón",
  "Retainer" => "Vasallo",
  "Rock Salt" => "Sal de Roca",
  "Rolling" => "Rodante",
  "Ruinous" => "Ruinoso",
  "Shell Bunker" => "Búnker de Concha",
  "Singer" => "Cantante",
  "Single-Cyl" => "Monocilindro",
  "Sphere" => "Esfera",
  "Spicy Pepper" => "Pimiento Picante",
  "Spinning" => "Giratorio",
  "Spiny Fish" => "Pez Espinoso",
  "Spiteful Fox" => "Zorro Rencoroso",
  "Storm Petrel" => "Petrel",
  "String Ball" => "Bola de Hilo",
  "Subjugation" => "Subyugación",
  "Synchronize" => "Sincronización",
  "Tera" => "Tera",
  "Terra Whale" => "Ballena de Tierra",
  "Toxic Monkey" => "Mono Tóxico",
  "Toxic Mouse" => "Ratón Tóxico",
  "Tumbleweed" => "Matorral Rodante",
  "Woodear" => "Oreja de Madera",
}.freeze

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  hash = data[2]
  updated = 0
  missing = []
  DICT.each do |k, v|
    unless hash.key?(k)
      missing << k
      next
    end
    hash[k] = v
    updated += 1
  end
  data[24]["{1} Pokémon"] = "Pokémon {1}"
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: actualizadas=#{updated}/#{DICT.size}, no encontradas=#{missing.size}"
  puts "  Faltantes: #{missing.join(', ')}" unless missing.empty?
end
