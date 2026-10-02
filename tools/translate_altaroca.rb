# encoding: UTF-8
require_relative "rpg_stubs"

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
          joined = opts.map { |o| o.dup.force_encoding("UTF-8") }.join("|")
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

DICT_232 = {
  "\\bOi, ye look exhausted mate. Please, take this." => "\\bEh, te ves agotado, che. Tomá, quedate con esto.",
  "\\bThe way to Granite Heights is tough, so it ain´t no big deal to help yer guests." => "\\bEl camino a Alta Roca es duro, así que no es gran cosa ayudar a las visitas.",
  "\\bAh, a Gym Challenger! The journey to Granite Heights must´ve been exhausting. I have just the right thing for you." => "\\b¡Ah, un retador de gimnasio! El viaje hasta Alta Roca debe haber sido agotador. Tengo justo lo que necesitás.",
  "\\bThis is a delicious specialty from Hoenn. Oh, and there´s something else I want you to have." => "\\bEsta es una delicia típica de Hoenn. Ah, y hay algo más que quiero que tengas.",
  "\\bI´ve had this fossil for years now, and I never knew what do to with it. I hope it´s more useful in your hands." => "\\bTengo este fósil hace años, y nunca supe qué hacer con él. Espero que te sea más útil a vos.",
  "\\bEnjoy your time in our town!" => "\\b¡Disfrutá tu estadía en nuestro pueblo!",
  "\\bIn Granite Heights, it´s a tradition to gift visitors. We love to reward those who make it here with rare and useful goods." => "\\bEn Alta Roca, es tradición regalarle cosas a los visitantes. Nos encanta recompensar a quienes llegan hasta acá con objetos raros y útiles.",
  "Granite Heights Gym\\nLeader: Galvano" => "Gimnasio de Alta Roca\\nLíder: Galvano",
  "\\bNow you look like a trainer who´s in need of rare Pokémon." => "\\bAhora sí parecés un entrenador que necesita Pokémon raros.",
  "\\bThen you´ve come to the right guy, because I´m willing to trade my rare Galarian Weezing for a Kantonian Weezing. Are you interested?" => "\\bEntonces viniste a hablar con el tipo correcto, porque estoy dispuesto a cambiar mi raro Weezing de Galar por un Weezing de Kanto. ¿Te interesa?",
  "\\bYou don't want to trade?  Aww..." => "\\b¿No querés intercambiar? Ay...",
  "\\bOK, let's get started." => "\\bBueno, empecemos.",
  "\\PN traded Weezing for Weezing!" => "¡\\PN intercambió un Weezing por otro Weezing!",
  "\\bThanks for trading with me!" => "\\b¡Gracias por intercambiar conmigo!",
  "\\bYou don't want to trade? Aww..." => "\\b¿No querés intercambiar? Ay...",
  "\\bWhat a lovely day! It really doesn´t get much better than this. But wait, do I know you? You don´t seem familiar." => "\\b¡Qué día tan lindo! La verdad que no puede ser mejor que esto. Pero esperá, ¿te conozco? No me sonás de nada.",
  "\\bOh, if you aren´t from here, then that means I´m supposed to gift you something. Well, at least that´s what my dad said, traditions or something." => "\\bAh, si no sos de acá, entonces se supone que tengo que regalarte algo. Bueno, al menos eso me dijo mi papá, tradiciones o algo así.",
  "\\bEither way, he gave me this, and now it´s yours." => "\\bDe cualquier forma, él me dio esto, y ahora es tuyo.",
  "\\bHm, giving you that gift actually felt kinda nice. I think I get it now. Have a lovely day!" => "\\bMm, la verdad que darte ese regalo se sintió bastante bien. Creo que ahora entiendo. ¡Que tengas un lindo día!",
  "\\bDid you know that Granite Heights was build on the ruins of an ancient village?" => "\\b¿Sabías que Alta Roca fue construida sobre las ruinas de una aldea antigua?",
  "\\bZeke: Not bad, not bad at all. Now that you´ve completed the Gym Challenge, you gotta join the Challengers Tournament." => "\\bXarly: Nada mal, nada mal. Ahora que completaste el Reto de Gimnasios, tenés que unirte al Torneo de Retadores.",
  "\\bIt´s the perfect place to settle this once and for all. Everyone will be watching this tournament, so it´s our chance to reach the top!" => "\\bEs el lugar perfecto para resolver esto de una vez por todas. Todos van a estar mirando este torneo, ¡así que es nuestra oportunidad de llegar a la cima!",
  "\\bCome on, \\PN, let´s head to Riverstone Stadium!" => "\\bDale, \\PN, ¡vamos al Estadio Río el Último!",
}

