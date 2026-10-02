require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
target_id = ARGV[0].to_i
raw.each do |id, name, compressed|
  next unless id == target_id
  source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  puts "=== #{name} (#{source.lines.size} lineas, #{source.bytesize} bytes) ==="
  puts source
end
