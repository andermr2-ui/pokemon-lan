# encoding: UTF-8
require_relative "rpg_stubs"

DICT = {
  "Don´t tell anyone that I sell this stuff. It´s illegal, and I don´t want to go to prison." =>
    "No le digas a nadie que vendo estas cosas. Es ilegal, y no quiero ir a la cárcel.",
  "\\bDo you want some weed? Then I have just the right Pokémon for the job." =>
    "\\b¿Quieres hierba? Entonces tengo justo el Pokémon adecuado para el trabajo.",
  "\\bSprigatito is the perfect Pokémon for getting high, and I can give you mine for just $20.000." =>
    "\\bSprigatito es el Pokémon perfecto para colocarte, y te puedo dar el mío por solo 20.000 ₽.",
  "\\bHave fun getting high!" => "\\b¡Que te diviertas colocándote!",
  "\\bWow, even I have never been that broke..." => "\\bVaya, ni siquiera yo he estado tan sin blanca...",
  "\\bI thought you wanted to get high?" => "\\bPensaba que querías colocarte.",
  "\\bSprigatito weed is the best in the world. That stuff can send you to a different dimension." =>
    "\\bLa hierba de Sprigatito es la mejor del mundo. Esa cosa te puede mandar a otra dimensión.",
  "\\bDo you want to buy a rare Pokémon?" => "\\b¿Quieres comprar un Pokémon raro?",
  "\\bI´ve got a Fennekin, and you can get it for just $20.000. So, what do you say?" =>
    "\\bTengo un Fennekin, y lo puedes conseguir por solo 20.000 ₽. Entonces, ¿qué me dices?",
  "\\bYou´ve made a good purchase." => "\\bHas hecho una buena compra.",
  "\\bWait, you don´t have enough money. Are you trying to scam me?!" =>
    "\\bEspera, no tienes suficiente dinero. ¡¿Intentas estafarme?!",
  "\\bYou´re missing out on a great deal..." => "\\bTe estás perdiendo una gran oferta...",
  "\\bOh, I didn´t steal that Fennekin. I found it, in, uhm, Unova? Or was it Paldea? Something like that..." =>
    "\\bOh, no robé ese Fennekin. Lo encontré en, eh, ¿Teselia? ¿O era Paldea? Algo así...",
  "\\bWelcome to the Underground Market. You can buy absolutely everything here. Just remember to be quiet about this place. Have fun!" =>
    "\\bBienvenido al Mercado Subterráneo. Aquí puedes comprar absolutamente de todo. Solo recuerda no hablar de este sitio. ¡Diviértete!",
  "\\bYou look like you want to have a Sobble!" => "\\b¡Parece que quieres tener un Sobble!",
  "\\bAnd I happen to have a Sobble, which I´d sell to you for $20.000. Do you want it?" =>
    "\\bY da la casualidad de que tengo un Sobble, que te vendería por 20.000 ₽. ¿Lo quieres?",
  "\\bI hope you like your new Pokémon!" => "\\b¡Espero que te guste tu nuevo Pokémon!",
  "\\bWhat? Why did you come here if you´re broke?!" =>
    "\\b¿Qué? ¡¿Por qué has venido aquí si no tienes ni un duro?!",
  "\\bBut this Sobble wants to be with a strong trainer..." =>
    "\\bPero este Sobble quiere estar con un entrenador fuerte...",
  "\\bUnderground markets like this one are the only way for folks like us to get around the inflation." =>
    "\\bLos mercados subterráneos como este son la única forma que tiene la gente como nosotros de sortear la inflación.",
  "\\bI have a rare Pokémon, and it can be yours for just $20.000." =>
    "\\bTengo un Pokémon raro, y puede ser tuyo por solo 20.000 ₽.",
  "\\bIt´s a Froakie, which you won´t find in this region. Do you want it?" =>
    "\\bEs un Froakie, que no vas a encontrar en esta región. ¿Lo quieres?",
  "\\bYou won´t regret it." => "\\bNo te arrepentirás.",
  "\\bOh, you´re broke..." => "\\bOh, estás sin blanca...",
  "\\bDamn, you should get a job." => "\\bJoder, deberías buscarte un trabajo.",
  "\\bYour loss." => "\\bTu pérdida.",
  "\\bAt this rate I can afford my vacation in Alola in no time!" =>
    "\\b¡A este ritmo me puedo pagar las vacaciones en Alola en nada!",
  "If you´re interested in fossils, you´ve come to the right guy." =>
    "Si te interesan los fósiles, has venido al tipo correcto.",
  "\\bDo you have $20.000 that you don´t need?" => "\\b¿Tienes 20.000 ₽ que no necesites?",
  "\\bI have a Scorbunny that I don´t need, so why don´t we trade?" =>
    "\\bTengo un Scorbunny que no necesito, así que ¿por qué no intercambiamos?",
  "\\bIt was a pleasure to trade with you." => "\\bFue un placer intercambiar contigo.",
  "\\bOh, you don´t have $20.000? You need every penny then..." =>
    "\\bOh, ¿no tienes 20.000 ₽? Entonces necesitas hasta el último céntimo...",
  "\\bCome on, let´s trade..." => "\\bVenga, intercambiemos...",
  "\\bNow you have something you need and I have something I need." =>
    "\\bAhora tú tienes algo que necesitas y yo tengo algo que necesito.",
  "\\bHey hey, do you want to buy a Chespin? I´ve got one for just $20.000." =>
    "\\bEy, ey, ¿quieres comprar un Chespin? Tengo uno por solo 20.000 ₽.",
  "\\bMh, the smell of cash..." => "\\bMmm, el olor del dinero...",
  "\\bAre you serious?! You don´t have $20.000?! Broke ass..." =>
    "\\b¡¿En serio?! ¡¿No tienes 20.000 ₽?! Pobretón...",
  "\\bHuh, what´s the hold up?" => "\\bEh, ¿qué pasa, por qué te lo piensas tanto?",
  "\\bWhy do people look down on selling Pokémon? It´s actually quite convenient for some people." =>
    "\\b¿Por qué la gente mira mal vender Pokémon? La verdad es que resulta bastante conveniente para algunos.",
  "I´ve got the finest goods. This stuff is super rare, trust me." =>
    "Tengo la mejor mercancía. Esto es súper raro, confía en mí.",
  "\\bDon´t let the others scam you, I can give you a rare Pokémon for just $12.000." =>
    "\\bNo dejes que los demás te estafen, yo te puedo dar un Pokémon raro por solo 12.000 ₽.",
  "\\bI´ve got a Fuecoco, which you can only find in Paldea. It can be yours. Come on, my price is great!" =>
    "\\bTengo un Fuecoco, que solo se encuentra en Paldea. Puede ser tuyo. ¡Venga, mi precio es genial!",
  "\\bI told you it´s a great price." => "\\bTe dije que era un gran precio.",
  "\\bWait, you can´t even afford my special price?! That´s just sad..." =>
    "\\bEspera, ¡¿ni siquiera puedes pagar mi precio especial?! Eso es triste...",
  "\\bI can´t make it cheaper than that, so you have to be fair..." =>
    "\\bNo lo puedo poner más barato que eso, así que tienes que ser justo...",
  "\\bThere´s no reason to charge $20.000 for these Pokémon. Only collectors would pay that much..." =>
    "\\bNo hay razón para cobrar 20.000 ₽ por estos Pokémon. Solo los coleccionistas pagarían tanto...",
  "I´ve got the best tech. It doesn´t get more advanced than this." =>
    "Tengo la mejor tecnología. No hay nada más avanzado que esto.",
  "\\bAre you looking for a Quaxly?" => "\\b¿Buscas un Quaxly?",
  "\\bThen you´re in luck, because I can give you one for just $20.000." =>
    "\\bEntonces estás de suerte, porque te puedo dar uno por solo 20.000 ₽.",
  "\\bThat´s what I like to see!" => "\\b¡Eso es lo que me gusta ver!",
  "\\bOh, you don´t have enough cash? Get lost!" => "\\bOh, ¿no tienes suficiente pasta? ¡Lárgate!",
  "\\bYou won´t get a Quaxly anywhere else..." => "\\bNo vas a conseguir un Quaxly en ningún otro sitio...",
  "\\bI might actually survive the economic crisis. I just need to sell one more Pokémon and then I´ve got nothing to worry about." =>
    "\\bPuede que sobreviva a la crisis económica después de todo. Solo necesito vender un Pokémon más y ya no tendré de qué preocuparme.",
}

CHOICES = {
  "I´m taking it|No, I don´t want it" => "Me lo llevo|No, no lo quiero",
}

path = "Data/Map299.rxdata"
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
        next unless DICT.key?(full)
        cmd.parameters[0] = DICT[full]
        ((i + 1)...j).each { |k| list[k].parameters[0] = "" }
        count += 1
      elsif cmd.code == 102
        opts = cmd.parameters[0]
        next unless opts.is_a?(Array)
        joined = opts.join("|")
        if CHOICES.key?(joined)
          cmd.parameters[0] = CHOICES[joined].split("|")
          count += 1
        end
      end
    end
  end
end
File.open(path, "wb") { |f| Marshal.dump(map, f) }
puts "#{path}: #{count} reemplazos"
