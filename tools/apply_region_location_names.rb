# encoding: UTF-8
# Categoria 19 (REGION_LOCATION_NAMES) es la que usa el mapa del Pokegear/
# Town Map para las etiquetas de ubicacion (PokemonRegionMap_Scene#pbGetMapLocation,
# via MessageTypes::REGION_LOCATION_NAMES). Es DISTINTA de la categoria 21
# (MAP_NAMES) que ya habiamos traducido -- por eso el mapa seguia en ingles.
#
# La mayoria de claves de esta categoria coinciden literalmente con nombres
# de pueblo/ciudad/ruta ya traducidos en categoria 21 (sin los sufijos de
# Gimnasio/Centro Pokemon), asi que se reusa ese valor. Los pocos nombres
# "genericos" (sin sufijo de piso/direccion) se traducen a mano manteniendo
# la misma raiz que ya usamos en los derivados.

MANUAL = {
  "Rumble Mountain" => "Montaña Calada",
  "Iron Mountain"   => "Monte Hierro",
  "Aurora Mountain"  => "Monte Auroreal",
  "Relic Cave"       => "Cueva Fetiche",
  "Here"             => "Aquí",
}.freeze

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  cat21 = data[21]
  cat19 = data[19]
  updated = 0
  unmatched = []
  cat19.each_key do |k|
    if MANUAL.key?(k)
      cat19[k] = MANUAL[k]
      updated += 1
    elsif cat21.key?(k)
      cat19[k] = cat21[k]
      updated += 1
    else
      unmatched << k
    end
  end
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: actualizadas=#{updated}/#{cat19.size}"
  puts "  Sin traducir: #{unmatched.join(', ')}" unless unmatched.empty?
end
