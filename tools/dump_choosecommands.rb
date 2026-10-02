require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  next unless id == 632959
  source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  idx = source.index("class Battle::Scene::CommandMenu")
  puts source[idx, 1600] if idx
end
