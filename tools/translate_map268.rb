# encoding: UTF-8
require_relative "rpg_stubs"

DICT_268 = {
  "\\bOh, hello. You like food, don´t you? Of course you do! Then what´s your opinion on eating meat?" =>
    "\\bOh, hola. Te gusta la comida, ¿verdad? ¡Claro que sí! Entonces, ¿qué opinas de comer carne?",
  "\\bEating Pokémon might´ve been a common practice in the old days, but today most people could never eat Pokémon meat." =>
    "\\bComer Pokémon pudo haber sido algo común en los viejos tiempos, pero hoy la mayoría de la gente jamás comería carne de Pokémon.",
  "\\bThese days it´s illegal anyways, but as a cook I still had to try. And the one time I did, it was fried Torchic." =>
    "\\bHoy en día es ilegal de todos modos, pero como cocinero tenía que probarlo. Y la única vez que lo hice, fue Torchic frito.",
  "\\bCall me a monster, but that stuff was tasty. I´ve been trying to recreate that taste for about 6 years now, but nothing has worked so far." =>
    "\\bLlámame monstruo, pero aquello estaba delicioso. Llevo unos 6 años intentando recrear ese sabor, pero nada ha funcionado hasta ahora.",
  "\\bI don´t know for how much longer I´ll be able to resist the urge to try the real thing again, so would you mind taking my emergency Torchic?" =>
    "\\bNo sé cuánto tiempo más podré resistir las ganas de volver a probar lo auténtico, así que, ¿te importaría quedarte con mi Torchic de emergencia?",
  "\\bIf I no longer have that thing with me, then I´ll have no choice but to resist the urge. Please, take it." =>
    "\\bSi ya no lo tengo conmigo, no me quedará más remedio que resistir las ganas. Por favor, tómalo.",
  "\\bAh, thank you. Now I can get back to work without being distracted." =>
    "\\bAh, gracias. Ahora puedo volver al trabajo sin distraerme.",
  "There's no more room for Pokémon!" => "¡No hay más espacio para Pokémon!",
  "The Pokémon Boxes are full and can't accept any more!" => "¡Las Cajas Pokémon están llenas y no pueden aceptar más!",
  "\\bThat taste..." => "\\bEse sabor...",
  "\\bThat immaculate taste..." => "\\bEse sabor inmaculado...",
  "\\bThis might come as a surprise, but the rent in Riverstone is actually very affordable. The government has done a great job!" =>
    "\\bPuede que te sorprenda, pero el alquiler en Río el Último es en realidad muy asequible. ¡El gobierno ha hecho un gran trabajo!",
  "\\bI´m not even a city person, but Riverstone is a great capital city. There´s pretty much everything here, and the crime rate is very low as well." =>
    "\\bNi siquiera soy de ciudad, pero Río el Último es una gran capital. Aquí hay prácticamente de todo, y la tasa de criminalidad también es muy baja.",
  "\\bHey, you look like you´re looking for something to strengthen your Pokémon. Well you´ve come to the right guy!" =>
    "\\bEy, parece que buscas algo para fortalecer a tus Pokémon. ¡Pues has dado con el tipo correcto!",
  "\\bYou probably know about Rare Candies, right? Those are cool, but there´s something much better now." =>
    "\\bSeguro que conoces los Caramelos Raros, ¿verdad? Están bien, pero ahora hay algo mucho mejor.",
  "\\bWe should be quiet from now on, because I´m about to tell you about something illegal." =>
    "\\bDeberíamos hablar bajo de ahora en adelante, porque te voy a contar algo ilegal.",
  "\\bSome mysterious drug lord called Heisenberg has created something called Exp-Candy." =>
    "\\bUn misterioso narcotraficante llamado Heisenberg ha creado algo llamado Exp-Caramelo.",
  "\\bWhile they do roughly the same thing as Rare Candies, they´re much more useful. They come in different sizes and strengths." =>
    "\\bAunque hacen más o menos lo mismo que los Caramelos Raros, son mucho más útiles. Vienen en distintos tamaños y potencias.",
  "\\bThe small ones can give your Pokémon a little boost, but the larger ones can boost your Pokémon far more than any Rare Candy." =>
    "\\bLos pequeños le dan a tu Pokémon un pequeño empujón, pero los grandes lo potencian mucho más que cualquier Caramelo Raro.",
  "\\bI´m not the best trainer, so I don´t have the most use for this stuff, so I want you to have a little sample. Take these." =>
    "\\bNo soy el mejor entrenador, así que no le saco mucho partido a esto, por eso quiero darte una pequeña muestra. Toma esto.",
  "\\bDon´t be shy, try them out. And if you want more, on some nights you can find Heisenberg here in Riverstone." =>
    "\\bNo seas tímido, pruébalos. Y si quieres más, algunas noches puedes encontrar a Heisenberg aquí en Río el Último.",
  "\\bBut make sure to bring enough cash, this stuff is quite expensive. And if anyone asks, you don´t know about nothing." =>
    "\\bPero asegúrate de traer suficiente dinero, esto es bastante caro. Y si alguien pregunta, tú no sabes nada de nada.",
  "\\bRich people could buy a bunch of this stuff and become Champion without even training their Pokémon. That´s crazy..." =>
    "\\bLa gente rica podría comprar un montón de esto y convertirse en Campeón sin siquiera entrenar a sus Pokémon. Eso es una locura...",
  "\\bThe dude next to me is giving me the creeps. Apparently he helps someone sell drugs. But I´m too scared to call the police..." =>
    "\\bEl tipo de al lado me da mal rollo. Por lo visto ayuda a alguien a vender drogas. Pero tengo demasiado miedo para llamar a la policía...",
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

apply("Data/Map268.rxdata", DICT_268)
