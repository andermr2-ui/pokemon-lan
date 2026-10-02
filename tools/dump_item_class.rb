require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  next unless id == 578333
  src = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  File.write("tools/_item_class.rb", src)
  puts src.length
end
