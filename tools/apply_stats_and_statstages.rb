STAT_NAMES = {
  "HP" => "PS",
  "Attack" => "Ataque",
  "Atk" => "Ata",
  "Defense" => "Defensa",
  "Def" => "Def",
  "Special Attack" => "Ataque Especial",
  "SpAtk" => "AtqEsp",
  "Special Defense" => "Defensa Especial",
  "SpDef" => "DefEsp",
  "Speed" => "Velocidad",
  "Spd" => "Vel",
  "accuracy" => "precisión",
  "Acc" => "Prec",
  "evasiveness" => "evasión",
  "Eva" => "Eva",
}

STAT_STAGE_MESSAGES = {
  "{1}'s {2} won't go any higher!" => "¡El {2} de {1} no puede subir más!",
  "{1}'s {2} rose!" => "¡El {2} de {1} subió!",
  "{1}'s {2} rose sharply!" => "¡El {2} de {1} subió mucho!",
  "{1}'s {2} rose drastically!" => "¡El {2} de {1} subió muchísimo!",
  "{1}'s {2} raised its {3}!" => "¡{2} de {1} subió su {3}!",
  "{1}'s {2} sharply raised its {3}!" => "¡{2} de {1} subió mucho su {3}!",
  "{1}'s {2} drastically raised its {3}!" => "¡{2} de {1} subió muchísimo su {3}!",
  "{1}'s {2} raised {3}'s {4}!" => "¡{2} de {1} subió el {4} de {3}!",
  "{1}'s {2} sharply raised {3}'s {4}!" => "¡{2} de {1} subió mucho el {4} de {3}!",
  "{1}'s {2} drastically raised {3}'s {4}!" => "¡{2} de {1} subió muchísimo el {4} de {3}!",
  "{1} is protected by its substitute!" => "¡{1} está protegido por su sustituto!",
  "{1} is protected by Mist!" => "¡{1} está protegido por Neblina!",
  "{1}'s {2} won't go any lower!" => "¡El {2} de {1} no puede bajar más!",
  "{1}'s {2} activated!" => "¡{2} de {1} se activó!",
  "{1}'s {2} fell!" => "¡El {2} de {1} bajó!",
  "{1}'s {2} harshly fell!" => "¡El {2} de {1} bajó mucho!",
  "{1}'s {2} severely fell!" => "¡El {2} de {1} bajó muchísimo!",
  "{1}'s {2} lowered its {3}!" => "¡{2} de {1} bajó su {3}!",
  "{1}'s {2} harshly lowered its {3}!" => "¡{2} de {1} bajó mucho su {3}!",
  "{1}'s {2} severely lowered its {3}!" => "¡{2} de {1} bajó muchísimo su {3}!",
  "{1}'s {2} lowered {3}'s {4}!" => "¡{2} de {1} bajó el {4} de {3}!",
  "{1}'s {2} harshly lowered {3}'s {4}!" => "¡{2} de {1} bajó mucho el {4} de {3}!",
  "{1}'s {2} severely lowered {3}'s {4}!" => "¡{2} de {1} bajó muchísimo el {4} de {3}!",
  "{1}'s substitute protected it from {2}'s {3}!" => "¡El sustituto de {1} lo protegió de {3} de {2}!",
  "{1}'s {2} cannot be lowered!" => "¡El {2} de {1} no puede bajar!",
  "{1}'s {2} prevents {3} loss!" => "¡{2} de {1} evita la pérdida de {3}!",
  "{1} is protected from {2}'s {3} by Mist!" => "¡{1} está protegido de {3} de {2} por Neblina!",
  "{1}'s {2} prevented {3}'s {4} from working!" => "¡{2} de {1} impidió que {4} de {3} funcionara!",
  "{1} is protected from {2}'s {3} by {4}'s {5}!" => "¡{1} está protegido de {3} de {2} por {5} de {4}!",
}

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  hash = (data[24] ||= {})
  added = 0
  STAT_NAMES.merge(STAT_STAGE_MESSAGES).each do |key, value|
    added += 1 unless hash.key?(key)
    hash[key] = value
  end
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: nuevas=#{added} total=#{hash.size}"
end
