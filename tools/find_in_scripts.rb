require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
scripts = raw.map do |id, name, compressed|
  [id, name.dup.force_encoding("UTF-8"), Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")]
end

targets = ARGV
scripts.each do |id, name, source|
  targets.each do |t|
    if source.include?(t)
      count = source.scan(t).size
      puts "#{name} (id #{id}): contiene \"#{t}\" x#{count}"
    end
  end
end
