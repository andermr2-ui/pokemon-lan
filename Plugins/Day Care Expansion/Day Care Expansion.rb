#===============================================================================
# Guarderia ampliada: 12 espacios (6 parejas de 2) en vez de 2, criando hasta
# 6 parejas de huevos en simultaneo en vez de una sola.
#
# Diseno:
#   - DayCare::MAX_SLOTS pasa de 2 a 12 (PAIR_SIZE * NUM_PAIRS).
#   - Las parejas se forman por posicion: espacios 0-1 = pareja A, 2-3 =
#     pareja B, ..., 10-11 = pareja F. No hay eleccion manual de pareja: se
#     depositan en orden y quedan emparejados de a 2, como "jaulas". Es
#     mucho mas simple de usar y de mantener que dejar elegir pareja libre
#     entre los 12, y ya cumple el pedido real (varias parejas criando a la
#     vez, dos equipos completos posibles).
#   - Cada pareja tiene su PROPIO progreso de huevo (compatibilidad, contador
#     de pasos, huevo listo) - independiente de las demas. Antes solo existia
#     un unico progreso global porque solo podia haber una pareja.
#   - El metodo original `pokemon_pair` (privado, sin parametro) buscaba
#     "los primeros 2 espacios llenos, los que sean" - con 12 espacios eso
#     ignoraria silenciosamente a las otras 10 mascotas. Se reemplaza por
#     `pokemon_pair_at(pair_index)`, que mira solo los 2 espacios de ESA
#     pareja especifica.
#   - Se agrega el modulo DayCareUI con TODA la logica de menu interactiva en
#     Ruby (mismo patron que CharCustom.pbAbrirArmario para el armario), en
#     vez de reconstruir un arbol de eventos de RPG Maker gigante a mano.
#===============================================================================
class DayCare
  PAIR_SIZE = 2
  NUM_PAIRS = 6

  # Reemplaza por completo el initialize original (que tenia MAX_SLOTS = 2
  # fijo en su propio codigo, no se puede "ampliar" con un alias porque la
  # constante se resuelve en el momento de escribir el script original).
  def initialize
    @slots = []
    (PAIR_SIZE * NUM_PAIRS).times { @slots.push(DayCareSlot.new) }
    reset_egg_counters
    @gain_exp = Settings::DAY_CARE_POKEMON_GAIN_EXP_FROM_WALKING
    @share_egg_moves = Settings::DAY_CARE_POKEMON_CAN_SHARE_EGG_MOVES
  end

  # Reemplaza el original (que solo llevaba un progreso global) por arrays,
  # uno por pareja. Se mantienen @egg_generated/@step_counter (sin usar,
  # pero por si algun codigo viejo los llegara a leer).
  def reset_egg_counters
    @egg_generated = false
    @step_counter = 0
    @pair_egg_generated = Array.new(NUM_PAIRS, false)
    @pair_step_counter  = Array.new(NUM_PAIRS, 0)
  end

  # Solo reinicia el progreso de UNA pareja (al depositar/retirar de sus 2
  # espacios) - antes, con una sola pareja posible, reiniciar "todo" y
  # reiniciar "esa pareja" era lo mismo; con 6 en simultaneo, resetear todo
  # por mover un solo Pokemon en otra jaula seria un bug nuevo.
  def reset_pair_counters(pair_index)
    ensure_expanded!
    return if pair_index < 0 || pair_index >= NUM_PAIRS
    @pair_egg_generated[pair_index] = false
    @pair_step_counter[pair_index]  = 0
  end

  # Una partida guardada ANTES de instalar este plugin tiene un DayCare viejo
  # (2 espacios, sin @pair_egg_generated/@pair_step_counter) - Marshal lo
  # deserializa tal cual, sin volver a pasar por initialize. Se autorepara
  # solo la primera vez que se lo necesita, en vez de exigir partida nueva.
  def ensure_expanded!
    @slots ||= []
    @slots.push(DayCareSlot.new) while @slots.length < PAIR_SIZE * NUM_PAIRS
    @pair_egg_generated ||= []
    @pair_step_counter  ||= []
    @pair_egg_generated.push(false) while @pair_egg_generated.length < NUM_PAIRS
    @pair_step_counter.push(0)      while @pair_step_counter.length < NUM_PAIRS
  end

  def pair_slots(pair_index)
    ensure_expanded!
    base = pair_index * PAIR_SIZE
    @slots[base, PAIR_SIZE]
  end

  def pair_count(pair_index)
    pair_slots(pair_index).count { |slot| slot.filled? }
  end

  def egg_ready?(pair_index)
    ensure_expanded!
    return false if pair_index < 0 || pair_index >= NUM_PAIRS
    @pair_egg_generated[pair_index]
  end

  def any_egg_ready?
    (0...NUM_PAIRS).any? { |i| egg_ready?(i) }
  end

  # Version con parametro del "pokemon_pair" privado original: en vez de
  # "los primeros 2 espacios llenos de los 12", mira solo los 2 espacios de
  # ESA pareja.
  def pokemon_pair_at(pair_index)
    slots = pair_slots(pair_index).select(&:filled?)
    raise _INTL("Couldn't find 2 deposited Pokémon.") if slots.length < 2
    return slots[0].pokemon, slots[1].pokemon
  end

  # Misma logica que la "compatibility" privada original, pero mirando una
  # pareja especifica en vez de "el conteo global == 2".
  def compatibility_at(pair_index)
    return 0 if pair_count(pair_index) != 2
    pkmn1, pkmn2 = pokemon_pair_at(pair_index)
    return 0 if pkmn1.shadowPokemon? || pkmn2.shadowPokemon?
    egg_groups1 = pkmn1.species_data.egg_groups
    egg_groups2 = pkmn2.species_data.egg_groups
    return 0 if egg_groups1.include?(:Undiscovered) || egg_groups2.include?(:Undiscovered)
    return 0 if !egg_groups1.include?(:Ditto) && !egg_groups2.include?(:Ditto) &&
                (egg_groups1 & egg_groups2).length == 0
    ditto1 = egg_groups1.include?(:Ditto)
    ditto2 = egg_groups2.include?(:Ditto)
    compatible_gender = (pkmn1.female? && pkmn2.male?) || (pkmn1.male? && pkmn2.female?) ||
                         (ditto1 && !ditto2) || (ditto2 && !ditto1)
    return 0 if !compatible_gender
    ret = 1
    ret += 1 if pkmn1.species == pkmn2.species
    ret += 1 if pkmn1.owner.id != pkmn2.owner.id
    return ret
  end

  def generate_egg_for_pair(pair_index)
    return nil if pair_count(pair_index) != 2
    pkmn1, pkmn2 = pokemon_pair_at(pair_index)
    return EggGenerator.generate(pkmn1, pkmn2)
  end

  def share_egg_move_for_pair(pair_index)
    return if pair_count(pair_index) != 2
    pkmn1, pkmn2 = pokemon_pair_at(pair_index)
    return if pkmn1.species != pkmn2.species
    egg_moves1 = pkmn1.species_data.get_egg_moves
    egg_moves2 = pkmn2.species_data.get_egg_moves
    known_moves1 = []
    known_moves2 = []
    if pkmn2.numMoves < Pokemon::MAX_MOVES
      pkmn1.moves.each { |m| known_moves1.push(m.id) if egg_moves2.include?(m.id) && !pkmn2.hasMove?(m.id) }
    end
    if pkmn1.numMoves < Pokemon::MAX_MOVES
      pkmn2.moves.each { |m| known_moves2.push(m.id) if egg_moves1.include?(m.id) && !pkmn1.hasMove?(m.id) }
    end
    if !known_moves1.empty?
      if known_moves2.empty?
        pkmn2.learn_move(known_moves1[0])
      else
        learner = [[pkmn1, known_moves2[0]], [pkmn2, known_moves1[0]]].sample
        learner[0].learn_move(learner[1])
      end
    elsif !known_moves2.empty?
      pkmn1.learn_move(known_moves2[0])
    end
  end

  # Reemplaza el original: en vez de un unico progreso, recorre las 6
  # parejas y hace avanzar el progreso de cada una por separado.
  def update_on_step_taken
    ensure_expanded!
    (0...NUM_PAIRS).each do |i|
      @pair_step_counter[i] += 1
      next if @pair_step_counter[i] < 256
      @pair_step_counter[i] = 0
      if !@pair_egg_generated[i] && pair_count(i) == 2
        compat = compatibility_at(i)
        egg_chance = [0, 20, 50, 70][compat]
        egg_chance = [0, 40, 80, 88][compat] if $bag.has?(:OVALCHARM)
        @pair_egg_generated[i] = true if rand(100) < egg_chance
      end
      share_egg_move_for_pair(i) if @share_egg_moves && rand(100) < 50
    end
    @slots.each { |slot| slot.add_exp } if @gain_exp
  end

  #-----------------------------------------------------------------------------
  # Metodos de clase: mismos nombres que el original donde tiene sentido,
  # pero ahora reciben (o requieren) el indice de pareja donde corresponde.
  #-----------------------------------------------------------------------------

  def self.deposit(party_index)
    $stats.day_care_deposits += 1
    day_care = $PokemonGlobal.day_care
    day_care.ensure_expanded!
    pkmn = $player.party[party_index]
    raise _INTL("No Pokémon at index {1} in party.", party_index) if pkmn.nil?
    day_care.slots.each_with_index do |slot, i|
      next if slot.filled?
      slot.deposit(pkmn)
      $player.party.delete_at(party_index)
      day_care.reset_pair_counters(i / PAIR_SIZE)
      return
    end
    raise _INTL("No room to deposit a Pokémon.")
  end

  def self.withdraw(index)
    day_care = $PokemonGlobal.day_care
    day_care.ensure_expanded!
    slot = day_care[index]
    if !slot.filled?
      raise _INTL("No Pokémon found in slot {1}.", index)
    elsif $player.party_full?
      raise _INTL("No room in party for Pokémon.")
    end
    $stats.day_care_levels_gained += slot.level_gain
    $player.party.push(slot.pokemon)
    slot.reset
    day_care.reset_pair_counters(index / PAIR_SIZE)
  end

  def self.collect_egg(pair_index)
    day_care = $PokemonGlobal.day_care
    egg = day_care.generate_egg_for_pair(pair_index)
    raise _INTL("Couldn't generate the egg.") if egg.nil?
    raise _INTL("No room in party for egg.") if $player.party_full?
    $player.party.push(egg)
    day_care.reset_pair_counters(pair_index)
  end

  def self.get_compatibility_for_pair(pair_index)
    $PokemonGlobal.day_care.compatibility_at(pair_index)
  end

  # Igual que self.deposit, pero en vez de usar el primer espacio libre de
  # los 12 (sin importar la pareja), deposita en un espacio libre DENTRO de
  # la pareja elegida. Si esa pareja ya tiene sus 2 espacios ocupados, no
  # deposita nada (el llamador debe elegir otra pareja).
  def self.deposit_into(party_index, pair_index)
    $stats.day_care_deposits += 1
    day_care = $PokemonGlobal.day_care
    pkmn = $player.party[party_index]
    raise _INTL("No Pokémon at index {1} in party.", party_index) if pkmn.nil?
    day_care.pair_slots(pair_index).each do |slot|
      next if slot.filled?
      slot.deposit(pkmn)
      $player.party.delete_at(party_index)
      day_care.reset_pair_counters(pair_index)
      return true
    end
    return false
  end
