# encoding: UTF-8
module GameData
  class Item
    attr_reader :id, :real_name, :real_name_plural, :real_description
  end
end
items = Marshal.load(File.binread("Data/items.dat"))
puts "Total objetos en items.dat: #{items.size}"

data = Marshal.load(File.binread("Data/messages_es_game.dat"))
cat_name = data[7] || {}
cat_plural = data[8] || {}
cat_desc = data[9] || {}

missing_name = 0
untranslated_name = 0
missing_desc = 0
untranslated_desc = 0

items.each_value do |item|
  n = item.real_name
  d = item.real_description
  if !cat_name.key?(n)
    missing_name += 1
  elsif cat_name[n] == n
    untranslated_name += 1
  end
  if !cat_desc.key?(d)
    missing_desc += 1
  elsif cat_desc[d] == d
    untranslated_desc += 1
  end
end

puts "NOMBRES: faltan=#{missing_name} sin_traducir=#{untranslated_name} total_cat7=#{cat_name.size}"
puts "DESCRIPCIONES: faltan=#{missing_desc} sin_traducir=#{untranslated_desc} total_cat9=#{cat_desc.size}"
