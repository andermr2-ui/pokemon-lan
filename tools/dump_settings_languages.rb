require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  next unless id == 557516
  source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  lines = source.lines
  idx = lines.index { |l| l =~ /LANGUAGES\s*=/ }
  puts lines[(idx-2)..(idx+10)].join
end
