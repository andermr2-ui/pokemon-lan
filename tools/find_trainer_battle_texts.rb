require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
patterns = ["wants to battle", "challenges you", "would like to battle", "sent out", "is about to send", "That's using", "won against", "defeated", "victory", "used all"]
raw.each do |id, name, compressed|
  src = begin
    Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  rescue
    next
  end
  patterns.each do |p|
    next unless src.include?(p)
    src.scan(/_INTL\(\s*("(?:[^"\\]|\\.)*")/).each do |m|
      puts "#{name}: #{m[0]}" if m[0].include?(p)
    end
  end
end
