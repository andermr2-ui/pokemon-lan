# encoding: UTF-8
require_relative "rpg_stubs"

VENDING = {
  "It's a vending machine.\\nWhich drink would you like?\\G" =>
    "Es una máquina expendedora.\\n¿Qué bebida te gustaría?\\G",
  "\\GA Fresh Water dropped down!" => "\\G¡Cayó un Agua Fresca!",
  "\\GBonus! Another Fresh Water dropped down." => "\\G¡Bonus! Cayó otra Agua Fresca.",
  "\\GYou have no room left in the Bag." => "\\GNo te queda espacio en la Mochila.",
  "\\GYou don't have enough money." => "\\GNo tienes suficiente dinero.",
  "\\GA Soda Pop dropped down!" => "\\G¡Cayó un Refresco!",
  "\\GBonus! Another Soda Pop dropped down." => "\\G¡Bonus! Cayó otro Refresco.",
  "\\GA Lemonade dropped down!" => "\\G¡Cayó una Limonada!",
  "\\GBonus! Another Lemonade dropped down." => "\\G¡Bonus! Cayó otra Limonada.",
  "\\GDecided not to buy a drink." => "\\GDecidiste no comprar ninguna bebida.",
}

VENDING_CHOICES = {
  "Fresh Water - $200|Soda Pop - $300|Lemonade - $350|Cancel" =>
    "Agua Fresca - 200 ₽|Refresco - 300 ₽|Limonada - 350 ₽|Cancelar",
}

DICT_115 = VENDING.merge({
  "\\bAh, isn´t the mountain air refreshing? Silver Peak is the perfect place to retire. No tourists, it´s quiet, the paths are clean and the residents are nice." =>
    "\\bAh, ¿a que el aire de montaña es refrescante? Pico Plata es el lugar perfecto para retirarse. Sin turistas, es tranquilo, los caminos están limpios y los residentes son majos.",
  "\\bYou´re probably here for the Gym. The Gym Challengers bring just enough diversity to this town to make it interesting." =>
    "\\bSeguro que estás aquí por el Gimnasio. Los aspirantes al Reto de Gimnasios traen justo la diversidad necesaria para hacer interesante este pueblo.",
  "\\bYou probably won´t be here for long, but take your time to get to know the people in this town. They´re usually quite eager to give gifts to strangers." =>
    "\\bSeguramente no te quedes mucho tiempo por aquí, pero tómate tu tiempo para conocer a la gente del pueblo. Suelen estar bastante deseosos de hacer regalos a los forasteros.",
  "\\bEnjoy our town!" => "\\b¡Disfruta de nuestro pueblo!",
  "\\bThere´s nothing quite like this view, don´t you think so too?" =>
    "\\bNo hay nada como estas vistas, ¿a que sí?",
  "\\bYeah, of course you think so. Everyone does!" =>
    "\\bSí, claro que sí. ¡Todo el mundo piensa lo mismo!",
  "\\bYou´re wrong!!!" => "\\b¡¡¡Estás equivocado!!!",
  "\\bI love to catch Pokémon with a Pokéball of the same color. I know, I know, that sounds quite autistic, but everbody needs a hobby." =>
    "\\bMe encanta capturar Pokémon con una Poké Ball del mismo color. Ya sé, ya sé, suena un poco friki, pero todo el mundo necesita una afición.",
  "\\bTry it out if you want to, so take this." => "\\bPruébalo si quieres, toma esto.",
  "\\bI have to admit that I have autism, but that´s not why I have this hobby!" =>
    "\\bTengo que admitir que soy autista, ¡pero no es por eso que tengo esta afición!",
  "Silver Peak" => "Pico Plata",
  "\\bHey kid, be careful around the edge of this town. The fence is quite old already, and I don´t want anyone to fall." =>
    "\\bOye, chaval, ten cuidado cerca del borde del pueblo. La valla ya es bastante vieja, y no quiero que nadie se caiga.",
  "Silver Peak Gym\\nLeader: Azura" => "Gimnasio de Pico Plata\\nLíder: Azura",
  "\\bHey hey, do you need some fossils? I´m a collector myself, and I have a fossil that I don´t understand. I tried to find out more but no one could help me." =>
    "\\bEy, ey, ¿necesitas fósiles? Yo también soy coleccionista, y tengo un fósil que no entiendo. Intenté averiguar más, pero nadie pudo ayudarme.",
  "\\bSo please, take this fossil." => "\\bAsí que, por favor, toma este fósil.",
  "\\bEven if if this isn´t useful to you, it at least makes a cool addition to your collection. Have a nice day!" =>
    "\\bAunque no te sea útil, al menos es una buena incorporación a tu colección. ¡Que tengas un buen día!",
  "\\bWhat´s your favorite fossil? Mine has to be the Jaw Fossil, but I haven´t come across one yet." =>
    "\\b¿Cuál es tu fósil favorito? El mío tiene que ser el Fósil Mandíbula, pero todavía no me he topado con ninguno.",
})