DICT_236 = {
  "\\bUm, actually the Fairy-Type isn´t the strongest type. Steel-Type Pokémon are stronger!" => "\\bEh, en realidad el tipo Hada no es el tipo más fuerte. ¡Los Pokémon de tipo Acero son más fuertes!",
  "\\bThe Steel-Type has the most resistances out of all the types. It´s weak to just 3 types, so you won´t have to worry about getting caught off guard." => "\\bEl tipo Acero tiene más resistencias que cualquier otro tipo. Es débil a solo 3 tipos, así que no vas a tener que preocuparte por que te agarren desprevenido.",
  "\\bGalvano knows what his Pokémon are weak too, yet you were able to overcome all of his resistances. Statistically speaking, you´re really good!" => "\\bGalvano sabe a qué son débiles sus Pokémon, y aun así pudiste superar todas sus resistencias. Estadísticamente hablando, ¡sos realmente bueno!",
  "\\bAre you ready for some heavy metal?!" => "\\b¿Estás listo para un poco de heavy metal?!",
  "\\bI need to keep it real with you. Just because you can win against us, doesn´t mean you can beat Galvano. He´s insanely strong." => "\\bTengo que ser sincero con vos. Que puedas ganarnos a nosotros no significa que puedas vencer a Galvano. Es increíblemente fuerte.",
  "\\bYou actually beat Galvano, that´s amazing!" => "\\bDe verdad venciste a Galvano, ¡eso es increíble!",
  "\\bCan you win against these tough bugs?!" => "\\b¿Podés ganarle a estos bichos duros?!",
  "\\bThe only way to overcome Steel-Type Pokémon is by using their weaknesses. You´ll struggle if you don´t." => "\\bLa única forma de superar a los Pokémon de tipo Acero es aprovechando sus debilidades. Te vas a complicar si no lo hacés.",
  "\\bLooks like there´s no type that can stop you." => "\\bParece que no hay tipo que pueda detenerte.",
  "\\bWelcome to the Granite Heights Gym. Here, the trainers use Steel-Type Pokémon, which are hard to take down." => "\\bBienvenido al Gimnasio de Alta Roca. Acá, los entrenadores usan Pokémon de tipo Acero, que son difíciles de derribar.",
  "\\bYou should use Fire-, Ground- and Fighting-Type attacks in order to have an advantage." => "\\bDeberías usar ataques de tipo Fuego, Tierra y Lucha para tener ventaja.",
  "\\bWe wanted to be creative like the other Gyms, but we couldn´t think of anything interesting, so we kept it simple." => "\\bQueríamos ser creativos como los otros gimnasios, pero no se nos ocurrió nada interesante, así que lo dejamos simple.",
  "\\bDefeat all the trainers in this room and the door will open." => "\\bDerrotá a todos los entrenadores de esta sala y la puerta se va a abrir.",
  "\\bGalvano, the Gym Leader, is known for using very strong Pokémon. If he catches you off guard, then you´ve already lost. Good luck!" => "\\bGalvano, el Líder de Gimnasio, es conocido por usar Pokémon muy fuertes. Si te agarra desprevenido, ya perdiste. ¡Suerte!",
  "\\bWow, you really did it! Congratulations on beating the Gym Challenge. Only the toughest trainers are able to get this far." => "\\bGuau, ¡de verdad lo lograste! Felicitaciones por vencer el Reto de Gimnasios. Solo los entrenadores más duros logran llegar tan lejos.",
  "\\bCome on, show me your strength!" => "\\b¡Dale, mostrame tu fuerza!",
  "\\bI´ve tried to beat Galvano a bunch of times already, but I have never defeated even one of his Pokémon." => "\\bYa intenté vencer a Galvano un montón de veces, pero nunca le gané ni a uno solo de sus Pokémon.",
  "\\bI´m out here struggling with one of Galvano´s Pokémon, but you defeated all of them just like that. Impressive!" => "\\bAcá ando peleándola con uno solo de los Pokémon de Galvano, y vos los venciste a todos así nomás. ¡Impresionante!",
}

