module GameData
  class Item
    attr_reader :id, :real_name, :real_name_plural, :real_description
  end
end
data = Marshal.load(File.binread("Data/items.dat"))
ids = [:MOOMOOMILK, :STRAWBERRYSWEET, :LOVESWEET, :BERRYSWEET, :CLOVERSWEET, :FLOWERSWEET, :STARSWEET, :RIBBONSWEET]
ids.each do |id|
  item = data[id]
  if item
    puts "#{id}: name=#{item.real_name.inspect} plural=#{item.real_name_plural.inspect}"
    puts "  desc=#{item.real_description.inspect}"
  else
    puts "#{id}: NO EXISTE"
  end
end
