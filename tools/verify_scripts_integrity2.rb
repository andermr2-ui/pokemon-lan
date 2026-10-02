require "zlib"

old_raw = Marshal.load(File.binread("Data/Scripts.rxdata.bak2"))
new_raw = Marshal.load(File.binread("Data/Scripts.rxdata"))

if old_raw.size != new_raw.size
  puts "DIFERENCIA DE TAMANO: #{old_raw.size} vs #{new_raw.size}"
  exit 1
end

diffs = []
old_raw.each_index do |i|
  old_id, old_name, old_c = old_raw[i]
  new_id, new_name, new_c = new_raw[i]
  if old_id != new_id || old_name != new_name
    diffs << "id/nombre distinto en posicion #{i}"
    next
  end
  old_src = Zlib::Inflate.inflate(old_c)
  new_src = Zlib::Inflate.inflate(new_c)
  diffs << "#{new_name} (id #{new_id}): fuente distinta" if old_src != new_src
end

puts "Scripts distintos: #{diffs.size}"
diffs.each { |d| puts "  - #{d}" }
