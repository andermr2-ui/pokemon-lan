# encoding: UTF-8
require "zlib"

OLD_TEXT = "You put the {1} in\nyour Bag's <icon=bagPocket{2}>\c[1]{3}\c[0] pocket."
NEW_TEXT = "Guardaste {1} en el\nbolsillo <icon=bagPocket{2}>\c[1]{3}\c[0] de tu Mochila."

path = "Data/Scripts.rxdata"
raw = Marshal.load(File.binread(path))

total = 0
new_raw = raw.map do |id, name, compressed|
  next [id, name, compressed] unless [128533, 109831].include?(id)
  source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  count = source.scan(OLD_TEXT).size
  if count > 0
    new_source = source.gsub(OLD_TEXT, NEW_TEXT)
    total += count
    puts "#{name} (id=#{id}): #{count} reemplazos"
    [id, name, Zlib::Deflate.deflate(new_source.b)]
  else
    [id, name, compressed]
  end
end

File.open(path, "wb") { |f| Marshal.dump(new_raw, f) }
puts "TOTAL: #{total} reemplazos de string literal en Scripts.rxdata"
