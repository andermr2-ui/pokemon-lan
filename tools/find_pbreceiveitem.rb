require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  src = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8") rescue next
  next unless src =~ /def pbReceiveItem/
  puts "id=#{id} name=#{name}"
  idx = src.index("def pbReceiveItem")
  puts src[idx, 1200]
end
