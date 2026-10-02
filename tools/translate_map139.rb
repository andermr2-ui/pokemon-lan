# encoding: UTF-8
require_relative "rpg_stubs"

DICT_139 = {
  "\\bI´m just the maintenance guy." => "\\bSolo soy el chico del mantenimiento.",
  "\\bEmmett is behind this door. But I´m just glad that the boosters worked!" =>
    "\\bEmmett está detrás de esta puerta. ¡Pero me alegro de que los propulsores hayan funcionado!",
  "\\bYeah, good job I guess. I´m just here for the Boosters." =>
    "\\bSí, buen trabajo, supongo. Yo solo estoy aquí por los propulsores.",
  "\\bYou look strong. Let´s do this!" => "\\bPareces fuerte. ¡Hagamos esto!",
  "\\bCan you guess which Pokémon Emmett will use?" => "\\b¿Puedes adivinar qué Pokémon usará Emmett?",
  "\\bWow, you were too strong for Emmett!" => "\\b¡Vaya, eras demasiado fuerte para Emmett!",
  "\\bThe evolutions of Eevee...How fascinating!" => "\\bLas evoluciones de Eevee... ¡Qué fascinante!",
  "\\bDid you know? Eevee can evolve into 8 different Pokémon! Isn´t that amazing?" =>
    "\\b¿Sabías que Eevee puede evolucionar en 8 Pokémon diferentes? ¿No es increíble?",
  "\\bHave you unlocked the secret that lies within Eevee?" =>
    "\\b¿Has descubierto el secreto que se esconde dentro de Eevee?",
  "\\bAren´t Eevees the cutest?" => "\\b¿A que los Eevee son los más adorables?",
  "\\bI love Eevees!" => "\\b¡Amo a los Eevee!",
  "\\bYou´re a strong trainer!" => "\\b¡Eres un entrenador fuerte!",
  "\\bYou pressed a button..." => "\\bPresionaste un botón...",
  "\\bWelcome to the Riverstone Gym. This Gym works a bit different, as the trainers don´t use Pokémon of a specific type here." =>
    "\\bBienvenido al Gimnasio de Río el Último. Este Gimnasio funciona un poco distinto, ya que los entrenadores no usan Pokémon de un tipo específico aquí.",
  "\\bInstead, the trainers in this Gym all use Eevees or evolutions of Eevee. If you have a well balanced team, you´ll have a fair shot. Good luck!" =>
    "\\bEn cambio, los entrenadores de este Gimnasio usan Eevees o evoluciones de Eevee. Si tienes un equipo bien equilibrado, tendrás una buena oportunidad. ¡Buena suerte!",
  "\\bIt takes talent to win against Emmett. Congratulations on claiming the Evolution Badge!" =>
    "\\bHace falta talento para ganarle a Emmett. ¡Felicidades por conseguir la Medalla Evolución!",
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

apply("Data/Map139.rxdata", DICT_139)