DICT_118 = {
  "\\bAre you afraid to get wet?" => "\\b¿Te da miedo mojarte?",
  "\\bBefore Silver Peak was chosen for the Gym Challenge, this place was just a bath." =>
    "\\bAntes de que Pico Plata fuera elegido para el Reto de Gimnasios, este sitio era solo un baño público.",
  "\\bYou can be proud of yourself. Azura doesn´t make it easy for anyone." =>
    "\\bPuedes estar orgulloso de ti mismo. Azura no se lo pone fácil a nadie.",
  "\\bWatch out, the tide is high!" => "\\b¡Cuidado, la marea está alta!",
  "\\bI´ve tried to challenge Azura before but I stood no chance." =>
    "\\bYa intenté retar a Azura antes, pero no tuve ninguna oportunidad.",
  "\\bHow did you do that? You´re super talented!" =>
    "\\b¿Cómo hiciste eso? ¡Tienes muchísimo talento!",
  "\\bWelcome to the Silver Peak Gym. You travelled all the way to Silver Peak, so I´m sure you have a fair chance at defeating Azura." =>
    "\\bBienvenido al Gimnasio de Pico Plata. Has viajado hasta Pico Plata, así que seguro que tienes una buena oportunidad de derrotar a Azura.",
  "\\bIn this Gym, the trainers use Water-Type Pokémon. With some Grass- and Electric-Type Pokémon in your team, you will have an advantage." =>
    "\\bEn este Gimnasio, los entrenadores usan Pokémon de tipo Agua. Con algunos Pokémon de tipo Planta y Eléctrico en tu equipo, tendrás ventaja.",
  "\\bCongrats, you managed to stay afloat!" => "\\b¡Felicidades, conseguiste mantenerte a flote!",
  "\\bIf you want to meet my sis, you´ll have to go through me first!" =>
    "\\b¡Si quieres conocer a mi hermana, primero tendrás que pasar por mí!",
  "\\bAlright, you can challenge my sister now. I´m gonna keep swimmin´." =>
    "\\bVale, ya puedes retar a mi hermana. Yo voy a seguir nadando.",
  "\\bWow you actually won against sis!" => "\\b¡Vaya, de verdad le ganaste a mi hermana!",
}

