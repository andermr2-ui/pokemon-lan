# encoding: UTF-8
require_relative "rpg_stubs"

DICT = {
  "It´s a Pokémon Statue dedicated to Jirachi." =>
    "Es una estatua Pokémon dedicada a Jirachi.",
  "The Delta Stone in your pocket just lit up!" =>
    "¡La Piedra Delta en tu bolsillo acaba de brillar!",
  "Something powerful is approaching!" =>
    "¡Algo poderoso se acerca!",
  "\\bJIRAAA!!!" => "\\b¡¡¡JIRAAA!!!",
  "Jirachi disappeared. Will it come back?" =>
    "Jirachi desapareció. ¿Volverá?",
}

path = "Data/Map076.rxdata"
map = File.open(path, "rb") { |f| Marshal.load(f) }
count = 0
map.events.each_value do |event|
  event.pages.each do |page|
    page.list.each do |cmd|
      next unless cmd.code == 101
      t = cmd.parameters[0]
      next unless t
      t = t.dup.force_encoding("UTF-8")
      if DICT.key?(t)
        cmd.parameters[0] = DICT[t]
        count += 1
      end
    end
  end
end
File.open(path, "wb") { |f| Marshal.dump(map, f) }
puts "#{path}: #{count} reemplazos"
