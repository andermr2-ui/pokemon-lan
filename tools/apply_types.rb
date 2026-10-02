TYPE_NAMES = 12
DICT = {
  "Normal" => "Normal",
  "Fighting" => "Lucha",
  "Flying" => "Volador",
  "Poison" => "Veneno",
  "Ground" => "Tierra",
  "Rock" => "Roca",
  "Bug" => "Bicho",
  "Ghost" => "Fantasma",
  "Steel" => "Acero",
  "Fire" => "Fuego",
  "Water" => "Agua",
  "Grass" => "Planta",
  "Electric" => "Eléctrico",
  "Psychic" => "Psíquico",
  "Ice" => "Hielo",
  "Dragon" => "Dragón",
  "Dark" => "Siniestro",
  "Fairy" => "Hada",
}
["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  data[TYPE_NAMES] ||= {}
  data[TYPE_NAMES].merge!(DICT)
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
end
puts "#{DICT.size} tipos aplicados"
