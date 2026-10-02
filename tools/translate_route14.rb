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

DICT_321 = {
  "\\b**************!!! ******* HELL!!! WHAT HAVE I DONE?!" => "\\b**************!!! ¡¡¡QUÉ ******* INFIERNO!!! ¿¡¡¡QUÉ HE HECHO!!!?",
  "\\bWHY DID THIS THING APPEAR?! AHHHHHH!!! HELP ME!!! HELP ME, I`M BEGGING YOU!!!" => "\\b¿¡¡¡POR QUÉ HA APARECIDO ESTA COSA!!!?! ¡¡¡AHHHHHH!!! ¡¡¡AYÚDAME!!! ¡¡¡AYÚDAME, TE LO SUPLICO!!!",
  "\\bOkay, okay, you´re right. I hope I didn´t scare you." => "\\bVale, vale, tienes razón. Espero no haberte asustado.",
  "\\bOh, okay wait, let me catch my breath first." => "\\bAh, vale, espera, déjame recuperar el aliento primero.",
  "\\bAlright, let me tell you what happened." => "\\bBien, déjame contarte qué ha pasado.",
  "\\bI´m from the Southford Institute, where we research time and space." => "\\bSoy del Instituto de Fuerte Sur, donde investigamos el tiempo y el espacio.",
  "\\bMy colleague has been working on a time machine, an I´ve been trying to build a device that can open portals to other dimensions." => "\\bMi colega ha estado trabajando en una máquina del tiempo, y yo he estado intentando construir un dispositivo que pueda abrir portales a otras dimensiones.",
  "\\bIt was going really well, and we were confident that it´d work, but it all changed a few weeks ago." => "\\bIba muy bien, y estábamos seguros de que iba a funcionar, pero todo cambió hace unas semanas.",
  "\\bDuring the first field test of my device, a malfunction caused the energy output to go haywire." => "\\bDurante la primera prueba de campo de mi dispositivo, un fallo hizo que la salida de energía se descontrolara.",
  "\\bThe device opened a dimensional crack in the sky above Southside Beach, and since then the weather has been going crazy over there." => "\\bEl dispositivo abrió una grieta dimensional en el cielo sobre Playa del Sur, y desde entonces el tiempo anda como loco por allí.",
  "\\bDespite that malfunction, I knew that my tech would work, so I was willing to try again. Today, my colleague and I finished our devices." => "\\bA pesar de ese fallo, yo sabía que mi tecnología iba a funcionar, así que estaba dispuesto a intentarlo otra vez. Hoy, mi colega y yo terminamos nuestros dispositivos.",
  "\\bBut then it all went to ****!!!" => "\\bPero luego todo se fue a la ****!!!",
  "\\bThe second I started up my device again, a shockwave came from the dimensional crack!" => "\\bEn el momento en que encendí mi dispositivo de nuevo, ¡una onda de choque salió de la grieta dimensional!",
  "\\bDo you know what came out of there?" => "\\b¿Sabes qué salió de allí?",
  "\\bIt was Hoopa, in its unbound form!" => "\\b¡Era Hoopa, en su forma liberada!",
  "\\bHoopa has the incredible ability to create portals to other dimensions, but I must have angered it." => "\\bHoopa tiene la increíble habilidad de crear portales a otras dimensiones, pero debo haberlo hecho enfadar.",
  "\\bIT KILLED MY COLLEAGUE! ****! HE WAS MY FRIEND, AND THIS MONSTER JUST MURDERED HIM!" => "\\b¡¡¡MATÓ A MI COLEGA!!! ¡****! ¡ERA MI AMIGO, Y ESTE MONSTRUO LO ACABA DE ASESINAR!",
  "\\bI tried to get away, but Hoopa was harnessing the power of our devices! It summoned Ultra Beasts and Paradox Pokémon!" => "\\bIntenté escapar, ¡pero Hoopa estaba aprovechando el poder de nuestros dispositivos! ¡Invocó Ultraentes y Pokémon de paradoja!",
  "\\bTHESE THINGS KILLED EVERYONE IN SOUTHFORD! " => "\\b¡¡¡ESAS COSAS MATARON A TODOS EN FUERTE SUR!!! ",
  "\\bNot even the children were spared..." => "\\bNi siquiera los niños se salvaron...",
  "\\bPlease, someone needs to help me! I know that this is my fault, but Hoopa needs to be stopped!" => "\\bPor favor, ¡alguien tiene que ayudarme! Sé que esto es culpa mía, ¡pero hay que detener a Hoopa!",
  "\\bIt now has the power over the past, the future and the dimensions! If no one stops it, then it might even surpass Arceus!" => "\\b¡Ahora tiene poder sobre el pasado, el futuro y las dimensiones! ¡Si nadie lo detiene, hasta podría superar a Arceus!",
  "\\bHm? You? You´re a child!" => "\\b¿Eh? ¿Tú? ¡Eres un niño!",
  "\\bNope, I´ve got no clue. But why does that matter?" => "\\bQué va, ni idea. ¿Pero por qué importa eso?",
  "\\bWhat?! You´re the Champion?! Really?!" => "\\b¿¡¡¡Qué!!!? ¿¡Eres el Campeón?! ¿¿¿De verdad???",
  "\\bWow, there might be some hope after all." => "\\bVaya, después de todo puede que haya alguna esperanza.",
  "\\bOkay, then I have an idea. Try to make it to Southford, I´ll be right behind you." => "\\bVale, entonces tengo una idea. Intenta llegar a Fuerte Sur, iré justo detrás de ti.",
  "\\bOh, and you should take these, they´re pretty much the only way to catch these Ultra Beasts." => "\\bAh, y deberías coger esto, es básicamente la única forma de atrapar a estos Ultraentes.",
  "\\bParadox Pokémon can be caught in normal Pokéballs, at least that´s what the scientists from Paldea say." => "\\bLos Pokémon de paradoja se pueden atrapar en Poké Balls normales, al menos eso dicen los científicos de Paldea.",
  "\\bOh, and one more thing. Some of the Ultra Beasts and Paradox Pokémon that Hoopa Summoned are almost as strong as itself." => "\\bAh, y una cosa más. Algunos de los Ultraentes y Pokémon de paradoja que invocó Hoopa son casi tan fuertes como él.",
  "\\bYou might´ve heard of them before. Koraidon, Miraidon and Necrozma." => "\\bPuede que ya hayas oído hablar de ellos. Koraidon, Miraidon y Necrozma.",
  "\\bOn top of that, I´ve also seen the paradoxical relatives of other Legendary Pokémon when I ran here, so we need to be extremely careful!" => "\\bY encima de eso, también he visto a los parientes paradójicos de otros Pokémon Legendarios cuando vine corriendo hasta aquí, ¡así que tenemos que tener muchísimo cuidado!",
  "\\bI´ll tell you the rest of my plan once we´ve made it to Southford. Alright, it´s time to go!" => "\\bTe contaré el resto de mi plan en cuanto lleguemos a Fuerte Sur. Bueno, ¡es hora de irnos!",
  "\\bWe have to stop this monster, or everyone will be doomed!" => "\\bTenemos que detener a este monstruo, ¡o todos estamos condenados!",
  "\\bAre you bringing emergency supplies to Southford?" => "\\b¿Traes suministros de emergencia para Fuerte Sur?",
  "\\bNo? Then I can´t let you through. I´m not even gonna ask why you´re here, but I won´t let you past this point." => "\\b¿No? Entonces no puedo dejarte pasar. Ni siquiera voy a preguntarte por qué estás aquí, pero no te voy a dejar pasar de este punto.",
  "\\bWe are unable to evacuate the people of Southford, so they´re dependent on emergency supplies." => "\\bNo podemos evacuar a la gente de Fuerte Sur, así que dependen de los suministros de emergencia.",
  "\\bOutsiders would make things even more complicated, so I hope you understand." => "\\bLos forasteros complicarían aún más las cosas, así que espero que lo entiendas.",
}

