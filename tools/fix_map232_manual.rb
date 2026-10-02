# Dos arreglos puntuales de Map232 que no son parte del diccionario
# generico de conversion Rioplatense->neutro (son contexto-dependientes):
# 1) "Dale" (muletilla rioplatense de asentimiento) -> "Venga".
# 2) Evento 13 (WeezingTrader), pagina 2 (post-intercambio): quedo un
#    comentario de desarrollo en ingles mostrado como si fuera dialogo.
require "./tools/rpg_stubs"

path = "Data/Map232.rxdata"
data = Marshal.load(File.binread(path))
events = data.events

ev4 = events[4]
ev4.pages.each do |page|
  page.list.each do |c|
    next unless c.parameters && c.parameters[0].is_a?(String)
    if c.parameters[0].include?("Dale, \\PN")
      old = c.parameters[0]
      c.parameters[0] = old.sub("Dale,", "Venga,")
      puts "Event 4: #{old.inspect} -> #{c.parameters[0].inspect}"
    end
  end
end

ev13 = events[13]
page2 = ev13.pages[1]
page2.list.each do |c|
  next unless c.parameters && c.parameters[0].is_a?(String)
  if c.parameters[0].include?("chosen Pok")
    old = c.parameters[0]
    c.parameters[0] = "\\b¡Gracias por intercambiar conmigo!"
    puts "Event 13 page2: #{old.inspect} -> #{c.parameters[0].inspect}"
  end
end

File.open(path, "wb") { |f| Marshal.dump(data, f) }
puts "GUARDADO"
