DICT = {
  "What will\nyou do?" => "¿Qué harás?",
}
key1 = "What will\n{1} throw?"
val1 = "¿Qué lanzará\n{1}?"
key2 = "What will you do with {1}?"
val2 = "¿Qué quieres hacer con {1}?"

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  hash = data[24]
  hash[key1] = val1
  hash[key2] = val2
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
end
puts "aplicado"
