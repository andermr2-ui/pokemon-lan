require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  next unless id == 160373
  source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  idx = source.index("USE_GRAPHICS = true")
  puts source[(idx-100)..(idx+50)].inspect
end
