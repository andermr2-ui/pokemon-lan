# Arregla el crash "TypeError: no implicit conversion of Regexp into
# Integer" en el Estadio Rio el Ultimo (Map196, evento 6 "Stadium Guy",
# pagina 6 - anuncio de fin de semifinales / inicio de la ronda final).
# Map196 es uno de los mapas que la libreria Python rubymarshal no puede
# leer (referencia circular), asi que se usa Ruby nativo + rpg_stubs.rb.
#
# Los comandos [3],[4],[5] tenian el mismo patron de corrupcion de
# siempre (objetos anidados en vez de texto plano). Se reconstruyeron
# comparando con la pagina 4 (anuncio de fin de la PRIMERA ronda), que
# tiene la MISMA estructura y funciona bien: texto "LOS GANADORES SON:"
# seguido de los nombres de los ganadores, uno por linea. Los dos
# finalistas (segun el resto del evento) son \PN y Xarly.
require "./tools/rpg_stubs"

path = "Data/Map196.rxdata"
data = Marshal.load(File.binread(path))
ev = data.events[6].pages[6].list

puts "Antes:"
[3, 4, 5].each { |i| puts "  #{i} #{ev[i].parameters.inspect[0,150]}" }

ev[3].parameters = ["LOS GANADORES SON:"]
ev[4].parameters = ["\\PN"]
ev[5].parameters = ["Xarly"]

puts "Despues:"
[3, 4, 5].each { |i| puts "  #{i} #{ev[i].parameters.inspect}" }

File.open(path, "wb") { |f| Marshal.dump(data, f) }
puts "GUARDADO."
