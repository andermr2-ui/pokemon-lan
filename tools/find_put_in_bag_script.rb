require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  src = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8") rescue next
  next unless src =~ /put the/i
  puts "id=#{id} name=#{name}"
  src.each_line.with_index { |l,i| puts "  #{i+1}: #{l}" if l =~ /put the/i }
end
