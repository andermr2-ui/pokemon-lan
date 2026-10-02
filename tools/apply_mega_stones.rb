# encoding: UTF-8
# Descubrimiento: 689 de 794 objetos del juego NUNCA se extrajeron a
# messages_es_game.dat (la clave ni siquiera existe en el hash), a
# diferencia de los ~104 que si se autoextrajeron y ya veniamos traduciendo.
# Las Mega Piedras son parte de ese bloque nunca tocado. Siguen el patron
# oficial de localizacion en español: nombre del Pokémon + sufijo "-ita".
NAMES = {
  "Eviolite" => "Eviolita",
  "Venusaurite" => "Venusaurita",
  "Charizardite X" => "Charizardita X",
  "Charizardite Y" => "Charizardita Y",
  "Blastoisinite" => "Blastoisita",
  "Beedrillite" => "Beedrillita",
  "Pidgeotite" => "Pidgeotita",
  "Alakazite" => "Alakazamita",
  "Slowbronite" => "Slowbronita",
  "Gengarite" => "Gengarita",
  "Kangaskhanite" => "Kangaskhanita",
  "Pinsirite" => "Pinsirita",
  "Gyaradosite" => "Gyaradosita",
  "Aerodactylite" => "Aerodactylita",
  "Mewtwonite X" => "Mewtwoita X",
  "Mewtwonite Y" => "Mewtwoita Y",
  "Ampharosite" => "Ampharosita",
  "Steelixite" => "Steelixita",
  "Scizorite" => "Scizorita",
  "Heracronite" => "Heracronita",
  "Houndoominite" => "Houndoominita",
  "Tyranitarite" => "Tyranitarita",
  "Sceptilite" => "Sceptilita",
  "Blazikenite" => "Blazikenita",
  "Swampertite" => "Swampertita",
  "Gardevoirite" => "Gardevoirita",
  "Sablenite" => "Sableñita",
  "Mawilite" => "Mawilita",
  "Aggronite" => "Aggronita",
  "Medichamite" => "Medichamita",
  "Manectite" => "Manectita",
  "Sharpedonite" => "Sharpedonita",
  "Cameruptite" => "Cameruptita",
  "Altarianite" => "Altarianita",
  "Banettite" => "Banettita",
  "Absolite" => "Absolita",
  "Glalitite" => "Glalitita",
  "Salamencite" => "Salamencita",
  "Metagrossite" => "Metagrossita",
  "Latiasite" => "Latiasita",
  "Latiosite" => "Latiosita",
  "Lopunnite" => "Lopunnita",
  "Garchompite" => "Garchompita",
  "Lucarionite" => "Lucarionita",
  "Abomasite" => "Abomasita",
  "Galladite" => "Galladita",
  "Audinite" => "Audinita",
  "Diancite" => "Diancita",
  "Black Augurite" => "Mena Negra",
  "Meteorite" => "Meteorito",
}.freeze

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  cat7 = (data[7] ||= {})
  cat8 = (data[8] ||= {})
  added_n = 0
  added_p = 0
  NAMES.each do |k, v|
    added_n += 1 unless cat7.key?(k)
    cat7[k] = v
    plural_k = k + "s"
    added_p += 1 unless cat8.key?(plural_k)
    cat8[plural_k] = v + "s"
  end
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: nombres nuevos=#{added_n}, plurales nuevos=#{added_p}, total nombres=#{NAMES.size}"
end
