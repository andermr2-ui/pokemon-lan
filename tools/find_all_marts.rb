module RPG
  class MapInfo
    attr_reader :name
  end
end
data = Marshal.load(File.binread("Data/MapInfos.rxdata"))
data.each do |id, info|
  puts "map#{id}: #{info.name}" if info.name =~ /mart/i
end