CHOICES_321 = {
  "Calm down!|What happened?" => "¡Cálmate!|¿Qué ha pasado?",
  "Don´t worry, I´ve got this!|Do you know who I am?" => "¡No te preocupes, yo me encargo!|¿Sabes quién soy?",
}

DICT_322 = {
  "It´s an ancient plate with strange symbols." => "Es una placa antigua con símbolos extraños.",
  "\\bAnthony: Hm? What is this place?" => "\\bAnthony: ¿Eh? ¿Qué es este lugar?",
  "\\bOh, you´re saying this is the secret cave that we were looking for?" => "\\bAh, ¿dices que esta es la cueva secreta que estábamos buscando?",
  "\\bAh, so the entrance revealed itself because of your Z-Power Ring. That sounds good." => "\\bAh, así que la entrada se reveló gracias a tu Anillo Z. Eso suena bien.",
  "\\bBut look, this doesn´t seem like a place where Z-Power would originate from. This is very strange. Let me have a look at that ancient plate." => "\\bPero mira, esto no parece un lugar del que se origine el Poder Z. Esto es muy extraño. Déjame echarle un vistazo a esa placa antigua.",
  "\\bOh, this confuses me. I thought I was familiar with the ancient language of Delta. I was able to read similar plates, but this, this is new to me." => "\\bAh, esto me confunde. Pensaba que conocía bien la lengua antigua de Delta. Pude leer placas similares, pero esto, esto es nuevo para mí.",
  "\\b****! Why did I give my translation tech to that guy..." => "\\b¡****! Por qué le habré dado mi tecnología de traducción a ese tipo...",
  "\\bOh, but wait, I have gotten this far, so I might as well be honest with my partner." => "\\bAh, pero espera, ya he llegado hasta aquí, así que bien podría ser sincero con mi compañero.",
  "\\bListen, \\PN. I haven´t told you the whole story about who I am, but most importantly I do know who you are." => "\\bEscucha, \\PN. No te he contado toda la historia sobre quién soy, pero lo más importante es que yo sí sé quién eres tú.",
  "\\bOur meeting at Crystal Harbor wasn´t by accident. To be fair, I was surprised that you didn´t know who I was, as my name used to be all over the news." => "\\bNuestro encuentro en Puerto del Cristal no fue casualidad. La verdad, me sorprendió que no supieras quién era yo, porque mi nombre solía estar en todas las noticias.",
  "\\bI am Doctor Anthony Reed, former member and co-founder of Team Rocket." => "\\bSoy el Doctor Anthony Reed, ex miembro y cofundador del Team Rocket.",
  "\\bNow I know this might come as a shock to you, but it´s the truth. Giovanni and I have parted ways years ago, because he betrayed me." => "\\bSé que esto puede ser un shock para ti, pero es la verdad. Giovanni y yo nos separamos hace años, porque él me traicionó.",
  "\\bI used the money that we made with Team Rocket to fund my experiments, as I was working on dangerous projects." => "\\bUsé el dinero que ganamos con el Team Rocket para financiar mis experimentos, ya que estaba trabajando en proyectos peligrosos.",
  "\\bBut with time, I realized that my experiments and Team Rocket´s mere existence were harming the people too much." => "\\bPero con el tiempo, me di cuenta de que mis experimentos y la mera existencia del Team Rocket estaban dañando demasiado a la gente.",
  "\\bEvery scientists makes sacrifises, and I was willing to go even further, but it was too much." => "\\bTodo científico hace sacrificios, y yo estaba dispuesto a ir aún más lejos, pero era demasiado.",
  "\\bI told Giovanni that I would leave the organisation, without snitching on him, but he already had a plan for me." => "\\bLe dije a Giovanni que iba a dejar la organización, sin delatarlo, pero él ya tenía un plan para mí.",
  "\\bHe leaked information about my illegal experiments to the police, and I thought it was over for me." => "\\bÉl filtró información sobre mis experimentos ilegales a la policía, y pensé que era mi fin.",
  "\\bThe work I did at Team Rocket was bad enough to put me in prison for 50 years, so I needed to confess." => "\\bEl trabajo que hice en el Team Rocket era lo bastante grave como para meterme en la cárcel 50 años, así que tuve que confesar.",
  "\\bBut during my trial, the judge gave me option to stay a free man, if I would help them take down Team Rocket." => "\\bPero durante mi juicio, el juez me dio la opción de seguir siendo un hombre libre, si ayudaba a derribar al Team Rocket.",
  "\\bI told them all I knew, and that was enough to severly damage Team Rocket." => "\\bLes conté todo lo que sabía, y eso fue suficiente para dañar seriamente al Team Rocket.",
  "\\bAnd after Ash Ketchum, who was a freshly baked trainer at the time, managed to expose Giovanni, Team Rocket was pretty much finished." => "\\bY después de que Ash Ketchum, que en aquel momento era un entrenador recién salido del horno, lograra exponer a Giovanni, el Team Rocket básicamente terminó.",
  "\\bThat was 2 years ago. I got my freedom and was allowed to continue my work, so I moved to Delta and began my career at the Rotom AI Company." => "\\bEso fue hace 2 años. Recuperé mi libertad y me permitieron seguir con mi trabajo, así que me mudé a Delta y empecé mi carrera en la Compañía de IA Rotom.",
  "\\bAnd while I was spending my time developing artificial intelligence, Giovanni had a new plan." => "\\bY mientras yo pasaba mi tiempo desarrollando inteligencia artificial, Giovanni tenía un nuevo plan.",
  "\\bHe cooperated with the police and somehow avoided prison, altough that probably involved bribing a lot of people." => "\\bÉl cooperó con la policía y de alguna forma evitó la cárcel, aunque eso probablemente implicó sobornar a mucha gente.",
  "\\bThat bloody bastard rebuild Team Rocket from the ground up, right here in the Delta Region." => "\\bEse maldito cabrón reconstruyó al Team Rocket desde cero, justo aquí en la Región Delta.",
  "\\bOf course I knew about this, and I´ve been spying on him ever since. That´s why I know that you´re the one who stopped him!" => "\\bPor supuesto que sabía de esto, y lo he estado espiando desde entonces. ¡Por eso sé que fuiste tú quien lo detuvo!",
  "\\bI know that you beat Kyurem, I know that you caught Keldeo and I know that you´ve been to the Team Rocket Base." => "\\bSé que venciste a Kyurem, sé que atrapaste a Keldeo y sé que has estado en la Base del Team Rocket.",
  "\\b****, enough backstories for today. Let me tell you about my new plan." => "\\b****, suficientes historias por hoy. Déjame contarte sobre mi nuevo plan.",
  "\\b4 years ago, I developed a translation device that could decipher pretty much every language there is." => "\\bHace 4 años, desarrollé un dispositivo de traducción que podía descifrar prácticamente cualquier idioma que existiera.",
  "\\bI made the mistake of giving it to Giovanni, since he needed it to read some of his history books." => "\\bCometí el error de dárselo a Giovanni, ya que lo necesitaba para leer algunos de sus libros de historia.",
  "\\bI´d bet you my Metagross that he still has that device, and I´m gonna get it back one way or another." => "\\bTe apuesto mi Metagross a que todavía tiene ese dispositivo, y lo voy a recuperar de una forma u otra.",
  "\\bMy first idea would be to check out Giovanni´s office in the Team Rocket Base. It shouldn´t be too difficult to get in there since Team Rocket is gone." => "\\bMi primera idea sería revisar la oficina de Giovanni en la Base del Team Rocket. No debería ser muy difícil entrar allí ya que el Team Rocket ya no existe.",
  "\\bYou should go there and search for the device, I´ll take a few pictures of these plates and then I´ll follow you. Good luck!" => "\\bDeberías ir allí y buscar el dispositivo, yo sacaré unas fotos de estas placas y luego te sigo. ¡Suerte!",
  "\\bAnthony: You know where the base is, am I right? It´s where they brought you when you got kidnapped." => "\\bAnthony: Sabes dónde está la base, ¿verdad? Es donde te llevaron cuando te secuestraron.",
  "\\bYou know, the hidden base on Route 8, that one." => "\\bYa sabes, la base escondida en la Ruta 8, esa.",
}

