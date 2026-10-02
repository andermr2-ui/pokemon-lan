#===============================================================================
# Speed Control - avance lento (L) / avance rapido (R), solo un jugador
#
# Mantener L (L1 del mando) hace que el juego vaya mas lento (slow-forward).
# Mantener R (R1 del mando) lo acelera (fast-forward). Suelto = velocidad
# normal. Deshabilitado por completo si hay una partida LAN activa (VMS), para
# no desincronizar a otros jugadores.
#
# Notas sobre el diseno (para quien retome esto despues - dos intentos
# anteriores DESCARTADOS, dejo el motivo para no repetir el error):
#   1. Cambiar Graphics.frame_rate en caliente: no hace nada en este build.
#      Con "syncToRefreshrate" el ritmo esta atado al vsync del monitor;
#      frame_rate es solo un valor informativo que leen los scripts para
#      calcular duraciones (flashes, fades), no repacea el bucle. Probado
#      tambien con vsync desactivado: tampoco cambio nada.
#   2. Saltear llamadas reales a Graphics.update (tecnica clasica de
#      plugins de la comunidad tipo "Better Fast-Forward Mode"): en este
#      proyecto el movimiento NO es "avanzar X por cada update" (frame-count
#      based) sino delta-time based sobre reloj real: Game_Character#update
#      (Scripts.rxdata, script "Game_Character") hace
#      `@delta_t = System.uptime - @last_update_time` y el movimiento
#      interpola en base a ese @delta_t contra una duracion en SEGUNDOS
#      REALES fija (@move_time). Saltear/duplicar Graphics.update solo
#      cambia cuantas veces por segundo se muestrea el mismo reloj real, no
#      cuanto tiempo real "pasa" - por eso no se sentia ningun cambio.
#
#   La palanca real es el reloj: si System.uptime "miente" (avanza mas o
#   menos rapido que el reloj real), CUALQUIER cosa que calcule su propio
#   delta_t contra el (movimiento, animaciones, timers) se acelera o frena
#   en conjunto, sin tocar Graphics.update ni frame_rate para nada. Por eso
#   se alias-ea System.uptime y se lleva un reloj "virtual" propio que
#   acumula (delta real * multiplicador) en vez del delta real posta.
#
#   - Deteccion de un jugador: VMS.is_connected? (Plugins/Voltseon's
#     Multiplayer Solution), el mismo check que usa todo ese plugin. Con LAN
#     activa, el reloj virtual y el real coinciden siempre (multiplicador 1).
#===============================================================================
module SpeedControl
  FAST_MULTIPLIER = 2.0
  SLOW_MULTIPLIER = 0.25

  @virtual_time = nil
  @real_last    = nil

  def self.allowed?
    return false if defined?(VMS) && VMS.is_connected?
    return true
  end

  def self.multiplier
    return 1.0 if !allowed?
    return FAST_MULTIPLIER if (Input.press?(Input::R) rescue false)   # R gana si se apretan los dos
    return SLOW_MULTIPLIER if (Input.press?(Input::L) rescue false)
    return 1.0
  end

  # Reemplazo de System.uptime: en vez de devolver el reloj real, lleva un
  # reloj virtual propio que arranca igual al real y, en cada llamada, suma
  # (tiempo real transcurrido desde la ultima llamada * multiplicador actual)
  # en lugar del tiempo real transcurrido posta.
  def self.uptime(real_now)
    if @real_last.nil?
      @virtual_time = real_now
      @real_last = real_now
      return @virtual_time
    end
    real_delta = real_now - @real_last
    @real_last = real_now
    @virtual_time += real_delta * multiplier
    return @virtual_time
  rescue StandardError
    real_now
  end
end

class << System
  alias __speedcontrol__uptime uptime unless method_defined?(:__speedcontrol__uptime)
  def uptime
    SpeedControl.uptime(__speedcontrol__uptime)
  end
end
