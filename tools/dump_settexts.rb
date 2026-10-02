require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  next unless id == 160373
  source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  idx = source.index("def setTexts")
  puts source[idx, 1200]
end
