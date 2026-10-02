# encoding: UTF-8
NAMES = {
  "Claw Fossil" => "Fósil Garra",
  "Root Fossil" => "Fósil Raíz",
  "Fossilized Bird" => "Fósil de Pájaro",
  "Fossilized Fish" => "Fósil de Pez",
  "Fossilized Drake" => "Fósil de Dragón",
  "Fossilized Dino" => "Fósil de Dino",
}
PLURALS = {
  "Claw Fossils" => "Fósiles Garra",
  "Root Fossils" => "Fósiles Raíz",
  "Fossilized Birds" => "Fósiles de Pájaro",
  "Fossilized Fish" => "Fósiles de Pez",
  "Fossilized Drakes" => "Fósiles de Dragón",
  "Fossilized Dinos" => "Fósiles de Dino",
}
DESCRIPTIONS = {
  "A fossil of an ancient Pokémon that lived in the sea. It appears to be part of a claw." =>
    "Un fósil de un Pokémon antiguo que vivió en el mar. Parece ser parte de una garra.",
  "A fossil of an ancient Pokémon that lived in the sea. It appears to be part of a plant root." =>
    "Un fósil de un Pokémon antiguo que vivió en el mar. Parece ser parte de una raíz de planta.",
  "The fossil of an ancient Pokémon that once soared through the sky. What it looked like is a mystery." =>
    "El fósil de un Pokémon antiguo que surcaba los cielos. Se desconoce qué aspecto tenía.",
  "The fossil of an ancient Pokémon that once lived in the sea. What it looked like is a mystery." =>
    "El fósil de un Pokémon antiguo que vivía en el mar. Se desconoce qué aspecto tenía.",
  "The fossil of an ancient Pokémon that once roamed the land. What it looked like is a mystery." =>
    "El fósil de un Pokémon antiguo que vagaba por la tierra. Se desconoce qué aspecto tenía.",
}

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  NAMES.each { |k, v| data[7][k] = v }
  PLURALS.each { |k, v| data[8][k] = v }
  DESCRIPTIONS.each { |k, v| data[9][k] = v }
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: #{NAMES.size} nombres, #{PLURALS.size} plurales, #{DESCRIPTIONS.size} desc"
end
