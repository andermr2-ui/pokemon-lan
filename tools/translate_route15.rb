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

DICT_329 = {
  "\\bThe battles on the Delta Islands are on another level!" => "\\b¡Los combates en las Islas Deliciosas son de otro nivel!",
  "\\bI love to battle on these islands!" => "\\b¡Me encanta combatir en estas islas!",
  "\\bLet´s make this battle the cherry on top of this already amazing vacation!" => "\\b¡Hagamos de este combate la guinda de este ya de por sí increíble viaje!",
  "\\bNo matter the result of our battle, this vacation is fantastic!" => "\\bIndependientemente del resultado de nuestro combate, ¡este viaje es fantástico!",
  "Hisui Wildlife Station" => "Estación de Vida Silvestre del Verde",
  "\\bYohoho! Let´s have a symphony of a battle!" => "\\b¡Yohoho! ¡Tengamos una sinfonía de combate!",
  "\\bYou should join my band, you have a great rhythm!" => "\\b¡Deberías unirte a mi banda, tienes un gran ritmo!",
  "\\bWelcome, Champion. This is the entrance to Champions Village. Only a few people are allowed to visit, and you are obviously one of them." => "\\bBienvenido, Campeón. Esta es la entrada a Villa Deliciosa. Solo unos pocos pueden visitarla, y tú obviamente eres uno de ellos.",
  "\\bHave fun!" => "\\b¡Que lo disfrutes!",
  "\\bYou look like you´re rich. Gimme your money!" => "\\bParece que eres rico. ¡Dame tu dinero!",
  "\\bDon´t judge me, looking this good is expensive!" => "\\bNo me juzgues, ¡verse tan bien cuesta dinero!",
}

DICT_331 = {
  "\\bSome of these Pokémon have gotten really strong. If you want to work here, you need to be a capable trainer first." => "\\bAlgunos de estos Pokémon se han vuelto muy fuertes. Si quieres trabajar aquí, primero tienes que ser un entrenador capaz.",
  "\\bStrong scientists, breeders and nurses like me are necessary to keep the station running." => "\\bHacen falta científicos, criadores y enfermeras fuertes como yo para mantener la estación en marcha.",
  "\\bBe careful, the shrine over there is dedicated to Enamorus. This Legendary Pokémon used to give life to Hisui, before it all went downhill..." => "\\bTen cuidado, ese santuario de allí está dedicado a Enamorus. Este Pokémon Legendario solía darle vida a Hisui, antes de que todo se fuera al garete...",
  "\\bSince the Wildlife Station Project started, Enamorus has been sighted again for the first time in centuries." => "\\bDesde que empezó el Proyecto de la Estación de Vida Silvestre, se ha vuelto a avistar a Enamorus por primera vez en siglos.",
  "\\bWe build that shrine to honor it, but we´re too scared to actually pray, because no one here would be strong enough to battle it." => "\\bConstruimos ese santuario para honrarlo, pero tenemos demasiado miedo como para rezar de verdad, porque nadie aquí sería lo bastante fuerte como para combatirlo.",
  "It´s a shrine dedicated to Enamorus." => "Es un santuario dedicado a Enamorus.",
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo se ha iluminado!",
  "Something powerful is approaching!" => "¡Algo poderoso se acerca!",
  "\\bENAAA!!!" => "\\b¡¡¡ENAAA!!!",
  "Enamorus disappeared. Will it come back?" => "Enamorus ha desaparecido. ¿Volverá?",
}

DICT_332 = {
  "\\bI´m so happy for these Pokémon! Throughout the last centuries, it has been getting increasingly harder for them to survive." => "\\b¡Estoy tan feliz por estos Pokémon! A lo largo de los últimos siglos, les ha resultado cada vez más difícil sobrevivir.",
  "\\bWithout the Wildlife Station, they would all be extinct in a few years..." => "\\bSin la Estación de Vida Silvestre, todos estarían extintos en unos pocos años...",
}

DICT_333 = {
  "\\bWelcome to the Hisui Wildlife Station! Please show me your registration certificate before proceeding." => "\\b¡Bienvenido a la Estación de Vida Silvestre del Verde! Por favor, muéstrame tu certificado de registro antes de continuar.",
  "\\bHm? You don´t have a certificate? Then you´re not allowed to visit the Wildlife Station. Only registered people can enter." => "\\b¿Eh? ¿No tienes certificado? Entonces no puedes visitar la Estación de Vida Silvestre. Solo puede entrar gente registrada.",
  "\\bWait, what do you mean you´re the Champion?! Let me check the newspaper..." => "\\bEspera, ¿cómo que eres el Campeón?! Déjame comprobarlo en el periódico...",
  "\\bOh, forgive me, \\PN. Of course the Champion can enter, it´s an honor to have you!" => "\\bAh, perdóname, \\PN. Por supuesto que el Campeón puede entrar, ¡es un honor tenerte aquí!",
  "\\bBut let me tell you the rules first. You can battle and catch the Pokémon in the Wildlife Station like you would in any other place." => "\\bPero antes déjame contarte las reglas. Puedes combatir y atrapar a los Pokémon de la Estación de Vida Silvestre como lo harías en cualquier otro lugar.",
  "\\bJust remember to respect the environment of these endangered species." => "\\bSolo recuerda respetar el entorno de estas especies en peligro de extinción.",
  "\\bThe people you´ll meet in the Wildlife Station aren´t trainers. They´re caretakers who look after our Pokémon." => "\\bLa gente que vas a encontrar en la Estación de Vida Silvestre no son entrenadores. Son cuidadores que velan por nuestros Pokémon.",
  "\\bIf you need help or have questions, just go to them." => "\\bSi necesitas ayuda o tienes preguntas, solo acude a ellos.",
  "\\bEnjoy your visit!" => "\\b¡Disfruta tu visita!",
  "\\bEnjoy your visit at the Hisui Wildlife Station!" => "\\b¡Disfruta tu visita a la Estación de Vida Silvestre del Verde!",
  "\\bIsn´t this a wonderful project? It´s a miracle that these Pokémon are still here, so looking after them is the least we can do." => "\\b¿No es un proyecto maravilloso? Es un milagro que estos Pokémon sigan aquí, así que cuidarlos es lo mínimo que podemos hacer.",
}

apply("Data/Map329.rxdata", DICT_329)
apply("Data/Map331.rxdata", DICT_331)
apply("Data/Map332.rxdata", DICT_332)
apply("Data/Map333.rxdata", DICT_333)
