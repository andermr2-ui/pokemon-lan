# encoding: UTF-8
require_relative "rpg_stubs"

DICT_198 = {
  "\\bStop right there, I need to train!" => "\\b¡Alto ahí, necesito entrenar!",
  "\\bI wanted to train at Relic Cave, but it looks like the entrance is somewhere else..." =>
    "\\bQuería entrenar en la Cueva Fetiche, pero parece que la entrada está en otro lado...",
  "\\bThis is going to be disappointing, but you can´t enter Relic Cave from here. I wanted to look for some cool fossils in there, but this is just a dead end." =>
    "\\bVa a ser decepcionante, pero no podés entrar a la Cueva Fetiche desde acá. Quería buscar algunos fósiles copados ahí adentro, pero esto es un callejón sin salida.",
  "\\bI guess we´ll have to use the entrance on Route 10, but getting there is gonna take a while." =>
    "\\bSupongo que vamos a tener que usar la entrada de la Ruta 10, pero llegar ahí va a llevar un rato.",
}

DICT_281 = {
  "It´s an ancient plate with strange symbols." => "Es una placa antigua con símbolos extraños.",
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo acaba de brillar!",
  "Something powerful is approaching!" => "¡Algo poderoso se aproxima!",
  "\\bKOKOOO!!!" => "\\b¡KOKOOO!!!",
  "Tapu Koko disappeared. Will it come back?" => "Tapu Koko desapareció. ¿Volverá?",
}

def apply(path, dict)
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
          c2 = list[j].parameters[0]
          full += c2.dup.force_encoding("UTF-8") if c2 && !c2.empty?
          j += 1
        end
        next unless dict.key?(full)
        cmd.parameters[0] = dict[full]
        ((i + 1)...j).each { |k| list[k].parameters[0] = "" }
        count += 1
      end
    end
  end
  File.open(path, "wb") { |f| Marshal.dump(map, f) }
  puts "#{path}: #{count} reemplazos"
end

apply("Data/Map198.rxdata", DICT_198)
apply("Data/Map281.rxdata", DICT_281)
