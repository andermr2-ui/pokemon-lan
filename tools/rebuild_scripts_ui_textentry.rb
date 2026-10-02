# encoding: UTF-8
require "zlib"

new_source = File.read("tools/_dump_UI_TextEntry.clean.rb", encoding: "UTF-8")

raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
found = false
raw.each_with_index do |(id, name, c), i|
  next unless name == "UI_TextEntry"
  compressed = Zlib::Deflate.deflate(new_source.dup.force_encoding("ASCII-8BIT"))
  raw[i] = [id, name, compressed]
  found = true
end
raise "UI_TextEntry section not found" unless found

File.open("Data/Scripts.rxdata", "wb") { |f| Marshal.dump(raw, f) }
puts "OK: Data/Scripts.rxdata actualizado"

# Verificacion: recargar y comparar
raw2 = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw2.each do |id, name, c|
  next unless name == "UI_TextEntry"
  src2 = Zlib::Inflate.inflate(c).force_encoding("UTF-8")
  if src2 == new_source
    puts "Verificado: el contenido reinsertado coincide byte a byte."
  else
    puts "AVISO: el contenido reinsertado NO coincide (diff de #{(src2.length - new_source.length).abs} caracteres)"
  end
end
