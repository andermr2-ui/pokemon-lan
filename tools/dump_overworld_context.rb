require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  next unless id == 128533
  src = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  lines = src.each_line.to_a
  [681, 731, 747].each do |ln|
    puts "--- linea #{ln} ---"
    puts lines[(ln-3)..(ln+2)]
  end
end
