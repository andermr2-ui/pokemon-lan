# encoding: UTF-8
require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
scripts = raw.map { |id, name, c| Zlib::Inflate.inflate(c).force_encoding("UTF-8") }
all_source = scripts.join("\n")
intl_strings = all_source.scan(/_INTL\(\s*"((?:[^"\\]|\\.)*)"/).flatten.uniq

def real_key(raw_text)
  eval('"' + raw_text + '"')
rescue StandardError
  nil
end

data = Marshal.load(File.binread("Data/messages_es_game.dat"))
cat = data[24] || {}

missing = []
untranslated = []
intl_strings.each do |s|
  key = real_key(s)
  next if key.nil?
  if !cat.key?(key)
    missing << key
  elsif cat[key] == key
    untranslated << key
  end
end

puts "Total strings unicas _INTL: #{intl_strings.size}"
puts "faltan por completo: #{missing.size}"
puts "presentes pero iguales: #{untranslated.size}"
puts "\n=== FALTAN ==="
missing.each { |k| puts k.inspect }
puts "\n=== SIN TRADUCIR ==="
untranslated.each { |k| puts k.inspect }
