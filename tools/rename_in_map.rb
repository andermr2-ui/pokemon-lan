# Reemplazo de texto simple dentro de un mapa YA traducido (para retoques
# puntuales tipo "cambiar nombre de personaje"), sin depender de indices de
# comandos. Recorre todos los code=101 y hace un gsub de old->new.
#
# Uso: ruby rename_in_map.rb <numero de mapa> <texto viejo> <texto nuevo>

require_relative "rpg_stubs"

map_num, old_text, new_text = ARGV
abort "Uso: ruby rename_in_map.rb <numero de mapa> <viejo> <nuevo>" unless map_num && old_text && new_text

path = "Data/Map#{map_num}.rxdata"
map = File.open(path, "rb") { |f| Marshal.load(f) }

count = 0
map.events.each_value do |event|
  event.pages.each do |page|
    page.list.each do |cmd|
      next unless cmd.code == 101
      text = cmd.parameters[0]
      next unless text
      text = text.dup.force_encoding("UTF-8")
      if text.include?(old_text)
        cmd.parameters[0] = text.gsub(old_text, new_text)
        count += 1
      end
    end
  end
end

if count > 0
  File.open(path, "wb") { |f| Marshal.dump(map, f) }
  puts "#{count} reemplazos aplicados en #{path}"
else
  puts "No se encontro #{old_text.inspect} en #{path}"
end
