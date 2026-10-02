module RPG
  class MapInfo
    attr_reader :name, :parent_id, :order, :expanded, :scroll_x, :scroll_y
  end
end
data = Marshal.load(File.binread("Data/MapInfos.rxdata"))
[9,24,36,43,50,53,54].each { |id| puts "map#{id}: #{data[id]&.name}" }
