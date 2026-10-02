MOVE_NAMES = 5
MOVE_DESCRIPTIONS = 6

NAMES = {
  "Branch Poke" => "Golpe Rama",
  "Ember" => "Ascuas",
  "Tail Whip" => "Látigo",
  "Water Gun" => "Pistola Agua",
}
DESCS = {
  "The user attacks the target by poking it with a sharply pointed branch." => "El usuario ataca al objetivo golpeándolo con una rama afilada.",
  "The target is attacked with small flames. It may also leave the target with a burn." => "El objetivo es atacado con pequeñas llamas. También puede dejarlo quemado.",
  "The user wags its tail cutely, making opposing Pokémon less wary and lowering their Defense stat." => "El usuario agita su cola con gracia, haciendo que los Pokémon rivales bajen la guardia y reduciendo su Defensa.",
  "The target is blasted with a forceful shot of water." => "El objetivo recibe un chorro de agua a presión.",
}

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  data[MOVE_NAMES].merge!(NAMES)
  data[MOVE_DESCRIPTIONS].merge!(DESCS)
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
end
puts "aplicado"
