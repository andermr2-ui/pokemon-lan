# encoding: UTF-8
require_relative "rpg_stubs"

VENDING = {
  "It's a vending machine.\\nWhich drink would you like?\\G" =>
    "Es una máquina expendedora.\\n¿Qué bebida te gustaría?\\G",
  "\\GA Fresh Water dropped down!" => "\\G¡Cayó un Agua Fresca!",
  "\\GBonus! Another Fresh Water dropped down." => "\\G¡Bonus! Cayó otra Agua Fresca.",
  "\\GYou have no room left in the Bag." => "\\GNo te queda espacio en la Mochila.",
  "\\GYou don't have enough money." => "\\GNo tienes suficiente dinero.",
  "\\GA Soda Pop dropped down!" => "\\G¡Cayó un Refresco!",
  "\\GBonus! Another Soda Pop dropped down." => "\\G¡Bonus! Cayó otro Refresco.",
  "\\GA Lemonade dropped down!" => "\\G¡Cayó una Limonada!",
  "\\GBonus! Another Lemonade dropped down." => "\\G¡Bonus! Cayó otra Limonada.",
  "\\GDecided not to buy a drink." => "\\GDecidiste no comprar ninguna bebida.",
}

VENDING_CHOICES = {
  "Fresh Water - $200|Soda Pop - $300|Lemonade - $350|Cancel" =>
    "Agua Fresca - 200 ₽|Refresco - 300 ₽|Limonada - 350 ₽|Cancelar",
}

DICT_136 = VENDING.merge({
  "\\sign[signskin]Rooftop Square: Vending Machines" =>
    "\\sign[signskin]Plaza de la Azotea: Máquinas Expendedoras",
  "\\bWow, we´re super high up! I need to hold on to my hat, it´s quite windy up here." =>
    "\\bVaya, ¡estamos súper alto! Tengo que sujetarme el sombrero, hace bastante viento aquí arriba.",
  "\\bWhy does the bloody elevator stop at the fifth floor?! I had to use stairs for the final bit, and now I´m exhausted." =>
    "\\b¿Por qué el maldito ascensor para en el quinto piso?! Tuve que subir por las escaleras el último tramo, y ahora estoy agotado.",
  "\\bNow I need a drink..." => "\\bAhora necesito una bebida...",
})

def apply(path, dict, choices = {})
  map = File.open(path, "rb") { |f| Marshal.load(f) }
  count = 0
  map.events.each_value do |event|
    event.pages.each do |page|
      list = page.list
      list.each_with_index do |cmd, i|
        if cmd.code == 101
          t = cmd.parameters[0]
          next unless t
          t = t.dup.force_encoding("UTF-8")
          j = i + 1
          full = t.dup
          while list[j] && list[j].code == 401
            c2 = list[j].parameters[0]
            full += c2.dup.force_encoding("UTF-8") if c2 && !c2.empty?
            j += 1
          end
          next unless dict.key?(full)
          cmd.parameters[0] = dict[full]
          ((i + 1)...j).each { |k| list[k].parameters[0] = "" }
          count += 1
        elsif cmd.code == 102
          opts = cmd.parameters[0]
          next unless opts.is_a?(Array)
          joined = opts.join("|")
          if choices.key?(joined)
            cmd.parameters[0] = choices[joined].split("|")
            count += 1
          end
        end
      end
    end
  end
  File.open(path, "wb") { |f| Marshal.dump(map, f) }
  puts "#{path}: #{count} reemplazos"
end

apply("Data/Map136.rxdata", DICT_136, VENDING_CHOICES)
