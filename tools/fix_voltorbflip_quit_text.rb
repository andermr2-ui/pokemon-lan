# encoding: UTF-8
# Envuelve en _INTL() el unico texto de Minigame_VoltorbFlip que no lo estaba
# (por eso no se traducia: el extractor de traduccion solo agarra texto
# dentro de _INTL()). Ver tools/_voltorbflip_dump.txt linea 408.
require "zlib"

OLD_LINE = '        if pbConfirmMessage("You haven\'t found any Coins! Are you sure you want to quit?")'
NEW_LINE = '        if pbConfirmMessage(_INTL("You haven\'t found any Coins! Are you sure you want to quit?"))'

raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
found = false
raw.each_with_index do |(id, name, c), i|
  next unless name == "Minigame_VoltorbFlip"
  src = Zlib::Inflate.inflate(c).force_encoding("UTF-8")
  raise "linea esperada no encontrada, no se toca nada" unless src.include?(OLD_LINE)
  new_src = src.sub(OLD_LINE, NEW_LINE)
  compressed = Zlib::Deflate.deflate(new_src.dup.force_encoding("ASCII-8BIT"))
  raw[i] = [id, name, compressed]
  found = true
end
raise "Minigame_VoltorbFlip section not found" unless found

File.open("Data/Scripts.rxdata", "wb") { |f| Marshal.dump(raw, f) }
puts "OK: Data/Scripts.rxdata actualizado"

raw2 = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw2.each do |id, name, c|
  next unless name == "Minigame_VoltorbFlip"
  src2 = Zlib::Inflate.inflate(c).force_encoding("UTF-8")
  if src2.include?(NEW_LINE) && !src2.include?(OLD_LINE)
    puts "Verificado: la linea quedo envuelta en _INTL() correctamente."
  else
    puts "AVISO: algo no coincide, revisar a mano."
  end
end
