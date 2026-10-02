# encoding: UTF-8
# Corrige nombres de Mochis/Z-Ring a la terminologia OFICIAL de las
# localizaciones en espanol de Pokemon Escarlata/Purpura (verificado via
# WikiDex), reemplazando traducciones descriptivas hechas en una sesion
# anterior que no coincidian con el nombre oficial real.
CAT7_FIX = {
  "Z-Ring"            => "Anillo Z",
  "Health Mochi"      => "Mochi Vigor",
  "Muscle Mochi"      => "Mochi Músculo",
  "Resist Mochi"      => "Mochi Aguante",
  "Genius Mochi"      => "Mochi Intelecto",
  "Clever Mochi"      => "Mochi Mente",
  "Swift Mochi"       => "Mochi Ímpetu",
  "Fresh-Start Mochi" => "Mochi Reinicio",
}.freeze

# Plurales que faltaban (excluye Z-Crystals y Poke Ball, que oficialmente NO
# se pluralizan/traducen ni siquiera en el texto en ingles original).
CAT8_FILL = {
  "Hopo Berries"          => "Bayas Hopo",
  "Scroll of Darkness"    => "Pergamino de las Tinieblas",
  "Scroll of Waters"      => "Pergamino de las Aguas",
  "Booster Energies"      => "Energías Potenciadoras",
  "Health Mochi"          => "Mochis Vigor",
  "Muscle Mochi"          => "Mochis Músculo",
  "Resist Mochi"          => "Mochis Aguante",
  "Genius Mochi"          => "Mochis Intelecto",
  "Clever Mochi"          => "Mochis Mente",
  "Swift Mochi"           => "Mochis Ímpetu",
  "Fresh-Start Mochi"     => "Mochis Reinicio",
  "Mythical Pecha Berries" => "Bayas Pecha Míticas",
  "Z-Rings"               => "Anillos Z",
}.freeze

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  n7 = 0
  CAT7_FIX.each { |k, v| (data[7][k] = v; n7 += 1) if data[7].key?(k) }
  n8 = 0
  CAT8_FILL.each { |k, v| (data[8][k] = v; n8 += 1) if data[8].key?(k) }
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: cat7 corregidos=#{n7}, cat8 completados=#{n8}"
end
