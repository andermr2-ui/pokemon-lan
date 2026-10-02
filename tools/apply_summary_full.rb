DICT = {
  "INFO" => "INFO",
  "TRAINER MEMO" => "MEMO DEL ENTRENADOR",
  "SKILLS" => "APTITUDES",
  "MOVES" => "MOVIMIENTOS",
  "RIBBONS" => "LISTONES",
  "Dex No." => "N.º Pokédex",
  "Species" => "Especie",
  "Type" => "Tipo",
  "OT" => "EO",
  "RENTAL" => "ALQUILER",
  "Heart Gauge" => "Medidor de Cariño",
  "The door to its heart is open! Undo the final lock!" => "¡La puerta de su corazón está abierta! ¡Deshaz el último candado!",
  "The door to its heart is almost fully open." => "La puerta de su corazón está casi del todo abierta.",
  "The door to its heart is nearly open." => "La puerta de su corazón está casi abierta.",
  "The door to its heart is opening wider." => "La puerta de su corazón se abre cada vez más.",
  "The door to its heart is opening up." => "La puerta de su corazón se está abriendo.",
  "The door to its heart is tightly shut." => "La puerta de su corazón está firmemente cerrada.",
  "Exp. Points" => "Puntos de Exp.",
  "To Next Lv." => "Para sig. Nivel",
  "A mysterious Pokémon Egg received from {1}." => "Un misterioso Huevo Pokémon recibido de {1}.",
  "A mysterious Pokémon Egg." => "Un misterioso Huevo Pokémon.",
  "\"The Egg Watch\"" => "\"El Vigía del Huevo\"",
  "It looks like this Egg will take a long time to hatch." => "Parece que este Huevo tardará mucho en eclosionar.",
  "What will hatch from this? It doesn't seem close to hatching." => "¿Qué eclosionará de esto? No parece estar cerca de eclosionar.",
  "It appears to move occasionally. It may be close to hatching." => "Parece moverse de vez en cuando. Puede que esté cerca de eclosionar.",
  "Sounds can be heard coming from inside! It will hatch soon!" => "¡Se oyen sonidos desde dentro! ¡Eclosionará pronto!",
  "Faraway place" => "Lugar lejano",
  "Egg received." => "Huevo recibido.",
  "Traded at Lv. {1}." => "Intercambiado en Nv. {1}.",
  "Had a fateful encounter at Lv. {1}." => "Tuvo un encuentro fortuito en el Nv. {1}.",
  "Egg hatched." => "Huevo eclosionado.",
  "Loves to eat." => "Le encanta comer.",
  "Takes plenty of siestas." => "Duerme muchas siestas.",
  "Thoroughly cunning." => "Muy astuto.",
  "Very finicky." => "Muy quisquilloso.",
  "Strong willed." => "De carácter fuerte.",
  "Strongly defiant." => "Muy desafiante.",
  "Hates to lose." => "Odia perder.",
  "Ability" => "Habilidad",
  "CATEGORY" => "CATEGORÍA",
  "POWER" => "POTENCIA",
  "ACCURACY" => "PRECISIÓN",
  "No. of Ribbons:" => "N.º de Listones:",
  "Mark {1}" => "Marca {1}",
  "Give item" => "Dar objeto",
  "Take item" => "Quitar objeto",
  "View Pokédex" => "Ver Pokédex",
  "Mark" => "Marca",
  "HM moves can't be forgotten now." => "Los movimientos MO no se pueden olvidar ahora.",
  "You must choose a move!" => "¡Debes elegir un movimiento!",
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
