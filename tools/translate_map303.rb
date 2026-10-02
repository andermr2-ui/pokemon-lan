# encoding: UTF-8
require_relative "rpg_stubs"

DICT_303 = {
  "\\bOh no, father is drinking again..." => "\\bOh no, papá está bebiendo otra vez...",
  "\\bI need to be quiet, or he´ll use the belt..." => "\\bTengo que estar callado, o usará el cinturón...",
  "\\bThese buildings really need elevators. My old bones struggle with those damn stairs." =>
    "\\bEstos edificios de verdad necesitan ascensores. Mis viejos huesos sufren con esas malditas escaleras.",
  "\\bMh, I love me some good beer." => "\\bMh, me encanta una buena cerveza.",
  "\\bWhat is a \"Sigma\" and why does it want to \"Rizz me up\"?!" =>
    "\\b¿Qué es un \"Sigma\" y por qué quiere \"engatusarme\"?!",
  "\\bOh, you look like a trainer." => "\\bOh, pareces un entrenador.",
  "\\bPLEASE TELL ME THAT YOU HAVE A MR. MIME!!!" => "\\b¡POR FAVOR, DIME QUE TIENES UN MR. MIME!!!",
  "\\bIf you have a Mr. Mime, specifically the Kanto Form, then please trade it for my Galarian Mr. Mime." =>
    "\\bSi tienes un Mr. Mime, específicamente la forma de Kanto, por favor, cámbialo por mi Mr. Mime de Galar.",
  "\\bI found mine while I was on vacation in Galar, but it´s too cold for me, so I really want a Kanto one." =>
    "\\bEncontré el mío mientras estaba de vacaciones en Galar, pero hace demasiado frío para mí, así que de verdad quiero uno de Kanto.",
  "\\bCan you trade a Kanto Mr. Mime for mine? Please!!!" =>
    "\\b¿Puedes cambiar un Mr. Mime de Kanto por el mío? ¡Por favor!!!",
  "\\bYou don't want to trade?  Aww..." => "\\b¿No quieres intercambiar? Vaya...",
  "\\bYou don't want to trade? Aww..." => "\\b¿No quieres intercambiar? Vaya...",
  "\\bOK, let's get started." => "\\bVale, empecemos.",
  "\\PN traded Mr. Mime for Mr. Mime!" => "¡\\PN intercambió Mr. Mime por Mr. Mime!",
  "\\bThank you so much! I finally have what I´ve been looking for, and you have something that you won´t find anywhere else in this region." =>
    "\\b¡Muchísimas gracias! Por fin tengo lo que estaba buscando, y tú tienes algo que no encontrarás en ningún otro lugar de esta región.",
  "\\bThanks for trading with me!" => "\\b¡Gracias por intercambiar conmigo!",
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

apply("Data/Map303.rxdata", DICT_303)
