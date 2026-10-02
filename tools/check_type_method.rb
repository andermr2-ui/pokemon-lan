require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  next unless name == "Type"
  source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  idx = source.index("def name")
  puts source[idx, 150] if idx
  puts "---registros---"
  source.scan(/_INTL\("([^"]+)"\)/) { |m| puts m[0] }
end
