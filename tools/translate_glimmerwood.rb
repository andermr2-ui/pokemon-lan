# encoding: UTF-8
require_relative "rpg_stubs"

DICT_209 = {
  "\\bArthur: Ah, it´s you again. \\PN, wasn´t it?" => "\\bArthur: Ah, sos vos de nuevo. \\PN, ¿no?",
  "\\bOh, good, I tend to struggle with names, but I got it right for once." =>
    "\\bAh, qué bueno, suelo tener problemas con los nombres, pero por una vez acerté.",
  "\\bIt´s quite convenient that we meet again, because there´s been a major scientific breakthrough." =>
    "\\bViene bien que nos encontremos de nuevo, porque hubo un gran avance científico.",
  "\\bWhat I´m about to tell you is quite exciting!" => "\\b¡Lo que estoy por contarte es muy emocionante!",
  "\\bA company in Crystal Harbor has managed to develope a new version of the Pokéball." =>
    "\\bUna empresa en el Puerto del Cristal logró desarrollar una nueva versión de la Poké Ball.",
  "\\bIt´s called the Deity Ball and it´s extremely advanced! It got developed based on Delta Aura theories, and they achieved something incredible!" =>
    "\\b¡Se llama la Bola Deidad y es extremadamente avanzada! Se desarrolló basándose en teorías del Aura Delta, ¡y lograron algo increíble!",
  "\\bThe Deity Ball is the first Pokéball to be able to catch Mythical and Legendary Pokémon with a high success rate!" =>
    "\\b¡La Bola Deidad es la primera Poké Ball capaz de atrapar Pokémon Míticos y Legendarios con una alta tasa de éxito!",
  "\\bWell, I guess it´s not as good as a Master Ball, but how often do you come across those?" =>
    "\\bBueno, supongo que no es tan buena como una Master Ball, pero ¿con qué frecuencia te encontrás con esas?",
  "\\bThe Deity Ball got tested on a special Legendary Pokémon called Type: Null. It was much more successful than the Ultra Ball for example." =>
    "\\bLa Bola Deidad se probó con un Pokémon Legendario especial llamado Type: Null. Tuvo mucho más éxito que, por ejemplo, la Ultra Ball.",
  "\\bHowever, we need to be careful with these balls. Legendary Pokémon protect the people, so catching them comes with responsibilities." =>
    "\\bSin embargo, tenemos que tener cuidado con estas balls. Los Pokémon Legendarios protegen a la gente, así que atraparlos conlleva responsabilidades.",
  "\\bThe company handed me a few prototypes, and I want you to have some of them. I trust you to use them wisely. Here you go." =>
    "\\bLa empresa me entregó algunos prototipos, y quiero que tengas algunos. Confío en que los uses con sabiduría. Tomá.",
  "\\bI should warn you though, these balls don´t work very well on regular Pokémon. You need to save them for potential encounters with mighty legends." =>
    "\\bAunque debería advertirte, estas balls no funcionan muy bien con Pokémon comunes. Tenés que guardarlas para posibles encuentros con poderosas leyendas.",
  "\\bYou gotta visit Crystal Harbor one day. The access is currently restricted because a movie is being filmed there, but that´ll soon be completed." =>
    "\\bTenés que visitar el Puerto del Cristal algún día. El acceso está restringido por el momento porque están filmando una película ahí, pero eso va a terminar pronto.",
  "\\bOnce you make it there, visit the Delta Tech Company." => "\\bUna vez que llegues ahí, visitá la Delta Tech Company.",
  "\\bThey can give you more Deity Balls, just mention that you know me." =>
    "\\bTe pueden dar más Bolas Deidad, solo mencioná que me conocés.",
  "\\bI have to continue with my research now, I´m trying to figure out which Pokémon can be caught with these balls and which can´t." =>
    "\\bAhora tengo que seguir con mi investigación, estoy tratando de descubrir qué Pokémon se pueden atrapar con estas balls y cuáles no.",
  "\\bThanks for helping me with the research. Take care!" => "\\bGracias por ayudarme con la investigación. ¡Cuidate!",
  "\\bCrikey, the weather is even worse over there..." => "\\bCarajo, el clima está aún peor por allá...",
  "\\bBrrr, this is too cold for me..." => "\\bBrrr, esto es demasiado frío para mí...",
  "\\bHow can this guy work in a cold like this?! I´m impressed..." =>
    "\\b¿¡Cómo puede trabajar este tipo con este frío!? Estoy impresionado...",
}

DICT_210 = {
  "\\bIsn´t it awesome that even a small village like Glimmerwood has a Pokémon Center?" =>
    "\\b¿No es genial que hasta un pueblito como Bosque Lumínico tenga un Centro Pokémon?",
}

