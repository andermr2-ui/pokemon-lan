require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
scripts = raw.map { |id, name, c| Zlib::Inflate.inflate(c).force_encoding("UTF-8") }
all_source = scripts.join("\n")
intl_strings = all_source.scan(/_INTL\(\s*"((?:[^"\\]|\\.)*)"/).flatten.uniq
puts "Total strings unicas _INTL en scripts: #{intl_strings.size}"

data = Marshal.load(File.binread("Data/messages_es_game.dat"))
cat = data[24] || {}
missing = 0
untranslated = 0
intl_strings.each do |s|
  key = s.gsub('\"', '"').gsub('\\n', "\n").gsub("\\'", "'")
  if !cat.key?(key)
    missing += 1
  elsif cat[key] == key
    untranslated += 1
  end
end
puts "faltan por completo: #{missing}"
puts "presentes pero iguales (sin traducir): #{untranslated}"
puts "total cat24 actual: #{cat.size}"
