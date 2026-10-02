module GameData
  class Item
    attr_reader :id, :real_name, :real_portion_name, :real_portion_name_plural
  end
end
data = Marshal.load(File.binread("Data/items.dat"))
containers = {}
data.each_value do |item|
  next unless item.real_portion_name
  m = item.real_portion_name.match(/^(.*?) of #{Regexp.escape(item.real_name)}$/)
  next unless m
  containers[m[1]] = true
end
containers.keys.sort.each { |c| puts c }
