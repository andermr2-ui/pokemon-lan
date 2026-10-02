require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
targets = []
raw.each do |id, name, compressed|
  source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  source.scan(/(?:_INTL|_ISPRINTF)\s*\(\s*"((?:[^"\\]|\\.)*)"/) do |m|
    targets << m[0] if m[0].include?("What will")
  end
end
targets.uniq.each { |t| puts eval('"' + t + '"').inspect }

# La correcta es la que tiene "{1} do?"
correct_raw = targets.uniq.find { |t| t.include?("{1} do?") }
raise "no encontrada" unless correct_raw
correct_key = eval('"' + correct_raw + '"')
puts "CORRECTA: #{correct_key.inspect}"

wrong_key = "What will hatch from this? It doesn't seem close to hatching."
value = "¿Qué hará\n{1}?"

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  hash = data[24]
  # deshacer el error: restaurar la entrada equivocada a su valor original (sin traducir)
  hash[wrong_key] = wrong_key
  # aplicar la correcta
  hash[correct_key] = value
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
end
puts "corregido"
