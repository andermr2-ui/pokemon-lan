require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  next unless name == "Nature"
  source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  source.scan(/_INTL\("([^"]+)"\)/) { |m| puts m[0] }
end
