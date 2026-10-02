module GameData
  class Item
    attr_reader :id, :real_name, :real_name_plural, :real_portion_name, :real_portion_name_plural
  end
end
data = Marshal.load(File.binread("Data/items.dat"))
item = data[:MOOMOOMILK]
puts "name=#{item.real_name.inspect}"
puts "portion_name=#{item.real_portion_name.inspect}"
puts "portion_name_plural=#{item.real_portion_name_plural.inspect}"

msgs = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
puts "cat28[#{item.real_portion_name.inspect}] = #{msgs[28][item.real_portion_name].inspect}" if item.real_portion_name
puts "cat29[#{item.real_portion_name_plural.inspect}] = #{msgs[29][item.real_portion_name_plural].inspect}" if item.real_portion_name_plural
