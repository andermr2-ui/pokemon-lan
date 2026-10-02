# encoding: UTF-8
require_relative "rpg_stubs"

DICT_187 = {
  "\\bYou look like a nerd. But do you fight like one?" =>
    "\\bTenés pinta de nerd. ¿Pero peleás como uno?",
  "\\bYou might not see it at first, but I´m a big nerd myself." =>
    "\\bPuede que no se note a primera vista, pero yo también soy un gran nerd.",
  "It´s a Pokémon Statue dedicated to Pecharunt." => "Es una estatua Pokémon dedicada a Pecharunt.",
  "The Delta Stone in your pocket just lit up!" => "¡La Piedra Delta en tu bolsillo acaba de brillar!",
  "Something powerful is approaching!" => "¡Algo poderoso se aproxima!",
  "\\bPECHAAA!!!" => "\\b¡PECHAAA!!!",
  "Pecharunt disappeared. Will it come back?" => "Pecharunt desapareció. ¿Volverá?",
  "\\bYo bitch wassup?!" => "\\b¡Ey perra, ¿qué onda?!",
  "\\bYou stupid bitch!" => "\\b¡Perra estúpida!",
  "\\bIt´s time to get shocked!" => "\\b¡Es hora de recibir una descarga!",
  "\\bThe trainers on Route 10 are tough. You only come here if you´re ready for battle." =>
    "\\bLos entrenadores de la Ruta 10 son duros. Solo venís acá si estás listo para combatir.",
  "\\bAh, you must be the kid that the boss mentioned. We knew you´d come. But don´t think we´re just gonna let you through, that would be stupid." =>
    "\\bAh, debés ser el chico que mencionó el jefe. Sabíamos que ibas a venir. Pero no pienses que te vamos a dejar pasar así nomás, eso sería estúpido.",
  "\\bPrepare for trouble!" => "\\b¡Prepárate para los problemas!",
  "\\bThe boss also said that we wouldn´t be able to stop you. Looks like he´s right." =>
    "\\bEl jefe también dijo que no íbamos a poder detenerte. Parece que tiene razón.",
  "\\bSTOP. I LOST MY GLASSES. GO AWAY, OR YOU`LL STEP ON THEM!" =>
    "\\bALTO. PERDÍ MIS ANTEOJOS. ¡ANDATE, O LOS VAS A PISAR!",
  "\\bThe boss said you´re strong. But how strong?!" => "\\bEl jefe dijo que sos fuerte. ¿¡Pero cuán fuerte!?",
  "\\bWhy did the boss have any faith in me to begin with..." =>
    "\\b¿Por qué el jefe confió en mí para empezar...",
  "\\bThis is quite a green day!" => "\\b¡Vaya día tan verde!",
  "\\bIt´s time for my holidays." => "\\bYa es hora de mis vacaciones.",
  "\\bYou look like a good sparring partner. Time to train!" =>
    "\\bTenés pinta de buen compañero de entrenamiento. ¡Hora de entrenar!",
  "\\bIt´s always good to train with other trainers. Battling wild Pokémon all the time just doesn´t do it for me." =>
    "\\bSiempre está bueno entrenar con otros entrenadores. Combatir Pokémon salvajes todo el tiempo no me convence.",
}

