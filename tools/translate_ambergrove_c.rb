# encoding: UTF-8
require_relative "rpg_stubs"

DICT_177 = {
  "\\bUhm, there´s road work going on over here or something. You can´t go here at the moment. Uhm, come back later." =>
    "\\bEhm, hay obras en construcción por acá o algo así. No podés pasar por ahora. Ehm, volvé más tarde.",
  "\\bWAIT!" => "\\b¡ESPERÁ!",
  "\\bThank Arceus, I caught up to you." => "\\bGracias a Arceus que te alcancé.",
  "\\bPeople call me the Strength Master, because my Pokémon have mastered Strength." =>
    "\\bLa gente me llama el Maestro de Fuerza, porque mis Pokémon dominan el movimiento Fuerza.",
  "\\bEvery trainer that claims the Arachno Badge is allowed to get the HM for Strength, and it´s my job to hand it to those trainers." =>
    "\\bTodo entrenador que consigue la Medalla Arácnida tiene derecho a recibir la MO de Fuerza, y mi trabajo es entregársela a esos entrenadores.",
  "\\bNyssa saw me wandering around, and she said that you claimed the badge, so I ran here to give it to you." =>
    "\\bNyssa me vio vagando por ahí y me dijo que ya conseguiste la medalla, así que vine corriendo para dártela.",
  "\\bAnd consider yourself lucky, because unlike the other HM Masters, I don´t spend that much time at home." =>
    "\\bY considerate afortunado, porque a diferencia de los otros Maestros de MO, yo no paso tanto tiempo en casa.",
  "\\bI´m always on the move, and we just so happened to be in the same town today. But enough talking, take the HM." =>
    "\\bSiempre estoy en movimiento, y hoy justo coincidimos en el mismo pueblo. Pero basta de charla, tomá la MO.",
  "\\bIf you teach this to one of your Pokémon, you can move these large boulders around. You will need this if you want to complete the Gym Challenge." =>
    "\\bSi le enseñás esto a uno de tus Pokémon, vas a poder mover estos grandes peñascos. Vas a necesitarlo si querés completar el Desafío de Gimnasios.",
  "\\bIt was nice to meet you. Bye!" => "\\bUn gusto conocerte. ¡Chau!",
  "\\bPssst, let me tell you a secret." => "\\bPsss, dejame contarte un secreto.",
  "\\bI know how to summon a Spiritomb. Don´t tell anyone about this, but I have the ability to harness lost souls." =>
    "\\bSé cómo invocar a un Spiritomb. No le cuentes esto a nadie, pero tengo la capacidad de aprovechar almas perdidas.",
  "\\bIf you bring me an Odd Keystone, then I can use the lost souls to summon a Spiritomb." =>
    "\\bSi me traés una Piedra Rara, puedo usar las almas perdidas para invocar a un Spiritomb.",
  "\\bHm, so you have an Odd Keystone. Do you want me to summon a Spiritomb?" =>
    "\\bMm, así que tenés una Piedra Rara. ¿Querés que invoque a un Spiritomb?",
  "\\bSpirits, you can finally rest! Come to me, and you will be at peace!" =>
    "\\b¡Espíritus, por fin pueden descansar! ¡Vengan a mí, y estarán en paz!",
  "\\bThe summoning is complete. I can do it again if you bring me another Odd Keystone." =>
    "\\bLa invocación está completa. Puedo hacerlo de nuevo si me traés otra Piedra Rara.",
  "There's no more room for Pokémon!" => "¡No hay más espacio para Pokémon!",
  "The Pokémon Boxes are full and can't accept any more!" =>
    "¡Las cajas de Pokémon están llenas y no pueden recibir más!",
  "\\bThe lost souls want to rest, but you won´t let them? How cruel!" =>
    "\\b¿Las almas perdidas quieren descansar, y vos no las dejás? ¡Qué cruel!",
  "Darkrai is angry." => "Darkrai está enojado.",
  "It wants to battle!" => "¡Quiere combatir!",
  "\\bKRAAAI!!!" => "\\b¡KRAAAI!!!",
  "Darkrai disappeared. Will it come back?" => "Darkrai desapareció. ¿Volverá?",
  "\\bI´m just supposed to stand here. Don´t ask me why." =>
    "\\bSe supone que solo tengo que quedarme parado acá. No me preguntes por qué.",
  "\\bHey kiddo, are you interested in a little trade? I want to trade my rare Alolan Marowak for a Kantonian Marowak, because I just can´t find that form." =>
    "\\bEy chico, ¿te interesa un pequeño intercambio? Quiero cambiar mi raro Marowak de Alola por un Marowak de Kanto, porque no logro encontrar esa forma.",
  "\\bSo, if you have a Katonian Marowak, then why don´t you trade with me?" =>
    "\\bAsí que, si tenés un Marowak de Kanto, ¿por qué no lo intercambiás conmigo?",
  "\\bYou don't want to trade?  Aww..." => "\\b¿No querés intercambiar? Ay...",
  "\\bOK, let's get started." => "\\bBueno, empecemos.",
  "\\PN traded Marowak for Marowak!" => "¡\\PN cambió Marowak por Marowak!",
  "\\bThank you so much! I´ve grown sick of searching, so it´s good that I could take the easy way out." =>
    "\\b¡Muchísimas gracias! Ya me tenía harto la búsqueda, así que qué bueno que pude tomar el camino fácil.",
  "\\bYou don't want to trade? Aww..." => "\\b¿No querés intercambiar? Ay...",
  "\\bThanks for trading with me!" => "\\b¡Gracias por intercambiar conmigo!",
  "\\bYou can´t go to Route 10 right now." => "\\bNo podés ir a la Ruta 10 ahora mismo.",
  "\\bWhat do you mean, why? You just can´t go there right now, so get lost!" =>
    "\\b¿Cómo que por qué? Simplemente no podés ir ahí ahora, ¡así que rajá!",
  "\\bThere´re rumours going around about a strange Pokémon that sometimes appears over this pond." =>
    "\\bCorren rumores sobre un extraño Pokémon que a veces aparece sobre este estanque.",
  "\\bThey say that this Pokémon causes nightmares, but I don´t think that there´s a creature that can do that." =>
    "\\bDicen que este Pokémon provoca pesadillas, pero no creo que exista una criatura capaz de hacer eso.",
  "\\bHave you been to the Day Care before? The old couple that runs the Day Care can take care of your Pokémon." =>
    "\\b¿Alguna vez fuiste a la Guardería? La pareja de ancianos que la maneja puede cuidar a tus Pokémon.",
  "\\bHey, I bet a trainer like you is interested in Mega Stones. I happen to have a rare Mega Stone, which I´m willing to trade for a very certain object." =>
    "\\bEy, apuesto a que a un entrenador como vos le interesan las Megapiedras. Resulta que tengo una Megapiedra rara, que estoy dispuesto a cambiar por un objeto muy en particular.",
  "\\bI´m collecting ancient objects, and I only need one more piece to complete my collection." =>
    "\\bEstoy coleccionando objetos antiguos, y solo me falta una pieza más para completar mi colección.",
  "\\bIf you give me a Relic Vase, then I´ll give you an Audinite." =>
    "\\bSi me das una Vasija Reliquia, te doy una Audinita.",
  "\\bOh, you actually have a Relic Vase? Then trade it for the Audinite, I really need that vase!" =>
    "\\bOh, ¿en serio tenés una Vasija Reliquia? Entonces cambiala por la Audinita, ¡de verdad necesito esa vasija!",
  "\\bAlright, here we go!" => "\\bBueno, ¡allá vamos!",
  "\\bThank you! My collection is finally complete." => "\\b¡Gracias! Mi colección por fin está completa.",
  "\\bI´d feel bad if I just took the vase without you having any space in your bag to carry the Mega Stone. Make some space so we can trade." =>
    "\\bMe sentiría mal si tomo la vasija sin que tengas espacio en tu bolso para llevar la Megapiedra. Hacé lugar para que podamos intercambiar.",
  "\\bOh, I thought I could finally complete my collection..." =>
    "\\bAh, pensé que por fin podría completar mi colección...",
  "\\bIf you don´t know where to find Audino, then I can help you out. I heard that Audinos live in the mountains on Route 13." =>
    "\\bSi no sabés dónde encontrar a Audino, te puedo ayudar. Escuché que los Audino viven en las montañas de la Ruta 13.",
  "\\bI´ve never been up there, but I bet you can find one!" =>
    "\\bNunca estuve ahí arriba, ¡pero seguro que podés encontrar uno!",
  "\\bMY NAME IS JEFF!" => "\\b¡MI NOMBRE ES JEFF!",
}

CHOICES_177 = {
  "Sí|No" => "Sí|No",
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
        end
      end
    end
  end
  File.open(path, "wb") { |f| Marshal.dump(map, f) }
  puts "#{path}: #{count} reemplazos"
end

apply("Data/Map177.rxdata", DICT_177)
