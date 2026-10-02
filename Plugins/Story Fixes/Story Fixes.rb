#===============================================================================
# Arreglos puntuales de logica de historia (eventos de mapa).
#
# Fosil de Alta Roca (Map232, evento "Fossil lady"):
#   El profesor de fosiles de Velo Brumoso (Map092) te deja elegir entre
#   Fosil Garra y Fosil Raiz. Mas adelante, en Alta Roca, una señora te
#   regala el fosil que NO elegiste - la idea es terminar con los dos.
#   El evento de Alta Roca tenia el regalo HARDCODEADO a Fosil Raiz sin
#   condicion ninguna: si elegiste Garra, funciona de pura casualidad
#   (te toca el correcto); si elegiste Raiz, te regalan Raiz de nuevo y
#   nunca conseguis el Garra. Bug real, solo invisible para la mitad de
#   los jugadores.
#
#   Arreglo: la eleccion en Velo Brumoso ahora guarda cual fosil se
#   eligio en $game_variables[FOSSIL_CHOICE_VAR] (1=Garra, 2=Raiz), y
#   Alta Roca lee esa variable para regalar el otro. Para partidas
#   guardadas ANTES de este arreglo (donde la variable nunca se seteo,
#   sigue en 0), se revisa que fosil hay en la mochila en ese momento
#   como respaldo -- funciona porque en la practica nadie llega a Alta
#   Roca sin haber pasado antes por Velo Brumoso.
#===============================================================================
module StoryFixes
  FOSSIL_CHOICE_VAR = 90

  def self.pbGiveOppositeFossil
    case $game_variables[FOSSIL_CHOICE_VAR]
    when 1 # eligio Fosil Garra en Velo Brumoso
      pbReceiveItem(:ROOTFOSSIL)
    when 2 # eligio Fosil Raiz en Velo Brumoso
      pbReceiveItem(:CLAWFOSSIL)
    else
      # Partida vieja: no hay variable guardada. Nos fijamos que fosil
      # tiene en la mochila ahora mismo (si tiene Raiz y no Garra, le
      # damos Garra; en cualquier otro caso -incluida la mochila vacia
      # por si ya lo reviviste- le damos Raiz, que era el comportamiento
      # de siempre).
      if $bag.has?(:ROOTFOSSIL) && !$bag.has?(:CLAWFOSSIL)
        pbReceiveItem(:CLAWFOSSIL)
      else
        pbReceiveItem(:ROOTFOSSIL)
      end
    end
  end
end
