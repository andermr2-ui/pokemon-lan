require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
scripts = raw.map { |id, name, c| Zlib::Inflate.inflate(c).force_encoding("UTF-8") }
all_source = scripts.join("\n")
intl_strings = all_source.scan(/_INTL\(\s*"((?:[^"\\]|\\.)*)"/).flatten.uniq

data = Marshal.load(File.binread("Data/messages_es_game.dat"))
cat = data[24] || {}

puts "=== FALTAN POR COMPLETO ==="
intl_strings.each do |s|
  key = s.gsub('\"', '"').gsub('\\n', "\n").gsub("\\'", "'")
  puts key.inspect unless cat.key?(key)
end

puts "\n=== PRESENTES PERO IGUALES (sin traducir) ==="
intl_strings.each do |s|
  key = s.gsub('\"', '"').gsub('\\n', "\n").gsub("\\'", "'")
  puts key.inspect if cat.key?(key) && cat[key] == key
end