DICT_119 = {
  "\\bAzura: Hello land-dweller, I am Azura. You should run for cover, because a tsunami is coming!" =>
    "\\bAzura: Hola, habitante de tierra firme, soy Azura. Deberías correr a cubrirte, ¡porque viene un tsunami!",
  "\\me[Badge get]\\bGood job land-dweller. I award you with the Pool Badge.\\wtnp[110]" =>
    "\\me[Badge get]\\bBuen trabajo, habitante de tierra firme. Te concedo la Medalla Piscina.\\wtnp[110]",
  "\\bAnd I also want you to have this." => "\\bY también quiero que tengas esto.",
  "\\bAzura: This TM cointains Brine, a very useful move if you need to finish of a dangerous Pokémon. Oh, and you can now use Rock Smash outside of battle." =>
    "\\bAzura: Esta MT contiene Salmuera, un movimiento muy útil si necesitas rematar a un Pokémon peligroso. Ah, y ya puedes usar Golpe Roca fuera de combate.",
  "\\bThe way back through Iron Mountain should be no problem for you, but I recommend to take a look around Silver Peak as well. Bye!" =>
    "\\bEl camino de vuelta por el Monte Hierro no debería suponerte ningún problema, pero también te recomiendo echar un vistazo por Pico Plata. ¡Adiós!",
  "\\bAzura: Our local market sells special objects that you need in order to evolve some Pokémon. Make sure to check it out." =>
    "\\bAzura: Nuestro mercado local vende objetos especiales que necesitas para evolucionar a algunos Pokémon. Asegúrate de echarle un vistazo.",
  "\\bAzura: Ah, welcome back. I heard that you stopped Team Rocket, my grandmother told me. Thank you for putting an end to that organisation." =>
    "\\bAzura: Ah, bienvenido de vuelta. Escuché que detuviste al Team Rocket, me lo contó mi abuela. Gracias por acabar con esa organización.",
  "\\bBut we´re not here to rant about those fools. The last time you were here, you managed to stay afloat against my official Gym Challenge team." =>
    "\\bPero no estamos aquí para quejarnos de esos idiotas. La última vez que estuviste aquí, conseguiste mantenerte a flote contra mi equipo oficial del Reto de Gimnasios.",
  "\\bNow that you´re the Champion, I want to have a battle at full force! Are you ready? Don´t drown!" =>
    "\\bAhora que eres el Campeón, ¡quiero combatir a toda potencia! ¿Estás listo? ¡No te ahogues!",
  "\\bAzura: It looks like it doesn´t matter what you´re up against, you´ll crush every opponent that dares to challenge you." =>
    "\\bAzura: Parece que no importa a qué te enfrentes, aplastas a todo rival que se atreva a retarte.",
  "\\bEven Arthur must´ve been overwhelmed by your strength, and that has never happened before." =>
    "\\bHasta Arthur debió de quedar abrumado por tu fuerza, y eso nunca había pasado antes.",
  "\\bI hope I gave you a good battle, land-dweller. When was the last time that I struggled like this? Hm, that doesn´t matter now." =>
    "\\bEspero haberte dado un buen combate, habitante de tierra firme. ¿Cuándo fue la última vez que me costó tanto? Hmm, eso ya no importa.",
  "\\bHave fun on your future adventures. Bye!" => "\\bDisfruta de tus futuras aventuras. ¡Adiós!",
  "\\bAzura: I wanna travel to Alola again, it´s the best place to go for a swim." =>
    "\\bAzura: Quiero volver a viajar a Alola, es el mejor sitio para ir a nadar.",
  "\\bMy sister needs to pass the Gym Leader registration exam so I can get a few days off. That´s the only way for me to get back to Alola..." =>
    "\\bMi hermana tiene que aprobar el examen de registro de Líder de Gimnasio para que yo pueda tener unos días libres. Es la única forma que tengo de volver a Alola...",
}

