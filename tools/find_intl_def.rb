require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  if source =~ /def _INTL/ || name =~ /Messages|Translat/i
    puts "=== #{name} (id #{id}) ==="
    puts source[0,3000]
    puts "..."
  end
end
