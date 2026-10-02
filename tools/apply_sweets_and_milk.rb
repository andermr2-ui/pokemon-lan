# encoding: UTF-8
# Estos objetos son parte del bloque grande de 689 objetos nunca
# extraidos (ver PENDIENTES.md). Se traducen puntualmente porque el
# usuario los encontro en la tienda de la Pasteleria Crema.
NAMES = {
  "Moomoo Milk" => "Leche Moomoo",
  "Strawberry Sweet" => "Dulce de Fresa",
  "Love Sweet" => "Dulce de Amor",
  "Berry Sweet" => "Dulce de Baya",
  "Clover Sweet" => "Dulce de Trébol",
  "Flower Sweet" => "Dulce de Flor",
  "Star Sweet" => "Dulce de Estrella",
  "Ribbon Sweet" => "Dulce de Lazo",
}

PLURALS = {
  "Moomoo Milks" => "Leches Moomoo",
  "Strawberry Sweets" => "Dulces de Fresa",
  "Love Sweets" => "Dulces de Amor",
  "Berry Sweets" => "Dulces de Baya",
  "Clover Sweets" => "Dulces de Trébol",
  "Flower Sweets" => "Dulces de Flor",
  "Star Sweets" => "Dulces de Estrella",
  "Ribbon Sweets" => "Dulces de Lazo",
}

DESCRIPTIONS = {
  "Milk with a very high nutrition content. It restores the HP of one Pokémon by 100 points." =>
    "Leche con un contenido nutricional muy alto. Restaura 100 puntos de PS de un Pokémon.",
  "A strawberry-shaped sweet. When a Milcery holds this, it will spin around happily." =>
    "Un dulce con forma de fresa. Cuando un Milcery lo lleva, da vueltas feliz.",
  "A heart-shaped sweet. When a Milcery holds this, it spins around happily." =>
    "Un dulce con forma de corazón. Cuando un Milcery lo lleva, da vueltas feliz.",
  "A berry-shaped sweet. When a Milcery holds this, it spins around happily." =>
    "Un dulce con forma de baya. Cuando un Milcery lo lleva, da vueltas feliz.",
  "A clover-shaped sweet. When a Milcery holds this, it spins around happily." =>
    "Un dulce con forma de trébol. Cuando un Milcery lo lleva, da vueltas feliz.",
  "A flower-shaped sweet. When a Milcery holds this, it spins around happily." =>
    "Un dulce con forma de flor. Cuando un Milcery lo lleva, da vueltas feliz.",
  "A star-shaped sweet. When a Milcery holds this, it spins around happily." =>
    "Un dulce con forma de estrella. Cuando un Milcery lo lleva, da vueltas feliz.",
  "A ribbon-shaped sweet. When a Milcery holds this, it spins around happily." =>
    "Un dulce con forma de lazo. Cuando un Milcery lo lleva, da vueltas feliz.",
}

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  n7 = data[7]
  n8 = data[8]
  n9 = data[9]
  NAMES.each { |k, v| n7[k] = v }
  PLURALS.each { |k, v| n8[k] = v }
  DESCRIPTIONS.each { |k, v| n9[k] = v }
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: #{NAMES.size} nombres, #{PLURALS.size} plurales, #{DESCRIPTIONS.size} descripciones"
end
