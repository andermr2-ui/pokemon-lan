# encoding: UTF-8
# Correcciones tras contrastar contra WikiDex (enciclopedia oficial en
# espanol) las categorias de Pokemon de Gen9 que habia traducido de forma
# literal/razonable sin verificar. Muchas categorias oficiales NO son
# traduccion literal del ingles, son localizaciones creativas propias.
FIX = {
  "Boss" => "Jefazo",
  "Candy Apple" => "Manzamelo",
  "Coin Chest" => "Cofre",
  "Coin Entity" => "Tesoro",
  "Coin Hunter" => "Cazatesoros",
  "Big Fish" => "Gran Pez",
  "EleFrog" => "Electrorrana",
  "EleTadpole" => "Electrocuajo",
  "Fire Child" => "Fuegodrilo",
  "Fire Warrior" => "Piroguerrero",
  "Fire Blades" => "Piroespada",
  "Grass Cat" => "Gato Planta",
  "Garden Eel" => "Anguiliforme",
  "Ghost Dog" => "Can Fantasma",
  "Frill" => "Montura",
  "Item Drop" => "Arrojador",
  "Storm Petrel" => "Païño",
  "Frigatebird" => "Fregata",
  "Retainer" => "Esbirro",
  "Ruinous" => "Debacle",
  "Mimicry" => "Mono Veneno",
  "Tera" => "Teracristal",
  "Rage Monkey" => "Mono Furia",
  "Spiny Fish" => "Pez Púas",
  "Love-Hate" => "Amorodio",
  "Terra Whale" => "Geoballena",
  "Rock Salt" => "Halita",
  "Woodear" => "Auricularia",
  "Spicy Pepper" => "Habanero",
  "Hog" => "Chancho",
  "Multi-Cyl" => "Policilindro",
  "Tumbleweed" => "Estepicursor",
}.freeze

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  hash = data[2]
  updated = 0
  missing = []
  FIX.each do |k, v|
    unless hash.key?(k)
      missing << k
      next
    end
    hash[k] = v
    updated += 1
  end
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: corregidas=#{updated}/#{FIX.size}"
  puts "  no encontradas: #{missing.join(', ')}" unless missing.empty?
end