DICT_261 = {
  "\\bHey um, do you happen to be familiar with Beldum? I recently caught one, but it looks different from what I saw on pictures." =>
    "\\bOye, eh, ¿por casualidad conoces a Beldum? Atrapé uno hace poco, pero se ve distinto a como lo vi en fotos.",
  "\\bIs there anything wrong with mine? You have a Pokédex, right? If you´ve registered a Beldum, would you mind showing me how it´s supposed to look like?" =>
    "\\b¿Le pasa algo al mío? Tienes una Pokédex, ¿verdad? Si has registrado un Beldum, ¿te importaría mostrarme cómo se supone que debe verse?",
  "\\bIf mine really is a weird one then you can have it, because I don´t want to have a retarded Pokémon or something." =>
    "\\bSi el mío resulta ser uno raro, te lo puedes quedar, porque no quiero tener un Pokémon defectuoso ni nada de eso.",
  "\\bYou have seen one? Great! Please show me how it looks like." =>
    "\\b¿Has visto uno? ¡Genial! Por favor, muéstrame cómo se ve.",
  "\\bOh, so that´s what I should´ve caught. Then I don´t want to keep whatever this is, I want to catch a real Beldum. Take this retard away from me, please." =>
    "\\bOh, así que eso es lo que debería haber capturado. Entonces no quiero quedarme con esto, sea lo que sea, quiero atrapar un Beldum de verdad. Llévate a este bicho raro, por favor.",
  "There's no more room for Pokémon!" => "¡No hay más espacio para Pokémon!",
  "The Pokémon Boxes are full and can't accept any more!" => "¡Las Cajas Pokémon están llenas y no pueden aceptar más!",
  "\\bOh, you haven´t seen one yet. Well, you can come back once you have, and then I wanna see what the problem is." =>
    "\\bOh, todavía no has visto ninguno. Bueno, puedes volver cuando lo hayas visto, y entonces quiero ver cuál es el problema.",
  "\\bThanks for helping me get rid of that thing. What would people think if they saw me with that?!" =>
    "\\bGracias por ayudarme a deshacerme de esa cosa. ¡¿Qué pensaría la gente si me viera con eso?!",
  "\\bYeah, I know these buildings are ugly. But that doesn´t take away from the charm of our little town." =>
    "\\bSí, ya sé que estos edificios son feos. Pero eso no le quita encanto a nuestro pequeño pueblo.",
  "\\bWait, I know everyone who lives in Silver Peak, but I´ve never seen you before. Does that mean what I think it means?" =>
    "\\bEspera, conozco a todo el que vive en Pico Plata, pero a ti nunca te había visto. ¿Eso significa lo que creo que significa?",
  "\\bYou´re a visitor! Wow, that´s amazing. You know, hardly anyone ever comes to Silver Peak, so seeing new faces is always refreshing." =>
    "\\b¡Eres un visitante! Vaya, qué maravilla. Sabes, casi nunca viene nadie a Pico Plata, así que ver caras nuevas siempre es refrescante.",
  "\\bPlease, take this little gift." => "\\bPor favor, toma este pequeño regalo.",
  "\\bWe´re in dire need of visitors, so please tell the people about our town. The few Gym Challengers that make it here just aren´t enough." =>
    "\\bNos hacen mucha falta visitantes, así que por favor cuéntale a la gente sobre nuestro pueblo. Los pocos aspirantes al Reto de Gimnasios que llegan aquí no son suficientes.",
  "\\bEven if you´re just here for the Gym, we´re all still glad to meet new people." =>
    "\\bAunque solo estés aquí por el Gimnasio, todos nos alegramos de conocer gente nueva.",
  "\\bOh, hello. What brings you to our little town? Ah, of course it´s the Gym. You know, back in my day that Gym was a popular bath." =>
    "\\bOh, hola. ¿Qué te trae a nuestro pequeño pueblo? Ah, claro, el Gimnasio. Sabes, en mis tiempos ese Gimnasio era un baño público popular.",
  "\\bIt was Delta´s top destination, but since it got turned into a Gym we´ve had less and less visitors. Just do what you came here for and leave!" =>
    "\\bEra el destino número uno de Delta, pero desde que lo convirtieron en Gimnasio hemos tenido cada vez menos visitantes. ¡Haz lo que viniste a hacer y vete!",
}

