require_relative "rpg_stubs"
%w[349 054 088 025].each do |n|
  m = Marshal.load(File.binread("Data/Map#{n}.rxdata"))
  puts "map#{n} OK eventos=#{m.events.size}"
end
