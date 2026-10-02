DICT = {
  "CLOSE BAG" => "CERRAR MOCHILA",
  "Close bag." => "Cerrar mochila.",
  "Read" => "Leer",
  "Use" => "Usar",
  "Toss" => "Tirar",
  "Deselect" => "Deseleccionar",
  "Register" => "Registrar",
  "{1} is selected." => "{1} está seleccionado.",
  "There is no Pokémon." => "No hay ningún Pokémon.",
  "The {1} can't be held." => "{1} no se puede llevar.",
  "Toss out how many {1}?" => "¿Cuántos {1} quieres tirar?",
  "Is it OK to throw away {1} {2}?" => "¿Seguro que quieres tirar {1} {2}?",
  "Threw away {1} {2}." => "Tiraste {1} {2}.",
  "Do what with {1}?" => "¿Qué quieres hacer con {1}?",
  "Change quantity" => "Cambiar cantidad",
  "Make Mystery Gift" => "Crear Regalo Misterioso",
  "Choose new quantity of {1} (max. {2})." => "Elige la nueva cantidad de {1} (máx. {2}).",
  "How many do you want to withdraw?" => "¿Cuántos quieres retirar?",
  "Withdrew {1} {2}." => "Retiraste {1} {2}.",
  "There's no more room in the Bag." => "No hay más espacio en la Mochila.",
  "How many do you want to deposit?" => "¿Cuántos quieres depositar?",
  "Deposited {1} {2}." => "Depositaste {1} {2}.",
  "There's no room to store items." => "No hay espacio para guardar objetos.",
  "That's too important to toss out!" => "¡Eso es demasiado importante para tirarlo!",

  # UI_Save
  "The script is taking too long. The game will restart." => "El script está tardando demasiado. El juego se reiniciará.",
  "The game was saved." => "La partida se guardó.",
  "The previous save file has been backed up." => "Se hizo una copia de seguridad del archivo de guardado anterior.",
  "Save failed." => "Error al guardar.",
  "Player" => "Jugador",
  "Time" => "Tiempo",
  "Badges" => "Medallas",
  "Would you like to save the game?" => "¿Quieres guardar la partida?",
  "WARNING!" => "¡AVISO!",
  "There is a different game file that is already saved." => "Ya hay guardado un archivo de partida distinto.",
  "If you save now, the other file's adventure, including items and Pokémon, will be entirely lost." => "Si guardas ahora, la aventura del otro archivo, incluyendo objetos y Pokémon, se perderá por completo.",
  "Are you sure you want to save now and overwrite the other save file?" => "¿Seguro que quieres guardar ahora y sobrescribir el otro archivo de guardado?",
  "{1} saved the game." => "{1} guardó la partida.",

  # Nombres de bolsillos de la Mochila (Settings.bag_pocket_names)
  "Items" => "Objetos",
  "Medicine" => "Medicinas",
  "Poké Balls" => "Poké Balls",
  "TMs & HMs" => "MTs y MOs",
  "Berries" => "Bayas",
  "Mail" => "Correo",
  "Battle Items" => "Objetos de Combate",
  "Key Items" => "Objetos Clave",

  # Genericos Si/No (usados en muchas confirmaciones via _INTL)
  "Yes" => "Sí",
}.freeze

def normalize_key(str)
  return str unless str =~ /[\r\n\t]|\A\s+|\s+\z|\s{2,}/
  k = str.dup
  k.sub!(/\A\s+/, "")
  k.sub!(/\s+\z/, "")
  k.gsub!(/\s{2,}/, " ")
  k
end

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  hash = (data[24] ||= {})
  added = 0
  DICT.each do |raw_key, value|
    key = normalize_key(raw_key)
    added += 1 unless hash.key?(key)
    hash[key] = value
  end
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: nuevas=#{added} total=#{hash.size}"
end
