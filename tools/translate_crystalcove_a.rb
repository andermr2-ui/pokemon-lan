# encoding: UTF-8
require_relative "rpg_stubs"

DICT_157 = {
  "\\bI gotta leave this town as soon as possible. I don´t like getting wet, so this place is hell." =>
    "\\bTengo que irme de este pueblo cuanto antes. No me gusta mojarme, así que este sitio es un infierno.",
}

DICT_306 = {
  "\\bMan, moving all of our stuff sure is exhausting. But I´d rather carry all of these boxes on my own than paying for the Machamp Moving Service." =>
    "\\bTío, mudar todas nuestras cosas es agotador de verdad. Pero prefiero cargar todas estas cajas yo solo antes que pagar el Servicio de Mudanzas Machamp.",
  "\\bMoving to the Delta Region was by far the biggest decision of our lives. I grew up in Unova, but it´s just too busy over there." =>
    "\\bMudarnos a la Región Delta fue, sin duda, la decisión más grande de nuestras vidas. Crecí en Unova, pero allí todo es demasiado ajetreado.",
  "\\bCrystal Cove is the perfect place for us, it´s such a relaxed little town." =>
    "\\bCueva de la Meta es el lugar perfecto para nosotros, es un pueblecito muy relajado.",
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

apply("Data/Map157.rxdata", DICT_157)
apply("Data/Map306.rxdata", DICT_306)
