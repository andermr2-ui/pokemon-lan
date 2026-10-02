require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  next unless id == 557516
  source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  File.write("tools/_settings_full.rb", source)
end
