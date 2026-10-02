# Genera plurales en español agregando "s" o "es" segun termine en vocal o consonante.
def pluralize(word)
  return word if word.end_with?("s") # ya termina en s, se usa igual (Z-crystals, etc.)
  last = word[-1]
  if "aeiouáéíóú".include?(last.downcase)
    word + "s"
  else
    word + "es"
  end
end

names = {
  "Deity Ball" => "Ball Deidad",
  "Key Card" => "Tarjeta Llave",
  "Delta Stone" => "Piedra Delta",
  "Black Augurite" => "Augurita Negra",
  "Peat Block" => "Bloque de Turba",
  "Linking Cord" => "Cordón Vínculo",
  "Adamant Crystal" => "Cristal Firme",
  "Lustrous Globe" => "Globo Perlado",
  "Legend Plate" => "Placa Legendaria",
  "Blank Plate" => "Placa en Blanco",
  "Hopo Berry" => "Baya Hopo",
  "Griseous Core" => "Núcleo Griseo",
  "Feather Ball" => "Ball Pluma",
  "Wing Ball" => "Ball Ala",
  "Jet Ball" => "Ball Jet",
  "Leaden Ball" => "Ball Plomo",
  "Gigaton Ball" => "Ball Gigatón",
  "Origin Ball" => "Ball Origen",
  "Strange Ball" => "Ball Extraña",
  "Auspicious Armor" => "Armadura Fasta",
  "Malicious Armor" => "Armadura Nefasta",
  "Scroll of Darkness" => "Pergamino de las Tinieblas",
  "Scroll of Waters" => "Pergamino de las Aguas",
  "Leader's Crest" => "Blasón del Líder",
  "Booster Energy" => "Energía Potenciadora",
  "Ability Shield" => "Protector de Habilidad",
  "Clear Amulet" => "Amuleto Nítido",
  "Mirror Herb" => "Hierba Espejo",
  "Punching Glove" => "Guante de Boxeo",
  "Covert Cloak" => "Capa Discreta",
  "Loaded Dice" => "Dados Trucados",
  "Gimmighoul Coin" => "Moneda Gimmighoul",
  "Tiny Bamboo Shoot" => "Brote de Bambú Pequeño",
  "Big Bamboo Shoot" => "Brote de Bambú Grande",
  "Rotom Phone" => "Rotofono",
  "Scarlet Book" => "Libro Escarlata",
  "Violet Book" => "Libro Púrpura",
  "Health Mochi" => "Mochi Vital",
  "Muscle Mochi" => "Mochi Fornido",
  "Resist Mochi" => "Mochi Resistente",
  "Genius Mochi" => "Mochi Ingenioso",
  "Clever Mochi" => "Mochi Astuto",
  "Swift Mochi" => "Mochi Veloz",
  "Fresh-Start Mochi" => "Mochi de Reinicio",
  "Fairy Feather" => "Pluma Hada",
  "Syrupy Apple" => "Manzana Almibarada",
  "Unremarkable Teacup" => "Taza de Té Corriente",
  "Masterpiece Teacup" => "Taza de Té Maestra",
  "Wellspring Mask" => "Máscara Manantial",
  "Hearthflame Mask" => "Máscara Fogón",
  "Cornerstone Mask" => "Máscara Cimiento",
  "Teal Mask" => "Máscara Trullo",
  "Metal Alloy" => "Aleación de Metal",
  "Indigo Disk" => "Disco Añil",
  "Mythical Pecha Berry" => "Baya Pecha Mítica",
  "Synchro Machine" => "Máquina Sincro",
  "Meteorite" => "Meteorito",
  "Briar's Book" => "Libro de Amarga",
  "Z-Power Ring" => "Anillo Poder Z",
  "Z-Booster" => "Potenciador Z",
}

ITEM_NAME_PLURALS = 8

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  hash_es_names = data[7]
  hash_plurals = data[ITEM_NAME_PLURALS]
  updated = 0
  hash_plurals.keys.each do |eng_plural|
    # buscar el singular correspondiente en names (heurística: probar sin "s"/"es" al final,
    # pero mas simple: recorrer names y ver si el plural es name+s o name+es)
    names.each do |eng_singular, es_singular|
      if eng_plural == eng_singular + "s" || eng_plural == eng_singular + "es"
        hash_plurals[eng_plural] = pluralize(es_singular)
        updated += 1
        break
      end
    end
  end
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: plurales actualizados=#{updated}"
end
