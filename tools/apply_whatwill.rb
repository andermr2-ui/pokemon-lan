require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
target = nil
raw.each do |id, name, compressed|
  source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  source.scan(/(?:_INTL|_ISPRINTF)\s*\(\s*"((?:[^"\\]|\\.)*)"/) do |m|
    target = m[0] if m[0].include?("What will")
  end
end
real_key = eval('"' + target + '"')
puts "Clave real: #{real_key.inspect}"

value = "¿Qué hará\n#{'{1}'}?"

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  data[24][real_key] = value
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
end
puts "aplicado: #{real_key.inspect} => #{value.inspect}"
