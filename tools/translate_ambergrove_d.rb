# encoding: UTF-8
require_relative "rpg_stubs"

DICT_182 = {
  "\\bIf you want to know more about our family, you´ll have to defeat me!" =>
    "\\b¡Si querés saber más sobre nuestra familia, vas a tener que derrotarme!",
  "\\bAlright, listen up. Our family moved here from another region, because we wanted to live somewhere with less water." =>
    "\\bBueno, escuchá. Nuestra familia se mudó acá desde otra región, porque queríamos vivir en algún lugar con menos agua.",
  "\\bWe´re really proud of Nyssa. Even though she had to move away from her friends, she never gave up and managed to become a Gym Leader!" =>
    "\\bEstamos muy orgullosos de Nyssa. Aunque tuvo que alejarse de sus amigos, nunca se rindió y ¡logró convertirse en líder de gimnasio!",
  "\\bYou might have won, but you have to admit that Nyssa didn´t make it easy for you." =>
    "\\bPuede que hayas ganado, pero tenés que admitir que Nyssa no te lo puso nada fácil.",
  "\\bDon´t think that my daughter is the only strong trainer in our family!" =>
    "\\b¡No creas que mi hija es la única entrenadora fuerte de nuestra familia!",
  "\\bWhen Nyssa was old enough to start her journey, the professor didn´t have a Pokémon for her." =>
    "\\bCuando Nyssa tuvo edad para empezar su viaje, el profesor no tenía un Pokémon para ella.",
  "\\bBecause it was her big dream to become a strong Pokémon trainer, I decided to gift her my Wimpod." =>
    "\\bComo su gran sueño era convertirse en una entrenadora Pokémon fuerte, decidí regalarle mi Wimpod.",
  "\\bI´m glad I did that, because look at my daughter now. She managed to fulfil her dream!" =>
    "\\bMe alegra haberlo hecho, porque mirá a mi hija ahora. ¡Logró cumplir su sueño!",
  "\\bWow, you won against my daughter. You should be proud of yourself, because we´re talking about someone who is respected by the Elite Four!" =>
    "\\bGuau, le ganaste a mi hija. Deberías estar orgulloso, porque estamos hablando de alguien respetada por el Alto Mando.",
  "\\bYou won´t even get to challenge big sis, because I will stop you right here!" =>
    "\\b¡Ni siquiera vas a llegar a desafiar a mi hermana mayor, porque te voy a detener acá mismo!",
  "\\bI´m gonna tell you a secret about big sis, but only because you managed to win against me." =>
    "\\bTe voy a contar un secreto sobre mi hermana mayor, pero solo porque lograste ganarme.",
  "\\bNyssa doesn´t really care too much about who you are and what you do, as long as you make a good first impression. Remember that." =>
    "\\bA Nyssa en realidad no le importa mucho quién sos ni qué hacés, mientras causes una buena primera impresión. Recordalo.",
  "\\bI knew you were strong, but I didn´t expect you to be strong enough to beat big sis..." =>
    "\\bSabía que eras fuerte, pero no esperaba que fueras lo bastante fuerte como para vencer a mi hermana mayor...",
  "\\bI´m gonna show you why my family uses Bug-Type Pokémon!" =>
    "\\b¡Te voy a mostrar por qué mi familia usa Pokémon de tipo Bicho!",
  "\\bOur family loves Bug-Type Pokémon. They might seem weak at first, but they can actually be very powerful." =>
    "\\bA nuestra familia le encantan los Pokémon de tipo Bicho. Puede que parezcan débiles al principio, pero en realidad pueden ser muy poderosos.",
  "\\bOh, and I don´t know if someone already told you, but we actually are 5 siblings! We all train with each other, and that´s why our Pokémon are so strong." =>
    "\\bAh, y no sé si alguien ya te lo dijo, ¡pero en realidad somos 5 hermanos! Todos entrenamos entre nosotros, y por eso nuestros Pokémon son tan fuertes.",
  "\\bWow, not even her Scizor could stop you. Amazing!" =>
    "\\bGuau, ni siquiera su Scizor pudo detenerte. ¡Increíble!",
  "\\bWelcome to the Ambergrove Gym. The trainers in this Gym are all from Nyssa´s family, and they specialize in Bug-Type Pokémon." =>
    "\\bBienvenido al Gimnasio de Arboleda Ámbar. Todos los entrenadores de este Gimnasio son de la familia de Nyssa, y se especializan en Pokémon de tipo Bicho.",
  "\\bRock-, Flying- and Fire-Type Attacks are going to give you an advantage here, but you shouldn´t underestimate this family. They´re strong!" =>
    "\\bLos ataques de tipo Roca, Volador y Fuego te van a dar ventaja acá, pero no deberías subestimar a esta familia. ¡Son fuertes!",
  "\\bDamn, I wish I would´ve seen your battle. Congrats on claiming the Arachno Badge!" =>
    "\\bCarajo, ojalá hubiera visto tu combate. ¡Felicitaciones por conseguir la Medalla Arácnida!",
  "\\bYou´re only allowed to face Nyssa if you can answer her 4 questions." =>
    "\\bSolo se te permite enfrentar a Nyssa si podés responder sus 4 preguntas.",
  "\\bHere comes the first question. What is Nyssa´s favorite Pokémon move?" =>
    "\\bAquí va la primera pregunta. ¿Cuál es el movimiento Pokémon favorito de Nyssa?",
  "\\bI´m sorry, but that´s the wrong answer." => "\\bLo siento, pero esa es la respuesta incorrecta.",
  "\\bCongratulations, that was correct! Now, here comes the second question." =>
    "\\b¡Felicitaciones, esa era correcta! Ahora, aquí va la segunda pregunta.",
  "\\bWhat was Nyssa´s first Pokémon?" => "\\b¿Cuál fue el primer Pokémon de Nyssa?",
  "\\bThat´s correct again! Onto the next one then." => "\\b¡Otra vez correcto! Vamos con la siguiente entonces.",
  "\\bWhich region is Nyssa from?" => "\\b¿De qué región es Nyssa?",
  "\\bThat´s correct, Nyssa is from the Hoenn Region. You have made it to the final question!" =>
    "\\bCorrecto, Nyssa es de la región de Hoenn. ¡Llegaste a la pregunta final!",
  "\\bHow many siblings does Nyssa have?" => "\\b¿Cuántos hermanos tiene Nyssa?",
  "\\bCongratulations, you answered every question correctly! You can proceed to the next room now." =>
    "\\b¡Felicitaciones, respondiste todas las preguntas correctamente! Ya podés pasar a la siguiente sala.",
  "\\bTry to defeat the other trainers, and they might give you a hint." =>
    "\\bIntentá derrotar a los otros entrenadores, y tal vez te den una pista.",
  "\\bGood luck in there. Nyssa´s Bug-Type Pokémon are tough." =>
    "\\bBuena suerte ahí adentro. Los Pokémon de tipo Bicho de Nyssa son duros.",
  "\\bGreat job! Nyssa never holds back, so you have to be super strong!" =>
    "\\b¡Gran trabajo! Nyssa nunca se guarda nada, así que tenés que ser súper fuerte.",
}

