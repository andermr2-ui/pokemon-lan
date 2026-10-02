module RPG
  class MapInfo
    attr_reader :name, :parent_id, :order
  end
end
infos = Marshal.load(File.binread("Data/MapInfos.rxdata"))
# Build children map
children = Hash.new { |h,k| h[k] = [] }
infos.each { |id, info| children[info.parent_id] << id }
def print_tree(id, infos, children, depth, out)
  info = infos[id]
  return unless info
  out << ("  " * depth) + "#{id}: #{info.name}"
  kids = children[id].sort_by { |k| infos[k].order }
  kids.each { |k| print_tree(k, infos, children, depth+1, out) }
end
out = []
top = children[0].sort_by { |k| infos[k].order }
top.each { |id| print_tree(id, infos, children, 0, out) }
File.write("tools/_map_tree.txt", out.join("\n"))
puts "escrito, #{out.size} lineas"
