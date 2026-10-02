# encoding: UTF-8
FIX = {
  "Apple Hydra" => "Manzanhidra",
  "Fire Croc" => "Fuegodrilo",
  "Ghost Flame" => "Can Fantasma",
  "Ice Dragon" => "Dragón Hielo",
  "Ice Fin" => "Aleta Hielo",
  "Pin Cluster" => "Trampa",
  "Poison Fish" => "Espinoso",
  "Baneful Fox" => "Maldizorro",
  "Spiteful Fox" => "Zorro Rencor",
  "String Ball" => "Ovillo",
  "Toxic Monkey" => "Mono Veneno",
  "Mimicry" => "Mimetismo",
}.freeze

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  hash = data[2]
  updated = 0
  FIX.each do |k, v|
    next unless hash.key?(k)
    hash[k] = v
    updated += 1
  end
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: corregidas=#{updated}/#{FIX.size}"
end
