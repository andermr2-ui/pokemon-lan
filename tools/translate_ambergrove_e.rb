# encoding: UTF-8
require_relative "rpg_stubs"

DICT_267 = {
  "\\bIsn´t the Day Care just great? This is my part-time job, and I basically get paid for playing with cute Pokémon. It´s all I ever wanted!" =>
    "\\b¿No es genial la Guardería? Este es mi trabajo de medio tiempo, y básicamente me pagan por jugar con Pokémon tiernos. ¡Es todo lo que siempre quise!",
  "\\rAh, there you are! My husband was looking for you." =>
    "\\rAh, ¡ahí estás! Mi esposo te estaba buscando.",
  "\\rI'm Day Care Laura. We can raise Pokémon for you." =>
    "\\rSoy Laura de la Guardería. Podemos criar Pokémon por vos.",
  "\\rWould you like us to raise your Pokémon?" => "\\r¿Querés que criemos a tu Pokémon?",
  "\\rOh? But you only have one Pokémon with you." => "\\r¿Ah? Pero solo tenés un Pokémon con vos.",
  "\\rYou can't go off without a Pokémon. Come back another time." =>
    "\\rNo podés irte sin un Pokémon. Volvé en otro momento.",
  "\\rWhich Pokémon should we raise for you?" => "\\r¿Cuál Pokémon querés que criemos por vos?",
  "\\rOh, fine, then.\\nCome again." => "\\rAh, está bien, entonces.\\nVolvé pronto.",
  "\\rIf you leave me that Pokémon, what are you gonna battle with?" =>
    "\\rSi me dejás ese Pokémon, ¿con qué vas a combatir?",
  "\\rCome back another time." => "\\rVolvé en otro momento.",
  "\\rFine, we'll raise your \\v[3] for a while." => "\\rBueno, vamos a criar a tu \\v[3] por un tiempo.",
  "\\rCome back for it later." => "\\rVolvé a buscarlo más tarde.",
  "\\rWe can raise two of your Pokémon. Would you like us to raise another?" =>
    "\\rPodemos criar dos de tus Pokémon. ¿Querés que criemos otro?",
  "\\rVery good. Come again." => "\\rMuy bien. Volvé pronto.",
  "\\rThat Pokémon looks like it would rather stay with you." =>
    "\\rParece que ese Pokémon prefiere quedarse con vos.",
  "\\rAh, it's you! Good to see you. Now, about your Pokémon..." =>
    "\\rAh, ¡sos vos! Qué bueno verte. Ahora, sobre tu Pokémon...",
  "\\rBy level, your \\v[3] has grown by about \\v[4]." =>
    "\\rEn niveles, tu \\v[3] creció aproximadamente \\v[4].",
  "\\rDo you want your Pokémon back?" => "\\r¿Querés que te devolvamos tu Pokémon?",
  "\\rYour Pokémon team is full. Make room, then come see me." =>
    "\\rTu equipo Pokémon está lleno. Hacé lugar y después vení a verme.",
  "\\G\\rIf you want your \\v[3] back, it will cost $\\v[4]." =>
    "\\G\\rSi querés que te devolvamos tu \\v[3], va a costar $\\v[4].",
  "\\G\\rYou don't have enough money..." => "\\G\\rNo tenés suficiente dinero...",
  "\\G\\rExcellent\\nHere's your Pokémon." => "\\G\\rExcelente.\\nAquí tenés tu Pokémon.",
  "\\PN took \\v[3] back from Day Care Laura." => "\\PN recuperó a \\v[3] de la Guardería de Laura.",
  "\\G\\rDo you want to take back the other one, too?" =>
    "\\G\\r¿Querés recuperar también al otro?",
  "\\bAh, it's you!" => "\\b¡Ah, sos vos!",
  "\\bWe were raising your Pokémon, and my goodness, were we surprised!" =>
    "\\bEstábamos criando a tu Pokémon, y madre mía, ¡vaya sorpresa que nos llevamos!",
  "\\bYour Pokémon was holding an Egg!" => "\\b¡Tu Pokémon tenía un Huevo!",
  "\\bWe don't know how it got there, but your Pokémon had it." =>
    "\\bNo sabemos cómo llegó ahí, pero tu Pokémon lo tenía.",
  "\\bYou do want it, don't you?" => "\\bLo querés, ¿no?",
  "\\bYou have no room for it right now... Come back when you've made room." =>
    "\\bNo tenés lugar para él ahora mismo... Volvé cuando hayas hecho lugar.",
  "\\me[Egg get]\\PN received the Egg from Day Care Daniel." =>
    "\\me[Egg get]\\PN recibió el Huevo de Daniel de la Guardería.",
  "\\bYou take good care of it." => "\\bCuidalo bien.",
  "\\bI really will keep it. You do want this Egg, yes?" =>
    "\\bLa verdad me lo voy a quedar. Querés este Huevo, ¿verdad?",
  "\\bWell all right then, I'll take it. Thank you." =>
    "\\bBueno, está bien entonces, me lo quedo. Gracias.",
  "\\bThat is, I don't think we'll ever find another..." =>
    "\\bEs decir, no creo que encontremos otro jamás...",
  "\\bNo, no, I'm sure we'll find another one. I'm definitely sure of it!" =>
    "\\bNo, no, seguro que vamos a encontrar otro. ¡Estoy completamente seguro!",
  "\\bI'm Day Care Daniel." => "\\bSoy Daniel de la Guardería.",
  "\\bI help take care of the precious Pokémon of trainers." =>
    "\\bAyudo a cuidar los preciados Pokémon de los entrenadores.",
  "\\bAny Pokémon you'd like to have raised you can leave in my wife's care." =>
    "\\bCualquier Pokémon que quieras que críen lo podés dejar al cuidado de mi esposa.",
  "\\bAh, it's you!\\nGood to see you!" => "\\b¡Ah, sos vos!\\nQué bueno verte.",
  "\\bYour \\v[3] is doing just fine." => "\\bTu \\v[3] está muy bien.",
  "\\bYour \\v[3] and \\v[4] are doing just fine." => "\\bTu \\v[3] y \\v[4] están muy bien.",
  "\\bThe two play with other Pokémon rather than with each other..." =>
    "\\bLos dos juegan con otros Pokémon en vez de jugar entre ellos...",
  "\\bThe two don't seem to like each other much." => "\\bLos dos no parecen llevarse muy bien.",
  "\\bThe two seem to get along." => "\\bLos dos parecen llevarse bien.",
  "\\bThe two seem to get along very well." => "\\bLos dos parecen llevarse muy bien.",
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

apply("Data/Map267.rxdata", DICT_267)
