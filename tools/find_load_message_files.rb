require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  src = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8") rescue next
  next unless src =~ /def self\.load_message_files|def self\.getFromHash|def self\.setMessages/
  puts "id=#{id} name=#{name}"
  idx = src.index("module MessageTypes") || 0
  puts src[idx, 3000]
end