end

#===============================================================================
# Menu interactivo de la Guarderia, todo en Ruby (mismo patron que
# CharCustom.pbAbrirArmario para el armario).
#===============================================================================
module DayCareUI
  def self.pbMainMenu
    $PokemonGlobal.day_care.ensure_expanded!   # migra partidas viejas (2 espacios) a 12 la primera vez
    loop do
      day_care = $PokemonGlobal.day_care
      commands = [_INTL("Dejar un Pokémon"), _INTL("Retirar un Pokémon"), _INTL("Revisar crías"), _INTL("Nada, gracias")]
      choice = pbMessage(_INTL("¿En qué te puedo ayudar?"), commands, commands.length)
      break if choice < 0 || choice == 3
      case choice
      when 0 then pbDeposit
      when 1 then pbWithdraw
      when 2 then pbCheckBreeding
      end
    end
  end

  # Etiqueta de una pareja para los menus de eleccion (compartida entre
  # "Revisar crias" y "Dejar un Pokemon").
  def self.pbPairLabel(day_care, pair_index)
    letter = ("A".ord + pair_index).chr
    case day_care.pair_count(pair_index)
    when 0
      _INTL("Pareja {1}: vacía", letter)
    when 1
      p1, = day_care.pair_slots(pair_index).select(&:filled?).map(&:pokemon)
      _INTL("Pareja {1}: {2} (esperando compañero)", letter, p1.name)
    else
      p1, p2 = day_care.pokemon_pair_at(pair_index)
      egg_mark = day_care.egg_ready?(pair_index) ? " (¡huevo listo!)" : ""
      _INTL("Pareja {1}: {2} y {3}{4}", letter, p1.name, p2.name, egg_mark)
    end
  end

  def self.pbDeposit
    day_care = $PokemonGlobal.day_care
    loop do
      if day_care.slots.none? { |s| !s.filled? }
        pbMessage(_INTL("La guardería está llena, no hay más lugar."))
        break
      end
      if $player.pokemon_count <= 1
        pbMessage(_INTL("¿Ah? Pero solo tienes un Pokémon contigo."))
        pbMessage(_INTL("No puedes irte sin un Pokémon. Vuelve en otro momento."))
        break
      end
      # Elegir en que pareja/jaula dejarlo primero (solo las que tengan
      # lugar libre son elegibles).
      commands = []
      pair_indices = []
      (0...DayCare::NUM_PAIRS).each do |i|
        next if day_care.pair_count(i) >= 2
        commands.push(pbPairLabel(day_care, i))
        pair_indices.push(i)
      end
      commands.push(_INTL("Cancelar"))
      pair_choice = pbMessage(_INTL("¿En qué pareja quieres dejarlo?"), commands, commands.length)
      break if pair_choice < 0 || pair_choice == pair_indices.length
      pair_index = pair_indices[pair_choice]
      pbMessage(_INTL("¿Cuál Pokémon quieres que criemos por ti?"))
      pbChooseNonEggPokemon(1, 3)
      idx = pbGet(1)
      next if idx < 0
      if !$player.has_other_able_pokemon?(idx)
        pbMessage(_INTL("Si me dejás ese Pokémon, ¿con qué vas a combatir?"))
        next
      end
      if $player.party[idx].cannot_store
        pbMessage(_INTL("Parece que ese Pokémon prefiere quedarse contigo."))
        next
      end
      DayCare.deposit_into(idx, pair_index)
      pbMessage(_INTL("Bueno, vamos a criar a tu {1} por un tiempo.", pbGet(3)))
      break if !pbConfirmMessage(_INTL("¿Quieres dejar otro Pokémon?"))
    end
  end

  def self.pbWithdraw
    day_care = $PokemonGlobal.day_care
    if day_care.count == 0
      pbMessage(_INTL("No tengo ningún Pokémon tuyo por acá."))
      return
    end
    loop do
      break if day_care.count == 0
      if $player.party_full?
        pbMessage(_INTL("Tu equipo Pokémon está lleno. Haz lugar y después ven a verme."))
        break
      end
      DayCare.choose(_INTL("¿A cuál quieres recuperar?"), 1)
      idx = pbGet(1)
      break if idx < 0
      DayCare.get_details(idx, 3, 4)
      if !pbConfirmMessage(_INTL("Si quieres que te devuelva a tu {1}, va a costar ${2}.", pbGet(3), pbGet(4)))
        break
      end
      if $player.money < pbGet(4)
        pbMessage(_INTL("No tienes suficiente dinero..."))
        break
      end
      $player.money -= pbGet(4)
      pbSEPlay("Mart buy item")
      DayCare.withdraw(idx)
      pbMessage(_INTL("Excelente.\nAquí tienes tu Pokémon."))
      pbMessage(_INTL("{1} recuperó a {2} de la Guardería de Laura.", $player.name, pbGet(3)))
      break if !pbConfirmMessage(_INTL("¿Quieres recuperar a otro también?"))
    end
  end

  def self.pbCheckBreeding
    day_care = $PokemonGlobal.day_care
    loop do
      commands = (0...DayCare::NUM_PAIRS).map { |i| pbPairLabel(day_care, i) }
      commands.push(_INTL("Volver"))
      choice = pbMessage(_INTL("¿Qué pareja quieres revisar?"), commands, commands.length)
      break if choice < 0 || choice == DayCare::NUM_PAIRS
      pbCheckPair(day_care, choice)
    end
  end

  def self.pbCheckPair(day_care, pair_index)
    if day_care.pair_count(pair_index) < 2
      pbMessage(_INTL("Esa pareja todavía no tiene dos Pokémon."))
      return
    end
    p1, p2 = day_care.pokemon_pair_at(pair_index)
    compat = day_care.compatibility_at(pair_index)
    compat_text = [
      _INTL("No parecen llevarse nada bien..."),
      _INTL("No se divierten mucho juntos."),
      _INTL("Se llevan bien entre ellos."),
      _INTL("¡Se adoran el uno al otro!"),
    ][compat]
    pbMessage(_INTL("{1} y {2}: {3}", p1.name, p2.name, compat_text))
    return if !day_care.egg_ready?(pair_index)
    if $player.party_full?
      pbMessage(_INTL("¡Parece que hay un huevo esperando! Pero tu equipo está lleno, haz lugar y vuelve."))
      return
    end
    return if !pbConfirmMessage(_INTL("¡Hay un huevo esperando! ¿Lo quieres?"))
    DayCare.collect_egg(pair_index)
    pbMessage(_INTL("¡{1} recibió un Huevo!", $player.name))
  end
end
