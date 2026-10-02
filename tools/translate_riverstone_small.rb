# encoding: UTF-8
require_relative "rpg_stubs"

DICT_124 = {
  "\\bFishing at Milotic River is nearly impossible...I´m frustrated!" =>
    "\\bPescar en el Río Milotic es casi imposible... ¡Qué frustración!",
  "\\bDon´t try to use your fishing rod here, you might get dragged down." =>
    "\\bNo intentes usar tu caña de pescar aquí, podrías acabar arrastrado.",
  "\\bHaha, wouldn´t it be funny if I jumped?" => "\\bJaja, ¿no sería gracioso si saltara?",
  "\\bDon´t worry, I would never jump down this bridge. But others have..." =>
    "\\bNo te preocupes, nunca saltaría de este puente. Pero otros sí lo han hecho...",
}

DICT_123 = {
  "\\bPraise the rock!" => "\\b¡Alabada sea la roca!",
  "\\bThis cool rock is one of Riverstone´s many cool attractions." =>
    "\\bEsta roca genial es una de las muchas atracciones geniales de Río el Último.",
  "\\bRiverstone Park is famous for it´s battles!" =>
    "\\b¡El Parque Río el Último es famoso por sus combates!",
  "\\bDon´t forget to take a look around the tall grass. Some very famous Pokémon live in this park." =>
    "\\bNo olvides echar un vistazo por la hierba alta. Algunos Pokémon muy famosos viven en este parque.",
}

DICT_272 = {
  "\\bFinally, someone else who´s in need of training. I need some confidence if I want to challenge the Riverstone Gym, and this battle will help for sure." =>
    "\\bPor fin, alguien más que necesita entrenar. Necesito algo de confianza si quiero retar el Gimnasio de Río el Último, y este combate seguro que ayuda.",
  "\\bAre you ready? Let´s battle!" => "\\b¿Estás listo? ¡A combatir!",
  "\\bLooks like I need even more training. But you, you´re ready." =>
    "\\bParece que necesito entrenar aún más. Pero tú, tú estás listo.",
}

DICT_132 = {
  "\\sign[signskin]Top-Grade Items for Trainers!" =>
    "\\sign[signskin]¡Objetos de primera para entrenadores!",
  "\\sign[signskin]2F: Trainer's Market" => "\\sign[signskin]2ª planta: Mercado del Entrenador",
}

DICT_133 = {
  "\\bThis store is awesome! They´ll let you use the sample console for as long as you want." =>
    "\\b¡Esta tienda es genial! Te dejan usar la consola de prueba todo el tiempo que quieras.",
  "\\bI come here whenever I want to play some games, which is why I don´t actually own a console." =>
    "\\bVengo aquí siempre que quiero jugar a algo, por eso en realidad no tengo consola propia.",
  "\\sign[signskin]3F: TV Game Shop" => "\\sign[signskin]3ª planta: Tienda de Videojuegos",
}

DICT_134 = {
  "\\bI think I´ll buy a Pokédoll for my granddaughter. Yeah, that´ll make her happy." =>
    "\\bCreo que le compraré un Pokémuñeco a mi nieta. Sí, eso la hará feliz.",
  "\\sign[signskin]4F: Gifts and Element Stones" =>
    "\\sign[signskin]4ª planta: Regalos y Piedras Elementales",
}

DICT_135 = {
  "\\bI thought I could buy weed up here, but I guess the \"Drugstore\" doesn´t actually sell any drugs." =>
    "\\bPensaba que podría comprar hierba aquí arriba, pero supongo que la \"Farmacia\" en realidad no vende drogas.",
  "\\sign[signskin]5F: Drugstore" => "\\sign[signskin]5ª planta: Farmacia",
}

DICT_141 = {
  "\\bBe careful out there. Route 8 can be tough." => "\\bTen cuidado ahí fuera. La Ruta 8 puede ser dura.",
  "\\bI´m sorry, but I can´t let you through at the moment. Only those who have at least 4 Gym Badges are allowed to enter Route 8." =>
    "\\bLo siento, pero no puedo dejarte pasar por ahora. Solo se permite entrar a la Ruta 8 a quienes tengan al menos 4 Medallas de Gimnasio.",
  "\\bYou´re free to go. We implented this badge rule, because an alarming number of people got injured on Route 8. Please be careful!" =>
    "\\bYa puedes pasar. Implantamos esta norma de medallas porque un número alarmante de personas se lesionaba en la Ruta 8. ¡Ten cuidado, por favor!",
}

DICT_188 = {
  "\\bThe protest is finally over. Those flat earthers really need help..." =>
    "\\bLa protesta por fin terminó. Esos terraplanistas de verdad necesitan ayuda...",
  "\\bThis is going to sound stupid, but there are flat earthers protesting on Route 10. I don´t want anyone to see that mess, so please, turn around." =>
    "\\bEsto va a sonar tonto, pero hay terraplanistas protestando en la Ruta 10. No quiero que nadie vea ese lío, así que, por favor, date la vuelta.",
  "\\bThe police had to come in to stop the protest. I don´t know who in their right mind would think that the earth is flat..." =>
    "\\bLa policía tuvo que intervenir para parar la protesta. No sé quién en su sano juicio pensaría que la Tierra es plana...",
}

DICT_302 = {
  "\\bDo you like Latinas? I love Latinas!!!" => "\\b¿Te gustan las latinas? ¡¡¡A mí me encantan las latinas!!!",
  "\\bI always have to be with my sister, because I get lost when I´m alone." =>
    "\\bSiempre tengo que estar con mi hermana, porque me pierdo cuando estoy solo.",
  "\\bMy sister has no sense of direction, so she needs me to get around." =>
    "\\bMi hermana no tiene sentido de la orientación, así que me necesita para moverse.",
}

DICT_308 = {
  "\\sign[signskin]1F: Service Counter" => "\\sign[signskin]1ª planta: Mostrador de Atención",
  "\\bOnce I go up there I´m gonna go broke. Shopping is my new addiction, and I just can´t stop myself!" =>
    "\\bEn cuanto suba ahí me voy a quedar sin blanca. Comprar es mi nueva adicción, ¡y no puedo parar!",
  "\\bHello! Welcome to the Riverstone Department Store." =>
    "\\b¡Hola! Bienvenido a los Grandes Almacenes de Río el Último.",
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

apply("Data/Map124.rxdata", DICT_124)
apply("Data/Map123.rxdata", DICT_123)
apply("Data/Map272.rxdata", DICT_272)
apply("Data/Map132.rxdata", DICT_132)
apply("Data/Map133.rxdata", DICT_133)
apply("Data/Map134.rxdata", DICT_134)
apply("Data/Map135.rxdata", DICT_135)
apply("Data/Map141.rxdata", DICT_141)
apply("Data/Map188.rxdata", DICT_188)
apply("Data/Map302.rxdata", DICT_302)
apply("Data/Map308.rxdata", DICT_308)
