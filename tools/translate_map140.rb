# encoding: UTF-8
require_relative "rpg_stubs"

DICT_140 = {
  "\\bEmmett: Welcome, trainer. Do you want to unveil the mystery of Eevee and it´s evolutions with me?" =>
    "\\bEmmett: Bienvenido, entrenador. ¿Quieres desvelar conmigo el misterio de Eevee y sus evoluciones?",
  "\\bThen buckle up, because I want to see a major breakthrough!" =>
    "\\bEntonces prepárate, ¡porque quiero ver un gran avance!",
  "\\me[Badge get]\\bYou´d make a great scientist. Take the Evolution Badge!\\wtnp[110]" =>
    "\\me[Badge get]\\bSerías un gran científico. ¡Toma la Medalla Evolución!\\wtnp[110]",
  "\\bAnd how about you take this as well." => "\\bY qué tal si también te llevas esto.",
  "\\bEmmett: This TM cointains Psychic, a powerful move that is guaranteed to help you. And you can now use Surf outside of battles." =>
    "\\bEmmett: Esta MT contiene Psíquico, un movimiento poderoso que sin duda te va a ayudar. Y ya puedes usar Surf fuera de combate.",
  "\\bIf you want to explore Route 8, then go to the Department Store to buy enough Potions and Poké Balls." =>
    "\\bSi quieres explorar la Ruta 8, ve a los Grandes Almacenes a comprar suficientes Pociones y Poké Balls.",
  "\\bRoute 8 is home to more than a hundred different species. If you go unprepared, you might regret it. Have fun out there, goodbye!" =>
    "\\bLa Ruta 8 alberga a más de cien especies distintas. Si vas sin preparación, podrías arrepentirte. ¡Diviértete por ahí, adiós!",
  "\\bEmmett: If you want to catch an Eevee, just go to Riverstone Park. Eevees love that place." =>
    "\\bEmmett: Si quieres atrapar un Eevee, solo tienes que ir al Parque de Río el Último. A los Eevee les encanta ese sitio.",
  "\\bEmmett: You did it! You had a major breakthrough! Science is great, but you can´t become Champion without skill." =>
    "\\bEmmett: ¡Lo lograste! ¡Tuviste un gran avance! La ciencia es genial, pero no puedes convertirte en Campeón sin habilidad.",
  "\\bI still need to research you progress though, so show me what you´ve learned!" =>
    "\\bAún necesito investigar tu progreso, ¡así que muéstrame lo que has aprendido!",
  "\\bEmmett: Look at the results! Your progress is off the charts! Thanks for helping me with my research." =>
    "\\bEmmett: ¡Mira los resultados! ¡Tu progreso se sale de la escala! Gracias por ayudarme con mi investigación.",
  "\\bWe´re now one step closer to solving the mystery behind Eevee and its evolutions. I wish you the best for your future studies. Farewell!" =>
    "\\bAhora estamos un paso más cerca de resolver el misterio de Eevee y sus evoluciones. Te deseo lo mejor para tus futuros estudios. ¡Adiós!",
  "\\bEmmett: So far, 8 evolutions of Eevee have been discovered. Are there more? Are there evolutions of other Types?" =>
    "\\bEmmett: Hasta ahora se han descubierto 8 evoluciones de Eevee. ¿Habrá más? ¿Habrá evoluciones de otros tipos?",
  "\\bMaybe there used to be other evolutions that are extinct now, who knows? I´m very excited to find out more!" =>
    "\\bQuizás hubo otras evoluciones que ahora están extintas, ¿quién sabe? ¡Estoy muy emocionado por descubrir más!",
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

apply("Data/Map140.rxdata", DICT_140)
