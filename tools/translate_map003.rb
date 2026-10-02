# encoding: UTF-8
require_relative "rpg_stubs"

DICT = {
  "\\bHello young Trainer. Route 2 lies ahead. Take this for your journey." =>
    "\\bHola, joven entrenador. La Ruta 2 está más adelante. Toma esto para tu viaje.",
  "\\bTake care!" => "\\b¡Cuídate!",
}

path = "Data/Map003.rxdata"
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
