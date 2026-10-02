require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
names = raw.map { |id, name, _| name }
counts = names.tally
counts.each { |n, c| puts "#{n}: #{c}" if c > 1 }
puts "total scripts: #{raw.size}"
