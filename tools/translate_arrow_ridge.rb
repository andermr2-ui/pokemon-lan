# encoding: UTF-8
require_relative "rpg_stubs"

DICT_042 = {
  "\\bArrow Ridge used to be much bigger, but 20 years ago a massive landslide destroyed almost the entire town." =>
    "\\bCordillera Flecha solía ser mucho más grande, pero hace 20 años un enorme corrimiento de tierras destruyó casi todo el pueblo.",
  "\\b12 people died in that incident..." => "\\b12 personas murieron en aquel suceso...",
  "\\bLuckily there´s been no other incident since that day, but that doesn´t make it any less tragic." =>
    "\\bPor suerte no ha vuelto a pasar nada parecido desde entonces, pero eso no lo hace menos trágico.",
  "\\bI lost both of my parents on that day. I was 9..." =>
    "\\bPerdí a mis dos padres ese día. Tenía 9 años...",
  "Arrow Ridge Gym\\nLeader: Rose" => "Gimnasio de Cordillera Flecha\\nLíder: Rose",
  "\\bOi, you look like a tourist. We don´t want tourists in Arrow Ridge." =>
    "\\bOye, pareces un turista. No queremos turistas en Cordillera Flecha.",
  "\\bOh, you´re a Pokémon Trainer? Pfff, I don´t care. Y´all are no better than those dirty tourists. Leave me alone!" =>
    "\\bOh, ¿eres Entrenador Pokémon? Pff, me da igual. No sois mejores que esos turistas asquerosos. ¡Déjame en paz!",
  "Pokémon Academy" => "Academia Pokémon",
  "\\bYou look tired. Here, this should help." => "\\bPareces cansado. Toma, esto debería ayudarte.",
  "\\bMoo Moo Milk is the perfect refreshment for people and Pokémon!" =>
    "\\b¡La Leche Moomoo es el refresco perfecto para personas y Pokémon!",
}

DICT_081 = {
  "\\bWelcome to the Arrow Ridge Gym. This is the first of 8 Gyms spread throughout the Delta Region." =>
    "\\bBienvenido al Gimnasio de Cordillera Flecha. Este es el primero de los 8 Gimnasios repartidos por la Región Delta.",
  "\\bRose, the Gym Leader, uses Grass-Typ Pokémon, so having some Flying-, Bug- or Fire-Type Pokémon will help." =>
    "\\bRose, la Líder de Gimnasio, usa Pokémon de tipo Planta, así que te vendrá bien tener Pokémon de tipo Volador, Bicho o Fuego.",
  "\\bCongratulations, trainer. That was your first step towards challengenig the Pokémon League." =>
    "\\bFelicidades, entrenador. Ese fue tu primer paso hacia el Reto de la Liga Pokémon.",
  "\\bRose: Welcome young trainer. I hope you are ready, because I want to see a magnificent battle!" =>
    "\\bRose: Bienvenido, joven entrenador. Espero que estés listo, ¡porque quiero ver un combate magnífico!",
  "\\me[Badge get]\\bWell done. You've earned yourself the Meadow Badge.\\wtnp[110]" =>
    "\\me[Badge get]\\bBien hecho. Te has ganado la Medalla Pradera.\\wtnp[110]",
  "\\bRose: Now you can use Cut outside of battles. And here, have this TM too." =>
    "\\bRose: Ahora puedes usar Corte fuera de los combates. Y toma, ten también esta MT.",
  "\\bThis TM contains Bullet Seed. This is a relentless attack, which will surely make your opponents struggle. " =>
    "\\bEsta MT contiene Semilladora. Es un ataque implacable que sin duda hará sufrir a tus rivales. ",
  "\\bAnd remember, you can use both TMs and HMs as often as you want." =>
    "\\bY recuerda, puedes usar tanto las MT como las MO todas las veces que quieras.",
  "\\bI recommend visiting the Pokémon Academy. They can teach you some handy things which will help you on your journey!" =>
    "\\bTe recomiendo visitar la Academia Pokémon. Pueden enseñarte cosas útiles que te ayudarán en tu viaje.",
  "\\bRose: Welcome back, \\PN. Your Gym Challenge started right here, and now you´ve returned as the Champion." =>
    "\\bRose: Bienvenido de nuevo, \\PN. Tu Reto de Gimnasios empezó justo aquí, y ahora has vuelto como Campeón.",
  "\\bLet me ask you a question. Do you think keeping your title is easier than getting it? It´s time to find out!" =>
    "\\bDéjame hacerte una pregunta. ¿Crees que mantener tu título es más fácil que conseguirlo? ¡Es hora de averiguarlo!",
  "\\bRose: You´re the Champion for a reason. Even my strongest team got crushed, so your skill cannot be denied." =>
    "\\bRose: Eres el Campeón por algo. Hasta mi equipo más fuerte quedó aplastado, así que no se puede negar tu talento.",
  "\\bI´m excited to see your perfomance in the next World Championship Tournament, which will be hosted in Riverstone." =>
    "\\bTengo muchas ganas de ver cómo te desenvuelves en el próximo Torneo Mundial de Campeones, que se celebrará en Río el Último.",
  "\\bIf you´re looking for challenging battles, that´s where you will find them. Goodbye, Champion!" =>
    "\\bSi buscas combates desafiantes, ahí es donde los encontrarás. ¡Adiós, Campeón!",
  "\\bI wonder if you could beat Cynthia in battle? She´s one of the toughest Champions, so that´d be quite the battle." =>
    "\\bMe pregunto si podrías vencer a Cynthia en un combate. Es una de las Campeonas más duras, así que menudo combate sería.",
  "\\bAre you ready to face Rose?" => "\\b¿Estás listo para enfrentarte a Rose?",
  "\\bPlease, go ahead." => "\\bAdelante, por favor.",
  "\\bCongrats! That was incredible." => "\\b¡Felicidades! Eso fue increíble.",
}

