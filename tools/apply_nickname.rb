DICT = {
  "Would you like to give a nickname to {1}?" => "¿Quieres ponerle un apodo a {1}?",
  "{1}'s nickname?" => "¿Apodo de {1}?",
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
