module GameData
  class Item
    attr_reader :id, :real_name, :real_name_plural, :real_description, :real_portion_name, :real_portion_name_plural
  end
end
data = Marshal.load(File.binread("Data/items.dat"))
item = data[:EXPSHARE]
puts "name=#{item.real_name.inspect}"
puts "plural=#{item.real_name_plural.inspect}"
puts "desc=#{item.real_description.inspect}"
puts "portion=#{item.real_portion_name.inspect}"
puts "portion_plural=#{item.real_portion_name_plural.inspect}"
