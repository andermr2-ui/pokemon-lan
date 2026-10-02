# encoding: UTF-8
module GameData
  class Item
    attr_reader :id, :real_name, :real_name_plural, :real_description
  end
end
items = Marshal.load(File.binread("Data/items.dat"))
data = Marshal.load(File.binread("Data/messages_es_game.dat"))
cat_name = data[7] || {}
cat_plural = data[8] || {}
cat_desc = data[9] || {}

def status(cat, key)
  if !cat.key?(key)
    "MISSING"
  elsif cat[key] == key
    "UNTRANSLATED"
  else
    "TRANSLATED"
  end
end

File.open("tools/_items_all.tsv", "wb") do |f|
  f.write("id\tinternal\tnombre_en\tplural_en\tdesc_en\testado_nombre\testado_plural\testado_desc\n".b)
  items.each_value do |item|
    n = item.real_name
    p = item.real_name_plural
    d = item.real_description
    row = [
      item.id,
      item.id.to_s,
      n.gsub("\t", " ").gsub("\n", "\\n"),
      p.gsub("\t", " ").gsub("\n", "\\n"),
      d.gsub("\t", " ").gsub("\n", "\\n"),
      status(cat_name, n),
      status(cat_plural, p),
      status(cat_desc, d),
    ].join("\t")
    f.write((row + "\n").encode("UTF-8").b)
  end
end
puts "Volcado #{items.size} objetos a tools/_items_all.tsv"
