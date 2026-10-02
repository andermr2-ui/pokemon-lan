require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  next unless name == "Nature"
  source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  idx = source.index("def name")
  puts source[idx, 150] if idx
end
