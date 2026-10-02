#===============================================================================
# Description Scroll
#
# Cuando el texto de descripcion de un item no cabe en la ventana
# (tienda, mochila, almacen, etc.), hace auto-scroll vertical para
# que se pueda leer todo sin tocar ningun boton.
#
# Como funciona:
#   - refresh() crea el bitmap tan alto como el texto completo
#     (no limitado al alto de la ventana).
#   - update() anima self.oy para desplazar el contenido.
#   - Al cambiar el texto (= nuevo item seleccionado) el scroll
#     vuelve al principio.
#===============================================================================

class Window_UnformattedTextPokemon
  DESCSCROLL_PAUSE_START  = 120  # frames quieto antes de empezar (2s a 60fps)
  DESCSCROLL_SPEED        = 1    # pixels por frame
  DESCSCROLL_PAUSE_BOTTOM = 90   # frames de pausa al llegar abajo (1.5s)

  #-----------------------------------------------------------------------------
  # Al crear la ventana, inicializar estado del scroll.
  #-----------------------------------------------------------------------------
  alias_method :__descscroll__initialize, :initialize
  def initialize(text = "")
    __descscroll__initialize(text)
    _descscroll_reset
  end

  #-----------------------------------------------------------------------------
  # Al cambiar el texto (item distinto), reiniciar scroll al tope.
  #-----------------------------------------------------------------------------
  alias_method :__descscroll__text_set, :text=
  def text=(value)
    _descscroll_reset
    __descscroll__text_set(value)
  end

  #-----------------------------------------------------------------------------
  # refresh: crea el bitmap con el ALTO REAL del texto, no el de la ventana.
  # Si el texto es mas corto que la ventana, el comportamiento es identico
  # al original. Si es mas largo, el bitmap sobresale y oy lo desplaza.
  #-----------------------------------------------------------------------------
  # borderX/borderY (SpriteWindow, ver Data/Scripts.rxdata) devuelven un
  # resguardo fijo de 32px cuando no hay windowskin real (!@trim), aunque
  # visualmente no se dibuje ningun borde. Estas cajas de descripcion usan
  # windowskin = nil a proposito (ver UI_Bag etc), asi que restar ese
  # resguardo de 32 le comia espacio real que no existe: una descripcion de
  # 3 lineas (96px) en una caja de 128px (4 lineas) ya "no entraba" segun
  # esa cuenta (128-32=96, y con el +4 de mas abajo ni siquiera esa).
  def _descscroll_border_y
    return (self.windowskin) ? self.borderY : 0
  end

  def _descscroll_border_x
    return (self.windowskin) ? self.borderX : 0
  end

  def refresh
    inner_w = [self.width - _descscroll_border_x - SpriteWindow_Base::TEXT_PADDING, 1].max
    # Medir cuanto alto necesita el texto completo
    dims = [0, 0]
    measure_bmp = Bitmap.new(inner_w, 1)
    pbSetSystemFont(measure_bmp)
    getLineBrokenChunks(measure_bmp, @text.to_s.gsub(/\r/, ""), inner_w, dims, true)
    measure_bmp.dispose
    text_h = dims[1] + 4  # +4 por el offset y=-2 que usa drawTextEx

    win_h = [self.height - _descscroll_border_y, 1].max
    content_h = [win_h, text_h].max

    self.contents = pbDoEnsureBitmap(self.contents,
                                     [self.width - _descscroll_border_x, 1].max,
                                     content_h)
    self.contents.clear
    drawTextEx(self.contents, 0, -2, self.contents.width, 0,
               @text.to_s.gsub(/\r/, ""), @baseColor, @shadowColor)
  end

  #-----------------------------------------------------------------------------
  # update: avanza el scroll si el contenido excede el alto visible.
  #-----------------------------------------------------------------------------
  def update
    super
    return unless self.contents
    win_h   = [self.height - _descscroll_border_y, 1].max
    total_h = self.contents.height
    return if total_h <= win_h   # cabe todo: nada que scrollear

    max_oy = total_h - win_h

    if self.oy >= max_oy
      # Llegamos al final: pausar y volver al principio
      @_ds_bottom = (@_ds_bottom || 0) + 1
      if @_ds_bottom >= DESCSCROLL_PAUSE_BOTTOM
        self.oy     = 0
        @_ds_timer  = 0
        @_ds_bottom = 0
        @_ds_active = false
      end
      return
    end

    unless @_ds_active
      @_ds_timer = (@_ds_timer || 0) + 1
      @_ds_active = true if @_ds_timer >= DESCSCROLL_PAUSE_START
      return
    end

    self.oy = [self.oy + DESCSCROLL_SPEED, max_oy].min
  end

  private

  def _descscroll_reset
    @_ds_timer  = 0
    @_ds_bottom = 0
    @_ds_active = false
    self.oy = 0 rescue nil
  end
end
