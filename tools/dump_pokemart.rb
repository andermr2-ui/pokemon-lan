require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  next unless id == 650988
  src = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  File.write("tools/_ui_pokemart_full.rb", src)
  puts src.length
end
