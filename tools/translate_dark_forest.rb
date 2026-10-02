# encoding: UTF-8
require_relative "rpg_stubs"

DICT_101 = {
  "Spectrier is staring at you." => "Spectrier te está mirando fijamente.",
  "It wants to battle!" => "¡Quiere combatir!",
  "\\bSPEEEC!!!" => "\\b¡¡¡SPEEEC!!!",
  "Spectrier disappeared. Will it come back?" => "Spectrier desapareció. ¿Volverá?",
  "\\bThese woods are haunted!" => "\\b¡Estos bosques están encantados!",
  "\\bMay the spirits protect you." => "\\bQue los espíritus te protejan.",
  "\\bHaha, you won´t even know what hit you. Give me your wallet!" =>
    "\\bJaja, ni siquiera sabrás qué te ha golpeado. ¡Dame tu cartera!",
  "\\bI don´t care if you go to the police, they won´t find me here anyways." =>
    "\\bMe da igual si vas a la policía, de todos modos no me van a encontrar aquí.",
}

DICT_102 = {
  "\\bCareful young trainer. The Dark Forest is an ominous place. It´s very easy to get lost, so be careful. Please, take this." =>
    "\\bCuidado, joven entrenador. El Bosque Oscuro es un lugar siniestro. Es muy fácil perderse, así que ten cuidado. Por favor, toma esto.",
  "\\bTake care!" => "\\b¡Cuídate!",
}

DICT_103 = {
  "\\b???: Hello Virizion. My name is Giovanni. I´m from the Kanto Region, and I have come here for a very specific reason. I want to meet your student." =>
    "\\b???: Hola, Virizion. Me llamo Giovanni. Soy de la Región Kanto, y he venido aquí por una razón muy específica. Quiero conocer a tu alumno.",
  "\\bGiovanni: You look surprised. Thanks to my extensive research, I discovered the existence of Keldeo. Since then I wanted to meet it." =>
    "\\bGiovanni: Pareces sorprendido. Gracias a mi extensa investigación, descubrí la existencia de Keldeo. Desde entonces quería conocerlo.",
  "\\bGiovanni: Wait a minute...Who are you?! What are you doing here?! Get out of here kid, this forest is no place for children." =>
    "\\bGiovanni: Espera un momento... ¡¿Quién eres?! ¡¿Qué haces aquí?! Lárgate de aquí, chaval, este bosque no es lugar para niños.",
  "\\bAre you deaf? Get lost already. You´ll regret staying here, trust me." =>
    "\\b¿Estás sordo? Lárgate ya. Te arrepentirás de quedarte aquí, confía en mí.",
  "\\bWell, you had your chance. Hey, you over there, remove this brat!" =>
    "\\bBueno, tuviste tu oportunidad. Oye, tú, ¡quita de en medio a este mocoso!",
  "\\bGiovanni: Argh!!! Useless!!!" => "\\bGiovanni: ¡¡¡Argh!!! ¡¡¡Inútil!!!",
  "\\bOh, but that doesn´t matter now. I got what I came here for, so we´re gonna get going. Don´t interfere with our business again!" =>
    "\\bOh, pero eso ya no importa. Conseguí lo que vine a buscar, así que nos vamos. ¡No vuelvas a interferir en nuestros asuntos!",
  "\\bYou heard the boss, I´ll have to remove you the hard way now. Take this, you stupid little brat!" =>
    "\\bYa oíste al jefe, ahora tendré que quitarte de en medio por las malas. ¡Toma esto, mocoso estúpido!",
  "\\bI´m sorry, boss. This kid is stronger than expected..." =>
    "\\bLo siento, jefe. Este chaval es más fuerte de lo esperado...",
  "Virizion is thankful for saving Keldeo. It wants to challenge you!" =>
    "Virizion te agradece haber salvado a Keldeo. ¡Quiere retarte!",
  "\\bVIRIIIII!!!" => "\\b¡¡¡VIRIIIII!!!",
  "Virizion disappeared. Will it come back?" => "Virizion desapareció. ¿Volverá?",
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
  puts "#{path}: #{count}/#{dict.size} reemplazos"
end

apply("Data/Map101.rxdata", DICT_101)
apply("Data/Map102.rxdata", DICT_102)
apply("Data/Map103.rxdata", DICT_103)
