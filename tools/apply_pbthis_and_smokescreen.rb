SCRIPT_DICT = {
  "the opposing {1}" => "el {1} rival",
  "The opposing {1}" => "El {1} rival",
  "the wild {1}" => "el {1} salvaje",
  "The wild {1}" => "El {1} salvaje",
  "the ally {1}" => "el {1} aliado",
  "The ally {1}" => "El {1} aliado",
  "the opposing team" => "el equipo rival",
  "The opposing team" => "El equipo rival",
  "your team" => "tu equipo",
  "Your team" => "Tu equipo",
  "Max. HP<r>+{1}\nAttack<r>+{2}\nDefense<r>+{3}\nSp. Atk<r>+{4}\nSp. Def<r>+{5}\nSpeed<r>+{6}" =>
    "PS Máx.<r>+{1}\nAtaque<r>+{2}\nDefensa<r>+{3}\nAtq. Esp.<r>+{4}\nDef. Esp.<r>+{5}\nVelocidad<r>+{6}",
  "Max. HP<r>{1}\nAttack<r>{2}\nDefense<r>{3}\nSp. Atk<r>{4}\nSp. Def<r>{5}\nSpeed<r>{6}" =>
    "PS Máx.<r>{1}\nAtaque<r>{2}\nDefensa<r>{3}\nAtq. Esp.<r>{4}\nDef. Esp.<r>{5}\nVelocidad<r>{6}",
}

MOVE_NAMES = 5
MOVE_DESCRIPTIONS = 6
MOVE_NAME_DICT = { "Smokescreen" => "Pantalla de Humo" }
MOVE_DESC_DICT = { "The user releases an obscuring cloud of smoke or ink. It reduces the target's accuracy." => "El usuario libera una nube de humo o tinta que oscurece la visión. Reduce la precisión del objetivo." }

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  script_hash = (data[24] ||= {})
  added = 0
  SCRIPT_DICT.each do |k, v|
    added += 1 unless script_hash.key?(k)
    script_hash[k] = v
  end
  data[MOVE_NAMES].merge!(MOVE_NAME_DICT)
  data[MOVE_DESCRIPTIONS].merge!(MOVE_DESC_DICT)
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: SCRIPT_TEXTS nuevas=#{added}, total=#{script_hash.size}"
end
