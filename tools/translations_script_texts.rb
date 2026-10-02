# Diccionario ingles->espanol para MessageTypes::SCRIPT_TEXTS (indice 24 en
# messages_game.dat). Cubre UI_PauseMenu, UI_Load y UI_PC. Las rutas de
# graficos tipo "Graphics/UI/Controls help/help_f1" NO se incluyen a proposito
# (no son texto, son paths de archivo -- si no estan en el hash, _INTL
# devuelve el string original sin tocar, que es justo lo que queremos).

SCRIPT_TEXTS_ES = {
  # --- UI_PauseMenu ---
  "The player trainer was not defined, so the pause menu can't be displayed." =>
    "El entrenador jugador no está definido, así que no se puede mostrar el menú de pausa.",
  "Please see the documentation to learn how to set up the trainer player." =>
    "Consulta la documentación para saber cómo configurar el entrenador jugador.",
  "Bag" => "Mochila",
  "Town Map" => "Mapa",
  "Save" => "Guardar",
  "Options" => "Opciones",
  "Quit Game" => "Salir del juego",
  "Are you sure you want to quit the game?" => "¿Seguro que quieres salir del juego?",

  # --- UI_Load ---
  "Badges:" => "Medallas:",
  "Pokédex:" => "Pokédex:",
  "Time:" => "Tiempo:",
  "Player character {1}'s walking charset was not found (filename: \"{2}\")." =>
    "No se encontró el charset de andar del personaje {1} (archivo: \"{2}\").",
  "The save file is corrupt. A backup will be loaded." =>
    "El archivo de guardado está dañado. Se cargará una copia de seguridad.",
  "The save file is corrupt, or is incompatible with this game." =>
    "El archivo de guardado está dañado o es incompatible con este juego.",
  "Do you want to delete the save file and start anew?" =>
    "¿Quieres borrar el archivo de guardado y empezar de nuevo?",
  "Delete all saved data?" => "¿Borrar todos los datos guardados?",
  "Once data has been deleted, there is no way to recover it." =>
    "Una vez borrados los datos, no hay forma de recuperarlos.",
  "Delete the saved data anyway?" => "¿Borrar los datos guardados de todos modos?",
  "Deleting all data. Don't turn off the power." =>
    "Borrando todos los datos. No apagues la consola.",
  "No save file was found." => "No se encontró ningún archivo de guardado.",
  "The saved data was deleted." => "Los datos guardados se han borrado.",
  "All saved data could not be deleted." => "No se pudieron borrar todos los datos guardados.",
  "Continue" => "Continuar",
  "Mystery Gift" => "Regalo Misterioso",
  "New Game" => "Nuevo Juego",
  "Language" => "Idioma",

  # --- UI_PC ---
  "Withdraw Item" => "Retirar objeto",
  "Deposit Item" => "Depositar objeto",
  "Toss Item" => "Tirar objeto",
  "Exit" => "Salir",
  "Take out items from the PC." => "Saca objetos del PC.",
  "Store items in the PC." => "Guarda objetos en el PC.",
  "Throw away items stored in the PC." => "Tira objetos guardados en el PC.",
  "Go back to the previous menu." => "Vuelve al menú anterior.",
  "There are no items." => "No hay objetos.",
  "There's no Mail here." => "No hay correo aquí.",
  "Cancel" => "Cancelar",
  "What do you want to do with {1}'s Mail?" => "¿Qué quieres hacer con el correo de {1}?",
  "Read" => "Leer",
  "Move to Bag" => "Mover a la Mochila",
  "Give" => "Dar",
  "The message will be lost. Is that OK?" => "El mensaje se perderá. ¿De acuerdo?",
  "The Mail was returned to the Bag with its message erased." =>
    "El correo volvió a la Mochila con el mensaje borrado.",
  "The Bag is full." => "La Mochila está llena.",
  "{1} booted up the PC." => "{1} encendió el PC.",
  "What do you want to do?" => "¿Qué quieres hacer?",
  "Item Storage" => "Almacén de objetos",
  "Mailbox" => "Buzón",
  "Turn Off" => "Apagar",
  "Which PC should be accessed?" => "¿A qué PC quieres acceder?",
  "{1}'s PC" => "PC de {1}",
  "Someone's PC" => "PC de alguien",
  "The Pokémon Storage System was opened." => "Se abrió el Sistema de Almacenamiento Pokémon.",
  "Organize Boxes" => "Organizar cajas",
  "Withdraw Pokémon" => "Retirar Pokémon",
  "Deposit Pokémon" => "Depositar Pokémon",
  "See ya!" => "¡Hasta luego!",
  "Organize the Pokémon in Boxes and in your party." => "Organiza los Pokémon en las cajas y en tu equipo.",
  "Move Pokémon stored in Boxes to your party." => "Mueve Pokémon guardados en las cajas a tu equipo.",
  "Store Pokémon in your party in Boxes." => "Guarda Pokémon de tu equipo en las cajas.",
  "Return to the previous menu." => "Vuelve al menú anterior.",
  "Your party is full!" => "¡Tu equipo está lleno!",
  "Can't deposit the last Pokémon!" => "¡No puedes depositar tu último Pokémon!",
  "Accessed {1}'s PC." => "Accediste al PC de {1}.",
  "Log off" => "Desconectar",

  # --- UI_Controls ---
  "Opens the Key Bindings window, where you can choose which keyboard keys to use for each control." =>
    "Abre la ventana de Configuración de Teclas, donde puedes elegir qué tecla usar para cada control.",
  "Take a screenshot. It is put in the same folder as the save file." =>
    "Toma una captura de pantalla. Se guarda en la misma carpeta que el archivo de guardado.",
  "Use the Arrow keys to move the main character.\n\nYou can also use the Arrow keys to select entries and navigate menus." =>
    "Usa las teclas de flecha para mover al personaje principal.\n\nTambién puedes usar las flechas para seleccionar opciones y navegar por los menús.",
  "Used to confirm a choice, interact with people and things, and move through text. (Default: C)" =>
    "Se usa para confirmar una elección, interactuar con personas y objetos, y avanzar en los textos. (Por defecto: C)",
  "Used to exit, cancel a choice, and cancel a mode. While moving around, hold to move at a different speed. (Default: X)" =>
    "Se usa para salir, cancelar una elección y cancelar un modo. Mientras te mueves, mantenla pulsada para cambiar de velocidad. (Por defecto: X)",
  "Used to open the Pause Menu. Also has various functions depending on context. (Default: Z)" =>
    "Se usa para abrir el Menú de Pausa. También tiene otras funciones según el contexto. (Por defecto: Z)",
  "Press to open the Ready Menu, where registered items and available field moves can be used. (Default: D)" =>
    "Pulsa para abrir el Menú Rápido, donde puedes usar objetos registrados y movimientos de campo disponibles. (Por defecto: D)",
}.freeze
