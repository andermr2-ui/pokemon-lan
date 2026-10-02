# encoding: UTF-8
require_relative "rpg_stubs"

DICT_138 = {
  "\\bYou don't want to trade?  Aww..." => "\\b¿No quieres intercambiar? Vaya...",
  "\\bYou don't want to trade? Aww..." => "\\b¿No quieres intercambiar? Vaya...",
  "\\bOK, let's get started." => "\\bVale, empecemos.",
  "\\bThanks!" => "\\b¡Gracias!",
  "\\bThanks for trading with me!" => "\\b¡Gracias por intercambiar conmigo!",
  "\\bWelcome to the Trade Hall. In here, you can trade Pokémon with other trainers." =>
    "\\bBienvenido al Salón de Intercambios. Aquí puedes intercambiar Pokémon con otros entrenadores.",
  "\\bThe Pokémon that get traded here all become stronger after trading. Have fun!" =>
    "\\bLos Pokémon que se intercambian aquí se vuelven más fuertes después del intercambio. ¡Diviértete!",

  "\\bLet´s trade Haunters." => "\\bIntercambiemos Ectoplasmas.",
  "\\bDo you want to trade your Haunter for my Haunter?" =>
    "\\b¿Quieres intercambiar tu Ectoplasma por mi Ectoplasma?",
  "\\PN traded Haunter for Haunter!" => "¡\\PN intercambió Ectoplasma por Ectoplasma!",

  "\\bLet´s trade Kadabras." => "\\bIntercambiemos Kadabras.",
  "\\bDo you want to trade your Kadabra for my Kadabra?" =>
    "\\b¿Quieres intercambiar tu Kadabra por mi Kadabra?",
  "\\PN traded Kadabra for Kadabra!" => "¡\\PN intercambió Kadabra por Kadabra!",

  "\\bLet´s trade Boldores." => "\\bIntercambiemos Boldores.",
  "\\bDo you want to trade your Boldore for my Boldore?" =>
    "\\b¿Quieres intercambiar tu Boldore por mi Boldore?",
  "\\PN traded Boldore for Boldore!" => "¡\\PN intercambió Boldore por Boldore!",

  "\\bLet´s trade Gurdurrs." => "\\bIntercambiemos Gurdurrs.",
  "\\bDo you want to trade your Gurdurr for my Gurdurr?" =>
    "\\b¿Quieres intercambiar tu Gurdurr por mi Gurdurr?",
  "\\PN traded Gurdurr for Gurdurr!" => "¡\\PN intercambió Gurdurr por Gurdurr!",

  "\\bLet´s trade Machokes." => "\\bIntercambiemos Machokes.",
  "\\bDo you want to trade your Machoke for my Machoke?" =>
    "\\b¿Quieres intercambiar tu Machoke por mi Machoke?",
  "\\PN traded Machoke for Machoke!" => "¡\\PN intercambió Machoke por Machoke!",

  "\\bLet´s trade Gravelers." => "\\bIntercambiemos Gravelers.",
  "\\bDo you want to trade your Graveler for my Alolan Graveler?" =>
    "\\b¿Quieres intercambiar tu Graveler por mi Graveler de Alola?",
  "\\bDo you want to trade your Graveler for my Graveler?" =>
    "\\b¿Quieres intercambiar tu Graveler por mi Graveler?",
  "\\PN traded Graveler for Graveler!" => "¡\\PN intercambió Graveler por Graveler!",
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

apply("Data/Map138.rxdata", DICT_138)
