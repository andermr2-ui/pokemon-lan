module GameData
  class Item
    attr_reader :id, :real_name, :real_name_plural, :real_portion_name, :real_portion_name_plural
  end
end
data = Marshal.load(File.binread("Data/items.dat"))
item = data[:ALTARIANITE]
puts "real_name=#{item.real_name.inspect}"
puts "real_portion_name=#{item.real_portion_name.inspect}"
puts "real_portion_name_plural=#{item.real_portion_name_plural.inspect}"
