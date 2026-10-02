require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  src = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8") rescue next
  next unless src.include?("your Bag")
  src.each_line.with_index do |l, i|
    puts "#{name} (id=#{id}) line #{i+1}: #{l.strip}" if l.include?("your Bag")
  end
end
