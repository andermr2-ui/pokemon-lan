# encoding: UTF-8
require_relative "rpg_stubs"

DICT_263 = {
  "\\bMr. Game: Show me how you play and make my heart pound with excitement!" =>
    "\\bSeñor Juego: ¡Muéstrame cómo juegas y haz que mi corazón lata de emoción!",
  "\\bI always take a break between games, because I don´t want to become addicted like those guys over there." =>
    "\\bSiempre me tomo un descanso entre partidas, porque no quiero volverme adicto como esos tipos de allí.",

  "\\CN\\bWe exchange your coins for prizes." => "\\CN\\bCambiamos tus monedas por premios.",
  "\\CN\\bWhich prize would you like?" => "\\CN\\b¿Qué premio te gustaría?",
  "\\CN\\bPlease save your Coins and come again!" => "\\CN\\b¡Guarda tus monedas y vuelve pronto!",
  "\\CN\\bSo, you want the \\v[3]?" => "\\CN\\b¿Así que quieres el \\v[3]?",
  "\\CN\\bSorry, you'll need more coins than that." => "\\CN\\bLo siento, necesitarás más monedas que esas.",
  "\\CN\\bHere you go!\\1" => "\\CN\\b¡Aquí tienes!\\1",
  "\\CN\\bYou have no room in your Bag." => "\\CN\\bNo tienes espacio en tu Mochila.",

  "\\rThis is the Pokémon Lottery Corner. I'm Felicity, your attendant today." =>
    "\\rEsto es el Rincón de la Lotería Pokémon. Soy Felicity, tu encargada de hoy.",
  "\\rIf the drawn number matches the ID No. of any of your Pokémon, you could win fabulous gifts." =>
    "\\rSi el número sorteado coincide con el Nº de ID de alguno de tus Pokémon, podrías ganar regalos fabulosos.",
  "\\rWould you like to check today's lucky number?" =>
    "\\r¿Te gustaría comprobar el número de la suerte de hoy?",
  "\\rFirst, I'll look up today's Pokémon Lottery Corner lucky number." =>
    "\\rPrimero, buscaré el número de la suerte de hoy del Rincón de la Lotería Pokémon.",
  "\\rYour Loto Ticket number is \\v[1]." => "\\rTu número de Boleto Loto es \\v[1].",
  "\\rNow, let's see if it matches the ID No. of any of your Pokémon." =>
    "\\rAhora, veamos si coincide con el Nº de ID de alguno de tus Pokémon.",
  "\\rI'm sorry. You didn't get a match..." => "\\rLo siento. No conseguiste ninguna coincidencia...",
  "\\rPlease do visit again." => "\\rPor favor, vuelve pronto.",
  "\\rCongratulations!" => "\\r¡Felicidades!",
  "\\rThe ID number of your team's \\v[2] matches your Loto Ticket number!" =>
    "\\r¡El número de ID de tu \\v[2] del equipo coincide con tu número de Boleto Loto!",
  "\\rThe ID number of your PC-boxed \\v[2] matches your Loto Ticket number!" =>
    "\\r¡El número de ID de tu \\v[2] guardado en la PC coincide con tu número de Boleto Loto!",
  "\\rOh my goodness, all five digits matched!" => "\\r¡Vaya, coincidieron los cinco dígitos!",
  "\\rYou've won the jackpot prize!" => "\\r¡Ganaste el premio gordo!",
  "\\rPlease do visit again! Good-bye from Felicity, your attendant!" =>
    "\\r¡Por favor, vuelve pronto! ¡Adiós de parte de Felicity, tu encargada!",
  "\\rYou have no room left. Make room, then come see me." =>
    "\\rNo te queda espacio. Haz sitio y luego ven a verme.",
  "\\rThe last four digits matched, so you win the first prize!" =>
    "\\r¡Coincidieron los últimos cuatro dígitos, así que ganas el primer premio!",
  "\\rThe last three digits matched, so you win the second prize!" =>
    "\\r¡Coincidieron los últimos tres dígitos, así que ganas el segundo premio!",
  "\\rThe last two digits matched, so you win the third prize!" =>
    "\\r¡Coincidieron los últimos dos dígitos, así que ganas el tercer premio!",
  "\\rThe last digit matched, so you win the fourth prize!" =>
    "\\r¡Coincidió el último dígito, así que ganas el cuarto premio!",
  "\\rOh, I see.\\nPlease do visit us again." => "\\rOh, ya veo.\\nPor favor, vuelve a visitarnos.",
  "\\rYou've already drawn a Loto Ticket today. Please come back tomorrow." =>
    "\\rYa sacaste un Boleto Loto hoy. Por favor, vuelve mañana.",
  "\\rI've been waiting for you. Here's the item you won." =>
    "\\rTe estaba esperando. Aquí está el objeto que ganaste.",

  "\\CN\\bYour party's full!\\nPlease make some room before you come back." =>
    "\\CN\\bTu equipo está lleno.\\nHaz espacio antes de volver.",
  "\\CN\\bWould you like \\v[3]?" => "\\CN\\b¿Te gustaría \\v[3]?",
  "\\CN\\PN received the \\v[3]!" => "\\CN¡\\PN recibió a \\v[3]!",

  "\\bMy name is Mr. Game!" => "\\b¡Me llamo Señor Juego!",
  "\\bMy heart pounds with excitement when people enjoy my Coin game!" =>
    "\\bMi corazón late de emoción cuando la gente disfruta de mi juego de monedas.",
  "\\bIn fact, that's what I live for!\\nGo ahead and play it!" =>
    "\\bDe hecho, ¡para eso vivo!\\n¡Adelante, juega!",
  "\\bMake my heart pound with excitement!" => "\\b¡Haz que mi corazón lata de emoción!",
  "\\bGo ahead and play my Coin game!" => "\\b¡Adelante, juega a mi juego de monedas!",

  "\\G\\CN\\bWelcome to Riverstone Game Corner!" => "\\G\\CN\\b¡Bienvenido al Salón de Juegos de Río el Último!",
  "\\G\\CN\\bDo you need some game coins?\\nWould you like to buy some?" =>
    "\\G\\CN\\b¿Necesitas monedas de juego?\\n¿Te gustaría comprar algunas?",
  "\\G\\CN\\bYou don't have a Coin Case." => "\\G\\CN\\bNo tienes un Estuche de Monedas.",
  "\\G\\CN\\bWhoops!\\nYour Coin Case is full." => "\\G\\CN\\b¡Vaya!\\nTu Estuche de Monedas está lleno.",
  "\\G\\CN\\bYou can't afford the coins." => "\\G\\CN\\bNo puedes pagar las monedas.",
  "\\G\\CN\\bThank you\\nHere are your coins!" => "\\G\\CN\\bGracias.\\n¡Aquí tienes tus monedas!",
  "\\G\\CN\\bNo?\\nPlease come play sometime!" => "\\G\\CN\\b¿No?\\n¡Ven a jugar en otro momento!",

  "\\bOh, I´m not addicted, why would you even think that? What you´re seeing here is true dedication." =>
    "\\bOh, no soy adicto, ¿por qué siquiera pensarías eso? Lo que estás viendo aquí es verdadera dedicación.",
  "\\bI´ve been coming here every day for the past 30 years, and I´m still not addicted. Don´t let anyone fool you, your passion will never be an addiction." =>
    "\\bLlevo viniendo aquí todos los días durante los últimos 30 años, y sigo sin ser adicto. Que nadie te engañe, tu pasión nunca será una adicción.",
  "\\bI´m not leaving until I hit the Jackpot. And once I´ve won enough coins, I will exchange them for a rare Pokémon." =>
    "\\bNo me voy hasta dar con el premio gordo. Y una vez que gane suficientes monedas, las cambiaré por un Pokémon raro.",

  "\\rWelcome!" => "\\r¡Bienvenido!",
  "\\rOh, you don't have a Coin Case? Here." => "\\rOh, ¿no tienes un Estuche de Monedas? Toma.",
  "\\rYou can exchange your coins for fabulous prizes on the counter over there." =>
    "\\rPuedes cambiar tus monedas por premios fabulosos en ese mostrador de ahí.",
  "\\rYou don't have any room for it. Come back when you do." =>
    "\\rNo tienes espacio para eso. Vuelve cuando lo tengas.",
}

