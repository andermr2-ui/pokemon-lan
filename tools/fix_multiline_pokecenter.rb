# encoding: UTF-8
# Segunda pasada: hay 2 lineas del dialogo estandar de la Enfermera Joy que
# el juego separa en dos comandos (101 + 401) en vez de uno solo, asi que
# no coincidian con el diccionario de bloque unico de
# batch_translate_pokecenter.rb. Se reconstruye el texto completo
# concatenando 101+401 consecutivos, se compara contra el diccionario, y si
# matchea se pone la traduccion completa en el primer comando y se vacia el
# comando 401 sobrante.
require_relative "rpg_stubs"

DICT = {
  "\\rLittle is known about the Pokérus except that they are microscopic life-forms that attach to Pokémon." =>
    "\\rSe sabe poco sobre el Pokérus, salvo que son formas de vida microscópicas que se adhieren a los Pokémon.",
  "\\rFirst, you should restore your Pokémon to full health." =>
    "\\rPrimero deberías restaurar la salud de tus Pokémon.",
  "\\rWhile infected, Pokémon are said to grow exceptionally well." =>
    "\\rSe dice que, mientras están infectados, los Pokémon crecen excepcionalmente bien.",
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

maps = Dir.glob("Data/Map[0-9]*.rxdata").select { |f| f !~ /\.bak/ }

total_files = 0
total_replacements = 0
maps.each do |path|
  map = File.open(path, "rb") { |f| Marshal.load(f) }
  count = 0
  map.events.each_value do |event|
    event.pages.each do |page|
      list = page.list
      list.each_with_index do |cmd, i|
        next unless cmd.code == 101
        t = cmd.parameters[0]
        next unless t
        t = t.dup.force_encoding("UTF-8")
        j = i + 1
        full = t.dup
        while list[j] && list[j].code == 401
          cont = list[j].parameters[0]
          full += cont.dup.force_encoding("UTF-8") if cont
          j += 1
        end
        next unless DICT.key?(full)
        cmd.parameters[0] = DICT[full]
        ((i + 1)...j).each { |k| list[k].parameters[0] = "" }
        count += 1
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
