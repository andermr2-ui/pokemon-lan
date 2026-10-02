require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
puts "Total scripts: #{raw.size}"
raw.each do |id, name, compressed|
  next unless id == 557516
  source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  idx = source.lines.index { |l| l =~ /LANGUAGES/ }
  puts source.lines[idx..idx+2].join
end