CHOICES_263 = {
  "Smoke Ball - 800 coins|Shed Shell - 800 coins|Red Card - 800 coins|Lucky Egg - 3000 coins" =>
    "Bola Humo - 800 monedas|Muda de Piel - 800 monedas|Tarjeta Roja - 800 monedas|Huevo Suerte - 3000 monedas",
  "Soothe Bell - 2000 Coins|Amulet Coin - 3000 Coins|No thanks" =>
    "Campana Alivio - 2000 monedas|Moneda Amuleto - 3000 monedas|No, gracias",
  "Voltorb - 180 coins|Ditto - 300 coins|Wynaut - 500 coins|Gimmighoul - 1000 coins" =>
    "Voltorb - 180 monedas|Ditto - 300 monedas|Wynaut - 500 monedas|Gimmighoul - 1000 monedas",
  "Porygon - 5000 coins|No thanks" => "Porygon - 5000 monedas|No, gracias",
  "TM01 - 3000 coins|TM20 - 2500 coins|TM59 - 3500 coins|TM60 - 3500 coins" =>
    "MT01 - 3000 monedas|MT20 - 2500 monedas|MT59 - 3500 monedas|MT60 - 3500 monedas",
  "TM94 - 4000 coins|No thanks" => "MT94 - 4000 monedas|No, gracias",
  "50 coins [$1,000]|500 coins [$10,000]|Exit" =>
    "50 monedas [1.000€]|500 monedas [10.000€]|Salir",
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

apply("Data/Map263.rxdata", DICT_263, CHOICES_263)