DICT_189 = {
  "\\bWait a minute, this fishing stuff is hella boring..." =>
    "\\bEsperá un momento, esto de pescar es re aburrido...",
  "\\bI should´ve tried this with cheaper equipment first, but no, I had to buy the most expensive equipment immediately." =>
    "\\bDebería haber probado esto con equipo más barato primero, pero no, tenía que comprar el equipo más caro de una.",
  "\\bWould you mind taking this? I need to find a more exciting hobby, cause this ain´t it." =>
    "\\b¿Te molestaría llevarte esto? Necesito encontrar un hobby más emocionante, porque esto no es lo mío.",
  "\\bI´m glad I tried it out, but I guess I just don´t have the patience for fishing." =>
    "\\bMe alegra haberlo probado, pero supongo que no tengo la paciencia para pescar.",
  "\\bI need a hobby where I actually do stuff. Maybe surfing in Alola or Cycling in Kalos?" =>
    "\\bNecesito un hobby donde realmente haga cosas. ¿Tal vez surf en Alola o ciclismo en Kalos?",
  "\\bNah, I´m probably just gonna hit the slots again. My attention span cooked, and I don´t even use Insta..." =>
    "\\bNah, seguramente vuelva a las tragamonedas nomás. Se me quemó la capacidad de atención, y ni siquiera uso Insta...",
  "\\bI train with my father every day. Let us show you our progress!" =>
    "\\bEntreno con mi padre todos los días. ¡Dejanos mostrarte nuestro progreso!",
  "\\bWe need to train our Pokémon even more. I want to be as as strong as you!" =>
    "\\bNecesitamos entrenar aún más a nuestros Pokémon. ¡Quiero ser tan fuerte como vos!",
  "\\bMy daughter wants to train with me, and I can´t disappoint her!" =>
    "\\bMi hija quiere entrenar conmigo, ¡y no la puedo decepcionar!",
  "\\bMaybe my daughter is right. If we keep on training, we might get to your level one day!" =>
    "\\bTal vez mi hija tenga razón. ¡Si seguimos entrenando, algún día podríamos llegar a tu nivel!",
}

DICT_193 = {
  "\\bI´m only here because this job pays well. And I work hard for my money!" =>
    "\\bSolo estoy acá porque este trabajo paga bien. ¡Y trabajo duro por mi dinero!",
  "\\bDon´t judge me, okay? People have done worse things for money." =>
    "\\bNo me juzgues, ¿sí? La gente ha hecho cosas peores por dinero.",
  "\\bNyssa: Hey, \\PN, it´s good to see you. What did you do in there with these Team Rocket guys?" =>
    "\\bNyssa: Ey, \\PN, qué bueno verte. ¿Qué hiciste ahí adentro con esos tipos del Team Rocket?",
  "\\bWhat? Their leader caught a Keldeo?! Isn´t that this mythical Pokémon? The one that some call the protector of this region?" =>
    "\\b¿Qué? ¿¡Su líder atrapó a un Keldeo!? ¿No es ese el Pokémon mítico? ¿El que algunos llaman el protector de esta región?",
  "\\bYou need to go after these guys. It looked like one of them was headed for Relic Cave. Please, this has me really worried." =>
    "\\bTenés que ir tras esos tipos. Parecía que uno de ellos se dirigía a la Cueva Fetiche. Por favor, esto me tiene muy preocupada.",
  "\\bI need to go back to the Gym now. Please be careful!" =>
    "\\bNecesito volver al Gimnasio ahora. ¡Por favor, tené cuidado!",
  "\\bIf you want to see the boss, you´ll have to work for it!" =>
    "\\b¡Si querés ver al jefe, te lo vas a tener que ganar!",
  "\\bGo ahead. But don´t do anything stupid!" => "\\bAdelante. ¡Pero no hagas ninguna estupidez!",
}

DICT_199 = {
  "\\bI might be old, but my Pokémon are older!" => "\\bPuede que yo sea viejo, ¡pero mis Pokémon son más viejos aún!",
  "\\bAfter I found these fossils, I brought them to the Mistveil Institute. They managed to bring these Pokémon back to life!" =>
    "\\bDespués de encontrar estos fósiles, los llevé al Instituto Velo de Niebla. ¡Lograron devolverles la vida a estos Pokémon!",
  "\\bBy the way, I actually have a second Helix Fossil, which I don´t need. Why don´t you take it?" =>
    "\\bPor cierto, en realidad tengo un segundo Fósil Hélix que no necesito. ¿Por qué no te lo llevás?",
  "\\bIf you give a fossil to the guys at the Mistveil Institute, they will do their best to revive it." =>
    "\\bSi le das un fósil a la gente del Instituto Velo de Niebla, van a hacer todo lo posible por revivirlo.",
}

