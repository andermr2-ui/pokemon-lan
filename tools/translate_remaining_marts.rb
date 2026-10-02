# encoding: UTF-8
require_relative "rpg_stubs"

DICTS = {
  349 => {
    "It´s a dead body..." => "Es un cadáver...",
    "\\bMIRAI!!!" => "\\b¡¡¡MIRAI!!!",
    "Miraidon disappeared. Will it come back?" => "Miraidon desapareció. ¿Volverá?",
  },
  54 => {
    "There is a questionnaire.\\nWould you like to fill it out?" =>
      "Hay un cuestionario.\\n¿Te gustaría rellenarlo?",
    "\\PN filled in the questionnaire." =>
      "\\PN rellenó el cuestionario.",
    "\\bOh, hello!\\nYou filled in the questionnaire?" =>
      "\\bOh, ¡hola!\\n¿Rellenaste el cuestionario?",
    "\\bThat means you must know about the Mystery Gift." =>
      "\\bEso significa que debes de saber lo que es el Regalo Misterioso.",
    "\\bFrom now on, you should be receiving Mystery Gifts!" =>
      "\\bA partir de ahora, deberías recibir Regalos Misteriosos.",
    "\\w[signskin]Once you save your game, you can access the Mystery Gift." =>
      "\\w[signskin]Una vez que guardes la partida, podrás acceder al Regalo Misterioso.",
    "\\bHello. You must be \\PN." =>
      "\\bHola. Debes de ser \\PN.",
    "\\bI've received a gift for you.\\nHere you go!" =>
      "\\bHe recibido un regalo para ti.\\n¡Aquí tienes!",
    "\\bI haven't received any other gifts for you." =>
      "\\bNo he recibido más regalos para ti.",
    "\\bWe look forward to your next visit." =>
      "\\bEsperamos tu próxima visita.",
  },
  88 => {
    "\\bInflation has gotten really bad..." =>
      "\\bLa inflación se ha puesto muy fea últimamente...",
    "\\bBeing a Pokémon Trainer these days is expensive, I would not wanna do that..." =>
      "\\bHoy en día ser Entrenador Pokémon sale carísimo, yo no querría serlo...",
  },
}
DICTS[25] = DICTS[54]

DICTS.each do |num, dict|
  path = format("Data/Map%03d.rxdata", num)
  map = File.open(path, "rb") { |f| Marshal.load(f) }
  count = 0
  map.events.each_value do |event|
    event.pages.each do |page|
      list = page.list
      list.each_with_index do |cmd, i|
        next unless cmd.code == 101
        t = cmd.parameters[0]
        next unless t && !t.empty?
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
