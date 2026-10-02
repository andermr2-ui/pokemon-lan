require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  next unless id == 743756
  source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  File.write("tools/_intl_messages_full.rb", source)
  puts "guardado, #{source.lines.size} lineas"
end
