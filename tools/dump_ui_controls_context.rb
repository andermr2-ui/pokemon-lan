require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  next unless id == 372389
  source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  File.write("tools/_ui_controls_full.rb", source)
  puts "guardado #{source.lines.size} lineas"
end
