# encoding: UTF-8
require_relative "rpg_stubs"

DICT_305 = {
  "For Sale: $10.000 a month" => "En Venta: 10.000€ al mes",
  "A stone is mounted in the machine." => "Hay una piedra montada en la máquina.",
  "\\bThat´s the machine I have built for my experiment. The stone that you see in there is nothing but an ordinary piece of rubble." =>
    "\\bEsa es la máquina que construí para mi experimento. La piedra que ves ahí no es más que un pedazo de escombro cualquiera.",
  "\\bAll I need for my experiment to begin is a Mega Ring and the right materials." =>
    "\\bTodo lo que necesito para empezar mi experimento es un Anillo Mega y los materiales adecuados.",
  "\\bSadly, I have neither of those things. The materials I need are rare, and the institute won´t give me a bloody Mega Ring." =>
    "\\bPor desgracia, no tengo ninguna de esas dos cosas. Los materiales que necesito son raros, y el instituto no me da un maldito Anillo Mega.",
  "\\bBut wait, what is that on your wrist?! YOU HAVE A MEGA RING?!" =>
    "\\bPero espera, ¡¿qué es eso en tu muñeca?! ¡¿TIENES UN ANILLO MEGA?!",
  "\\bHUH?! YOU GOT IT FROM THE INSTITUTE?! I ******* hate these arrogant *************!!!" =>
    "\\b¡¿EH?! ¡¿TE LO DIERON EN EL INSTITUTO?! ¡ODIO A ESOS ******* ARROGANTES *************!!!",
  "\\bOh, sorry for my little outburst. It´s just really frustrating to be unable to complete your work." =>
    "\\bOh, perdona mi pequeño arrebato. Es que es muy frustrante no poder terminar tu trabajo.",
  "\\bWould you be willing to help me? I know that´s a strange request, but I just feel so hopeless right now..." =>
    "\\b¿Estarías dispuesto a ayudarme? Sé que es una petición extraña, pero ahora mismo me siento tan desesperanzado...",
  "\\bHm? You will?! Thank you!!!" => "\\b¿Hm? ¿¡De verdad?! ¡Gracias!!!",
  "\\bYou must be a pretty strong trainer since you have that Mega Ring, so getting the materials I need shouldn´t be too difficult for you." =>
    "\\bDebes de ser un entrenador bastante fuerte ya que tienes ese Anillo Mega, así que conseguir los materiales que necesito no debería ser muy difícil para ti.",
  "\\bFor my first experiment, I want to recreate the Mega Stone for my favorite Pokémon, Slowbro." =>
    "\\bPara mi primer experimento, quiero recrear la Piedra Mega de mi Pokémon favorito, Slowbro.",
  "\\bAll I need is a Slowpoke Tail. These are extremely rare, but I know where you can buy them." =>
    "\\bLo único que necesito es una Cola Slowpoke. Son extremadamente raras, pero sé dónde puedes comprarlas.",
  "\\bThere´s a vendor in Ambergrove who sells a bunch of rare objects, and I believe he also offers Slowpoke Tails." =>
    "\\bHay un vendedor en Arboleda Ámbar que vende un montón de objetos raros, y creo que también ofrece Colas Slowpoke.",
  "\\bThey´re quite pricey, but I only need one, so you should be fine. Come back to me once you have one, because I can´t wait to start the experiment!" =>
    "\\bSon bastante caras, pero solo necesito una, así que no deberías tener problema. Vuelve cuando tengas una, ¡porque no puedo esperar para empezar el experimento!",
  "The machine is empty." => "La máquina está vacía.",
  "\\bAh, so you found a Slowpoke Tail. Please give it to me so we can begin with the experiment." =>
    "\\bAh, así que encontraste una Cola Slowpoke. Dámela para que podamos empezar con el experimento.",
  "\\bThank you! Alright, let me begin." => "\\b¡Gracias! Bien, déjame empezar.",
  "\\bIt´s happening! Yes, that looks like the simulations." => "\\b¡Está pasando! Sí, eso se parece a las simulaciones.",
  "\\bOh my Arceus!!! I think it worked!!!" => "\\b¡¡¡Ay, Arceus!!! ¡¡¡Creo que funcionó!!!",
  "\\bI did it! My research wasn´t for nothing! Artificial Mega Stones are possible!" =>
    "\\b¡Lo logré! ¡Mi investigación no fue en vano! ¡Las Piedras Mega artificiales son posibles!",
  "\\bAnd because you made this whole thing possible, I want you to have the result. Come and take it." =>
    "\\bY como tú hiciste posible todo esto, quiero que te quedes con el resultado. Ven y tómalo.",
  "\\bWhat?! But what about the experiment?!" => "\\b¿¡Qué?! ¿Y qué hay del experimento?!",
  "\\bCome back once you have a Slowpoke Tail." => "\\bVuelve cuando tengas una Cola Slowpoke.",
  "\\bThere you go. But remember, this Mega Stone only works on a Kanto Slowbro. Galarian Slowbro cannot Mega Evolve." =>
    "\\bAhí tienes. Pero recuerda, esta Piedra Mega solo funciona con un Slowbro de Kanto. El Slowbro de Galar no puede Megaevolucionar.",
  "\\bAnyways, I bet you want to have another Mega Stone. At least I want to, so listen up." =>
    "\\bBueno, seguro que quieres tener otra Piedra Mega. Al menos yo quiero, así que escucha.",
  "\\bI want to recreate the Mega Stone for Medicham. In order to make it I need a Relic Band." =>
    "\\bQuiero recrear la Piedra Mega de Medicham. Para hacerla necesito una Banda Reliquia.",
  "\\bYou´ve probably never heard of that, have you? I thought so. The Relic Band is part of an antique collection." =>
    "\\bSeguro que nunca oíste hablar de eso, ¿verdad? Me lo imaginaba. La Banda Reliquia forma parte de una colección de antigüedades.",
  "\\bThe Pokémon Mart in Aurora Summit sells these ancient objects, and that´s your only option this time, because you won´t find these anywhere else." =>
    "\\bLa Tienda Pokémon de Cumbre Aurora vende estos objetos antiguos, y esa es tu única opción esta vez, porque no los encontrarás en ningún otro lugar.",
  "\\bCome back once you have a Relic Band, and then we´ll make another Mega Stone!" =>
    "\\bVuelve cuando tengas una Banda Reliquia, ¡y entonces haremos otra Piedra Mega!",
  "\\bOr I would give it to you, but you no space in your bag to actually carry the Mega Stone." =>
    "\\bO te la daría, pero no tienes espacio en tu mochila para llevar la Piedra Mega.",
  "\\bAh, so you have a Relic Band. Please give it to me so we can begin with the experiment." =>
    "\\bAh, así que tienes una Banda Reliquia. Dámela para que podamos empezar con el experimento.",
  "\\bIt´s happening! Looks like we´re gonna have another breakthrough!" =>
    "\\b¡Está pasando! ¡Parece que vamos a tener otro gran avance!",
  "\\bJackpot!!!" => "\\b¡¡¡Premio gordo!!!",
  "\\bThat´s as far as my research went, but I managed to recreate two different Mega Stones. I´m satisfied, so you can have the result once again." =>
    "\\bHasta ahí llegó mi investigación, pero conseguí recrear dos Piedras Mega distintas. Estoy satisfecho, así que puedes quedarte con el resultado otra vez.",
  "\\bCome back once you have a Relic Band." => "\\bVuelve cuando tengas una Banda Reliquia.",
  "\\bThank you for helping me with my research. I´m really grateful for that. Take care!" =>
    "\\bGracias por ayudarme con mi investigación. Te lo agradezco de verdad. ¡Cuídate!",
  "\\bThat feeling when all of your hard work finally pays off is better than any drug. Never settle for less, and always have a goal in sight." =>
    "\\bEsa sensación de que todo tu esfuerzo por fin da sus frutos es mejor que cualquier droga. Nunca te conformes con menos, y siempre ten una meta a la vista.",
  "\\bAm I poor, or is the rent in this building way too high?" => "\\b¿Soy pobre, o el alquiler de este edificio es demasiado alto?",
  "\\bIf my calculations are correct, then I´m about to create an artifical Mega Stone!" =>
    "\\bSi mis cálculos son correctos, ¡estoy a punto de crear una Piedra Mega artificial!",
  "\\bThese morons from the institute fired me for proposing that idea, but I´ll show them that it´s possible!" =>
    "\\bEsos idiotas del instituto me despidieron por proponer esa idea, ¡pero les demostraré que es posible!",
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

apply("Data/Map305.rxdata", DICT_305)
