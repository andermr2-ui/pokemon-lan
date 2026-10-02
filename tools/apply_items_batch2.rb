ITEM_NAMES = 7

DICT = {
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
}.freeze

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  hash = data[ITEM_NAMES]
  added = 0
  DICT.each do |k, v|
    added += 1 if hash.key?(k)
    hash[k] = v
  end
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: actualizadas=#{added}/#{DICT.size}"
end
