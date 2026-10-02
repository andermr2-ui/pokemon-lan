require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  next unless name == "Stat"
  source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  puts source[0,1500]
end
