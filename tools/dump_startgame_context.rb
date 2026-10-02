require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  next unless id == 312799
  source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  lines = source.lines
  puts lines[20..40].join
end