DICT_237 = {
  "\\bGalvano: Ah, finally another challenger. I´m Galvano, and I was really looking forward to another battle." => "\\bGalvano: Ah, por fin otro retador. Soy Galvano, y tenía muchas ganas de otro combate.",
  "\\bWesley tends to defeat a lot of promising trainers, so hardly anyone actually comes to Granite Heights to challenge the Gym." => "\\bWesley suele derrotar a un montón de entrenadores prometedores, así que casi nadie llega a Alta Roca a retar el Gimnasio.",
  "\\bBut it looks like you managed to win against Wesley, which is really impressive." => "\\bPero parece que lograste ganarle a Wesley, lo cual es realmente impresionante.",
  "\\bNow it´s only me who´s left, but I won´t make it easy. My Pokémon are tough, and they hit hard. I´ll show you the power of Steel-Type Pokémon!" => "\\bAhora solo quedo yo, pero no te lo voy a poner fácil. Mis Pokémon son duros y pegan fuerte. ¡Te voy a mostrar el poder de los Pokémon de tipo Acero!",
  "\\me[Badge get]\\bCongratulations! You just completed the Gym Challenge! Take the Magnet Badge.\\wtnp[110]" => "\\me[Badge get]\\b¡Felicitaciones! ¡Acabás de completar el Reto de Gimnasios! Tomá la Medalla Magneto.\\wtnp[110]",
  "\\bYou can now enter Victory Road and challenge the Pokémon League. But don´t go without this." => "\\bAhora podés entrar a la Avenida Victoriosa y retar a la Liga Pokémon. Pero no te vayas sin esto.",
  "\\bGalvano: This TM contains Flash Cannon. It´s a super useful Steel-Type attack, which will be helpful against the Elite Four." => "\\bGalvano: Esta MT contiene Cañón Destello. Es un ataque de tipo Acero súper útil, que te va a servir contra el Alto Mando.",
  "\\bBut before you run of to Victory Road, why not join the Challengers Tournament at Riverstone Stadium?" => "\\bPero antes de salir corriendo hacia la Avenida Victoriosa, ¿por qué no te unís al Torneo de Retadores en el Estadio Río el Último?",
  "\\bI highly recommend that if you want to train your Pokémon. I know the other trainers who will participate in the tournament." => "\\bTe lo recomiendo mucho si querés entrenar a tus Pokémon. Conozco a los demás entrenadores que van a participar en el torneo.",
  "\\bThey´re about as strong as you, so you can´t break a sweat when you face them." => "\\bSon más o menos tan fuertes como vos, así que no podés relajarte cuando los enfrentes.",
  "\\bOh, I almost forgot something. You can now use Waterfall outside of battles. The guy with the HM is somewhere on Victory Road." => "\\bAh, casi me olvido de algo. Ahora podés usar Cascada fuera de combate. El tipo con la MO está en algún lugar de la Avenida Victoriosa.",
  "\\bWell, I guess this means goodbye for now. Never give up!" => "\\bBueno, supongo que esto es un hasta luego. ¡Nunca te rindas!",
  "\\bGalvano: If you actually manage to become Champion, then we need to have a rematch." => "\\bGalvano: Si de verdad llegás a ser Campeón, vamos a tener que tener una revancha.",
  "\\bGalvano: When I said that we´d have a rematch if you actually managed to become Champion, I didn´t think that you´d actually do it." => "\\bGalvano: Cuando dije que tendríamos una revancha si de verdad llegabas a ser Campeón, no pensé que de verdad lo ibas a lograr.",
  "\\bIt´s quite hard to believe that Arthur lost his title, but it looks like you´re really that good." => "\\bEs bastante difícil de creer que Arthur perdió su título, pero parece que de verdad sos tan bueno.",
  "\\bThis should make our rematch interesting, because your mindset is different from Arthur´s." => "\\bEsto debería hacer que nuestra revancha sea interesante, porque tu mentalidad es distinta a la de Arthur.",
  "\\bI don´t want to downplay your skill, but my chances at becoming Champion have never been higher." => "\\bNo quiero subestimar tu habilidad, pero mis chances de convertirme en Campeón nunca fueron tan altas.",
  "\\bMy Steel-Type Pokémon will crush you, and I will take your title!" => "\\b¡Mis Pokémon de tipo Acero te van a aplastar, y yo me voy a quedar con tu título!",
  "\\bGalvano: Well, there goes my last chance of becoming Champion. But it´s fine, being a Gym Leader brings me just as much joy." => "\\bGalvano: Bueno, ahí se fue mi última oportunidad de ser Campeón. Pero está bien, ser Líder de Gimnasio me da la misma alegría.",
  "\\bYou know, I used to be a pilot, so making it this far is quite an achievement, wouldn´t you agree?" => "\\bSabés, yo antes era piloto, así que llegar hasta acá es todo un logro, ¿no te parece?",
  "\\bThank you so much for this rematch, it was very fun. Goodbye!" => "\\bMuchísimas gracias por esta revancha, fue muy divertida. ¡Chau!",
  "\\bGalvano: I want to be a Gym Leader for many years to come, though I wouldn´t mind returning to my old profession after that." => "\\bGalvano: Quiero ser Líder de Gimnasio por muchos años más, aunque no me molestaría volver a mi vieja profesión después de eso.",
  "The Delta Stone in your pocket just moved! You can feel a stronger aura coming from within the stone." => "¡La Piedra Delta en tu bolsillo se movió! Podés sentir un aura más fuerte proviniendo de la piedra.",
}

