# Arregla el crash "undefined method `[]' for #<RPG::MoveRoute>" en el
# altar de Thundurus de la Ruta 13 (Map231, evento 9 "thundurus size(2,1)").
#
# Mismo patron de corrupcion de siempre: comandos code=101 (Show Text) cuyo
# parameters[0] quedo como un objeto RPG::MoveRoute en vez de un String.
# Afecta las paginas 1, 2 y 4.
#
# Reconstruido comparando con el santuario gemelo de Landorus (Map033,
# evento 17), que usa el MISMO patron de evento (copiado/adaptado por
# santuario) y tiene sus paginas intactas: TODAS sus paginas -- incluida
# la pagina de encuentro -- repiten el mismo texto plano "Es un santuario
# dedicado a <legendario>." como primera linea. La pagina 0 de nuestro
# propio evento (intacta) ya tenia ese texto para Thundurus, asi que se
# reutiliza tal cual en las paginas 1, 2 y 4.
require "./tools/rpg_stubs"
require "fileutils"

path = "Data/Map231.rxdata"
bak = "#{path}.bak_thundurus_crash"
FileUtils.cp(path, bak) unless File.exist?(bak)

data = Marshal.load(File.binread(path))
ev = data.events[9]
text = "Es un santuario dedicado a Thundurus."

[1, 2, 4].each do |pi|
  cmd = ev.pages[pi].list[0]
  raise "page #{pi} cmd0 not code=101" unless cmd.code == 101
  puts "page #{pi} antes: #{cmd.parameters.inspect}"
  cmd.parameters = [text]
  puts "page #{pi} despues: #{cmd.parameters.inspect}"
end

File.open(path, "wb") { |f| Marshal.dump(data, f) }
puts "GUARDADO."
