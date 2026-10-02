require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  next unless [4100, 342135, 578333].include?(id)
  source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  idx = source.index("def name")
  puts "=== #{name} ==="
  puts source[idx, 300] if idx
  idx2 = source.index("def description")
  puts source[idx2, 300] if idx2
  puts
end
