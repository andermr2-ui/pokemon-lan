# encoding: UTF-8
require_relative "rpg_stubs"

DICT_129 = {
  "\\bWe dedicated our lives to this research. It can´t just all be gone like this..." =>
    "\\bDedicamos nuestras vidas a esta investigación. No puede desaparecer todo así, sin más...",
  "\\bIf you have any more questions about Mega Evolutions, you can always ask my assistant." =>
    "\\bSi tienes más preguntas sobre las Megaevoluciones, siempre puedes preguntarle a mi ayudante.",
  "\\bOh, finally someone´s here. I wish I could properly welcome you, but we have a problem right now:" =>
    "\\bOh, por fin viene alguien. Ojalá pudiera darte una bienvenida como es debido, pero ahora mismo tenemos un problema:",
  "\\bSomeone stole our Mega Rings! All of our research was for nothing..." =>
    "\\b¡Alguien robó nuestros Anillos Mega! Toda nuestra investigación fue en vano...",
  "\\bMy assistant noticed someone getting away, so he chased after them. I have no right to demand this from you, but please, help us!" =>
    "\\bMi ayudante vio a alguien escapando, así que fue tras él. No tengo derecho a pedírtelo, pero, ¡por favor, ayúdanos!",
  "\\bOh, it´s you again. Did you find something?" => "\\bOh, eres tú otra vez. ¿Encontraste algo?",
  "\\bWhat?! You got our Mega Rings back?!" => "\\b¡¿Qué?! ¡¿Recuperaste nuestros Anillos Mega?!",
  "\\bI... I can´t thank you enough. You didn´t have to do that, but you did. I think the least I can do is tell you about Mega Evolutions then." =>
    "\\bYo... no sé cómo agradecértelo. No tenías por qué hacerlo, pero lo hiciste. Creo que lo mínimo que puedo hacer es contarte sobre las Megaevoluciones.",
  "\\bA Mega Evolution is the highest state of evolution that a Pokémon can reach. Mega evolved Pokémon are extremely powerful!" =>
    "\\bUna Megaevolución es el estado de evolución más alto que puede alcanzar un Pokémon. ¡Los Pokémon megaevolucionados son extremadamente poderosos!",
  "\\bSo far, we only know about a handful of Pokémon that are capable of mega evolving. But those few that can, are in a league of their own." =>
    "\\bPor ahora, solo conocemos a un puñado de Pokémon capaces de megaevolucionar. Pero esos pocos que pueden, están en una liga aparte.",
  "\\bMega Evolutions can only happen when the bond between trainer and Pokémon is strong enough. But thanks to science, we made this process easier." =>
    "\\bLas Megaevoluciones solo ocurren cuando el vínculo entre entrenador y Pokémon es lo bastante fuerte. Pero gracias a la ciencia, hicimos este proceso más fácil.",
  "\\bDuring a battle, a trainer can make only one Pokémon Mega Evolve, and after the battle, the Pokémon returns to their normal state." =>
    "\\bDurante un combate, un entrenador solo puede hacer que un Pokémon Megaevolucione, y tras el combate, el Pokémon vuelve a su estado normal.",
  "\\bYou were able to bring the Mega Rings back, so I´m sure you´ll be able to make your Pokémon mega evolve! Please, take this." =>
    "\\bLograste traer de vuelta los Anillos Mega, ¡así que seguro que podrás hacer que tu Pokémon megaevolucione! Por favor, toma esto.",
  "\\bIn order to make a Pokémon mega evolve, you need to give them their Mega Stone. These are rare, but you´ll come across them eventually." =>
    "\\bPara hacer que un Pokémon megaevolucione, necesitas darle su Mega Piedra correspondiente. Son escasas, pero acabarás encontrándolas.",
  "\\bI would give you a demonstration, but we don´t have any Mega Stones right now." =>
    "\\bTe haría una demostración, pero ahora mismo no tenemos ninguna Mega Piedra.",
  "\\bHowever, you should visit Molly. She´s the grandmother of Silver Peak´s gym leader, Azura. You can find her in the house with the green roof." =>
    "\\bSin embargo, deberías visitar a Molly. Es la abuela de Azura, la Líder de Gimnasio de Pico Plata. La puedes encontrar en la casa con el tejado verde.",
  "\\bShe has mastered the Mega Evolution, so I´m sure she can help you. But she might challenge you to a battle, so be prepared." =>
    "\\bDomina la Megaevolución a la perfección, así que seguro que puede ayudarte. Pero puede que te rete a un combate, así que prepárate.",
  "\\bOnce again, I can´t thank you enough, and I hope that the Mega Ring will help you. Farewell!" =>
    "\\bUna vez más, no sé cómo agradecértelo, y espero que el Anillo Mega te sea útil. ¡Adiós!",
  "\\bThanks for helping us. The Prof. has spend decades reasearching Mega Evolutions, so you have no idea what this means to him." =>
    "\\bGracias por ayudarnos. El Profesor lleva décadas investigando las Megaevoluciones, así que no te imaginas lo que esto significa para él.",
  "\\bOh, so you want to know more about Mega Evolutions? Alright, listen up." =>
    "\\bOh, ¿así que quieres saber más sobre las Megaevoluciones? Vale, escucha.",
  "\\bMega Evolutions were first discovered in the Kalos Region. Since then, scientists around the world have been researching this topic a lot." =>
    "\\bLas Megaevoluciones se descubrieron por primera vez en la Región Kalos. Desde entonces, científicos de todo el mundo han investigado mucho este tema.",
  "\\bYou might not believe it, but even legendary Pokémon can perfom a Mega Evolution. As if those weren´t strong enough already." =>
    "\\bPuede que no te lo creas, pero incluso los Pokémon legendarios pueden Megaevolucionar. Como si no fueran ya bastante fuertes.",
  "\\bSome Pokémon also change their type while mega evolving, and they often gain new abilities as well." =>
    "\\bAlgunos Pokémon también cambian de tipo al megaevolucionar, y a menudo también ganan nuevas habilidades.",
  "\\bIn the Delta Region, only a handful of trainers have been able to make their Pokémon mega evolve. If you ever meet such a trainer, don´t underestimate them." =>
    "\\bEn la Región Delta, solo un puñado de entrenadores ha logrado que sus Pokémon megaevolucionen. Si alguna vez te encuentras con uno de ellos, no lo subestimes.",
}