DICT_271 = {
  "\\bDo my eyes deceive me? A stranger has made it here?! You must be a Gym Challenger, right?" => "\\b¿Me engañan mis ojos? ¿¡Un forastero llegó hasta acá?! Debés ser un retador de gimnasio, ¿no?",
  "\\bOf course you are. Who else would endure blizzards and thunderstorms just to get to Granite Heights?" => "\\bClaro que sí. ¿Quién más aguantaría ventiscas y tormentas eléctricas solo para llegar a Alta Roca?",
  "\\bWell, you´re here now, so at least enjoy your time here and don´t just rush straight into the Gym like most trainers." => "\\bBueno, ya que estás acá, al menos disfrutá tu estadía y no te vayas corriendo directo al Gimnasio como la mayoría de los entrenadores.",
  "\\bOi, welcome to Granite Heights. Our town is a dream for hikers and adventure seekers!" => "\\bEh, bienvenido a Alta Roca. ¡Nuestro pueblo es un sueño para excursionistas y buscadores de aventura!",
  "\\bI don´t care if you´re only here for the Gym, I´m happy about every visitor we get. " => "\\bNo me importa si solo viniste por el Gimnasio, me pone contento cada visitante que recibimos. ",
  "\\bAfter all, we´re the last town that trainers visit during the Gym Challenge, so we try our best to support these talents." => "\\bDespués de todo, somos el último pueblo que visitan los entrenadores durante el Reto de Gimnasios, así que hacemos lo posible por apoyar a estos talentos.",
  "\\bYou´ve probably won countless battles up until now, so you´re the right person to get this reward." => "\\bSeguramente ganaste incontables combates hasta ahora, así que sos la persona indicada para recibir esta recompensa.",
  "\\bHere, take this little Chimchar." => "\\bTomá, quedate con este pequeño Chimchar.",
  "\\bA weak little Pokémon like this might not seem like a worthy reward for a trainer like you, but remember, your other Pokémon used to be just like this." => "\\bUn Pokémon débil y pequeño como este puede no parecer una recompensa digna para un entrenador como vos, pero recordá que tus otros Pokémon alguna vez fueron igual que este.",
  "\\bI´m confident that you´ll be able to train this Chimchar, so that one day it might even face the Champion? That´d be super cool!" => "\\bConfío en que vas a poder entrenar a este Chimchar, así que quién sabe, ¿algún día hasta podría enfrentar al Campeón? ¡Eso sería buenísimo!",
  "\\bI wish you the best for the rest of your journey. Take care!" => "\\bTe deseo lo mejor para el resto de tu viaje. ¡Cuidate!",
  "There's no more room for Pokémon!" => "¡No hay más lugar para Pokémon!",
  "The Pokémon Boxes are full and can't accept any more!" => "¡Las Cajas de Pokémon están llenas y no pueden aceptar más!",
  "\\bI used to live in Sinnoh, but I´ve seen everything in that region. I moved here in order to have some new adventures, and it´s been going great so far!" => "\\bAntes vivía en Sinnoh, pero ya vi todo lo que había para ver en esa región. Me mudé para acá para tener nuevas aventuras, ¡y hasta ahora me está yendo genial!",
}

DICT_312 = {
  "\\bLet me cook!" => "\\b¡Dejame cocinar!",
  "\\bMy husband is wasting his talents here. He´s a great cook, so he should work at a restaurant." => "\\bMi esposo está desperdiciando su talento acá. Es un gran cocinero, así que debería trabajar en un restaurante.",
}

apply("Data/Map232.rxdata", DICT_232)
apply("Data/Map236.rxdata", DICT_236)
apply("Data/Map237.rxdata", DICT_237)
apply("Data/Map271.rxdata", DICT_271)
apply("Data/Map312.rxdata", DICT_312)
