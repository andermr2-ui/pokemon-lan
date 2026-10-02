require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
targets = []
raw.each do |id, name, compressed|
  source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  source.scan(/(?:_INTL|_ISPRINTF)\s*\(\s*"((?:[^"\\]|\\.)*)"/) do |m|
    targets << m[0] if m[0].include?("Bag's")
  end
end
targets.uniq.each { |t| puts eval('"' + t + '"').inspect }
