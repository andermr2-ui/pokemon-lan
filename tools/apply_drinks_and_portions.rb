# encoding: UTF-8
# Categoria 28/29 (ITEM_PORTION_NAMES/PLURALS) es un campo APARTE del
# nombre normal del objeto, usado en frases tipo "botella de Leche Moomoo"
# cuando se cuenta por unidades del envase. El usuario encontro que
# "Moomoo Milk" (nombre) ya estaba en español pero "bottle of Moomoo Milk"
# (el portion_name) seguia en ingles porque es una clave completamente
# distinta que nunca se habia tocado.
NAMES = {
  "Fresh Water" => "Agua Fresca",
  "Soda Pop" => "Refresco",
  "Lemonade" => "Limonada",
  "Berry Juice" => "Zumo de Bayas",
  "Honey" => "Miel",
  "Sacred Ash" => "Ceniza Sagrada",
  "Max Honey" => "Miel Máxima",
}

PLURALS = {
  "Fresh Waters" => "Aguas Frescas",
  "Soda Pops" => "Refrescos",
  "Lemonades" => "Limonadas",
  "Berry Juices" => "Zumos de Bayas",
  "Sacred Ashes" => "Cenizas Sagradas",
  "Max Honeys" => "Mieles Máximas",
}

DESCRIPTIONS = {
  "Water with high mineral content. It can be used to restore 30 HP to a single Pokémon." =>
    "Agua con alto contenido mineral. Se puede usar para restaurar 30 PS de un Pokémon.",
  "A highly carbonated soda drink. It can be used to restore 50 HP to a single Pokémon." =>
    "Un refresco muy carbonatado. Se puede usar para restaurar 50 PS de un Pokémon.",
  "A very sweet and refreshing drink. It can be used to restore 70 HP to a single Pokémon." =>
    "Una bebida muy dulce y refrescante. Se puede usar para restaurar 70 PS de un Pokémon.",
  "A 100% pure juice made of Berries. It restores the HP of one Pokémon by just 20 points." =>
    "Un zumo 100% puro hecho de Bayas. Restaura solo 20 puntos de PS de un Pokémon.",
  "A sweet honey with a lush aroma that attracts wild Pokémon when used in tall grass, in caves, or elsewhere." =>
    "Una miel dulce de aroma intenso que atrae a Pokémon salvajes al usarla en hierba alta, cuevas u otros lugares.",
  "It revives all fainted Pokémon. In doing so, it also fully restores their HP." =>
    "Revive a todos los Pokémon debilitados. Al hacerlo, también restaura por completo sus PS.",
  "Honey that Dynamax Vespiquen produces. It has the same effect as a Max Revive." =>
    "Miel que produce un Vespiquen Dynamax. Tiene el mismo efecto que un Revivir Todo.",
}

PORTION_NAMES = {
  "bottle of Moomoo Milk" => "botella de Leche Moomoo",
  "bottle of Fresh Water" => "botella de Agua Fresca",
  "bottle of Soda Pop" => "botella de Refresco",
  "can of Lemonade" => "lata de Limonada",
  "cup of Berry Juice" => "taza de Zumo de Bayas",
  "jar of Honey" => "tarro de Miel",
  "bag of Sacred Ash" => "bolsa de Ceniza Sagrada",
  "comb of Max Honey" => "panal de Miel Máxima",
}

PORTION_PLURALS = {
  "bottles of Moomoo Milk" => "botellas de Leche Moomoo",
  "bottles of Fresh Water" => "botellas de Agua Fresca",
  "bottles of Soda Pop" => "botellas de Refresco",
  "cans of Lemonade" => "latas de Limonada",
  "cups of Berry Juice" => "tazas de Zumo de Bayas",
  "jars of Honey" => "tarros de Miel",
  "bags of Sacred Ash" => "bolsas de Ceniza Sagrada",
  "combs of Max Honey" => "panales de Miel Máxima",
}

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  NAMES.each { |k, v| data[7][k] = v }
  PLURALS.each { |k, v| data[8][k] = v }
  DESCRIPTIONS.each { |k, v| data[9][k] = v }
  data[28] ||= {}
  data[29] ||= {}
  PORTION_NAMES.each { |k, v| data[28][k] = v }
  PORTION_PLURALS.each { |k, v| data[29][k] = v }
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: #{NAMES.size} nombres, #{PLURALS.size} plurales, #{DESCRIPTIONS.size} desc, " \
       "#{PORTION_NAMES.size} portion, #{PORTION_PLURALS.size} portion plural"
end
