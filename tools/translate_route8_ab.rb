# encoding: UTF-8
require_relative "rpg_stubs"

DICT_143 = {
  "\\bAre you ready for Route 8?" => "\\b¿Estás listo para la Ruta 8?",
  "\\bI want to catch every single Pokémon on this Route!" => "\\b¡Quiero atrapar a todos y cada uno de los Pokémon de esta ruta!",
  "\\bThis is my hill! And you are not invited!" => "\\b¡Esta es mi colina! ¡Y tú no estás invitado!",
  "\\bOkay, you can stay." => "\\bVale, puedes quedarte.",
  "\\bWatch out! Here I come!" => "\\b¡Cuidado! ¡Ahí voy!",
  "\\bWhy can´t you just take a different bridge?!" => "\\b¡¿Por qué no puedes tomar otro puente?!",
  "\\bSURPRISE ATTACK! GIVE ME YOUR WALLET!" => "\\b¡ATAQUE SORPRESA! ¡DAME TU CARTERA!",
  "\\bMost trainers on Route 8 are hella rich." => "\\bLa mayoría de los entrenadores de la Ruta 8 son bastante ricos.",
}

DICT_144 = {
  "\\bSTOP!" => "\\b¡ALTO!",
  "\\bDon´t enter this part of Route 8. This is where Kleavor lives. This Pokémon was once believed to be extinct! It´s extremely strong and very aggressive!" =>
    "\\bNo entres en esta parte de la Ruta 8. Aquí vive Kleavor. ¡Se creía que este Pokémon estaba extinto! ¡Es extremadamente fuerte y muy agresivo!",
  "\\bIf I were you, I would not go in there..." => "\\bSi yo fuera tú, no entraría ahí...",
  "\\bIf someone were to catch this Pokémon, scientists might be able to find out more about it. But I don´t think anyone stands a chance against Kleavor." =>
    "\\bSi alguien atrapara a este Pokémon, los científicos podrían averiguar más sobre él. Pero no creo que nadie tenga oportunidad contra Kleavor.",
  "It´s a shrine dedicated to Tornadus." => "Es un altar dedicado a Tornadus.",
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo acaba de brillar!",
  "Something powerful is approaching!" => "¡Algo poderoso se aproxima!",
  "\\bTORNAAA!!!" => "\\b¡TORNAAA!!!",
  "Tornadus disappeared. Will it come back?" => "Tornadus desapareció. ¿Volverá?",
  "\\bYou look like you want to battle. Alright then!" => "\\bParece que quieres combatir. ¡Muy bien, entonces!",
  "\\bYou can try and get a better view over the maze from here." => "\\bPuedes intentar ver mejor el laberinto desde aquí.",
  "\\bI got lost, but at least I found a cool Pokémon!" => "\\bMe perdí, ¡pero al menos encontré un Pokémon genial!",
  "\\bGood luck, I hope you find the exit." => "\\bBuena suerte, espero que encuentres la salida.",
  "\\bBe careful if you want to go any further, you might get lost." => "\\bTen cuidado si quieres seguir avanzando, podrías perderte.",
  "\\bThis maze wasn´t actually made by humans. It´s entirely natural." => "\\bEste laberinto en realidad no lo hicieron los humanos. Es completamente natural.",
  "\\bKLEAAAAAAVVVV!!!" => "\\b¡KLEAAAAAAVVVV!!!",
  "\\bI think I found the exit!" => "\\b¡Creo que encontré la salida!",
  "\\bI thought this was the exit, but without Surf, this is just another dead end." =>
    "\\bPensé que esta era la salida, pero sin Surf, esto es solo otro callejón sin salida.",
  "\\bOh, hello. I didn´t expect someone to find my favorite fishing spot." =>
    "\\bOh, hola. No esperaba que alguien encontrara mi lugar de pesca favorito.",
  "\\bWell, it´s always great to meet a fellow fisherman. Why don´t you accompany me and fish here with me?" =>
    "\\bBueno, siempre es genial conocer a otro pescador. ¿Por qué no me acompañas y pescas aquí conmigo?",
  "\\bGreat! And you know what, I want you to have my spare rod. These Good Rods are very durable anyways, so I don´t really need two of them." =>
    "\\b¡Genial! Y sabes qué, quiero que te quedes con mi caña de repuesto. Estas Súper Cañas son muy duraderas de todos modos, así que no necesito dos.",
  "\\bNow let´s catch something!" => "\\b¡Ahora pesquemos algo!",
  "\\bOh, that´s a shame." => "\\bOh, qué pena.",
  "\\bMy biggest catch on Route 8 was a massive Feebas. I know that those are ugly, but you should have seen the size of that thing!" =>
    "\\bMi mayor captura en la Ruta 8 fue un Feebas enorme. Sé que son feos, ¡pero deberías haber visto el tamaño de esa cosa!",
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

apply("Data/Map143.rxdata", DICT_143)
apply("Data/Map144.rxdata", DICT_144)
