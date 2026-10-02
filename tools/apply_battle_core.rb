DICT = {
  "Fight" => "Luchar",
  "Run" => "Huir",

  "Oh! A wild {1} appeared!" => "¡Un {1} salvaje apareció!",
  "Oh! A wild {1} and {2} appeared!" => "¡Un {1} y un {2} salvajes aparecieron!",
  "Oh! A wild {1}, {2} and {3} appeared!" => "¡Un {1}, un {2} y un {3} salvajes aparecieron!",
  "You are challenged by {1}!" => "¡{1} te desafía!",
  "You are challenged by {1} and {2}!" => "¡{1} y {2} te desafían!",
  "You are challenged by {1}, {2} and {3}!" => "¡{1}, {2} y {3} te desafían!",
  "{1} sent out {2}!" => "¡{1} sacó a {2}!",
  "{1} sent out {2} and {3}!" => "¡{1} sacó a {2} y {3}!",
  "{1} sent out {2}, {3} and {4}!" => "¡{1} sacó a {2}, {3} y {4}!",
  "Go! {1}!" => "¡Adelante, {1}!",
  "Go! {1} and {2}!" => "¡Adelante, {1} y {2}!",
  "Go! {1}, {2} and {3}!" => "¡Adelante, {1}, {2} y {3}!",
  "The sunlight is strong." => "El sol brilla con fuerza.",
  "It is raining." => "Está lloviendo.",
  "A sandstorm is raging." => "Una tormenta de arena está azotando.",
  "Hail is falling." => "Está granizando.",
  "The sunlight is extremely harsh." => "El sol brilla extremadamente fuerte.",
  "It is raining heavily." => "Está lloviendo intensamente.",
  "The wind is strong." => "El viento sopla con fuerza.",
  "The sky is shadowy." => "El cielo está sombrío.",
  "An electric current runs across the battlefield!" => "¡Una corriente eléctrica recorre el campo de batalla!",
  "Grass is covering the battlefield!" => "¡La hierba cubre el campo de batalla!",
  "Mist swirls about the battlefield!" => "¡La niebla envuelve el campo de batalla!",
  "The battlefield is weird!" => "¡El campo de batalla es extraño!",
  "You got ${1} for winning!" => "¡Conseguiste {1}€ por ganar!",
  "You picked up ${1}!" => "¡Recogiste {1}€!",
  "You gave ${1} to the winner..." => "Le diste {1}€ al ganador...",
  "You panicked and dropped ${1}..." => "Te entró el pánico y se te cayeron {1}€...",
  "You defeated {1}!" => "¡Derrotaste a {1}!",
  "You defeated {1} and {2}!" => "¡Derrotaste a {1} y {2}!",
  "You defeated {1}, {2} and {3}!" => "¡Derrotaste a {1}, {2} y {3}!",
  "You have no more Pokémon that can fight!" => "¡No te quedan más Pokémon que puedan luchar!",
  "You lost against {1}!" => "¡Perdiste contra {1}!",
  "You lost against {1} and {2}!" => "¡Perdiste contra {1} y {2}!",
  "You lost against {1}, {2} and {3}!" => "¡Perdiste contra {1}, {2} y {3}!",
  "You blacked out!" => "¡Has perdido el conocimiento!",
}.freeze

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  hash = (data[24] ||= {})
  added = 0
  DICT.each do |key, value|
    added += 1 unless hash.key?(key)
    hash[key] = value
  end
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: nuevas=#{added} total=#{hash.size}"
end