DICT_262 = {
  "\\bOh, a stranger. My mommy says that I should be careful with strangers. But daddy says that I should always be kind to strangers." =>
    "\\bOh, un desconocido. Mi mami dice que debo tener cuidado con los desconocidos. Pero mi papi dice que siempre debo ser amable con los desconocidos.",
  "\\bYou look funny, so I will be nice to you. Take this." =>
    "\\bTienes pinta graciosa, así que seré simpático contigo. Toma.",
  "\\bI found this stone on the ground, and I thought it looked pretty. I hope it makes for a good gift." =>
    "\\bEncontré esta piedra en el suelo, y me pareció bonita. Espero que sea un buen regalo.",
  "\\bWhenever I see a stranger that I don´t like, I just tell mommy and then she scares them away with her Vikavolt. It works every time!" =>
    "\\bCada vez que veo a un desconocido que no me gusta, se lo digo a mi mami y ella lo asusta con su Vikavolt. ¡Funciona siempre!",
  "\\bWhy does no one believe me? Silver Peak is in great danger! One landslide is all it takes for the entire town to come crashing down the hillside." =>
    "\\b¿Por qué nadie me cree? ¡Pico Plata está en gran peligro! Basta un corrimiento de tierras para que todo el pueblo se derrumbe ladera abajo.",
  "\\bBut I´ve tried for too long now. I will move to Riverstone in a few weeks, and then I don´t care what happens to this place." =>
    "\\bPero ya llevo demasiado tiempo intentándolo. Me mudaré a Río el Último en unas semanas, y entonces me dará igual lo que le pase a este sitio.",
  "\\bAh, welcome. You don´t happen to be interested in getting a rare Pokémon? Well today´s your lucky day!" =>
    "\\bAh, bienvenido. ¿Por casualidad te interesa conseguir un Pokémon raro? ¡Pues hoy es tu día de suerte!",
  "\\bI finally got a shiny Totodile, and now I´ve a bunch of normal Totodiles that I have no use for." =>
    "\\bPor fin conseguí un Totodile shiny, y ahora tengo un montón de Totodiles normales a los que no les doy uso.",
  "\\bHere, this one´s for you." => "\\bToma, este es para ti.",
  "There's no more room for Pokémon!" => "¡No hay más espacio para Pokémon!",
  "The Pokémon Boxes are full and can't accept any more!" => "¡Las Cajas Pokémon están llenas y no pueden aceptar más!",
  "\\bIf you´re interested in shiny hunting as well, then I recommend the breeding method. That way you can get a very specific Shiny Pokémon a lot easier." =>
    "\\bSi también te interesa cazar shinys, te recomiendo el método de la cría. Así puedes conseguir un Pokémon Shiny muy específico mucho más fácil.",
  "\\bJust head over to the Pokémon Daycare in Ambergrove and let your Pokémon get busy." =>
    "\\bSolo tienes que ir a la Guardería Pokémon de Arboleda Ámbar y dejar que tus Pokémon se pongan manos a la obra.",
  "\\bOh, hello. Are you surprised to see a nurse who isn´t at work? We´re far more sisters than there are Pokémon Centers." =>
    "\\bOh, hola. ¿Te sorprende ver a una enfermera que no está trabajando? Somos muchas más hermanas de las que hay Centros Pokémon.",
  "\\bThat way we can get enough time off, and that also is why you sometimes see us wandering around different routes." =>
    "\\bAsí es como conseguimos suficiente tiempo libre, y por eso a veces nos ves paseando por distintas rutas.",
  "\\bIt´s my free day today, and I´ve decided to start investing in Crypto Currencies. This Doge Coin seems to be huge right now, so I hope I can profit from that." =>
    "\\bHoy es mi día libre, y he decidido empezar a invertir en criptomonedas. Este Doge Coin parece que está muy de moda ahora mismo, así que espero poder sacarle provecho.",
}

DICT_300 = {
  "\\bHMMMM?! WHAT?! I CAN`T HEAR YOU!" => "\\b¿¿¿EEEH??? ¡¿QUÉ?! ¡NO TE OIGO!",
  "\\bPoor old Grandma doesn´t hear that well anymore. I always have to shout when I want to talk to her." =>
    "\\bLa pobre abuela ya no oye muy bien. Siempre tengo que gritar cuando quiero hablar con ella.",
  "\\bMy doctor said that I should move to Silver Peak, because the clean air will get ride of my asthma." =>
    "\\bMi médico dijo que debería mudarme a Pico Plata, porque el aire limpio se llevaría mi asma.",
  "\\bUnfortunately I still have asthma, but at least the view is quite nice." =>
    "\\bPor desgracia sigo teniendo asma, pero al menos las vistas son bastante bonitas.",
}

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
          joined = opts.join("|")
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

apply("Data/Map115.rxdata", DICT_115, VENDING_CHOICES)
apply("Data/Map118.rxdata", DICT_118)
apply("Data/Map119.rxdata", DICT_119)
apply("Data/Map261.rxdata", DICT_261)
apply("Data/Map262.rxdata", DICT_262)
apply("Data/Map300.rxdata", DICT_300)
