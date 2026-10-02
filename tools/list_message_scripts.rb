require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  puts "#{id}: #{name}" if name =~ /Messag/i
end
