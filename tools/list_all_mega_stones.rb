module GameData
  class Item
    attr_reader :id, :real_name, :real_name_plural, :real_description
  end
end
data = Marshal.load(File.binread("Data/items.dat"))
mega = data.select { |k,v| v.real_name.to_s.end_with?("ite") && v.real_name != "Everstone" }
puts mega.size
mega.each { |k,v| puts "#{k}: #{v.real_name}" }
