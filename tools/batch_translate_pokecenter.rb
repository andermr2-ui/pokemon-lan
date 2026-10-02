# encoding: UTF-8
# Traduce el dialogo estandar de la Enfermera Joy (y de Bill/PC donde exista)
# que esta duplicado, texto identico, en cada mapa de Centro Pokemon del
# juego. En vez de pasar por extraer/traducir/reinsertar mapa por mapa, se
# hace un gsub directo sobre el texto en ingles en cada mapa afectado.
#
# OJO: los prefijos \r y \b NO son secuencias de escape de Ruby (retorno de
# carro / backspace) sino codigos de control LITERALES de dos caracteres
# (backslash + letra) que el motor del juego interpreta al mostrar texto.
# Por eso hay que escribirlos como "\\r"/"\\b" en el codigo fuente Ruby.
require_relative "rpg_stubs"

NURSE_DICT = {
  "\\rHello, and welcome to the Pokémon Center." =>
    "\\rHola, bienvenido al Centro Pokémon.",
  "\\rWe restore your tired Pokémon to full health." =>
    "\\rRestauramos la salud de tus Pokémon cansados.",
  "\\rWould you like to rest your Pokémon?" =>
    "\\r¿Te gustaría que tus Pokémon descansaran?",
  "\\rOK, I'll take your Pokémon for a few seconds." =>
    "\\rDe acuerdo, me llevaré a tus Pokémon unos segundos.",
  "\\rYour Pokémon may be infected by Pokérus." =>
    "\\rEs posible que tus Pokémon estén infectados de Pokérus.",
  "\\rLittle is known about the Pokérus except that they are microscopic life-forms that attach to Pokémon." =>
    "\\rSe sabe poco sobre el Pokérus, salvo que son formas de vida microscópicas que se adhieren a los Pokémon.",
  "\\rWhile infected, Pokémon are said to grow exceptionally well." =>
    "\\rSe dice que, mientras están infectados, los Pokémon crecen excepcionalmente bien.",
  "\\rThank you for waiting." =>
    "\\rGracias por esperar.",
  "\\rWe've restored your Pokémon to full health." =>
    "\\rHemos restaurado por completo la salud de tus Pokémon.",
  "\\rWe hope to see you again!" =>
    "\\r¡Esperamos volver a verte pronto!",
  "\\rFirst, you should restore your Pokémon to full health." =>
    "\\rPrimero deberías restaurar la salud de tus Pokémon.",
  "\\rYour Pokémon have been healed to perfect health." =>
    "\\rTus Pokémon han sido curados por completo.",
  "\\rWe hope you excel!" =>
    "\\r¡Esperamos que tengas mucho éxito!",
}.freeze

BILL_DICT = {
  "\\bBill: Hello! I'm \\v[2]." =>
    "\\bBill: ¡Hola! Soy \\v[2].",
  "\\bI invented the Pokémon Storage System." =>
    "\\bInventé el Sistema de Almacenamiento Pokémon.",
  "\\bWhat do you want to know?" =>
    "\\b¿Qué quieres saber?",
  "\\bAll storage box wallpapers need to be listed in class PokemonStorage, in def allWallpapers." =>
    "\\bTodos los papeles tapiz de las cajas deben figurar en la clase PokemonStorage, en def allWallpapers.",
  "\\bThey correspond to box_0.png, box_1.png, etc. in order without gaps. These images are in the folder Graphics/Pictures/Storage." =>
    "\\bCorresponden a box_0.png, box_1.png, etc. en orden y sin huecos. Esas imágenes están en la carpeta Graphics/Pictures/Storage.",
  "\\bStorage wallpapers are split into two categories: basic and special.All basic wallpapers are listed before the special wallpapers." =>
    "\\bLos papeles tapiz se dividen en dos categorías: básicos y especiales. Todos los básicos se listan antes que los especiales.",
  "\\bBasic wallpapers are always accessible, and boxes use these wallpapers by default. Numbers 0 to 15 inclusive are basic wallpapers." =>
    "\\bLos papeles tapiz básicos siempre están disponibles, y las cajas los usan por defecto. Los números del 0 al 15 inclusive son básicos.",
  "\\bSpecial wallpapers start off locked and unavailable. You can unlock them with pbUnlockWallpaper(id), where id is the wallpaper's number." =>
    "\\bLos papeles tapiz especiales empiezan bloqueados y no disponibles. Se desbloquean con pbUnlockWallpaper(id), donde id es el número del papel tapiz.",
}.freeze

CHOICE_DICT = {
  "Yes|No" => "Sí|No",
  "Wallpapers|Cancel" => "Papeles Tapiz|Cancelar",
}.freeze

ALL_DICT = NURSE_DICT.merge(BILL_DICT)

maps = Dir.glob("Data/Map[0-9]*.rxdata").select { |f| f !~ /\.bak/ }

total_files = 0
total_replacements = 0
maps.each do |path|
  map = File.open(path, "rb") { |f| Marshal.load(f) }
  count = 0
  map.events.each_value do |event|
    event.pages.each do |page|
      page.list.each do |cmd|
        if cmd.code == 101
          text = cmd.parameters[0]
          next unless text
          text = text.dup.force_encoding("UTF-8")
          if ALL_DICT.key?(text)
            cmd.parameters[0] = ALL_DICT[text]
            count += 1
          end
        elsif cmd.code == 102
          opts = cmd.parameters[0]
          next unless opts.is_a?(Array)
          joined = opts.join("|")
          if CHOICE_DICT.key?(joined)
            cmd.parameters[0] = CHOICE_DICT[joined].split("|")
            count += 1
          end
        end
      end
    end
  end
  next if count == 0
  File.open(path, "wb") { |f| Marshal.dump(map, f) }
  total_files += 1
  total_replacements += count
  puts "#{path}: #{count} reemplazos"
end

puts "TOTAL: #{total_files} mapas modificados, #{total_replacements} reemplazos"
