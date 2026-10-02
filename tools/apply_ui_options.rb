DICT = {
  "Close" => "Cerrar",
  "Type {1}/{2}" => "Tipo {1}/{2}",
  "Close the screen." => "Cierra la pantalla.",
  "Music Volume" => "Volumen de Música",
  "Adjust the volume of the background music." => "Ajusta el volumen de la música de fondo.",
  "SE Volume" => "Volumen de Efectos",
  "Adjust the volume of sound effects." => "Ajusta el volumen de los efectos de sonido.",
  "Text Speed" => "Velocidad del Texto",
  "Slow" => "Lenta",
  "Mid" => "Media",
  "Fast" => "Rápida",
  "Inst" => "Inst.",
  "Choose the speed at which text appears." => "Elige la velocidad a la que aparece el texto.",
  "Battle Effects" => "Efectos de Combate",
  "On" => "Sí",
  "Off" => "No",
  "Choose whether you wish to see move animations in battle." => "Elige si quieres ver las animaciones de movimientos en combate.",
  "Battle Style" => "Estilo de Combate",
  "Switch" => "Cambio",
  "Set" => "Fijo",
  "Choose whether you can switch Pokémon when an opponent's Pokémon faints." => "Elige si puedes cambiar de Pokémon cuando el Pokémon rival se debilita.",
  "Default Movement" => "Movimiento por Defecto",
  "Walking" => "Caminar",
  "Running" => "Correr",
  "Choose your movement speed. Hold Back while moving to move at the other speed." => "Elige tu velocidad de movimiento. Mantén pulsado Atrás mientras te mueves para cambiar de velocidad.",
  "Send to Boxes" => "Enviar a Cajas",
  "Manual" => "Manual",
  "Automatic" => "Automático",
  "Choose whether caught Pokémon are sent to your Boxes when your party is full." => "Elige si los Pokémon capturados se envían a tus Cajas cuando tu equipo está lleno.",
  "Give Nicknames" => "Poner Apodos",
  "Give" => "Dar",
  "Don't give" => "No dar",
  "Choose whether you can give a nickname to a Pokémon when you obtain it." => "Elige si puedes ponerle un apodo a un Pokémon cuando lo consigues.",
  "Speech Frame" => "Marco de Diálogo",
  "Choose the appearance of dialogue boxes." => "Elige la apariencia de los cuadros de diálogo.",
  "Menu Frame" => "Marco de Menú",
  "Choose the appearance of menu boxes." => "Elige la apariencia de los cuadros de menú.",
  "Text Entry" => "Entrada de Texto",
  "Cursor" => "Cursor",
  "Keyboard" => "Teclado",
  "Choose how you want to enter text." => "Elige cómo quieres introducir texto.",
  "Screen Size" => "Tamaño de Pantalla",
  "Full" => "Completa",
  "Choose the size of the game window." => "Elige el tamaño de la ventana del juego.",
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
  updated = 0
  DICT.each do |raw_key, value|
    key = normalize_key(raw_key)
    if hash.key?(key)
      updated += 1 if hash[key] != value
    else
      added += 1
    end
    hash[key] = value
  end
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: nuevas=#{added} actualizadas=#{updated} total=#{hash.size}"
end
