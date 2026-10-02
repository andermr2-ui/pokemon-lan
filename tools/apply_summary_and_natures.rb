DICT = {
  "Switch In" => "Cambiar",
  "None" => "Ninguno",
  "Met at Lv. {1}." => "Encontrado en Nv. {1}.",
  "{1} nature." => "Naturaleza {1}.",
  "You put the {1} in\nyour Bag's <icon=bagPocket{2}>\c[1]{3}\c[0] pocket." => "Guardaste {1} en el\nbolsillo <icon=bagPocket{2}>\c[1]{3}\c[0] de tu Mochila.",

  # Caracteristicas
  "Nods off a lot." => "Se echa siestas a menudo.",
  "Scatters things often." => "Suele esparcir cosas.",
  "Likes to relax." => "Le gusta relajarse.",
  "Proud of its power." => "Orgulloso de su poder.",
  "Likes to thrash about." => "Le gusta menearse mucho.",
  "A little quick tempered." => "Un poco irascible.",
  "Likes to fight." => "Le gusta pelear.",
  "Quick tempered." => "Irascible.",
  "Sturdy body." => "Cuerpo robusto.",
  "Capable of taking hits." => "Aguanta bien los golpes.",
  "Highly persistent." => "Muy persistente.",
  "Good endurance." => "Buena resistencia.",
  "Good perseverance." => "Buena perseverancia.",
  "Highly curious." => "Muy curioso.",
  "Mischievous." => "Travieso.",
  "Often lost in thought." => "A menudo ensimismado.",
  "Somewhat vain." => "Algo presumido.",
  "Somewhat stubborn." => "Algo testarudo.",
  "Likes to run." => "Le gusta correr.",
  "Alert to sounds." => "Atento a los sonidos.",
  "Impetuous and silly." => "Impetuoso y alocado.",
  "Somewhat of a clown." => "Algo payaso.",
  "Quick to flee." => "Huye con facilidad.",

  # Naturalezas
  "Hardy" => "Fuerte",
  "Lonely" => "Huraña",
  "Brave" => "Audaz",
  "Adamant" => "Firme",
  "Naughty" => "Pícara",
  "Bold" => "Osada",
  "Docile" => "Dócil",
  "Relaxed" => "Relajada",
  "Impish" => "Agitada",
  "Lax" => "Floja",
  "Timid" => "Miedosa",
  "Hasty" => "Activa",
  "Serious" => "Seria",
  "Jolly" => "Alegre",
  "Naive" => "Ingenua",
  "Modest" => "Modesta",
  "Mild" => "Afable",
  "Quiet" => "Mansa",
  "Bashful" => "Tímida",
  "Rash" => "Alocada",
  "Calm" => "Serena",
  "Gentle" => "Amable",
  "Sassy" => "Grosera",
  "Careful" => "Cauta",
  "Quirky" => "Rara",
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