CHOICES_182 = {
  "Leech Life|Bug Buzz|First Impression" => "Chupavidas|Zumbido|Sorpresa",
  "Wimpod|Venipede|Spinarak" => "Wimpod|Venipede|Spinarak",
  "Delta|Galar|Hoenn" => "Delta|Galar|Hoenn",
  "2|3|4" => "2|3|4",
}

DICT_183 = {
  "\\bNyssa: Hello, \\PN. I´m glad you made it. I haven´t had a good battle in a while, so I want you to change that." =>
    "\\bNyssa: Hola, \\PN. Me alegra que hayas llegado. Hace tiempo que no tengo un buen combate, así que quiero que cambies eso.",
  "\\bCan you already feel the bugs crawling on your skin?!" =>
    "\\b¿¡Ya podés sentir a los bichos arrastrándose sobre tu piel!?",
  "\\me[Badge get]\\bYes, that´s exactly what I wanted to see. Take the Arachno Badge!\\wtnp[110]" =>
    "\\me[Badge get]\\bSí, eso es exactamente lo que quería ver. ¡Tomá la Medalla Arácnida!\\wtnp[110]",
  "\\bAnd because I like you, I want you to have this." => "\\bY como me caés bien, quiero que tengas esto.",
  "\\bNyssa: This TM cointains X-Scissor, a strong Bug-Type move that really shows what these Pokémon are capable of." =>
    "\\bNyssa: Esta MT contiene Tijera X, un poderoso movimiento de tipo Bicho que muestra realmente de qué son capaces estos Pokémon.",
  "\\bWith the Arachno Badge, you can now use Strength to move boulders around." =>
    "\\bCon la Medalla Arácnida, ahora podés usar Fuerza para mover peñascos.",
  "\\bBut tell me, is everything alright? You seem a bit nervous." =>
    "\\bPero decime, ¿está todo bien? Te veo un poco nervioso.",
  "\\bOh, so you need to go to the Sword Ruins? Well you´re in luck, because they´re not far from here." =>
    "\\bAh, ¿así que tenés que ir a las Ruinas de la Espada? Bueno, estás de suerte, porque no quedan lejos de acá.",
  "\\bJust head west from here, and then you can´t miss them. But please be careful, because I want to see you again. Bye!" =>
    "\\bSolo andá hacia el oeste desde acá, y no te las vas a perder. Pero por favor, tené cuidado, porque quiero volver a verte. ¡Chau!",
  "\\bNyssa: Once you have the time, why don´t we go for a walk? Ambergrove is the perfect place for that!" =>
    "\\bNyssa: Cuando tengas tiempo, ¿por qué no salimos a caminar? ¡Arboleda Ámbar es el lugar perfecto para eso!",
  "\\bNyssa: \\PN! You´re back!" => "\\bNyssa: ¡\\PN! ¡Volviste!",
  "\\bUhm, how do I put this?" => "\\bEhm, ¿cómo lo digo?",
  "\\bI missed you! You´ve no idea how happy I was when I found out that you´re our new Champion." =>
    "\\b¡Te extrañé! No tenés idea de lo feliz que estuve cuando me enteré de que sos nuestro nuevo Campeón.",
  "\\bThis means that I won´t only be able to have another battle with you, but with the strongest trainer as well!" =>
    "\\b¡Esto significa que no solo voy a poder tener otro combate con vos, sino con el entrenador más fuerte también!",
  "\\bI´ve refined my skills since our last battle, and I won´t hold back!" =>
    "\\bHe refinado mis habilidades desde nuestro último combate, ¡y no me voy a guardar nada!",
  "\\bNyssa: Mhh, I don´t care that I lost. I got to see you again, and that´s worth more than any victory in the world." =>
    "\\bNyssa: Mmh, no me importa haber perdido. Pude verte de nuevo, y eso vale más que cualquier victoria del mundo.",
  "\\bAnd now that I finally got you back, I want to invite you on a date. Let´s meet at the Patisserie Alcremie in Meadow Grove. I love that place!" =>
    "\\bY ahora que por fin te tengo de vuelta, quiero invitarte a una cita. Encontrémonos en la Patisserie Alcremie en Arboleda del Prado. ¡Amo ese lugar!",
  "\\bOh, maybe I should ask you if you also want to go. Will you go on a date with me?" =>
    "\\bAh, tal vez debería preguntarte si también querés ir. ¿Querés tener una cita conmigo?",
  "\\bYAAAY!!!" => "\\b¡SIIIÍ!!!",
  "\\bWait for me at the Patisserie, I´ll join you soon." => "\\bEsperame en la Patisserie, ya te alcanzo.",
  "\\bWhat?! Are you serious?! But I´m pretty and I like you! Don´t reject me like that! " =>
    "\\b¿¡Qué!? ¿¡En serio!? ¡Pero soy linda y me gustás! ¡No me rechaces así! ",
  "\\bI guess I can´t force you, but a simple \"no\" would´ve been enough..." =>
    "\\bSupongo que no te puedo obligar, pero un simple \"no\" habría bastado...",
  "\\bLeave me alone now!" => "\\b¡Dejame sola ahora!",
  "\\bNyssa: I told you to leave me alone! If you don´t like me, then why are here?!" =>
    "\\bNyssa: ¡Te dije que me dejaras sola! Si no te gusto, ¿¡entonces qué hacés acá!?",
  "\\bNyssa: I´m so excited! I´ve never been on a date before, and now I´m gonna go on one with you!!!" =>
    "\\bNyssa: ¡Estoy tan emocionada! Nunca antes tuve una cita, ¡y ahora voy a tener una con vos!",
  "\\bNyssa: \\PN! You´re here! I missed you! How has your day been?! Do you want to go on another date?! Do you need anything?!" =>
    "\\bNyssa: ¡\\PN! ¡Estás acá! ¡Te extrañé! ¡¿Cómo estuvo tu día?! ¡¿Querés tener otra cita?! ¡¿Necesitás algo?!",
  "\\bOh, sorry, I didn´t want to overwhelm you. I just get really excited whenever I see you." =>
    "\\bAh, perdón, no quería agobiarte. Es que me emociono muchísimo cada vez que te veo.",
  "\\bLove you!" => "\\b¡Te quiero!",
}

CHOICES_183 = {
  "Of course!|Ew no..." => "¡Por supuesto!|Ew, no...",
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

apply("Data/Map182.rxdata", DICT_182, CHOICES_182)
apply("Data/Map183.rxdata", DICT_183, CHOICES_183)
