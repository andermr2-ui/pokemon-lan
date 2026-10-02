require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
targets = ARGV.map(&:to_i)
raw.each do |id, name, compressed|
  next unless targets.include?(id)
  source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  puts "=== #{name} (id #{id}) ==="
  source.scan(/(?:_INTL|_ISPRINTF)\s*\(\s*"((?:[^"\\]|\\.)*)"/) do |m|
    puts "  _INTL: #{m[0].inspect}"
  end
end
