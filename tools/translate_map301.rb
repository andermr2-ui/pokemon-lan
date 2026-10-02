# encoding: UTF-8
require_relative "rpg_stubs"

DICT_301 = {
  "\\bYo yo yo! I´m da real Slim Shady!" => "\\b¡Yo yo yo! ¡Soy el auténtico Slim Shady!",
  "\\bWhat? My name is Marshall Mathers, and I´m da mayor of this town." =>
    "\\b¿Qué? Me llamo Marshall Mathers, y soy el alcalde de este pueblo.",
  "\\bDr. Dre said I should get into politics, and this looked like a job for me. I promised my people that I´ll do this´till I collapse." =>
    "\\bEl Dr. Dre dijo que debería meterme en política, y esto parecía un trabajo hecho para mí. Le prometí a mi gente que haría esto hasta desplomarme.",
  "\\bCan you go ´round the outside and find out what the Riverstone folks think about me?" =>
    "\\b¿Puedes dar una vuelta por ahí fuera y averiguar qué piensa la gente de Río el Último sobre mí?",
  "\\bYou will? That´s dope. Come back here once you know more." =>
    "\\b¿Lo harás? Eso mola. Vuelve aquí cuando sepas más.",
  "\\bPlease talk to more people so I can see if this really looks like a job for me. Don´t lose yourself kid." =>
    "\\bPor favor, habla con más gente para que pueda ver si esto realmente es un trabajo hecho para mí. No te pierdas a ti mismo, chaval.",
  "\\bAlright, what did my folks say?" => "\\bBueno, ¿qué dijo mi gente?",
  "\\bHm, mh, okay, yeah. This does look like a job for me! Please, take this. I got it from Dre, and I don´t know what to do with it. Here you go!" =>
    "\\bHmm, mh, vale, sí. ¡Esto sí que parece un trabajo hecho para mí! Por favor, toma esto. Me lo dio Dre, y no sé qué hacer con ello. ¡Aquí tienes!",
  "\\bIf these TMs could be used in rap battles, I´d use this move. But I´m so good that it probably wouldn´t be necessary. Bye!" =>
    "\\bSi estas MT se pudieran usar en batallas de rap, usaría este movimiento. Pero soy tan bueno que probablemente no haría falta. ¡Adiós!",
  "\\bI´m going to make a diss track. That dojo guy thinks I´m lazy or something, so I´m gonna end his career!" =>
    "\\bVoy a hacer una canción de diss. Ese tipo del dojo cree que soy vago o algo así, ¡así que voy a acabar con su carrera!",
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

apply("Data/Map301.rxdata", DICT_301)
