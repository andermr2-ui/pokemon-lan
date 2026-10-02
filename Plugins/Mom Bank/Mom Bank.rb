#===============================================================================
# Banco de Mama - sistema de ahorros
#
# Guarda automaticamente parte de las ganancias de los combates contra
# entrenadores, y de tanto en tanto "Mama" gasta esos ahorros en un objeto
# util que queda esperando a que lo recojas hablando con ella.
#
# Uso:
#   - Evento de "Llamar Script" al hablar con Mama: MomBank.talk_to_mom
#   - Evento de "Llamar Script" en el PC de tu habitacion: MomBank.check_pc_balance
#
# Notas sobre el diseno (para quien retome esto despues):
#   - No existe en este motor (v21.1) un hook de EventHandlers que avise a la
#     vez "esto fue contra un entrenador" y "se ganaron X PokeDolares" - la
#     unica logica real que junta ambos datos vive en Battle#pbGainMoney
#     (Data/Scripts.rxdata, seccion "Battle_StartAndEnd"). Por eso el hook de
#     combate usa alias sobre ese metodo (con guarda method_defined?, no
#     destructivo) en vez de EventHandlers.add.
#   - No existe una API generica de "llamada telefonica con texto libre": el
#     sistema real (Phone::Call.play) exige un Phone::Contact registrado y
#     dirige una escena completa (piensa en un entrenador que te reta a
#     revancha). Sobredimensionado para un aviso de sabor, asi que la "llamada"
#     de Mama es directamente un pbMessage con el aviso.
#   - Los datos persistentes van en $PokemonGlobal (attr_accessor + getter
#     con inicializacion perezosa), el mismo patron que ya usa el plugin
#     Following Pokemon EX para sus propios campos.
#   - Todo el texto usa _INTL() con la clave en ingles (igual que el resto
#     del juego base); la traduccion al espanol vive en el diccionario
#     (Data/messages_es_game.dat, categoria SCRIPT_TEXTS) en vez de estar
#     hardcodeada, para que funcione con el selector de idioma nativo del
#     motor (Settings::LANGUAGES).
#===============================================================================

module MomBank
  # Porcentaje de las ganancias de un combate contra entrenador que Mama
  # guarda automaticamente (0.25 = 25%).
  SAVINGS_CUT = 0.25

  # Umbrales de ahorro (en orden) en los que Mama hace un regalo. Son
  # crecientes a proposito, para que el primer regalo llegue rapido (2500)
  # y los siguientes vayan pidiendo cada vez mas ahorro, acompanando el
  # progreso de la partida (mas entrenadores derrotados = mas dinero =
  # regalos mas espaciados).
  PURCHASE_THRESHOLDS = [
    2500, 7500, 15000, 25000, 40000, 60000, 85000, 115000, 150000, 190000
  ]
  # Una vez agotada la lista de arriba, cada regalo siguiente pide este
  # incremento extra sobre el ultimo umbral (para no quedarse sin regalos
  # nunca, ya avanzada la partida).
  PURCHASE_STEP_AFTER_LIST = 60000

  # Que fraccion del umbral alcanzado gasta Mama en cada regalo (crece con
  # el umbral, asi los regalos tempranos son mas baratos que los tardios).
  PURCHASE_COST_FRACTION = 0.3

  # Objetos de verdad valiosos que Mama puede comprarte (nada de pociones
  # ni Poke Balls basicas).
  PURCHASE_POOL = [
    :RARECANDY, :PPUP, :PPMAX, :FULLRESTORE, :MAXREVIVE, :ABILITYCAPSULE,
    :EXPCANDYXL, :LEFTOVERS, :LUCKYEGG, :DESTINYKNOT, :CHOICESPECS,
    :CHOICEBAND, :CHOICESCARF, :LIFEORB, :FOCUSSASH, :HEAVYDUTYBOOTS,
    :ASSAULTVEST, :ROCKYHELMET, :EVIOLITE, :METALALLOY
  ]

  # Umbral (en orden) que corresponde al numero de regalos ya recibidos.
  def self.threshold_for(purchase_count)
    return PURCHASE_THRESHOLDS[purchase_count] if purchase_count < PURCHASE_THRESHOLDS.length
    extra = purchase_count - PURCHASE_THRESHOLDS.length + 1
    return PURCHASE_THRESHOLDS.last + (extra * PURCHASE_STEP_AFTER_LIST)
  end
