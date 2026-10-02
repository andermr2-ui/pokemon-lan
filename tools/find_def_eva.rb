require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  src = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  if src =~ /_INTL\(\s*"Def"\s*\)/ || src =~ /_INTL\(\s*"Eva"\s*\)/
    puts "id=#{id} name=#{name}"
    src.each_line.with_index do |line, i|
      puts "  #{i+1}: #{line}" if line =~ /"Def"|"Eva"/
    end
  end
end
