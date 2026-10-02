require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  if source.include?("module GameData") || source =~ /class Move\b/
    puts "#{id}: #{name}"
  end
end
