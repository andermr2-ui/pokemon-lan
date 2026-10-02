require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
scripts = raw.map do |id, name, compressed|
  [id, name.dup.force_encoding("UTF-8"), Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")]
end

target_name = ARGV[0]
needle = ARGV[1]
scripts.each do |id, name, source|
  next unless name == target_name
  idx = source.index(needle)
  next unless idx
  puts source[[idx - 300, 0].max..idx + 300]
end
