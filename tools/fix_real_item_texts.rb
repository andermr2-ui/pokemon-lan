# encoding: UTF-8
#
# CAUSA RAIZ ENCONTRADA: al escribir estos diccionarios dentro de bloques
# heredoc de bash, bash colapsaba "\\c[1]" (backslash doble, el codigo de
# color LITERAL que usa el motor) a "\c[1]" (un solo backslash), y Ruby
# interpretaba ESE como un escape real (byte ESC 0x1B). El resultado
# quedaba guardado bajo una clave que NUNCA coincide con la que el juego
# realmente busca en tiempo de ejecucion. Este archivo se escribio con la
# herramienta de edicion de archivos directa (no bash), así que los
# backslashes dobles llegan intactos.
DICT = {
  "You put the {1} in\\nyour Bag's <icon=bagPocket{2}>\\c[1]{3}\\c[0] pocket." =>
    "Guardaste {1} en el\\nbolsillo <icon=bagPocket{2}>\\c[1]{3}\\c[0] de tu Mochila.",
  "You found \\c[1]{1}\\c[0]!" => "¡Encontraste \\c[1]{1}\\c[0]!",
  "You found an \\c[1]{1}\\c[0]!" => "¡Encontraste \\c[1]{1}\\c[0]!",
  "You found a \\c[1]{1}\\c[0]!" => "¡Encontraste \\c[1]{1}\\c[0]!",
  "You found {1} \\c[1]{2}\\c[0]!" => "¡Encontraste {1} \\c[1]{2}\\c[0]!",
  "You found \\c[1]{1} {2}\\c[0]!" => "¡Encontraste \\c[1]{1} {2}\\c[0]!",
  "You found {1} \\c[1]{2} {3}\\c[0]!" => "¡Encontraste {1} \\c[1]{2} {3}\\c[0]!",
  "You obtained \\c[1]{1}\\c[0]!" => "¡Conseguiste \\c[1]{1}\\c[0]!",
  "You obtained an \\c[1]{1}\\c[0]!" => "¡Conseguiste \\c[1]{1}\\c[0]!",
  "You obtained a \\c[1]{1}\\c[0]!" => "¡Conseguiste \\c[1]{1}\\c[0]!",
  "You obtained {1} \\c[1]{2}\\c[0]!" => "¡Conseguiste {1} \\c[1]{2}\\c[0]!",
  "You obtained \\c[1]{1} {2}\\c[0]!" => "¡Conseguiste \\c[1]{1} {2}\\c[0]!",
  "You obtained {1} \\c[1]{2} {3}\\c[0]!" => "¡Conseguiste {1} \\c[1]{2} {3}\\c[0]!",
}

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  hash = data[24]
  updated = 0
  missing = []
  DICT.each do |k, v|
    unless hash.key?(k)
      missing << k
      next
    end
    hash[k] = v
    updated += 1
  end
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: actualizadas=#{updated}/#{DICT.size}"
  puts "  NO ENCONTRADAS (clave distinta a la esperada): #{missing.join(' | ')}" unless missing.empty?
end
