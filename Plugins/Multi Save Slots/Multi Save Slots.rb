#===============================================================================
# Multi Save Slots
#
# Vanilla Essentials (como los juegos reales) solo tiene UN archivo de
# guardado fijo (SaveData::FILE_PATH = ".../Game.rxdata"): empezar una
# partida nueva sobrescribe la unica que existe. Este plugin agrega 3
# espacios de guardado independientes, elegidos con un selector que
# aparece antes del menu de titulo.
#
# Diseno (para quien retome esto):
#   - CADA punto del motor que necesita saber "en que archivo estoy
#     guardando/cargando" lo hace leyendo la CONSTANTE SaveData::FILE_PATH
#     (Game.save la usa como valor por defecto de un parametro -evaluado
#     de nuevo en cada llamada, no fijo al definir el metodo-,
#     SaveData.exists?/delete_file la leen adentro del cuerpo del metodo,
#     PokemonLoadScreen la usa al construirse, y hasta el manejador del
#     cambio de idioma en la pantalla de carga escribe directo a esa
#     constante). Motivo: en vez de tener que interceptar cada uno de
#     esos puntos por separado (fragil: cualquiera que se escape sigue
#     usando el archivo fijo de siempre), se REASIGNA la constante misma
#     al elegir un slot (SaveData.send(:remove_const,...) +
#     SaveData.const_set(...)). Como Ruby evalua las referencias a una
#     constante en el momento en que se ejecutan (no las "hornea" en el
#     codigo compilado), TODO el motor pasa a usar el slot elegido sin
#     tocar ni un solo metodo mas.
#   - Unico alias real: PokemonLoadScreen#initialize, para mostrar el
#     selector de slot ANTES de que se lea o construya nada, y despues
#     dejar que la logica original (Continuar/Partida Nueva/Opciones/
#     Idioma/Salir) siga intacta.
#   - El aviso de "hay otra partida guardada, ¿la sobrescribo?" al
#     guardar (UI_Save) NO se toca: sigue siendo correcto tal cual,
#     ahora comparando contra el archivo del slot activo.
#===============================================================================

module SaveData
  SLOT_COUNT = 3

  def self.slot_path(n)
    dir = File.directory?(System.data_directory) ? System.data_directory : "."
    "#{dir}/Game_slot#{n}.rxdata"
  end

  # Cambia a que archivo apunta SaveData::FILE_PATH. Como es una constante
  # de Ruby real (no una variable), reasignarla hace que TODO el codigo
  # que la lea de aca en mas (Game.save, SaveData.exists?, etc.) use el
  # nuevo valor automaticamente, sin necesidad de tocar esos metodos.
  def self.set_active_slot(n)
    path = slot_path(n)
    SaveData.send(:remove_const, :FILE_PATH) if SaveData.const_defined?(:FILE_PATH)
    SaveData.const_set(:FILE_PATH, path)
  end

  # Info resumida de un slot para mostrar en el selector, o nil si esta vacio
  # o el archivo esta corrupto (se trata como vacio, no se rompe el menu).
  def self.slot_info(n)
    path = slot_path(n)
    return nil if !File.file?(path)
    data = SaveData.read_from_file(path)
    return nil if !SaveData.valid?(data)
    return data
  rescue StandardError
    return nil
  end

  def self.slot_label(n)
    data = slot_info(n)
    return _INTL("Slot {1}: (empty)", n) if !data
    totalsec = data[:stats].play_time.to_i
    hour = totalsec / 60 / 60
    min = totalsec / 60 % 60
    mapname = (data[:map_factory].map.name rescue "?")
    _INTL("Slot {1}: {2} - {3} - {4}h{5}m", n, data[:player].name, mapname, hour, min)
  end

  # Devuelve el numero de slot elegido (1..SLOT_COUNT). No se puede
  # cancelar: no hay a donde volver desde el arranque del juego, asi que
  # si el jugador cancela se le vuelve a preguntar.
  def self.pbChooseSlot
    loop do
      commands = (1..SLOT_COUNT).map { |n| SaveData.slot_label(n) }
      cancel_idx = commands.length
      commands.push(_INTL("Cancel"))
      choice = pbMessage(_INTL("Choose a save slot:"), commands, cancel_idx)
      next if choice.nil? || choice < 0 || choice == cancel_idx
      return choice + 1
    end
  end
end

class PokemonLoadScreen
  alias __multisave__initialize initialize unless method_defined?(:__multisave__initialize)
  def initialize(scene)
    slot = SaveData.pbChooseSlot
    SaveData.set_active_slot(slot)
    __multisave__initialize(scene)
  end
end
