# encoding: UTF-8
# Agrega la etiqueta de mensaje \pr (rol del jugador segun su outfit del
# armario, o chico/chica por genero si no tiene ninguno puesto), justo al
# lado de \pn (nombre del jugador) que ya existe en pbMessageDisplay.
require "zlib"

# Se busca por un fragmento SIN backslashes (para no depender de contar
# cuantas barras invertidas literales hay en el regex fuente) que solo
# aparece en esa linea especifica.
ANCHOR = "$player.name) if $player"

raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
found = false
raw.each_with_index do |(id, name, c), i|
  next unless name == "Messages"
  src = Zlib::Inflate.inflate(c).force_encoding("UTF-8")
  lines = src.lines
  target_idx = lines.index { |l| l.include?(ANCHOR) && l.include?("pn") }
  raise "linea ancla no encontrada, no se toca nada" unless target_idx
  raise "la etiqueta \\pr ya existe, no se toca nada" if src.include?("pr/i") && src.include?("player_role_text")
  indent = lines[target_idx][/\A\s*/]
  new_line = "#{indent}text.gsub!(/\\pr/i,  CharCustom.player_role_text) if $player && defined?(CharCustom)\n"
  lines.insert(target_idx + 1, new_line)
  new_src = lines.join
  compressed = Zlib::Deflate.deflate(new_src.dup.force_encoding("ASCII-8BIT"))
  raw[i] = [id, name, compressed]
  found = true
end
raise "Messages section not found" unless found

File.open("Data/Scripts.rxdata", "wb") { |f| Marshal.dump(raw, f) }
puts "OK: Data/Scripts.rxdata actualizado"

raw2 = Marshal.load(File.binread("Data/Scripts.rxdata"))
raw2.each do |id, name, c|
  next unless name == "Messages"
  src2 = Zlib::Inflate.inflate(c).force_encoding("UTF-8")
  if src2.include?("CharCustom.player_role_text")
    idx = src2.lines.index { |l| l.include?("CharCustom.player_role_text") }
    puts "Verificado, linea insertada:"
    puts src2.lines[idx-1..idx+1].join
  else
    puts "AVISO: algo no coincide, revisar a mano."
  end
end
