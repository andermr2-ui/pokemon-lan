DICT = {
  "{1} used {2}!" => "¡{1} usó {2}!",
  "But it failed!" => "¡Pero falló!",
  "{1} is unaffected!" => "¡No afecta a {1}!",
  "{1} is unaffected because of its {2}!" => "¡No afecta a {1} debido a su {2}!",
  "{1} is unaffected because of {2}'s {3}!" => "¡No afecta a {1} debido a {3} de {2}!",
  "It's super effective on {1}!" => "¡Es muy eficaz contra {1}!",
  "It's super effective!" => "¡Es muy eficaz!",
  "It's not very effective on {1}..." => "No es muy eficaz contra {1}...",
  "It's not very effective..." => "No es muy eficaz...",
  "A critical hit on {1}!" => "¡Golpe crítico a {1}!",
  "A critical hit!" => "¡Golpe crítico!",
  "{1}'s attack missed!" => "¡El ataque de {1} falló!",
  "{1} avoided the attack!" => "¡{1} esquivó el ataque!",
  "It doesn't affect {1}..." => "No afecta a {1}...",
  "{1} must recharge!" => "¡{1} debe recargar energías!",
  "{1} flinched and couldn't move!" => "¡{1} se acobardó y no pudo moverse!",
  "{1} is confused!" => "¡{1} está confuso!",
  "It hurt itself in its confusion!" => "¡Se hizo daño a sí mismo en su confusión!",
  "{1} snapped out of its confusion." => "{1} salió de su confusión.",
  "{1} is in love with {2}!" => "¡{1} está enamorado de {2}!",
  "{1} is immobilized by love!" => "¡{1} está inmovilizado por el amor!",
  "{1} fainted!" => "¡{1} se debilitó!",
  "{1} won't obey!" => "¡{1} no obedece!",
  "{1} turned away!" => "¡{1} se dio la vuelta!",
  "{1} is loafing around!" => "¡{1} está vagueando!",
  "{1} pretended not to notice!" => "¡{1} fingió no darse cuenta!",
}.freeze

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  hash = (data[24] ||= {})
  added = 0
  DICT.each do |key, value|
    added += 1 unless hash.key?(key)
    hash[key] = value
  end
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: nuevas=#{added} total=#{hash.size}"
end
