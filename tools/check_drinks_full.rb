module GameData
  class Item
    attr_reader :id, :real_name, :real_name_plural, :real_description
  end
end
data = Marshal.load(File.binread("Data/items.dat"))
[:FRESHWATER, :SODAPOP, :LEMONADE, :BERRYJUICE, :HONEY, :SACREDASH, :MAXHONEY].each do |id|
  item = data[id]
  puts "#{id}\tname=#{item.real_name.inspect}\tplural=#{item.real_name_plural.inspect}"
  puts "\tdesc=#{item.real_description.inspect}"
end
