data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
categories = {
  5=>"Nombres de movimientos", 6=>"Descripciones de movimientos",
  7=>"Nombres de objetos", 9=>"Descripciones de objetos",
  10=>"Nombres de habilidades", 11=>"Descripciones de habilidades",
  13=>"Tipos de entrenador", 14=>"Nombres de entrenadores",
  21=>"Nombres de mapas/zonas", 23=>"Frases de derrota de entrenadores",
  24=>"Textos de sistema/combate (SCRIPT_TEXTS)",
  1=>"Nombres de especies Pokémon", 3=>"Entradas de Pokédex",
}
categories.each do |idx, label|
  h = data[idx]
  next unless h.is_a?(Hash)
  done = h.count { |k,v| k != v }
  puts "#{label}: #{done}/#{h.size}"
end

maps_done = Dir.glob("Data/Map*.rxdata.bak").map { |f| File.basename(f) }.size
maps_total_with_content = Dir.glob("translations/map*.txt").size
puts ""
puts "Mapas de historia con backup (=ya reinsertados): #{maps_done}"
puts "Mapas totales con texto extraido: #{maps_total_with_content}"
