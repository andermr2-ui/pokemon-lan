module GameData
  class Item
    attr_reader :id, :real_name, :real_portion_name, :real_portion_name_plural
  end
end
data = Marshal.load(File.binread("Data/items.dat"))
data.each_value do |item|
  next unless item.real_portion_name
  puts "#{item.id}\t#{item.real_name.inspect}\tportion=#{item.real_portion_name.inspect}\tplural=#{item.real_portion_name_plural.inspect}"
end
