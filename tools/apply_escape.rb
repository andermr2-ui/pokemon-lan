DICT = {
  "You got away safely!" => "¡Escapaste sin problemas!",
  "No! There's no running from a Trainer battle!" => "¡No! ¡No puedes huir de un combate contra un Entrenador!",
  "Would you like to forfeit the match and quit now?" => "¿Quieres rendirte y salir ahora?",
  "{1} forfeited the match!" => "¡{1} se rindió!",
  "You can't escape!" => "¡No puedes escapar!",
  "{1} fled using its {2}!" => "¡{1} huyó usando su {2}!",
  "{1} prevents escape with {2}!" => "¡{2} de {1} impide la huida!",
  "You couldn't get away!" => "¡No pudiste escapar!",
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
