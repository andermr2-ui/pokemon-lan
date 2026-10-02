require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  next unless id == 128533
  src = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  idx = src.index("def pbReceiveItem")
  puts src[idx, 2200]
end
