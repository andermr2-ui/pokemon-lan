module GameData
  class Item
    attr_reader :id, :real_name, :real_name_plural, :real_description
  end
end
items_data = Marshal.load(File.binread("Data/items.dat"))
msgs = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
cat7 = msgs[7]
missing = []
items_data.each_value do |item|
  missing << item.real_name unless cat7.key?(item.real_name)
end
puts "total items=#{items_data.size}, sin extraer en absoluto=#{missing.size}"
missing.each { |m| puts "  #{m}" }
