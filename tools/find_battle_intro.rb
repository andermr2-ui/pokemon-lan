require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  src = begin
    Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  rescue
    next
  end
  next unless src =~ /would like to battle|wants to battle|challenges you/i
  src.scan(/_INTL\(\s*("(?:[^"\\]|\\.)*")/).each do |m|
    puts "#{name}: #{m[0]}" if m[0] =~ /battle|challenge/i
  end
end
