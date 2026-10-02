require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  src = begin
    Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  rescue
    next
  end
  next unless src.include?("threw a") || src.include?("so close")
  puts "id=#{id} name=#{name}"
  src.each_line.with_index do |l, i|
    puts "  #{i+1}: #{l}" if l.include?("threw a") || l.include?("so close")
  end
end
