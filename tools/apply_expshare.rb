# encoding: UTF-8
NAME = { "Exp. Share" => "Compartir Exp." }
PLURAL = { "Exp. Shares" => "Compartir Exp." }
DESC = {
  "An item to be held by a Pokémon. The holder gets a share of a battle's Exp. Points without battling." =>
    "Un objeto que puede llevar un Pokémon. Quien lo porta recibe una parte de los Puntos de Exp. de un combate sin combatir.",
}

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  data[7].merge!(NAME)
  data[8].merge!(PLURAL)
  data[9].merge!(DESC)
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: actualizado"
end
