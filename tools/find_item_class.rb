require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  src = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  next unless src =~ /class Item\b/ && src =~ /DATA_FILENAME.*items\.dat/
  puts "#{id}\t#{name}"
end
