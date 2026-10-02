module GameData
  class Item
    attr_reader :id, :real_name, :real_name_plural, :real_description
  end
end
data = Marshal.load(File.binread("Data/items.dat"))
item = data[:ALTARIANITE]
if item
  puts "name=#{item.real_name.inspect} plural=#{item.real_name_plural.inspect}"
else
  puts "no existe :ALTARIANITE"
  data.each_key { |k| puts k if k.to_s.include?("ALTAR") }
end