DICT_214 = {
  "\\bGlimmerwood has been hit by a blizzard, so I can´t let anyone through until that mess has been cleaned up. I´m sorry, but you´ll have to come back later." =>
    "\\bBosque Lumínico fue golpeado por una ventisca, así que no puedo dejar pasar a nadie hasta que se limpie ese lío. Perdón, pero vas a tener que volver más tarde.",
  "\\bIf you want to use Route 12, then wear warm clothes. It is very cold over there." =>
    "\\bSi querés usar la Ruta 12, ponete ropa abrigada. Hace mucho frío allá.",
}

DICT_269 = {
  "\\bOh, hi. What brings you to Glimmerwood?" => "\\bAh, hola. ¿Qué te trae a Bosque Lumínico?",
  "\\bAh, you´re headed for Aurora Summit. If you follow Route 12, you´ll be there in no time." =>
    "\\bAh, vas rumbo a las Cumbres Auroreales. Si seguís la Ruta 12, vas a llegar en un abrir y cerrar de ojos.",
  "\\bHey, do you happen to be familiar with the Legendary Giants, also known as the Regis?" =>
    "\\bEy, ¿por casualidad conocés a los Gigantes Legendarios, también conocidos como los Regis?",
  "\\bRegigigas, the first of the giants, created 5 others. While they used to be worshipped, all of the giants were sealed away long ago." =>
    "\\bRegigigas, el primero de los gigantes, creó a otros 5. Aunque solían ser venerados, todos los gigantes fueron sellados hace mucho tiempo.",
  "\\bNow listen, I´ve heard that these giants were sealed in the caves of this region." =>
    "\\bAhora escuchá, oí que estos gigantes fueron sellados en las cuevas de esta región.",
  "\\bOne in Rumble Mountain, one in Iron Mountain, one in Aurora Mountain, one somewhere on Thunder Pass, and one on Victory Road." =>
    "\\bUno en la Montaña Calada, uno en el Monte Hierro, uno en el Monte Auroreal, uno en algún lugar del Paso del Trueno, y uno en la Avenida Victoriosa.",
  "\\bNo one has been able to find them, but I bet that they´re there!" =>
    "\\bNadie ha podido encontrarlos, ¡pero apuesto a que están ahí!",
  "\\bYou seem interested. And you´re doing the Gym Challenge, right? That means you´re strong." =>
    "\\bParecés interesado. Y estás haciendo el Desafío de Gimnasios, ¿no? Eso significa que sos fuerte.",
  "\\bWill you try to find the Regis while you´re on your journey?" =>
    "\\b¿Vas a intentar encontrar a los Regis mientras estás de viaje?",
  "\\bYou are?! Really?! That´s awesome! Then I bet you like rare Pokémon as much as I do! Here, this one should make for a great companion!" =>
    "\\b¿¡En serio!? ¿¡De verdad!? ¡Eso es genial! ¡Entonces apuesto a que te gustan los Pokémon raros tanto como a mí! Tomá, ¡este debería ser un gran compañero!",
  "\\bI got this Piplup as a gift during my year abroad in Sinnoh, but it doesn´t fit into my team, so I want a strong trainer to take care of it." =>
    "\\bConseguí este Piplup de regalo durante mi año en el extranjero en Sinnoh, pero no encaja en mi equipo, así que quiero que un entrenador fuerte lo cuide.",
  "\\bWe share the same goal, so I´m happy to give this to you. And now go out there and find the Regis!" =>
    "\\bCompartimos la misma meta, así que me alegra dártelo. ¡Y ahora salí a buscar a los Regis!",
  "There's no more room for Pokémon!" => "¡No hay más espacio para Pokémon!",
  "The Pokémon Boxes are full and can't accept any more!" =>
    "¡Las cajas de Pokémon están llenas y no pueden recibir más!",
  "\\bOh, but that´s okay. It´s probably too dangerous anyways..." =>
    "\\bAh, pero está bien. De todos modos probablemente sea demasiado peligroso...",
  "\\bI heard that only those who rule over the 5 Regis can reawaken the mighty Regigigas. If that´s no reason to find them, then I don´t know what is." =>
    "\\bOí que solo quienes dominan a los 5 Regis pueden volver a despertar al poderoso Regigigas. Si eso no es razón suficiente para encontrarlos, no sé qué lo sería.",
}

DICT_307 = {
  "\\bOh no, I knocked over the book shelf!" => "\\bAy no, ¡tiré la estantería de libros!",
  "\\bMom´s gonna kill me when she comes home..." => "\\bMamá me va a matar cuando vuelva a casa...",
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

apply("Data/Map209.rxdata", DICT_209)
apply("Data/Map210.rxdata", DICT_210)
apply("Data/Map214.rxdata", DICT_214)
apply("Data/Map269.rxdata", DICT_269)
apply("Data/Map307.rxdata", DICT_307)