DICT_087 = {
  "\\bPlease don´t be too hard on the poeple of Arrow Ridge, I know that they can be a bit rude." =>
    "\\bPor favor, no seas muy duro con la gente de Cordillera Flecha, sé que pueden ser un poco bordes.",
  "\\bThe landslide 20 years ago changed everything. It´s getting better, but some are struggeling to get over it." =>
    "\\bEl corrimiento de tierras de hace 20 años lo cambió todo. Va mejorando, pero a algunos les está costando superarlo.",
  "\\bI know that 20 years is a long period of time, but that landslide was horrible. When our house came crashing down, I thought it was over for us." =>
    "\\bSé que 20 años es mucho tiempo, pero aquel corrimiento fue horrible. Cuando nuestra casa se vino abajo, pensé que se había acabado para nosotros.",
  "\\bMy dad´s Copperajah saved my entire family, but it didn´t make it. If it wasn´t for that hero, I wouldn´t be here today." =>
    "\\bEl Copperajah de mi padre salvó a toda mi familia, pero no lo logró. Si no fuera por ese héroe, hoy no estaría aquí.",
}

DICT_258 = {
  "\\bI´m sorry, but the dorm rooms are for students only. Visitors are only allowed to go here if they´re invited by a student." =>
    "\\bLo siento, pero los dormitorios son solo para estudiantes. Los visitantes solo pueden entrar aquí si un estudiante los invita.",
  "\\bI´m afraid only students are allowed to attend lectures, so this area is off limits." =>
    "\\bMe temo que solo los estudiantes pueden asistir a las clases, así que esta zona está restringida.",
  "\\bStudying at Arrow Ridge Academy is just great! Once I graduate, I´m gonna smash the Gym Challenge and become the Champion in no time." =>
    "\\b¡Estudiar en la Academia de Cordillera Flecha es genial! En cuanto me gradúe, voy a arrasar en el Reto de Gimnasios y ser Campeón en un abrir y cerrar de ojos.",
  "\\bProf. McAvoy: Welcome to the Arrow Ridge Academy, where great minds pursue an even greater future." =>
    "\\bProf. McAvoy: Bienvenido a la Academia de Cordillera Flecha, donde las grandes mentes persiguen un futuro aún más grande.",
  "\\bI´m Professor Charles McAvoy, and I´m the director of the Academy. You must be \\PN then, because that Zeke guy stopped by earlier." =>
    "\\bSoy el Profesor Charles McAvoy, director de la Academia. Entonces debes de ser \\PN, porque ese tal Xarly pasó por aquí antes.",
  "\\bOh, are you surprised that I know about you? I´m an old friend of Professor Oak, and he told me about the two of you." =>
    "\\bOh, ¿te sorprende que sepa de ti? Soy un viejo amigo del Profesor Miyagi, y me habló de vosotros dos.",
  "\\bI was going to give a certain gift to one of you, but I wasn´t too found of Zeke´s attitude, so I just told him about some type match ups and let him go." =>
    "\\bTenía pensado darle un regalo a uno de los dos, pero no me convenció mucho la actitud de Xarly, así que solo le expliqué algunas ventajas de tipo y lo dejé marchar.",
  "\\bBut you seem less rash, and more determined, so this will be a lot more useful in your hands." =>
    "\\bPero tú pareces menos impulsivo y más decidido, así que esto será mucho más útil en tus manos.",
  "\\bTwo students of mine that wanted to pursue a degree in Pokémon Biology got to pick a partner to support them." =>
    "\\bDos alumnos míos que querían estudiar Biología Pokémon pudieron elegir un compañero que los apoyara.",
  "\\bThis Squirtle didn´t get picked, so giving it to a promising trainer is the right thing to do. Please, take good care of it." =>
    "\\bEste Squirtle no fue elegido, así que dárselo a un entrenador prometedor es lo correcto. Por favor, cuídalo bien.",
  "\\bOh, and my students got another little gift. Take this." =>
    "\\bOh, y mis alumnos recibieron otro pequeño regalo. Toma esto.",
  "\\bYour eyes aren´t deceiving you. That is a real Mega Stone. These are rare, but under the right conditions they can grant certain Pokémon great power." =>
    "\\bNo, tus ojos no te engañan. Eso es una Mega Piedra de verdad. Son escasas, pero bajo las condiciones adecuadas pueden conceder un gran poder a ciertos Pokémon.",
  "\\bOnly a handful of people have managed to unleash the power of these stones, but who knows, you might be able to do so as well." =>
    "\\bSolo un puñado de personas ha logrado liberar el poder de estas piedras, pero quién sabe, quizá tú también puedas.",
  "\\bYou should check out the Riverstone Institute once you make it to Riverstone, they´ll surely be able to help you out." =>
    "\\bDeberías visitar el Instituto Río el Último cuando llegues allí, seguro que podrán ayudarte.",
  "\\bIf you ever need a break from your adventure, you could study at our academy." =>
    "\\bSi alguna vez necesitas un descanso de tu aventura, podrías estudiar en nuestra academia.",
  "\\bWe offer a special degree for trainers, where they can learn everything about Pokémon battles and ethics. But I can see that you want to get going now." =>
    "\\bOfrecemos un título especial para entrenadores, donde pueden aprender todo sobre los combates Pokémon y la ética. Pero veo que quieres seguir tu camino ya.",
  "\\bI don´t blame you, so get going already. Good luck out there, and good bye!" =>
    "\\bNo te culpo, así que vete ya. ¡Buena suerte ahí fuera, y adiós!",
  "\\bI should visit Oak again, I haven´t seen that bloke in years. Fortnite´s OG season is coming back, and I can´t wait to smoke his old ass again." =>
    "\\bDebería visitar de nuevo al Profesor Miyagi, hace años que no veo a ese tío. Vuelve la temporada OG de Fortnite, y no veo la hora de volver a machacarlo.",
  "\\bAt the Academy, we can pursue one of three degrees. I´ve chosen to become a Professor, because I want to help my mother." =>
    "\\bEn la Academia podemos elegir entre tres títulos. Yo he elegido hacerme Profesor, porque quiero ayudar a mi madre.",
  "\\bShe works at the Hisui Wildlife Station on the Delta Islands, and treating those ancient Pokémon would be a dream come true for me." =>
    "\\bElla trabaja en la Estación de Vida Silvestre del Verde, en las Islas Delta, y tratar a esos Pokémon ancestrales sería un sueño hecho realidad para mí.",
  "\\bI´m just studying here to get a job at Silph Co. one day. They´re the biggest Pokémon tech company in the world, and I want to improve the world with them." =>
    "\\bSolo estudio aquí para algún día conseguir trabajo en Silph Co. Son la empresa tecnológica Pokémon más grande del mundo, y quiero mejorar el mundo junto a ellos.",
  "\\bI have never seen you here before, have I?" => "\\bNunca te había visto por aquí, ¿verdad?",
  "\\bOh, you´re doing the Gym Challenge and stopped by for some tips? Then you should talk to Professor McAvoy, he´ll help you for sure." =>
    "\\bOh, ¿estás haciendo el Reto de Gimnasios y has pasado a por algún consejo? Entonces deberías hablar con el Profesor McAvoy, seguro que te ayuda.",
  "\\bIt looks like he´s busy right now, but usually you can find him in the lobby. Just come back later and I´m sure you´ll meet him." =>
    "\\bParece que ahora está ocupado, pero normalmente lo encuentras en el vestíbulo. Vuelve más tarde y seguro que lo ves.",
}

