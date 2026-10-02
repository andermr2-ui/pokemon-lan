require_relative "rpg_stubs"
maps = %w[009 024 036 043 053 055 057 087 093 116 127 157 184 196 210 216 233 246 325 351 086 290 291 292]
maps.each do |n|
  path = "Data/Map#{n}.rxdata"
  m = Marshal.load(File.binread(path))
  puts "map#{n} OK eventos=#{m.events.size}"
end
