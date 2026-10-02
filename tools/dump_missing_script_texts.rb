# encoding: UTF-8
require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
scripts = raw.map { |id, name, c| Zlib::Inflate.inflate(c).force_encoding("UTF-8") }
all_source = scripts.join("\n")
intl_strings = all_source.scan(/_INTL\(\s*"((?:[^"\\]|\\.)*)"/).flatten.uniq

data = Marshal.load(File.binread("Data/messages_es_game.dat"))
cat = data[24] || {}

pending = []
intl_strings.each do |s|
  key = s.gsub('\"', '"').gsub('\\n', "\n").gsub("\\'", "'")
  if !cat.key?(key)
    pending << key
  elsif cat[key] == key
    pending << key
  end
end
pending.uniq!

File.open("tools/_script_texts_missing.tsv", "wb") do |f|
  f.write("idx\ttexto_ingles\n".b)
  pending.each_with_index do |s, i|
    line = "#{i + 1}\t#{s.gsub("\t", " ").gsub("\n", "\\n")}\n"
    f.write(line.encode("UTF-8").b)
  end
end
puts "Total pendientes: #{pending.size}"
