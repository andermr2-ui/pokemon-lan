require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  src = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8") rescue next
  next unless src.include?("def getFromHash")
  puts "id=#{id} name=#{name}"
  File.write("tools/_translation_impl.rb", src)
end