DICT_130 = {
  "\\bWho are you? Leave me alone." => "\\b¿Quién eres? Déjame en paz.",
  "\\bMolly: Leave me alone. I don´t want any guests." =>
    "\\bMolly: Déjame en paz. No quiero visitas.",
  "\\bWait, what do you have there? Is that a Mega Ring?!" =>
    "\\bEspera, ¿qué tienes ahí? ¡¿Eso es un Anillo Mega?!",
  "\\bAh, I see, the institute got robbed and you decided to be a hero. Respectable." =>
    "\\bAh, ya veo, robaron el instituto y decidiste hacerte el héroe. Respetable.",
  "\\bOkay, fine. If you manage to entertain me, I might have something for you." =>
    "\\bVale, está bien. Si consigues entretenerme, puede que tenga algo para ti.",
  "\\bBut let´s waste no more time, I need the thrill of battle again!" =>
    "\\bPero no perdamos más tiempo, ¡necesito de nuevo la emoción del combate!",
  "\\bMolly: Wow, I´m impressed! I think, I think you are worthy of having this." =>
    "\\bMolly: Vaya, ¡estoy impresionada! Creo, creo que eres digno de tener esto.",
  "\\bMolly: If you ever catch an Absol, let it hold this stone. That way, it can mega evolve!" =>
    "\\bMolly: Si alguna vez capturas un Absol, deja que lleve esta piedra. ¡Así podrá megaevolucionar!",
  "\\bWait, you´re saying my grandaughter said you should visit me?" =>
    "\\bEspera, ¿estás diciendo que mi nieta te dijo que me visitaras?",
  "\\bSome strange guys have been involved with Virizion and Cobalion?" =>
    "\\b¿Unos tipos raros han estado metidos con Virizion y Cobalion?",
  "\\bThis is bad. Really bad." => "\\bEsto es malo. Muy malo.",
  "\\bIf this Giovanni unites Virizion, Cobalion and Terrakion, he will be able to find Keldeo." =>
    "\\bSi este tal Giovanni une a Virizion, Cobalion y Terrakion, podrá encontrar a Keldeo.",
  "\\bKeldeo, and only a handful of people even know about this, is the protector of the Delta Region!" =>
    "\\bKeldeo, y solo un puñado de personas sabe siquiera esto, ¡es el protector de la Región Delta!",
  "\\b100 years ago, it managed to seal Kyurem, the legendary dragon. Kyrem used to terrorize this region, until that day." =>
    "\\bHace 100 años, logró sellar a Kyurem, el dragón legendario. Kyurem solía aterrorizar esta región, hasta aquel día.",
  "\\bBut if someone were to control Keldeo, they might be able to free Kyurem!" =>
    "\\b¡Pero si alguien lograra controlar a Keldeo, podría liberar a Kyurem!",
  "\\bIf that happens, the Delta Region is doomed. I don´t know what this Giovanni´s true plan is, but he needs to be stopped!" =>
    "\\bSi eso pasa, la Región Delta está condenada. No sé cuál es el verdadero plan de este Giovanni, ¡pero hay que detenerlo!",
  "\\bWith the power of Mega Evolutions on your side, you might be able to stop him, but be careful!" =>
    "\\bCon el poder de las Megaevoluciones de tu lado, puede que logres detenerlo, ¡pero ten cuidado!",
  "\\bThe sacred place dedicated to Terrakion is on the other side of Route 8. But be prepared for that journey, Route 8 is big. Stay safe!" =>
    "\\bEl lugar sagrado dedicado a Terrakion está al otro lado de la Ruta 8. Pero prepárate para ese viaje, la Ruta 8 es grande. ¡Ten cuidado!",
  "\\bMolly: If he actually managed to catch these legendary Pokémon, you need to hurry!" =>
    "\\bMolly: Si de verdad logró atrapar a estos Pokémon legendarios, ¡tienes que darte prisa!",
  "\\bMolly: Hm? Oh, it´s you again. So you were successful. That´s fantastic. An evil maniac like that Giovanni guy had to be stopped." =>
    "\\bMolly: ¿Hmm? Oh, eres tú otra vez. Así que lo lograste. Eso es fantástico. Había que detener a un maníaco malvado como ese tal Giovanni.",
  "\\bSince you must have grown a lot since the last time we met, I´d like to have another battle. After all, I held back the last time." =>
    "\\bComo debes de haber crecido mucho desde la última vez que nos vimos, me gustaría tener otro combate. Al fin y al cabo, la última vez me contuve.",
  "\\bIf you manage to beat me at full strength, then I´ll have another reward for you." =>
    "\\bSi consigues vencerme a plena potencia, entonces tendré otra recompensa para ti.",
  "\\bShow me your strength!" => "\\b¡Muéstrame tu fuerza!",
  "\\bMolly: Amazing. Fantastic. Excellent. Let me reward you with this." =>
    "\\bMolly: Asombroso. Fantástico. Excelente. Deja que te recompense con esto.",
  "\\bMolly: If anyone will discover the true secret behind the Mega Evolution, it´ll be you." =>
    "\\bMolly: Si alguien va a descubrir el verdadero secreto tras la Megaevolución, serás tú.",
  "\\bThe bond that you have with your Pokémon is truly special, and you can be proud of that. I wish you the best for your future, and take care!" =>
    "\\bEl vínculo que tienes con tus Pokémon es realmente especial, y puedes estar orgulloso de eso. Te deseo lo mejor para tu futuro, ¡y cuídate!",
  "\\bMolly: I should visit my granddaughter again. I haven´t seen her in a while." =>
    "\\bMolly: Debería visitar de nuevo a mi nieta. Hace tiempo que no la veo.",
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
  puts "#{path}: #{count}/#{dict.size} reemplazos"
end

apply("Data/Map129.rxdata", DICT_129)
apply("Data/Map130.rxdata", DICT_130)
