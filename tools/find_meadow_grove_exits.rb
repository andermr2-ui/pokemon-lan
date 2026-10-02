require_relative "rpg_stubs"
module RPG
  class MapInfo
    attr_reader :name
  end
end
infos = Marshal.load(File.binread("Data/MapInfos.rxdata"))
m = Marshal.load(File.binread("Data/Map033.rxdata"))
dest_ids = []
m.events.each_value do |ev|
  ev.pages.each do |pg|
    pg.list.each do |cmd|
      next unless cmd.code == 201
      dest_ids << cmd.parameters[1]
    end
  end
end
dest_ids.uniq.sort.each { |id| puts "map#{id}: #{infos[id]&.name}" }
