require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  src = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8") rescue next
  if src.include?("Link Play")
    puts "id=#{id} name=#{name}"
    src.each_line.with_index { |l,i| puts "  #{i+1}: #{l}" if l.include?("Link Play") }
  end
end
