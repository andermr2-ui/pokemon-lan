require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  next unless id == 578333
  src = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  idx = src.index("def portion_name")
  puts src[idx-50, 900] if idx
end
