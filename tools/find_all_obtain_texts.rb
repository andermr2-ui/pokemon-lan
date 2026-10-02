require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
seen = {}
raw.each do |id, name, compressed|
  src = begin
    Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  rescue
    next
  end
  src.scan(/_INTL\(\s*("(?:[^"\\]|\\.)*")/).each do |m|
    text = m[0]
    next unless text =~ /You (obtained|received|found|put|gave|got)/i
    seen[text] ||= []
    seen[text] << name
  end
end
seen.each { |text, names| puts "#{text}  -- en: #{names.uniq.join(', ')}" }
