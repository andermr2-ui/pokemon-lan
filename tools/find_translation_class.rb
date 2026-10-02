require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  src = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8") rescue next
  next unless src =~ /class Translation/
  puts "id=#{id} name=#{name}, len=#{src.length}"
  File.write("tools/_translation_class.rb", src)
end