DICT_323 = {
  "A strange crystal is embedded into a socket. Do you want to take it?" => "Un cristal extraño está incrustado en un enchufe. ¿Quieres cogerlo?",
  "It´s a mysterious Pokémon." => "Es un Pokémon misterioso.",
  "\\bTERAAA!!!" => "\\b¡¡¡TERAAA!!!",
  "Terapagos disappeared. Will it come back?" => "Terapagos desapareció. ¿Volverá?",
  "\\bArthur: Ouch, that hurt..." => "\\bArthur: Ay, eso ha dolido...",
  "\\bBut it looks like our problem resolved itself. Fine by me, ´cause this was starting to get dangerous. Did you see what happened to his Pokémon?" => "\\bPero parece que nuestro problema se ha resuelto solo. Por mí bien, porque esto se estaba empezando a poner peligroso. ¿Viste qué pasó con sus Pokémon?",
  "\\bAh, the dragons escaped before the implosion, and 3 of the Pokéballs got destroyed." => "\\bAh, los dragones escaparon antes de la implosión, y 3 de las Poké Balls se destruyeron.",
  "\\bThese poor Pokémon..." => "\\bPobres Pokémon...",
  "\\bWhat about Genesect?" => "\\b¿Y Genesect?",
  "\\bOh, that Pokéball is still working? Then you should take it. Such a strong Pokémon shouldn´t be left alone in a place with so much power." => "\\bAh, ¿esa Poké Ball todavía funciona? Entonces deberías cogerla. Un Pokémon tan fuerte no debería quedarse solo en un lugar con tanto poder.",
  "\\bThanks for saving our butts again, we would´ve been screwed without you." => "\\bGracias por salvarnos el pellejo otra vez, sin ti estaríamos apañados.",
  "\\bI´m gonna go back to the Delta Tech Company, and I want to find out where the dragons went. I hope they don´t go on a rampage." => "\\bVoy a volver a la Compañía Delta Tech, y quiero averiguar adónde han ido los dragones. Espero que no se pongan a arrasarlo todo.",
  "\\bOh, and I almost forgot to give you this. Since you managed to catch Kyurem, this should be useful if you also manage to catch a Legendary Dragon." => "\\bAh, y casi se me olvida darte esto. Ya que lograste atrapar a Kyurem, esto te será útil si también consigues atrapar a un Dragón Legendario.",
  "\\bSome day, we should have a rematch. Stay safe, and have fun on your next adventure. Goodbye!" => "\\bAlgún día, deberíamos tener una revancha. Cuídate, y pásatelo bien en tu próxima aventura. ¡Adiós!",
  "\\bAnthony: What the ****?!" => "\\bAnthony: ¿Qué ****?!",
  "\\bInstead of just interfering with my plan, you brought help?! And not just anyone, but the former Champion?!" => "\\b¿En vez de solo interferir con mi plan, has traído ayuda?! ¿Y no cualquiera, sino el ex Campeón?!",
  "\\bWell, who cares, I´m just moments away from gaining so much power that I can surpass Arceus!" => "\\bBueno, qué más da, ¡estoy a instantes de conseguir tanto poder que podré superar a Arceus!",
  "\\bHow about you leave me alone for on more minute? Come on, I even brought something for you to play with!" => "\\b¿Qué tal si me dejáis en paz un minuto más? Venga, ¡hasta he traído algo para que juguéis!",
  "\\bReshiram, Zekrom, get rid of this scum. Don´t let them bother me any longer!" => "\\bReshiram, Zekrom, deshaceos de esta escoria. ¡No dejéis que me molesten más!",
  "\\bAnthony: Of course I can´t stop two Champions, even with the Legendary Dragons..." => "\\bAnthony: Claro que no puedo detener a dos Campeones, ni siquiera con los Dragones Legendarios...",
  "\\bWell, I guess we´ll have to do this the old-school way, then. Zekrom, remove Arthur from the face of the earth!!!" => "\\bBueno, supongo que tendremos que hacerlo a la vieja usanza, entonces. ¡¡¡Zekrom, borra a Arthur de la faz de la tierra!!!",
  "\\bAnthony: That´s what you get for trying to stop me! Now it´s your turn, \\PN. Reshiram, kill this brat!" => "\\bAnthony: ¡Eso es lo que te pasa por intentar detenerme! Ahora te toca a ti, \\PN. ¡Reshiram, mata a este mocoso!",
  "\\bAnthony: What?! Kyurem saved you?! Then I guess I´ll have to use my new Pokémon team. I will crush you and then I will kill you with my own hands!" => "\\bAnthony: ¿Qué?! ¿Kyurem te ha salvado?! Entonces supongo que tendré que usar mi nuevo equipo Pokémon. ¡Te voy a aplastar y luego te voy a matar con mis propias manos!",
  "\\bZekrom, Reshiram, come back. We have a battle to win!" => "\\bZekrom, Reshiram, volved. ¡Tenemos un combate que ganar!",
  "\\bEven the Champion of the Delta Region won´t stand a chance against this team! Hit me, kid. Hit me with all you´ve got!" => "\\b¡Ni siquiera el Campeón de la Región Delta tendrá ninguna oportunidad contra este equipo! Pégame, chaval. Pégame con todo lo que tengas.",
  "\\bFor ***** sake! Argh! Why?! Why can 3 extremely well trained Pokémon and 3 of the most powerful Pokémon out there do nothing against you?!" => "\\b¡Por el amor de *****! ¡Argh! ¿Por qué?! ¿Por qué 3 Pokémon extremadamente bien entrenados y 3 de los Pokémon más poderosos que existen no pueden hacer nada contra ti?!",
  "\\bEven Genesect, a prehistoric Pokémon that I upgraded with modern tech, is no challenge to you." => "\\bNi siquiera Genesect, un Pokémon prehistórico que mejoré con tecnología moderna, supone un desafío para ti.",
  "\\bAnd why hasn´t this cave granted me unlimited power?! Aren´t we right in the center of all Z-Power in the world?!" => "\\b¿Y por qué esta cueva no me ha dado poder ilimitado?! ¿No estamos justo en el centro de todo el Poder Z del mundo?!",
  "\\bCome on, I need this power! It´s all I ever wanted!" => "\\b¡Venga, necesito este poder! ¡Es todo lo que siempre he querido!",
  "\\bHm?!" => "\\b¿Eh?!",
  "\\bWhat´s this? Is it finally happening?!" => "\\b¿Qué es esto? ¿Finalmente está pasando?!",
  "\\bBut wait, this feels wrong. The Z-Power keeps flowing into my body!" => "\\bPero espera, esto se siente mal. ¡El Poder Z sigue fluyendo hacia mi cuerpo!",
  "\\bSTOP! THIS IS TOO MUCH!!!" => "\\b¡¡¡PARA! ESTO ES DEMASIADO!!!",
  "It´s a Pokéball containing Genesect. Do you want to take it?" => "Es una Poké Ball que contiene a Genesect. ¿Quieres cogerla?",
  "A few items are scattered around the Pokéball." => "Hay algunos objetos esparcidos alrededor de la Poké Ball.",
  "There's no more room for Pokémon!" => "¡No queda más sitio para Pokémon!",
  "The Pokémon Boxes are full and can't accept any more!" => "¡Las Cajas de Pokémon están llenas y no pueden aceptar más!",
}

apply("Data/Map321.rxdata", DICT_321, CHOICES_321)
apply("Data/Map322.rxdata", DICT_322)
apply("Data/Map323.rxdata", DICT_323)