DICT_294 = {
  "\\bHm, a Pokémon Trainer?" => "\\bHmm, ¿un Entrenador Pokémon?",
  "\\bAnd you look very strong. Then you can help me. I´m a rookie Pokémon Ranger, and I recently got my partner Pokémon." =>
    "\\bY pareces muy fuerte. Entonces puedes ayudarme. Soy una Ranger Pokémon novata, y hace poco conseguí a mi Pokémon compañero.",
  "\\bThey gave me a Snivy, but I really wanted a Fire-Type. Don´t tell anyone, but I stole someone´s Torchic." =>
    "\\bMe dieron un Snivy, pero yo quería de verdad uno de tipo Fuego. No se lo digas a nadie, pero le robé el Torchic a alguien.",
  "\\bBecause all of us Rangers look the same, no one will be able to know who did it, if I get rid of the Snivy." =>
    "\\bComo todos los Rangers vamos iguales, nadie podrá saber quién fue, si me deshago del Snivy.",
  "\\bPlease, take it." => "\\bPor favor, tómalo.",
  "\\bTake good care of this Snivy. And if anyone asks where you got this from, tell them that you visited your family in Unova." =>
    "\\bCuida bien de este Snivy. Y si alguien te pregunta de dónde lo sacaste, dile que visitaste a tu familia en Teselia.",
  "\\bThanks for helping me!" => "\\b¡Gracias por ayudarme!",
  "There's no more room for Pokémon!" => "¡No hay más espacio para Pokémon!",
  "The Pokémon Boxes are full and can't accept any more!" => "¡Las Cajas Pokémon están llenas y no pueden aceptar más!",
  "\\bBut you´re not the right person to help me..." => "\\bPero no eres la persona indicada para ayudarme...",
  "\\bNow that I have a Fire-Type Pokémon, my career will flourish!" =>
    "\\b¡Ahora que tengo un Pokémon de tipo Fuego, mi carrera va a florecer!",
  "\\bI´m so proud of my daughter. She managed to become a Pokémon Ranger! That´s a very honorable profession and I hope it makes her happy." =>
    "\\bEstoy muy orgulloso de mi hija. ¡Ha conseguido hacerse Ranger Pokémon! Es una profesión muy honorable y espero que la haga feliz.",
  "\\bShe did it! She fulfilled her big dream! I´m the proudest father in the world right now!" =>
    "\\b¡Lo consiguió! ¡Cumplió su gran sueño! ¡Ahora mismo soy el padre más orgulloso del mundo!",
}

DICT_295 = {
  "\\bI don´t wanna do my stupid homework! I wanna watch MoistCr1TiKaL rant about something!" =>
    "\\b¡No quiero hacer mis estúpidos deberes! ¡Quiero ver a MoistCr1TiKaL despotricar sobre algo!",
  "\\bGetting your child to do its homework is a nightmare. How stubborn can someone be?!" =>
    "\\bConseguir que tu hijo haga los deberes es una pesadilla. ¡¿Cómo se puede ser tan cabezota?!",
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

apply("Data/Map042.rxdata", DICT_042)
apply("Data/Map081.rxdata", DICT_081)
apply("Data/Map087.rxdata", DICT_087)
apply("Data/Map258.rxdata", DICT_258)
apply("Data/Map294.rxdata", DICT_294)
apply("Data/Map295.rxdata", DICT_295)
