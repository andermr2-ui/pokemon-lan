# encoding: UTF-8
require_relative "rpg_stubs"

DICT_202 = {
  "It´s an ancient Pokémon Statue. A powerful aura is coming from within the statue." =>
    "Es una antigua estatua Pokémon. Un aura poderosa emana desde el interior de la estatua.",
  "The statue is shaking!" => "¡La estatua está temblando!",
  "The power of your Delta Stone has been restored. Could certain Pokémon come back now?" =>
    "El poder de tu Piedra Delta se ha restaurado. ¿Podrían ciertos Pokémon regresar ahora?",
  "\\bAre you looking for the boss? Then I have bad news, you´ll have to deal with me!" =>
    "\\b¿Estás buscando al jefe? Entonces tengo malas noticias, ¡vas a tener que vértelas conmigo!",
  "\\bThe boss said that we can´t keep on losing like this, so we had a brilliant idea. What if we just remove you by force?" =>
    "\\bEl jefe dijo que no podemos seguir perdiendo así, así que tuvimos una idea brillante. ¿Y si simplemente te sacamos de encima por la fuerza?",
  "\\bNOW! GET HIM!" => "\\b¡AHORA! ¡AGÁRRENLO!",
  "It´s an ancient plate with strange symbols." => "Es una placa antigua con símbolos extraños.",
  "\\bPoliwrath, use Hypnosis!" => "\\b¡Poliwrath, usa Hipnosis!",
  "\\bOh, look, it´s the kid that wants to be a hero. You´ve angered the wrong people!" =>
    "\\bAh, mirá, es el chico que quiere ser un héroe. ¡Enojaste a la gente equivocada!",
  "\\bOkay, go ahead." => "\\bBueno, adelante.",
}

DICT_203 = {
  "\\bYou must be the kid that keeps bothering us. Enough of this!" =>
    "\\bDebés ser el chico que no para de molestarnos. ¡Basta de esto!",
  "\\bYou should stop, for your own good. Relic Cave is a one-way cave, so once you jump over this ledge, there´s no turning back." =>
    "\\bDeberías parar, por tu propio bien. La Cueva Fetiche es de un solo sentido, así que una vez que saltás este saliente, no hay vuelta atrás.",
}

DICT_288 = {
  "It´s an ancient plate with strange symbols." => "Es una placa antigua con símbolos extraños.",
  "It´s a large stature resembling a Pokémon." => "Es una gran estatua que se asemeja a un Pokémon.",
  "\\bThe stature seems to be alive!" => "\\b¡La estatua parece estar viva!",
  "\\bGIGAAAS!!!" => "\\b¡GIGAAAS!!!",
  "Regigigas went back into a deep slumber. Will it wake up again?" =>
    "Regigigas volvió a caer en un sueño profundo. ¿Despertará de nuevo?",
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

apply("Data/Map202.rxdata", DICT_202)
apply("Data/Map203.rxdata", DICT_203)
apply("Data/Map288.rxdata", DICT_288)
