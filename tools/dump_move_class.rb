require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  next unless id == 258909
  source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  puts source[0,2500]
end
