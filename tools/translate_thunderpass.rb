# encoding: UTF-8
require_relative "rpg_stubs"

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

DICT_229 = {
  "\\bWhy did I take my bike here?! This place is dangerous!" => "\\b¿¡Por qué traje mi bici hasta acá?! ¡Este lugar es peligroso!",
  "\\bI almost flew off the cliff when I came here. Now I´m too scared to go back." => "\\bCasi salgo volando del acantilado cuando vine para acá. Ahora tengo demasiado miedo para volver.",
  "Zekrom is staring at you." => "Zekrom te está mirando fijo.",
  "It wants to battle!" => "¡Quiere combatir!",
  "\\bKROOOM!!!" => "\\b¡¡¡KROOOM!!!",
  "Zekrom disappeared. Will it come back?" => "Zekrom desapareció. ¿Volverá?",
  "\\bAre you build for Thunder Pass?" => "\\b¿Estás preparado para el Paso del Trueno?",
  "\\bThere´re some really strong Pokémon on Thunder Pass. This is the perfect place to train." => "\\bHay Pokémon realmente fuertes en el Paso del Trueno. Este es el lugar perfecto para entrenar.",
  "\\bOh my, you look really strong. Please, show me!" => "\\bAy, te ves realmente fuerte. ¡Por favor, mostrame!",
  "\\bSomething about Thunder Pass is special. That´s why I keep coming back." => "\\bHay algo especial en el Paso del Trueno. Por eso sigo volviendo.",
  "\\bI grew up on the sea, this kind of weather is what I need!" => "\\bMe crié en el mar, ¡este tipo de clima es justo lo que necesito!",
  "\\bOh, you´re wondering why a sailor is high up in the mountains? Hiking is my second hobby, simple as that." => "\\bAh, ¿te preguntás por qué un marinero está en lo alto de las montañas? El excursionismo es mi segundo hobby, así de simple.",
  "\\bI´m just one Gym away from challenging the Pokémon League. And nothing will stop me!" => "\\bEstoy a solo un Gimnasio de retar a la Liga Pokémon. ¡Y nada me va a detener!",
  "\\bLooks like I need to train even more. But one day, I will challenge the League!" => "\\bParece que necesito entrenar todavía más. ¡Pero algún día, voy a retar a la Liga!",
  "It´s a Pokémon Statue dedicated to Zeraora." => "Es una estatua Pokémon dedicada a Zeraora.",
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo se iluminó!",
  "Something powerful is approaching!" => "¡Algo poderoso se acerca!",
  "\\bORAAA!!!" => "\\b¡¡¡ORAAA!!!",
  "Zeraora disappeared. Will it come back?" => "Zeraora desapareció. ¿Volverá?",
}

DICT_230 = {
  "It´s a Pokémon Statue dedicated to Raikou." => "Es una estatua Pokémon dedicada a Raikou.",
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo se iluminó!",
  "Something powerful is approaching!" => "¡Algo poderoso se acerca!",
  "\\bRAAAAAIII!!!" => "\\b¡¡¡RAAAAAIII!!!",
  "Raikou disappeared. Will it come back?" => "Raikou desapareció. ¿Volverá?",
  "\\bToughen up, kid!" => "\\b¡Endurecete, pibe!",
  "\\bI need to get stronger!" => "\\b¡Necesito ponerme más fuerte!",
  "\\bWatch out, it´s dangerous around the edge!" => "\\b¡Cuidado, es peligroso cerca del borde!",
  "\\bBe careful around the edge. If you slip and fall, it´s pretty much over for you." => "\\bTené cuidado cerca del borde. Si resbalás y te caés, básicamente se acabó para vos.",
  "\\bDo you feel the thunder?" => "\\b¿Sentís el trueno?",
  "\\bThe thunder talks to us. It tries to warn those who come to close to the edge." => "\\bEl trueno nos habla. Trata de advertir a los que se acercan demasiado al borde.",
}

DICT_285 = {
  "It´s a large stature resembling a Pokémon." => "Es una gran estatua que se parece a un Pokémon.",
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo se iluminó!",
  "The stature is coming to life!" => "¡La estatua está cobrando vida!",
  "\\bELEKIII!!!" => "\\b¡¡¡ELEKIII!!!",
  "Regieleki went back into a deep slumber. Will it wake up again?" => "Regieleki volvió a un sueño profundo. ¿Despertará de nuevo?",
}

apply("Data/Map229.rxdata", DICT_229)
apply("Data/Map230.rxdata", DICT_230)
apply("Data/Map285.rxdata", DICT_285)
