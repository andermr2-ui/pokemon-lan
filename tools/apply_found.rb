DICT = {
  "You found \\c[1]{1}\\c[0]!" => "¡Encontraste \\c[1]{1}\\c[0]!",
  "You found {1} \\c[1]{2} {3}\\c[0]!" => "¡Encontraste {1} \\c[1]{2} {3}\\c[0]!",
  "You found \\c[1]{1} {2}\\c[0]!" => "¡Encontraste \\c[1]{1} {2}\\c[0]!",
  "You found {1} \\c[1]{2}\\c[0]!" => "¡Encontraste {1} \\c[1]{2}\\c[0]!",
  "You found an \\c[1]{1}\\c[0]!" => "¡Encontraste un \\c[1]{1}\\c[0]!",
  "You found a \\c[1]{1}\\c[0]!" => "¡Encontraste un \\c[1]{1}\\c[0]!",
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
