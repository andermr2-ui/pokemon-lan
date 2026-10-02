# encoding: UTF-8
require_relative "rpg_stubs"

DICT_149 = {
  "\\bAy, welcome to my little lodge. People call me the Surf Master. I used to be a captain, but these days I prefer to spend my time at this lake." =>
    "\\bAy, bienvenido a mi pequeña cabaña. La gente me llama el Maestro del Surf. Antes era capitán, pero hoy prefiero pasar mi tiempo en este lago.",
  "\\bIf you have proven yourself worthy and claimed the Evolution Badge, I will give you the HM for Surf." =>
    "\\bSi has demostrado ser digno y conseguiste la Medalla Evolución, te daré la MO de Surf.",
  "\\bOh, looks like you already have that badge. Then I have no reason to keep this. Here you go." =>
    "\\bOh, parece que ya tienes esa medalla. Entonces no tengo razón para quedarme con esto. Aquí tienes.",
  "\\bHaha, you shouldn´t actually be here. But I don´t mind you cheating. But then get Surf by cheating, I won´t give you the HM." =>
    "\\bJaja, en realidad no deberías estar aquí. Pero no me importa que hagas trampa. Pero si consigues Surf haciendo trampa, no te daré la MO.",
  "\\bIf one of your Pokémon learned Surf without the HM, then that´s great! But you need this HM in order to enter Crystal Cove." =>
    "\\bSi uno de tus Pokémon aprendió Surf sin la MO, ¡eso es genial! Pero necesitas esta MO para poder entrar a Cala Cristal.",
}

DICT_150 = {
  "\\bDon´t ask me how I caught this one." => "\\bNo me preguntes cómo atrapé a este.",
  "\\bBe careful in the tall grass. Wild Scythers can be dangerous!" =>
    "\\bTen cuidado en la hierba alta. ¡Los Scyther salvajes pueden ser peligrosos!",
  "\\bAre you ready for this?" => "\\b¿Estás listo para esto?",
  "\\bI heard that you can get the HM for Surf somewhere on Route 8, but I don´t know where." =>
    "\\bOí que puedes conseguir la MO de Surf en algún lugar de la Ruta 8, pero no sé dónde.",
  "Lugia is looking at you. It seems to respect you." => "Lugia te está mirando. Parece respetarte.",
  "It wants to challenge you to a battle!" => "¡Quiere retarte a un combate!",
  "\\bLUGIAAAAA!!!" => "\\b¡LUGIAAAAA!!!",
  "Lugia disappeared. Will it come back?" => "Lugia desapareció. ¿Volverá?",
  "\\bA wild Greg appears!" => "\\b¡Aparece un Greg salvaje!",
  "\\bI´m just a kid named Greg. Of course I´m weak." => "\\bSolo soy un niño llamado Greg. Claro que soy débil.",
  "\\bDo you have what it takes?" => "\\b¿Tienes lo que hace falta?",
  "\\bI would have loved to visit Crystal Cove, but without Surf, that won´t happen." =>
    "\\bMe habría encantado visitar Cala Cristal, pero sin Surf, eso no va a pasar.",
}

DICT_151 = {
  "\\bURSAAAAAAAAAAA!!!" => "\\b¡URSAAAAAAAAAAA!!!",
  "\\bHey, wait!" => "\\b¡Ey, espera!",
  "\\bAre you sure you want to go there? This is the territory of the Bloodmoon. At night, this place becomes dangerous." =>
    "\\b¿Seguro que quieres ir ahí? Este es el territorio de Luna de Sangre. De noche, este lugar se vuelve peligroso.",
  "\\bYou should only face the Bloodmoon if you feel confident that you can defeat it. Please be careful!" =>
    "\\bSolo deberías enfrentarte a Luna de Sangre si te sientes seguro de poder derrotarlo. ¡Ten cuidado, por favor!",
  "\\bThe Pokémon known as the Bloodmoon seems to be a form of the extinct Pokémon Ursaluna. No one knows how these forms are connected." =>
    "\\bEl Pokémon conocido como Luna de Sangre parece ser una forma del extinto Pokémon Ursaluna. Nadie sabe cómo están conectadas estas formas.",
  "\\bI´m bored. Let´s battle!" => "\\bEstoy aburrido. ¡Combatamos!",
  "\\bThere´s not much to fix on Route 8, so battles keep me busy." =>
    "\\bNo hay mucho que arreglar en la Ruta 8, así que los combates me mantienen ocupado.",
  "It´s a Pokémon Statue dedicated to Meloetta." => "Es una estatua Pokémon dedicada a Meloetta.",
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo acaba de brillar!",
  "Something powerful is approaching!" => "¡Algo poderoso se aproxima!",
  "\\bMELOETTAAA!!!" => "\\b¡MELOETTAAA!!!",
  "Meloetta disappeared. Will it come back?" => "Meloetta desapareció. ¿Volverá?",
}

DICT_152 = {
  "\\bIt´s a great day for a battle!" => "\\b¡Es un gran día para un combate!",
  "\\bOn days like these, I don´t care if I win or lose." => "\\bEn días como estos, no me importa si gano o pierdo.",
  "The entrance to Victory Road is closed while the Challengers Tournament is going on. Come back later." =>
    "La entrada al Camino de la Victoria está cerrada mientras dura el Torneo de Aspirantes. Vuelve más tarde.",
  "Victory Road" => "Camino de la Victoria",
}

DICT_279 = {
  "It´s an ancient plate with strange symbols." => "Es una placa antigua con símbolos extraños.",
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo acaba de brillar!",
  "Something powerful is approaching!" => "¡Algo poderoso se aproxima!",
  "\\bBULUUU!!!" => "\\b¡BULUUU!!!",
  "Tapu Bulu disappeared. Will it come back?" => "Tapu Bulu desapareció. ¿Volverá?",
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

apply("Data/Map149.rxdata", DICT_149)
apply("Data/Map150.rxdata", DICT_150)
apply("Data/Map151.rxdata", DICT_151)
apply("Data/Map152.rxdata", DICT_152)
apply("Data/Map279.rxdata", DICT_279)
