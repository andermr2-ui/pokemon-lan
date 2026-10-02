require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata.bak3"))
raw.each do |id, name, compressed|
  next unless id == 128533
  src = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  idx = src.index("You put the")
  puts src[idx, 90].bytes.inspect
end
