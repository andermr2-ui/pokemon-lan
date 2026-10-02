require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  if name =~ /MessageTypes/i || source =~ /module MessageTypes/
    puts "=== #{name} (id #{id}) ==="
    puts source
  end
end
