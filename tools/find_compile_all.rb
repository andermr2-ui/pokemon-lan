require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw.each do |id, name, compressed|
  source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  if source =~ /def self\.compile_all|compile_all\(/
    puts "=== #{name} (#{id}) ==="
    source.lines.each_with_index do |l, i|
      puts "#{i+1}: #{l}" if l =~ /compile_all/
    end
  end
end
