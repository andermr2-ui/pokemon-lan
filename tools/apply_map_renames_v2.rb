# Renombres personalizados pedidos por el usuario sobre nombres de mapa que
# ya estaban traducidos (categoria MAP_NAMES = 21). Sobrescribe solo las
# entradas indicadas, propagando el cambio a los derivados de cada lugar
# (Gimnasio/Centro Pokemon/Tienda/pisos de cueva, etc).
MAP_NAMES = 21

DICT = {
  "Meadow Grove" => "Prado Arboleda",

  "Starter Valley" => "Valle del Rocío",
  "Starter Valley Pokémon Lab" => "Laboratorio Pokémon del Valle del Rocío",

  "Arrow Ridge" => "Cordillera Flecha",
  "Arrow Ridge Gym" => "Gimnasio de Cordillera Flecha",
  "Arrow Ridge Poké Center" => "Centro Pokémon de Cordillera Flecha",
  "Arrow Ridge Mart" => "Tienda de Cordillera Flecha",

  "Silver Peak" => "Pico Plata",
  "Silver Peak Poké Center" => "Centro Pokémon de Pico Plata",
  "Silver Peak Gym" => "Gimnasio de Pico Plata",

  "Mistveil" => "Velo Brumoso",
  "Mistveil Poké Center" => "Centro Pokémon de Velo Brumoso",
  "Mistveil Gym" => "Gimnasio de Velo Brumoso",

  "Southford" => "Fuerte Sur",

  "Hisui Wildlife Station" => "Estación de Vida Silvestre del Verde",

  "Crystal Harbor" => "Puerto del Cristal",
  "Crystal Harbor Poké Center" => "Centro Pokémon de Puerto del Cristal",

  "Crystal Cove" => "Cueva de la Meta",
  "Crystal Cove Poké Center" => "Centro Pokémon de la Cueva de la Meta",
  "Crystal Cove Gym" => "Gimnasio de la Cueva de la Meta",
  "Crytal Cove Gym" => "Gimnasio de la Cueva de la Meta",

  "Crystal Beach" => "Playa Tushi",

  "Aurora Summit" => "Cumbres Auroreales",
  "Aurora Summit Poké Center" => "Centro Pokémon de Cumbres Auroreales",
  "Aurora Summit Gym" => "Gimnasio de Cumbres Auroreales",
  "Aurora Peak" => "Pico Auroreal",
  "Aurora Mountain F1" => "Monte Auroreal F1",
  "Aurora Mountain F2" => "Monte Auroreal F2",
  "Aurora Mountain F3" => "Monte Auroreal F3",
  "Aurora Mountain F4" => "Monte Auroreal F4",

  "Granite Heights" => "Alta Roca",
  "Granite Heights Poké Center" => "Centro Pokémon de Alta Roca",
  "Granite Heights Gym" => "Gimnasio de Alta Roca",

  "Glimmerwood" => "Bosque Lumínico",
  "Glimmerwood Poké Center" => "Centro Pokémon de Bosque Lumínico",

  "Rumble Mountain South" => "Montaña Calada Sur",
  "Rumble Mountain Center" => "Montaña Calada Centro",
  "Rumble Mountain North" => "Montaña Calada Norte",
  "Rumble Mountain East" => "Montaña Calada Este",

  "Riverstone" => "Río Stones",
  "Riverstone Park" => "Parque Río Stones",
  "Riverstone Poké Center" => "Centro Pokémon de Río Stones",
  "Riverstone Gym" => "Gimnasio de Río Stones",
  "Riverstone Graveyard" => "Cementerio de Río Stones",
  "Riverstone Stadium" => "Estadio Río Stones",

  "Relic Cave F1" => "Cueva Fetiche F1",
  "Relic Cave F2" => "Cueva Fetiche F2",
  "Relic Cave F3" => "Cueva Fetiche F3",

  "Ambergrove Cave" => "Cueva del Groove",

  "Southside Beach" => "Playa del Sur",
  "Southside Beach Passage Way" => "Paso de la Playa del Sur",

  "Rocky Gate" => "Puerta Piedra",

  "Eastern Beach" => "Playa del Este",

  "Shrouded Cove" => "Cueva Envuelta",
  "Shrouded Chamber" => "Cámara Envuelta",

  "Delta Islands Harbor" => "Puerto D",

  "Victory Road" => "Avenida Victoriosa",

  "Champions Beach" => "Playa de la Victoria Absoluta",
  "Champions Village" => "Villa Deliciosa",
  "Champions Village Poké Center" => "Centro Pokémon de Villa Deliciosa",

  "Ruin Island" => "Isla Reliquia",
}.freeze

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  hash = data[MAP_NAMES]
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
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: actualizadas=#{updated}, no encontradas=#{missing.size}"
  puts "  Faltantes: #{missing.join(', ')}" unless missing.empty?
end
