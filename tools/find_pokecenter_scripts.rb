require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  next unless name.to_s =~ /pokemoncenter|healing|nurse/i
  puts "#{id}\t#{name}"
end