end

#===============================================================================
# Datos persistentes en $PokemonGlobal (se guardan solos con la partida,
# mismo patron que usa Following Pokemon EX para sus propios campos).
#===============================================================================
class PokemonGlobalMetadata
  attr_writer :mom_savings, :mom_savings_active, :mom_pending_items, :mom_purchase_count

  def mom_savings
    @mom_savings = 0 if !@mom_savings
    return @mom_savings
  end

  # Cuantos regalos de Mama ya se recibieron (indice en PURCHASE_THRESHOLDS).
  def mom_purchase_count
    @mom_purchase_count = 0 if !@mom_purchase_count
    return @mom_purchase_count
  end

  def mom_savings_active
    @mom_savings_active = false if @mom_savings_active.nil?
    return @mom_savings_active
  end

  def mom_pending_items
    @mom_pending_items = [] if !@mom_pending_items
    return @mom_pending_items
  end
end

#===============================================================================
# Logica de ahorro y compras.
#===============================================================================
module MomBank
  # Revisa si mom_savings acaba de cruzar un nuevo umbral de PURCHASE_THRESHOLD
  # (puede cruzar mas de uno si se ahorro mucho de golpe), y por cada umbral
  # cruzado, gasta PURCHASE_COST en un objeto al azar del pool y avisa.
  def self.check_purchase(old_savings, new_savings)
    return if new_savings <= old_savings
    loop do
      threshold = MomBank.threshold_for($PokemonGlobal.mom_purchase_count)
      break if new_savings < threshold
      cost = (threshold * PURCHASE_COST_FRACTION).round
      break if $PokemonGlobal.mom_savings < cost
      item = PURCHASE_POOL.sample
      $PokemonGlobal.mom_savings -= cost
      $PokemonGlobal.mom_pending_items.push(item)
      $PokemonGlobal.mom_purchase_count += 1
      item_name = GameData::Item.get(item).name
      pbMessage(_INTL("Hi sweetie! I saw an amazing deal and used some of your " \
        "savings (${1}) to buy you {2}. Stop by the house to pick it up!",
        cost.to_s_formatted, item_name))
    end
  rescue StandardError
    nil
  end

  # Punto de entrada para el menu de Mama (evento de "Llamar Script").
  def self.talk_to_mom
    loop do
      commands = []
      commands.push(_INTL("Check savings"))
      commands.push(_INTL("Deposit money"))
      commands.push(_INTL("Withdraw money"))
      recoger_idx = nil
      if !$PokemonGlobal.mom_pending_items.empty?
        recoger_idx = commands.length
        commands.push(_INTL("Collect item"))
      end
      commands.push(_INTL("Heal my team"))
      toggle_idx = commands.length
      commands.push($PokemonGlobal.mom_savings_active ? _INTL("Turn off savings") : _INTL("Turn on savings"))
      salir_idx = commands.length
      commands.push(_INTL("Leave"))

      # pbShowCommands espera cmdIfCancel en base 1 (resta 1 internamente:
      # ver Data/Scripts.rxdata, script "Messages", pbShowCommands linea 738),
      # asi que hay que pasar salir_idx + 1 para que B mapee al indice real
      # de "Leave" y no al anterior ("Turn on/off savings").
      choice = pbMessage(_INTL("What do you want to do, sweetie?"), commands, salir_idx + 1)
      break if choice < 0 || choice == salir_idx

      case choice
      when 0 # Consultar saldo
        pbMessage(_INTL("You have ${1} saved in the bank.", $PokemonGlobal.mom_savings.to_s_formatted))
      when 1 # Ingresar dinero
        MomBank.pbDeposit
      when 2 # Retirar dinero
        MomBank.pbWithdraw
      else
        if recoger_idx && choice == recoger_idx
          MomBank.pbCollectItems
        elsif choice == toggle_idx
          $PokemonGlobal.mom_savings_active = !$PokemonGlobal.mom_savings_active
          if $PokemonGlobal.mom_savings_active
            pbMessage(_INTL("Okay, from now on I'll save {1}% of what you earn from trainer battles.", (SAVINGS_CUT * 100).round))
          else
            pbMessage(_INTL("Okay, I'll stop saving money from your battles."))
          end
        else # Curar a mi equipo
          $player.heal_party
          pbSEPlay("Pkmn healing") rescue nil
          pbMessage(_INTL("Mom heals your whole team while you rest a while at home."))
        end
      end
    end
  end

  def self.pbDeposit
    amount = pbMessageFreeText(_INTL("How much money do you want to deposit? (You have ${1})", $player.money.to_s_formatted), "", false, 7)
    amount = amount.to_i
    if amount <= 0
      pbMessage(_INTL("You didn't deposit anything."))
    elsif amount > $player.money
      pbMessage(_INTL("You don't have that much money."))
    else
      old_savings = $PokemonGlobal.mom_savings
      $player.money -= amount
      $PokemonGlobal.mom_savings += amount
      pbMessage(_INTL("You deposited ${1}. You now have ${2} saved.", amount.to_s_formatted, $PokemonGlobal.mom_savings.to_s_formatted))
      MomBank.check_purchase(old_savings, $PokemonGlobal.mom_savings)
    end
  end

  def self.pbWithdraw
    amount = pbMessageFreeText(_INTL("How much money do you want to withdraw? (You have ${1} saved)", $PokemonGlobal.mom_savings.to_s_formatted), "", false, 7)
    amount = amount.to_i
    if amount <= 0
      pbMessage(_INTL("You didn't withdraw anything."))
    elsif amount > $PokemonGlobal.mom_savings
      pbMessage(_INTL("You don't have that much saved."))
    else
      $PokemonGlobal.mom_savings -= amount
      $player.money += amount
      pbMessage(_INTL("You withdrew ${1}. You now have ${2} on you.", amount.to_s_formatted, $player.money.to_s_formatted))
    end
  end

  def self.pbCollectItems
    items = $PokemonGlobal.mom_pending_items
    if items.empty?
      pbMessage(_INTL("You don't have any items waiting."))
      return
    end
    given = []
    items.each do |item|
      if $bag.add(item, 1)
        given.push(GameData::Item.get(item).name)
      end
    end
    $PokemonGlobal.mom_pending_items = items - items.first(given.length)
    if given.empty?
      pbMessage(_INTL("Your Bag is full, I couldn't give you anything. Come back when you have room!"))
    else
      pbMessage(_INTL("Here you go! {1}.", given.join(", ")))
    end
  end

  # Punto de entrada para el PC de la habitacion del jugador.
  def self.check_pc_balance
    pbMessage(_INTL("Your current savings balance is: ${1}.", $PokemonGlobal.mom_savings.to_s_formatted))
  end
end

#===============================================================================
# Hook de combate: solo se puede saber a la vez "fue contra un entrenador" y
# "se ganaron X PokeDolares" interceptando Battle#pbGainMoney directamente.
#===============================================================================
class Battle
  alias __mombank__pbGainMoney pbGainMoney unless method_defined?(:__mombank__pbGainMoney)

  def pbGainMoney
    was_trainer_battle = (trainerBattle? rescue false)
    money_before = (pbPlayer.money rescue nil)
    __mombank__pbGainMoney
    return if !was_trainer_battle || money_before.nil?
    return if !$PokemonGlobal.mom_savings_active
    gained = pbPlayer.money - money_before
    return if gained <= 0
    cut = (gained * MomBank::SAVINGS_CUT).round
    return if cut <= 0
    old_savings = $PokemonGlobal.mom_savings
    pbPlayer.money -= cut
    $PokemonGlobal.mom_savings += cut
    pbDisplayPaused(_INTL("Your mom saved ${1} from your winnings!", cut.to_s_formatted))
    MomBank.check_purchase(old_savings, $PokemonGlobal.mom_savings)
  rescue StandardError
    nil
  end
end