DICT_200 = {
  "\\bAh, finally I can use these new moves!" => "\\b¡Ah, por fin puedo usar estos movimientos nuevos!",
  "\\bIt´s always exciting when your Pokémon learn new moves." =>
    "\\bSiempre es emocionante cuando tu Pokémon aprende movimientos nuevos.",
  "Calyrex is staring at you." => "Calyrex te está mirando fijo.",
  "It wants to battle!" => "¡Quiere combatir!",
  "\\bREEEEEX!!!" => "\\b¡REEEEEX!!!",
  "Calyrex disappeared. Will it come back?" => "Calyrex desapareció. ¿Volverá?",
  "\\bRelic Cave is said to hold great treasures. And I´m gonna hit the jackpot!" =>
    "\\bSe dice que la Cueva Fetiche guarda grandes tesoros. ¡Y yo voy a dar en el pozo!",
  "\\bYou remind me of myself when I was younger. Full of energy and ready for adventure!" =>
    "\\bMe recordás a mí cuando era joven. ¡Lleno de energía y listo para la aventura!",
}

DICT_194 = {
  "This wall looks odd." => "Esta pared se ve extraña.",
  "This wall looks odd. Do you want to remove some bricks?" =>
    "Esta pared se ve extraña. ¿Querés quitar algunos ladrillos?",
  "There is a hole behind the wall. But it´s empty..." =>
    "Hay un agujero detrás de la pared. Pero está vacío...",
  "There is a hole behind the wall. Something is hidden inside the hole." =>
    "Hay un agujero detrás de la pared. Algo está escondido dentro del agujero.",
  "\\bGiovanni: Ah, there you are. Of course these stupid grunts wouldn´t be able to intimidate you." =>
    "\\bGiovanni: Ah, ahí estás. Por supuesto que estos soldados estúpidos no iban a poder intimidarte.",
  "\\bYou´ve arrived at the right time, because I´m about to begin the ritual. Come and join me." =>
    "\\bLlegaste en el momento justo, porque estoy a punto de empezar el ritual. Vení y unite a mí.",
  "\\bGiovanni: Don´t interrupt me while I do this. Just watch." =>
    "\\bGiovanni: No me interrumpas mientras hago esto. Solo mirá.",
  "\\bVirizion." => "\\bVirizion.",
  "\\bCobalion." => "\\bCobalion.",
  "\\bTerrakion." => "\\bTerrakion.",
  "\\bGiovanni: I have brought the three of you here, because only you can make Keldeo appear." =>
    "\\bGiovanni: Los traje a ustedes tres acá, porque solo ustedes pueden hacer que Keldeo aparezca.",
  "\\bKeldeo has fascinated me since I first heard about it. The Pokémon that holds the power to seal Kyrem." =>
    "\\bKeldeo me fascina desde la primera vez que oí hablar de él. El Pokémon que posee el poder de sellar a Kyurem.",
  "\\bNow, it is time. Make Keldeo appear!" => "\\bAhora, es el momento. ¡Hagan aparecer a Keldeo!",
  "\\bKel?" => "\\b¿Kel?",
  "\\bGiovanni: Hello, Keldeo. I´m pleased to finally meet you. My name is Giovanni, and I want to make an alliance with you." =>
    "\\bGiovanni: Hola, Keldeo. Me da gusto conocerte por fin. Mi nombre es Giovanni, y quiero hacer una alianza con vos.",
  "\\bIf you become my ally, you will no longer need to go into hiding. So, what do you say?" =>
    "\\bSi te convertís en mi aliado, ya no vas a necesitar esconderte. Entonces, ¿qué decís?",
  "\\bGiovanni: Ouch..." => "\\bGiovanni: Ay...",
  "\\bWhy did you do that?! What did I do to you?" => "\\b¿¡Por qué hiciste eso!? ¿Qué te hice yo?",
  "\\bThis is disappointing. Well, good thing I have another Master Ball. If you want to take the hard way like your teachers, then I´m okay with that." =>
    "\\bQué decepción. Bueno, menos mal que tengo otra Master Ball. Si querés tomar el camino difícil como tus maestros, a mí me parece bien.",
  "\\bYou´re mine!" => "\\b¡Sos mío!",
  "\\bGiovanni: You really made that harder than it needed to be." =>
    "\\bGiovanni: Realmente hiciste eso más difícil de lo necesario.",
  "\\bGiovanni: Oh come on, you shouldn´t be surprised, I did the same thing with you." =>
    "\\bGiovanni: Ah, vamos, no deberías sorprenderte, hice lo mismo con vos.",
  "\\bAnd you shouldn´t be surprised either. I know that you want to stop me. You´re not the first kid that interfered with my business." =>
    "\\bY tampoco deberías sorprenderte de esto. Sé que querés detenerme. No sos el primer chico que se mete en mis asuntos.",
  "\\bBut give me a second." => "\\bPero dame un segundo.",
  "\\bCome back into your Poké Balls now." => "\\bVuelvan a sus Poké Balls ahora.",
  "\\bI have an offer to make. The Swords of Justice have fulfilled their task, so I don´t need them anymore." =>
    "\\bTengo una oferta que hacer. Las Espadas de la Justicia ya cumplieron su tarea, así que ya no las necesito.",
  "\\bAnd because I know that you´re a strong trainer, how about this: If you win against the Swords of Justice in battle, I will release them." =>
    "\\bY como sé que sos un entrenador fuerte, qué te parece esto: si les ganás a las Espadas de la Justicia en combate, las voy a liberar.",
  "\\bYeah, I knew you would say yes. And don´t worry, I am a man of my word." =>
    "\\bSí, sabía que ibas a decir que sí. Y no te preocupes, soy un hombre de palabra.",
  "\\bI might have won our first battle, but that was quite a while ago. Show me what you´ve got!" =>
    "\\bPuede que haya ganado nuestro primer combate, pero eso fue hace bastante. ¡Mostrame de qué estás hecho!",
  "\\bAnd now, show me what you´ve got!" => "\\bY ahora, ¡mostrame de qué estás hecho!",
  "\\bGiovanni: I expected you to be strong, but that shattered my expectations. As I said, I am a man of my word." =>
    "\\bGiovanni: Esperaba que fueras fuerte, pero eso superó mis expectativas. Como dije, soy un hombre de palabra.",
  "Giovanni released the Swords of Justice back into the wild." =>
    "Giovanni liberó a las Espadas de la Justicia de vuelta a la naturaleza.",
  "\\bGiovanni: You look surprised. Did you really think that I would lie to you? Who do you think I am, some weird gangster?" =>
    "\\bGiovanni: Te veo sorprendido. ¿De verdad pensaste que te iba a mentir? ¿Quién creés que soy, algún gánster raro?",
  "\\bLet me tell you something. I am an honorable man that gets what he wants by sheer determination." =>
    "\\bDejame decirte algo. Soy un hombre honorable que consigue lo que quiere por pura determinación.",
  "\\bI will get going now. And if you follow me again,  there will be consequences. So far, I always went easy on you, because you´re just a kid." =>
    "\\bMe voy a ir ahora. Y si me volvés a seguir, va a haber consecuencias. Hasta ahora siempre te la hice fácil, porque sos solo un chico.",
  "\\bBut you´re starting to remind of a certain someone, and you better not make the same mistakes as that guy. Goodbye, \\PN." =>
    "\\bPero me estás empezando a recordar a cierta persona, y más te vale no cometer los mismos errores que ese tipo. Adiós, \\PN.",
  "\\bOh I don´t actually want to battle you, I´m just supposed to stand here with a scary face." =>
    "\\bAh, en realidad no quiero combatir contra vos, se supone que solo tengo que quedarme parado acá con cara de miedo.",
  "\\bAhhhh, please spare me, I just got paid to stand here, I´m not even a trainer!" =>
    "\\bAhhhh, por favor perdoname la vida, solo me pagaron por quedarme parado acá, ¡ni siquiera soy entrenador!",
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

apply("Data/Map187.rxdata", DICT_187)
apply("Data/Map189.rxdata", DICT_189)
apply("Data/Map193.rxdata", DICT_193)
apply("Data/Map199.rxdata", DICT_199)
apply("Data/Map200.rxdata", DICT_200)
apply("Data/Map194.rxdata", DICT_194)
