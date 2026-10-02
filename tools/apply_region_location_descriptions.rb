# encoding: UTF-8
# Categoria 20 (REGION_LOCATION_DESCRIPTIONS) es la etiqueta secundaria que
# aparece abajo a la derecha del mapa del Pokegear cuando el cursor esta sobre
# un punto de interes especifico (point[3] en town_map.txt), separada de la
# categoria 19 que ya tradujimos (nombre principal del punto, point[2]).
MAP_NAMES = 21

DICT = {
  "Oak's Lab"            => "Laboratorio del Profesor Miyagi",
  "Cedolan Dept. Store"  => "Grandes Almacenes Cedolan",
  "Ice Cave"             => "Cueva de Hielo",
  "Cycle Road"           => "Ciclovía",
  "Rock Cave"            => "Cueva de Roca",
  "Diving area"          => "Zona de Buceo",
  "Patisserie Alcremie"  => "Patisserie Alcremie",
  "Pokémon Academy"      => "Academia Pokémon",
  "Mistveil Institute"   => "Instituto Velo Brumoso",
  "Riverstone Institute" => "Instituto Río Stones",
  "Trade Hall"           => "Sala de Intercambios",
  "Riverstone Stadium"   => "Estadio Río Stones",
  "Riverstone Graveyard" => "Cementerio de Río Stones",
  "Pokémon Day Care"     => "Guardería Pokémon",
  "Move Maniac"          => "Maníaco de los Movimientos",
  "Name Rater"           => "Evaluador de Nombres",
  "Kalos Museum"         => "Museo de Kalos",
  "Rotom AI Company"     => "Compañía de IA Rotom",
  "Delta Tech Company"   => "Compañía Delta Tech",
  "Southford Institute"  => "Instituto de Fuerte Sur",
  "Memorial Tower"       => "Torre Conmemorativa",
}.freeze

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  hash = data[20]
  updated = 0
  missing = []
  DICT.each do |k, v|
    unless hash.key?(k)
      missing << k
      next
    end
    hash[k] = v
    updated += 1
  end
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: actualizadas=#{updated}, no encontradas=#{missing.size}"
  puts "  Faltantes: #{missing.join(', ')}" unless missing.empty?
end
