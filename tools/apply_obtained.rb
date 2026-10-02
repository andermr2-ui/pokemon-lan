DICT = {
  "{1} obtained {2}!" => "¡{1} consiguió a {2}!",
  "{1} obtained {2}." => "{1} consiguió {2}.",
  "You obtained \\c[1]{1}\\c[0]!" => "¡Conseguiste \\c[1]{1}\\c[0]!",
  "You obtained {1} \\c[1]{2} {3}\\c[0]!" => "¡Conseguiste {1} \\c[1]{2} {3}\\c[0]!",
  "You obtained \\c[1]{1} {2}\\c[0]!" => "¡Conseguiste \\c[1]{1} {2}\\c[0]!",
  "You obtained {1} \\c[1]{2}\\c[0]!" => "¡Conseguiste {1} \\c[1]{2}\\c[0]!",
  "You obtained an \\c[1]{1}\\c[0]!" => "¡Conseguiste un \\c[1]{1}\\c[0]!",
  "You obtained a \\c[1]{1}\\c[0]!" => "¡Conseguiste un \\c[1]{1}\\c[0]!",
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
