require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  next unless id == 697789
  src = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  puts src[0,3000]
end
