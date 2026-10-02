# encoding: UTF-8
# Mensajes de "recibiste/encontraste un objeto" (pbReceiveItem, Mystery
# Gift, objetos tirados en el suelo). Usan \c[1]/\c[0] como codigos de
# color -- esos SI son secuencias de escape normales de Ruby (\c[1] se
# evalua a ESC+"1]"), a diferencia de \r/\b/\v en el texto de mapas, que
# deben escribirse con doble backslash. Verificado con
# eval(%q{"...\c[1]..."}) contra la clave ya existente y correcta de
# "You put the {1} in your Bag's pocket.".
#
# En español se elimina el articulo "a/an" (no hay forma de saber el
# genero del sustantivo del objeto de forma generica), dejando "Conseguiste
# {1}!" / "Encontraste {1}!" sin articulo.
DICT = {
  "You found \c[1]{1}\c[0]!" => "¡Encontraste \c[1]{1}\c[0]!",
  "You found an \c[1]{1}\c[0]!" => "¡Encontraste \c[1]{1}\c[0]!",
  "You found a \c[1]{1}\c[0]!" => "¡Encontraste \c[1]{1}\c[0]!",
  "You found {1} \c[1]{2}\c[0]!" => "¡Encontraste {1} \c[1]{2}\c[0]!",
  "You found \c[1]{1} {2}\c[0]!" => "¡Encontraste \c[1]{1} {2}\c[0]!",
  "You found {1} \c[1]{2} {3}\c[0]!" => "¡Encontraste {1} \c[1]{2} {3}\c[0]!",
  "You obtained \c[1]{1}\c[0]!" => "¡Conseguiste \c[1]{1}\c[0]!",
  "You obtained an \c[1]{1}\c[0]!" => "¡Conseguiste \c[1]{1}\c[0]!",
  "You obtained a \c[1]{1}\c[0]!" => "¡Conseguiste \c[1]{1}\c[0]!",
  "You obtained {1} \c[1]{2}\c[0]!" => "¡Conseguiste {1} \c[1]{2}\c[0]!",
  "You obtained \c[1]{1} {2}\c[0]!" => "¡Conseguiste \c[1]{1} {2}\c[0]!",
  "You obtained {1} \c[1]{2} {3}\c[0]!" => "¡Conseguiste {1} \c[1]{2} {3}\c[0]!",
  "You got away safely!" => "¡Escapaste sin problemas!",
}.freeze

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  hash = (data[24] ||= {})
  added = 0
  DICT.each do |k, v|
    added += 1 unless hash.key?(k)
    hash[k] = v
  end
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: nuevas=#{added} total=#{hash.size}"
end
