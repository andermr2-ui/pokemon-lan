# encoding: UTF-8
require_relative "rpg_stubs"

MOVE_DELETER_DICT = {
  "\\bHello, I´m a move deleter. I can make Pokémon forget their moves." =>
    "\\bHola, soy un borrador de movimientos. Puedo hacer que los Pokémon olviden sus movimientos.",
  "\\bWould you like me to do that?" =>
    "\\b¿Te gustaría que lo hiciera?",
  "\\bWhich Pokémon should forget a move?" =>
    "\\b¿Qué Pokémon debería olvidar un movimiento?",
  "\\bCome again if there are moves that need to be forgotten." =>
    "\\bVuelve si hay movimientos que necesiten olvidarse.",
  "\\bWhat? No Egg should know any moves." =>
    "\\b¿Qué? Ningún Huevo debería saber movimientos.",
  "\\bWhat? I can't make a Shadow Pokémon forget a move." =>
    "\\b¿Qué? No puedo hacer que un Pokémon Sombra olvide un movimiento.",
  "\\b\\v[3] seems to know only one move..." =>
    "\\b\\v[3] solo parece saber un movimiento...",
  "\\bWhich move should be forgotten?" =>
    "\\b¿Qué movimiento debería olvidar?",
  "\\bHm! \\v[3]'s \\v[4]? That move should be forgotten?" =>
    "\\b¡Ajá! ¿\\v[4] de \\v[3]? ¿Ese movimiento debería olvidarse?",
  "\\bIt worked to perfection!" =>
    "\\b¡Funcionó a la perfección!",
  "\\b\\v[3] has forgotten \\v[4] completely." =>
    "\\b\\v[3] ha olvidado \\v[4] por completo.",
}.freeze

EGG_DICT = {
  "\\bOh, hello! You look like you want to dive head first into your adventure. Well you´ve come to the right guy, because I have a gift for you." =>
    "\\bOh, ¡hola! Parece que quieres lanzarte de cabeza a tu aventura. Pues has venido a la persona indicada, porque tengo un regalo para ti.",
  "\\bA friend of mine recently gave me this, but I have no use for it, so it would be a shame if to leave it with me." =>
    "\\bUn amigo mío me dio esto hace poco, pero no le doy ningún uso, así que sería una pena dejarlo aquí conmigo.",
  "\\bThis is a Pokémon Egg, and in the hands of a trainer a Pokémon might hatch after a while. So, do you want to take it?" =>
    "\\bEsto es un Huevo Pokémon, y en manos de un entrenador, un Pokémon podría eclosionar de él tras un tiempo. Entonces, ¿quieres llevártelo?",
  "\\me[Egg get]\\PN received the Egg from Jeremy." =>
    "\\me[Egg get]\\PN recibió el Huevo de Jeremy.",
  "\\bTake good care of it!" =>
    "\\b¡Cuídalo bien!",
  "\\bOh, you can't carry it with you." =>
    "\\bOh, no puedes llevarlo contigo.",
  "\\bMake some space in your party and come back." =>
    "\\bHaz espacio en tu equipo y vuelve.",
  "\\bOh. Will I ever find someone to take this Egg?" =>
    "\\bOh. ¿Llegaré a encontrar a alguien que se lleve este Huevo?",
  "\\bI wonder what that Egg will hatch into?" =>
    "\\bMe pregunto en qué eclosionará ese Huevo...",
}.freeze

def apply_dict(path, dict)
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
  File.open(path, "wb") { |f| Marshal.dump(map, f) } if count > 0
  count
end

move_deleter_maps = %w[043 087 093 116 127 157 184 210 216 233 246 325 351]
move_deleter_maps.each do |n|
  path = "Data/Map#{n}.rxdata"
  c = apply_dict(path, MOVE_DELETER_DICT)
  puts "#{path} (move deleter): #{c} reemplazos"
end

c = apply_dict("Data/Map043.rxdata", EGG_DICT)
puts "Data/Map043.rxdata (Jeremy egg): #{c} reemplazos"
