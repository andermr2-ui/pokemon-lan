# encoding: UTF-8
require_relative "rpg_stubs"

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
          joined = opts.map { |o| o.dup.force_encoding("UTF-8") }.join("|")
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

DICT_344 = {
  "It´s a dead body..." => "Es un cadáver...",
  "\\bcosmo..." => "\\bcosmo...",
  "\\bCROZMA!!!" => "\\b¡¡¡CROZMA!!!",
  "Necrozma disappeared. Will it come back?" => "Necrozma desapareció. ¿Volverá?",
  "\\bRAIII!!!" => "\\b¡¡¡RAIII!!!",
  "Raging Bolt disappeared. Will it come back?" => "Raging Bolt desapareció. ¿Volverá?",
  "It´s a Cosmog. It looks frightened." => "Es un Cosmog. Parece asustado.",
  "\\bSmog..." => "\\bSmog...",
  "\\bCosmo!" => "\\b¡Cosmo!",
  "Cosmog seems to trust you." => "Cosmog parece confiar en ti.",
  "It wants to join you!" => "¡Quiere unirse a ti!",
  "There's no more room for Pokémon!" => "¡No queda más sitio para Pokémon!",
  "The Pokémon Boxes are full and can't accept any more!" => "¡Las Cajas de Pokémon están llenas y no pueden aceptar más!",
  "A strange noise came somewhere from Victory Road..." => "Un ruido extraño vino de algún lugar de la Avenida Victoriosa...",
  "\\bTEIII!!!" => "\\b¡¡¡TEIII!!!",
  "Gouging Fire disappeared. Will it come back?" => "Gouging Fire desapareció. ¿Volverá?",
  "\\bAHHHHHHHHHHHH!!!" => "\\b¡¡¡AHHHHHHHHHHHH!!!",
  "\\bWow, we actually made it. But once we go through that door, we might never leave again." => "\\bVaya, de verdad lo logramos. Pero una vez que crucemos esa puerta, quizá nunca más podamos salir.",
  "\\bOkay, are you ready?" => "\\bVale, ¿estás listo?",
  "\\bThen go inside the institute, and I´ll be right behind you." => "\\bEntonces entra en el instituto, iré justo detrás de ti.",
  "\\bSUIII!!!" => "\\b¡¡¡SUIII!!!",
  "Walking Wake disappeared. Will it come back?" => "Walking Wake desapareció. ¿Volverá?",
}

CHOICES_344 = {
  "Hey little guy, are you okay?|Please, let me help you." => "Eh, pequeño, ¿estás bien?|Por favor, déjame ayudarte.",
}

DICT_345 = {
  "\\bRAKION!!!" => "\\b¡¡¡RAKION!!!",
  "Iron Boulder disappeared. Will it come back?" => "Iron Boulder desapareció. ¿Volverá?",
  "It´s a dead body..." => "Es un cadáver...",
}

DICT_346 = {
  "\\bCOBA!!!" => "\\b¡¡¡COBA!!!",
  "Iron Crown disappeared. Will it come back?" => "Iron Crown desapareció. ¿Volverá?",
  "It´s a dead body..." => "Es un cadáver...",
}

DICT_347 = {
  "\\bVIRI!!!" => "\\b¡¡¡VIRI!!!",
  "Iron Leaves disappeared. Will it come back?" => "Iron Leaves desapareció. ¿Volverá?",
  "It´s a dead body..." => "Es un cadáver...",
}

DICT_348 = {
  "\\bKORA!!!" => "\\b¡¡¡KORA!!!",
  "Koraidon disappeared. Will it come back?" => "Koraidon desapareció. ¿Volverá?",
  "It´s a dead body..." => "Es un cadáver...",
  "The PC is broken..." => "El PC está roto...",
}

DICT_350 = {
  "The scientist is dead..." => "El científico está muerto...",
  "It´s a dead body..." => "Es un cadáver...",
  "It´s a time machine." => "Es una máquina del tiempo.",
  "Hoopa is staring at you with malicious intent." => "Hoopa te está mirando fijamente con intención maliciosa.",
  "\\bHOOPA!!!" => "\\b¡¡¡HOOPA!!!",
  "Hoopa is unfazed." => "Hoopa permanece impasible.",
  "It´s a machine containing a bunch of weird stuff." => "Es una máquina que contiene un montón de cosas raras.",
  "It´s a machine containing a bunch of weird stuff. Do you want to take it?" => "Es una máquina que contiene un montón de cosas raras. ¿Quieres cogerla?",
  "It´s an empty machine." => "Es una máquina vacía.",
  "\\bHOOPA! YOU BASTARD! I WILL KILL YOU WITH MY OWN HANDS!" => "\\b¡¡¡HOOPA! ¡¡¡MALDITO CABRÓN!!! ¡¡¡TE VOY A MATAR CON MIS PROPIAS MANOS!!!",
  "\\bRAAAAAAH!!!" => "\\b¡¡¡RAAAAAAH!!!",
}

apply("Data/Map344.rxdata", DICT_344, CHOICES_344)
apply("Data/Map345.rxdata", DICT_345)
apply("Data/Map346.rxdata", DICT_346)
apply("Data/Map347.rxdata", DICT_347)
apply("Data/Map348.rxdata", DICT_348)
apply("Data/Map350.rxdata", DICT_350)
