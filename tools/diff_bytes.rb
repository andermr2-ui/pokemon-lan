require_relative "rpg_stubs"
path = ARGV[0]
original = File.binread(path)
obj = Marshal.load(original)
roundtrip = Marshal.dump(obj)

offset = 6492
puts "ORIGINAL  [#{offset-20}..#{offset+20}]: #{original.byteslice(offset-20, 40).inspect}"
puts "ROUNDTRIP [#{offset-20}..#{offset+20}]: #{roundtrip.byteslice(offset-20, 40).inspect}"

diffs = []
[original.bytesize, roundtrip.bytesize].min.times do |i|
  diffs << i if original.getbyte(i) != roundtrip.getbyte(i)
end
puts "Total de bytes distintos: #{diffs.size}"
puts "Offsets: #{diffs.first(30).inspect}"
