DICT = {
  # UI_Pokedex_Main
  "Search results" => "Resultados de búsqueda",
  "Seen:" => "Vistos:",
  "Owned:" => "Poseídos:",
  "Search Mode" => "Modo de Búsqueda",
  "Order" => "Orden",
  "Type" => "Tipo",
  "Height" => "Altura",
  "Weight" => "Peso",
  "Color" => "Color",
  "Shape" => "Forma",
  "Reset" => "Reiniciar",
  "Start" => "Iniciar",
  "OK" => "Aceptar",
  "Numerical" => "Numérico",
  "A to Z" => "De A a Z",
  "Heaviest" => "Más pesado",
  "Lightest" => "Más ligero",
  "Tallest" => "Más alto",
  "Smallest" => "Más pequeño",
  "No matching Pokémon were found." => "No se encontraron Pokémon coincidentes.",
  "National Pokédex" => "Pokédex Nacional",

  # UI_Party
  "CANCEL" => "CANCELAR",
  "CONFIRM" => "CONFIRMAR",
  "[Special]: To Boxes" => "[Especial]: A las Cajas",
  "Give to which Pokémon?" => "¿A qué Pokémon dárselo?",
  "This Pokémon is holding an item. It can't hold mail." => "Este Pokémon ya lleva un objeto. No puede llevar correo.",
  "Eggs can't hold mail." => "Los huevos no pueden llevar correo.",
  "Mail was transferred from the Mailbox." => "El correo se transfirió desde el Buzón.",
  "ABLE" => "APTO",
  "NOT ABLE" => "NO APTO",
  "INELIGIBLE" => "NO ELEGIBLE",
  "NOT ENTERED" => "NO INSCRITO",
  "BANNED" => "BANEADO",
  "FIRST" => "PRIMERO",
  "SECOND" => "SEGUNDO",
  "THIRD" => "TERCERO",
  "FOURTH" => "CUARTO",
  "FIFTH" => "QUINTO",
  "SIXTH" => "SEXTO",
  "SEVENTH" => "SÉPTIMO",
  "EIGHTH" => "OCTAVO",
  "NINTH" => "NOVENO",
  "TENTH" => "DÉCIMO",
  "ELEVENTH" => "UNDÉCIMO",
  "TWELFTH" => "DUODÉCIMO",
  "Choose Pokémon and confirm." => "Elige un Pokémon y confirma.",
  "Entry" => "Inscripción",
  "No Entry" => "Sin Inscripción",
  "Summary" => "Resumen",
  "Do what with {1}?" => "¿Qué hacer con {1}?",
  "No more than {1} Pokémon may enter." => "No pueden inscribirse más de {1} Pokémon.",
  "Choose a Pokémon." => "Elige un Pokémon.",
  "Choose Pokémon or cancel." => "Elige un Pokémon o cancela.",
  "This Pokémon can't be chosen." => "Este Pokémon no puede elegirse.",
  "Move to where?" => "¿Mover adónde?",
  "Not enough HP..." => "No tiene suficientes PS...",
  "Use on which Pokémon?" => "¿Usar en qué Pokémon?",
  "{1} can't use {2} on itself!" => "¡{1} no puede usar {2} en sí mismo!",
  "{1} can't be used on an Egg!" => "¡{1} no se puede usar en un Huevo!",
  "{1} can't be used on that Pokémon." => "{1} no se puede usar en ese Pokémon.",
  "{1}'s HP was restored by {2} points." => "Los PS de {1} se restauraron en {2} puntos.",
  "Mail" => "Correo",
  "Do what with the mail?" => "¿Qué hacer con el correo?",
  "Take" => "Coger",
  "Item" => "Objeto",
  "Do what with an item?" => "¿Qué hacer con un objeto?",
  "Move" => "Mover",
  "Move {1} to where?" => "¿Mover {1} adónde?",
  "Eggs can't hold items." => "Los huevos no pueden llevar objetos.",
  "{1} was given the {2} to hold." => "Le diste {2} a {1} para que lo lleve.",
  "{1}'s mail must be removed before giving it an item." => "Hay que quitarle el correo a {1} antes de darle un objeto.",
  "{1} is already holding an {2}." => "{1} ya lleva un {2}.",
  "{1} is already holding a {2}." => "{1} ya lleva un {2}.",
  "Would you like to switch the two items?" => "¿Quieres intercambiar los dos objetos?",

  # UI_Pokegear
  "Map" => "Mapa",
  "Phone" => "Teléfono",
  "Jukebox" => "Jukebox",

  # UI_Phone
  "Registered" => "Registrado",
  "Waiting for a rematch" => "Esperando revancha",
  "There are no phone numbers stored." => "No hay números guardados.",
  "Call" => "Llamar",
  "Delete" => "Borrar",
  "Sort Contacts" => "Ordenar Contactos",
  "Are you sure you want to delete {1} from your phone?" => "¿Seguro que quieres borrar a {1} de tu teléfono?",
  "{1} was deleted from your phone contacts." => "Se borró a {1} de tus contactos telefónicos.",
  "How do you want to sort the contacts?" => "¿Cómo quieres ordenar los contactos?",
  "By name" => "Por nombre",
  "By Trainer type" => "Por tipo de Entrenador",
  "Special contacts first" => "Contactos especiales primero",

  # UI_Jukebox
  "Play: Pokémon March" => "Reproducir: Marcha Pokémon",
  "Play: Pokémon Lullaby" => "Reproducir: Nana Pokémon",
  "Play: Oak" => "Reproducir: Miyagi",
  "Play: Custom..." => "Reproducir: Personalizada...",
}.freeze

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  hash = (data[24] ||= {})
  added = 0
  DICT.each do |key, value|
    added += 1 unless hash.key?(key)
    hash[key] = value
  end
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: nuevas=#{added} total=#{hash.size}"
end
