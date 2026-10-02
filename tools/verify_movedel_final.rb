require_relative "rpg_stubs"
%w[043 087 093 116 127 157 184 210 216 233 246 325 351].each do |n|
  m = Marshal.load(File.binread("Data/Map#{n}.rxdata"))
  puts "map#{n} OK eventos=#{m.events.size}"
end
