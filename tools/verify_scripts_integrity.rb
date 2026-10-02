# Compara Scripts.rxdata actual contra el backup: confirma que la UNICA
# diferencia real es el bloque LANGUAGES que tocamos a proposito, y que todo
# lo demas (los otros 401 scripts) sigue byte-por-byte identico tras
# descomprimir.
require "zlib"

old_raw = Marshal.load(File.binread("Data/Scripts.rxdata.bak"))
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
    diffs << "id/nombre distinto en posicion #{i}: #{old_id.inspect}/#{old_name.inspect} vs #{new_id.inspect}/#{new_name.inspect}"
    next
  end
  old_src = Zlib::Inflate.inflate(old_c)
  new_src = Zlib::Inflate.inflate(new_c)
  diffs << "#{new_name} (id #{new_id}): fuente distinta" if old_src != new_src
end

puts "Scripts distintos: #{diffs.size}"
diffs.each { |d| puts "  - #{d}" }
