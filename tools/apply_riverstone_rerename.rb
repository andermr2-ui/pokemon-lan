# encoding: UTF-8
# Segundo cambio de nombre pedido por Danko: "Rio Stones" -> "Rio el Ultimo"
# Toca las 3 categorias que usan este nombre: 19 (mapa Pokegear, nombre
# principal del punto), 20 (mapa Pokegear, sublocalizaciones especificas
# como el Instituto) y 21 (cartel de "entrando a...", pantalla de guardado).
CAT21 = {
  "Riverstone"           => "Río el Último",
  "Riverstone Park"      => "Parque Río el Último",
  "Riverstone Poké Center" => "Centro Pokémon de Río el Último",
  "Riverstone Gym"       => "Gimnasio de Río el Último",
  "Riverstone Graveyard" => "Cementerio de Río el Último",
  "Riverstone Stadium"   => "Estadio Río el Último",
}.freeze

CAT19 = {
  "Riverstone"      => "Río el Último",
  "Riverstone Park" => "Parque Río el Último",
}.freeze

CAT20 = {
  "Riverstone Institute" => "Instituto Río el Último",
  "Riverstone Stadium"   => "Estadio Río el Último",
  "Riverstone Graveyard" => "Cementerio de Río el Último",
}.freeze

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  total = 0
  { 19 => CAT19, 20 => CAT20, 21 => CAT21 }.each do |cat, dict|
    hash = data[cat]
    dict.each do |k, v|
      unless hash.key?(k)
        puts "  AVISO: #{path} categoria #{cat} no tiene clave #{k.inspect}"
        next
      end
      hash[k] = v
      total += 1
    end
  end
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: #{total} claves actualizadas"
end
