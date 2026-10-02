DICT = {
  "Your other Pokémon also gained Exp. Points!" => "¡Tus otros Pokémon también ganaron Puntos de Exp.!",
  "{1} got a boosted {2} Exp. Points!" => "¡{1} ganó {2} Puntos de Exp. potenciados!",
  "{1} got {2} Exp. Points!" => "¡{1} ganó {2} Puntos de Exp.!",
  "{1} grew to Lv. {2}!" => "¡{1} subió al Nv. {2}!",
  "{1} learned {2}!" => "¡{1} aprendió {2}!",
  "{1} wants to learn {2}, but it already knows {3} moves." => "{1} quiere aprender {2}, pero ya conoce {3} movimientos.",
  "Should {1} forget a move to learn {2}?" => "¿Debería {1} olvidar un movimiento para aprender {2}?",
  "1, 2, and... ... ... Ta-da!" => "1, 2, y... ... ... ¡Tachán!",
  "{1} forgot how to use {2}. And..." => "{1} olvidó cómo usar {2}. Y...",
  "Give up on learning {1}?" => "¿Renunciar a aprender {1}?",
  "{1} did not learn {2}." => "{1} no aprendió {2}.",
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
