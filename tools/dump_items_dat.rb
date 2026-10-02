module GameData
  class Item
    attr_reader :id, :real_name, :real_name_plural, :real_description
  end
end
data = Marshal.load(File.binread("Data/items.dat"))
data.each_value do |item|
  next unless item.real_description =~ /catch rate|too heavy to throw|Feather Ball|Heavy Ball|frenzied Pokémon|arrived from the past/
  puts "id=#{item.id} name=#{item.real_name.inspect}"
  puts "  desc=#{item.real_description.inspect}"
end
