#===============================================================================
# Arreglos de UI puntuales, sin tocar Data/Scripts.rxdata directamente.
#
# 1) Superposicion en la pantalla de "Continuar": el nombre del mapa se
#    dibuja alineado a la derecha (terminando en x=386) mientras que la
#    etiqueta "Continuar"/"Continue" se dibuja alineada a la izquierda
#    (empezando en x=32). El layout original asumia nombres de mapa en
#    ingles, mas cortos; varios nombres de lugar traducidos (ej. "Centro
#    Pokémon de Velo Brumoso") son lo bastante largos como para que su
#    borde izquierdo invada el espacio de "Continuar" y se superpongan.
#    Arreglo: si el nombre del mapa no entra en el espacio disponible con
#    la fuente normal, se encoge la fuente SOLO para ese texto (nunca por
#    debajo de un piso razonable) hasta que entra sin pisar nada.
#===============================================================================
#===============================================================================
# 2-5) Descripciones cortadas (movimiento en Resumen, habilidad en Resumen,
#    entrada de Pokedex, movimiento en Recordar Movimiento): todas usan
#    drawTextEx(bitmap, x, y, width, numlines, texto, ...), que dibuja sobre
#    un bitmap del tamaño exacto de la pantalla (Graphics.width x
#    Graphics.height, 512x384 en este proyecto). El numlines original de
#    cada caja ya estaba puesto al maximo que fisicamente cabe entre su "y"
#    y el borde inferior de esa pantalla de 384px (ej. y=224 con numlines=5
#    llega justo a y=384; subir numlines no gana espacio real, porque
#    cualquier linea de mas cae fuera del bitmap y no se ve, o se ve
#    cortada a la mitad -- lo intente una vez asi y no sirvio de nada).
#    El problema real nunca fue el limite de lineas: es que la fuente por
#    defecto es demasiado grande para que las descripciones traducidas
#    (mas largas que el ingles original) entren en esas pocas lineas
#    disponibles. Arreglo de verdad: antes de dibujar, se mide cuantas
#    lineas necesitaria el texto con la fuente actual (via
#    getLineBrokenChunks, la misma funcion interna que usa drawTextEx para
#    partir el texto) y si no entra en el maximo de lineas que realmente
#    caben en pantalla, se encoge la fuente (nunca por debajo de un piso
#    legible) hasta que si entra.
#===============================================================================
module UIFixes
  MIN_DESC_FONT_SIZE = 12

  # bitmap: bitmap sobre el que se dibuja (ya con la fuente que se quiere usar
  #   como tamaño de partida).
  # max_lines: cuantas lineas caben de verdad entre "y" y el borde inferior
  #   de la pantalla para esa caja (Graphics.height - y, entre 32).
  def self.pbFitDescription(bitmap, x, y, width, max_lines, text, base, shadow)
    original_size = bitmap.font.size
    size = original_size
    loop do
      chunks = getLineBrokenChunks(bitmap, text, width, nil, true)
      lines_needed = chunks.empty? ? 0 : (chunks.map { |c| c[2] }.max / 32) + 1
      break if lines_needed <= max_lines || size <= MIN_DESC_FONT_SIZE
      size -= 1
      bitmap.font.size = size
    end
    drawTextEx(bitmap, x, y, width, max_lines, text, base, shadow)
    bitmap.font.size = original_size
  end

  # Para textos de UNA sola linea dibujados via pbDrawTextPositions (nombres
  # de habilidad, de movimiento, etc: nunca hacen salto de linea, solo se
  # dibujan a su ancho natural sin importar si entran o no en la caja).
  #
  # En vez de achicar el tamaño de fuente (letras mas chicas Y mas bajas), se
  # dibuja el texto a su tamaño normal en un bitmap aparte y se pega
  # comprimido horizontalmente (mismo alto, menos ancho) - se ve mas prolijo,
  # como una fuente condensada, en vez de "miniatura".
  MIN_SQUEEZE_RATIO = 0.6

  def self.pbFitSingleLine(bitmap, x, y, max_width, text, base, shadow, align = :left)
    textsize = bitmap.text_size(text)
    natural_width = textsize.width
    if natural_width <= max_width || natural_width <= 0
      pbDrawTextPositions(bitmap, [[text, x, y, align, base, shadow]])
      return
    end
    height = textsize.height
    ratio = [max_width.to_f / natural_width, MIN_SQUEEZE_RATIO].max
    draw_width = (natural_width * ratio).round
    # Margen extra arriba/abajo: pbSetSystemFont aplica un text_offset_y (ver
    # DrawText/MessageConfig) que desplaza donde cae el texto dentro del
    # rect. Sin margen, ese desplazamiento saca el texto del bitmap chico
    # (se veia pegado al borde inferior). Con margen y centrando el dibujo
    # adentro, el resultado final cae exactamente en la misma "y" de
    # siempre sin importar cuanto desplace el offset.
    pad = 16
    # text_size().height mide la caja de línea "normal" (sin bajantes tipo
    # g/j/ñ/y): si el texto tiene alguna, drawTextEx la encoge para que
    # entre en esa altura justa (se vio con "Piedra Angular Extraña", la
    # "g" de "Angular" la hacia dibujarse mas chica y corrida hacia arriba
    # que el resto de los nombres, que no tienen bajantes). Se le da un
    # colchon vertical extra a la caja de dibujo para que nunca tenga que
    # encogerse, sin tocar donde cae el texto (dest_y sigue centrado con
    # el mismo pad).
    draw_height = height + 6
    temp = Bitmap.new(natural_width, draw_height + pad * 2)
    pbSetSystemFont(temp)
    temp.font.size = bitmap.font.size
    pbDrawShadowText(temp, 0, pad, natural_width, draw_height, text, base, shadow)
    dest_x = x
    case align
    when :right, true, 1
      dest_x = x - draw_width
    when :center, 2
      dest_x = x - (draw_width / 2)
    end
    bitmap.stretch_blt(Rect.new(dest_x, y - pad, draw_width, temp.height), temp, temp.rect)
    temp.dispose
  end

  #-----------------------------------------------------------------------------
  # 6) Arreglo GENERALIZADO: en vez de seguir parchando pantalla por pantalla
  #    cada vez que un texto traducido (mas largo que el ingles original) se
  #    pisa con otra cosa en su misma fila (un badge, una cantidad "x99", un
  #    PP, etc.), se detecta y arregla automaticamente para CUALQUIER llamada
  #    a pbDrawTextPositions de todo el juego, sin tocar cada pantalla.
  #
  #    pbDrawTextPositions recibe una lista de [texto, x, y, align, ...] y los
  #    dibuja cada uno a su ancho natural, sin ningun control de superposicion
  #    entre ellos (ver Data/Scripts.rxdata, script "DrawText"). Aca, ANTES de
  #    dibujar, se calcula la caja de cada item (segun su align), se detecta
  #    si dos items de la MISMA fila se solapan, y al que esta mas a la
  #    izquierda se le aplica pbFitSingleLine (comprimir el ancho, no achicar
  #    la fuente) para que entre justo antes de donde empieza el siguiente.
  #
  #    Esto NO puede detectar superposiciones contra IMAGENES (badges/iconos
  #    dibujados aparte via pbDrawImagePositions, que no pasan por esta
  #    funcion) - esos casos puntuales se siguen arreglando a mano cuando se
  #    reportan (ver Window_PokemonBag mas abajo, el badge "REG").
  #-----------------------------------------------------------------------------
  ROW_TOLERANCE = 8   # si dos items difieren menos que esto en "y", se consideran la misma fila

  def self.pbTextBox(bitmap, text, x, y, align)
    w = bitmap.text_size(text).width
    case align
    when :right, true, 1
      [x - w, x, y]
    when :center, 2
      [x - w / 2, x + w / 2, y]
    else
      [x, x + w, y]
    end
  end

  # Devuelve los items de textpos que el drawer original todavia tiene que
  # dibujar (los que NO se solapaban con nada se devuelven sin tocar; los
  # que si se solapaban ya se dibujaron comprimidos aca mismo).
  def self.pbAutoFitOverlaps(bitmap, textpos)
    return textpos if textpos.length < 2
    boxes = textpos.map do |item|
      text = item[0]
      next nil if text.nil? || text == ""
      pbTextBox(bitmap, text, item[1], item[2], item[3])
    end
    remaining = []
    textpos.each_with_index do |item, i|
      box_i = boxes[i]
      if box_i.nil?
        remaining.push(item)
        next
      end
      limit = nil
      textpos.each_with_index do |_other, j|
        next if i == j
        box_j = boxes[j]
        next if box_j.nil?
        next if (box_j[2] - box_i[2]).abs > ROW_TOLERANCE   # no es la misma fila
        next if box_j[0] < box_i[0]                          # el otro esta a la izquierda
        next if box_j[0] >= box_i[1]                         # no se solapan
        limit = box_j[0] if limit.nil? || box_j[0] < limit
      end
      if limit
        align = item[3] || :left
        max_width = [limit - box_i[0] - 4, 8].max
        pbFitSingleLine(bitmap, item[1], item[2], max_width, item[0], item[4], item[5], align)
      else
        remaining.push(item)
      end
    end
    remaining
  end
end

alias __uifixes__pbDrawTextPositions pbDrawTextPositions unless defined?(__uifixes__pbDrawTextPositions)
def pbDrawTextPositions(bitmap, textpos)
  remaining = UIFixes.pbAutoFitOverlaps(bitmap, textpos)
  __uifixes__pbDrawTextPositions(bitmap, remaining)
end

class PokemonSummary_Scene
  alias __uifixes__drawSelectedMove drawSelectedMove unless method_defined?(:__uifixes__drawSelectedMove)
  def drawSelectedMove(move_to_learn, selected_move)
    drawPageFourSelecting(move_to_learn)
    overlay = @sprites["overlay"].bitmap
    base = Color.new(64, 64, 64)
    shadow = Color.new(176, 176, 176)
    @sprites["pokemon"].visible = false if @sprites["pokemon"]
    @sprites["pokeicon"].pokemon = @pokemon
    @sprites["pokeicon"].visible = true
    @sprites["itemicon"].visible = false if @sprites["itemicon"]
    textpos = []
    case selected_move.display_damage(@pokemon)
    when 0 then textpos.push(["---", 216, 160, :right, base, shadow])
    when 1 then textpos.push(["???", 216, 160, :right, base, shadow])
    else        textpos.push([selected_move.display_damage(@pokemon).to_s, 216, 160, :right, base, shadow])
    end
    if selected_move.display_accuracy(@pokemon) == 0
      textpos.push(["---", 216, 192, :right, base, shadow])
    else
      textpos.push(["#{selected_move.display_accuracy(@pokemon)}%", 216 + overlay.text_size("%").width, 192, :right, base, shadow])
    end
    pbDrawTextPositions(overlay, textpos)
    imagepos = [["Graphics/UI/category", 166, 124, 0, selected_move.display_category(@pokemon) * 28, 64, 28]]
    pbDrawImagePositions(overlay, imagepos)
    UIFixes.pbFitDescription(overlay, 4, 224, 230, 5, selected_move.description, base, shadow)
  end

  alias __uifixes__drawPageThree drawPageThree unless method_defined?(:__uifixes__drawPageThree)
  def drawPageThree
    overlay = @sprites["overlay"].bitmap
    base   = Color.new(248, 248, 248)
    shadow = Color.new(104, 104, 104)
    # Determine which stats are boosted and lowered by the Pokémon's nature
    statshadows = {}
    GameData::Stat.each_main { |s| statshadows[s.id] = shadow }
    if !@pokemon.shadowPokemon? || @pokemon.heartStage <= 3
      @pokemon.nature_for_stats.stat_changes.each do |change|
        statshadows[change[0]] = Color.new(136, 96, 72) if change[1] > 0
        statshadows[change[0]] = Color.new(64, 120, 152) if change[1] < 0
      end
    end
    # Write various bits of text
    textpos = [
      [_INTL("HP"), 292, 82, :center, base, statshadows[:HP]],
      [sprintf("%d/%d", @pokemon.hp, @pokemon.totalhp), 462, 82, :right, Color.new(64, 64, 64), Color.new(176, 176, 176)],
      [_INTL("Attack"), 248, 126, :left, base, statshadows[:ATTACK]],
      [@pokemon.attack.to_s, 456, 126, :right, Color.new(64, 64, 64), Color.new(176, 176, 176)],
      [_INTL("Defense"), 248, 158, :left, base, statshadows[:DEFENSE]],
      [@pokemon.defense.to_s, 456, 158, :right, Color.new(64, 64, 64), Color.new(176, 176, 176)],
      [_INTL("Sp. Atk"), 248, 190, :left, base, statshadows[:SPECIAL_ATTACK]],
      [@pokemon.spatk.to_s, 456, 190, :right, Color.new(64, 64, 64), Color.new(176, 176, 176)],
      [_INTL("Sp. Def"), 248, 222, :left, base, statshadows[:SPECIAL_DEFENSE]],
      [@pokemon.spdef.to_s, 456, 222, :right, Color.new(64, 64, 64), Color.new(176, 176, 176)],
      [_INTL("Speed"), 248, 254, :left, base, statshadows[:SPEED]],
      [@pokemon.speed.to_s, 456, 254, :right, Color.new(64, 64, 64), Color.new(176, 176, 176)],
      [_INTL("Ability"), 224, 290, :left, base, shadow]
    ]
    # Draw all text (ability name se dibuja aparte, ver abajo, para poder
    # encogerle la fuente sin afectar al resto)
    pbDrawTextPositions(overlay, textpos)
    # Draw ability name and description
    ability = @pokemon.ability
    if ability
      UIFixes.pbFitSingleLine(overlay, 362, 290, 506 - 362, ability.name, Color.new(64, 64, 64), Color.new(176, 176, 176))
      UIFixes.pbFitDescription(overlay, 224, 322, 282, 2, ability.description, Color.new(64, 64, 64), Color.new(176, 176, 176))
    end
    # Draw HP bar
    if @pokemon.hp > 0
      w = @pokemon.hp * 96 / @pokemon.totalhp.to_f
      w = 1 if w < 1
      w = ((w / 2).round) * 2
      hpzone = 0
      hpzone = 1 if @pokemon.hp <= (@pokemon.totalhp / 2).floor
      hpzone = 2 if @pokemon.hp <= (@pokemon.totalhp / 4).floor
      imagepos = [
        ["Graphics/UI/Summary/overlay_hp", 360, 110, 0, hpzone * 6, w, 6]
      ]
      pbDrawImagePositions(overlay, imagepos)
    end
  end

  # Nombre de movimiento (columna a la derecha del icono de tipo, x=316):
  # se dibuja a su ancho natural sin importar la caja - movimientos con
  # nombre largo se salen del panel. Se saca del array generico de textpos
  # y se dibuja aparte con encogido de fuente, igual que la habilidad.
  MOVE_NAME_RIGHT_EDGE = 506

  alias __uifixes__drawPageFour drawPageFour unless method_defined?(:__uifixes__drawPageFour)
  def drawPageFour
    overlay = @sprites["overlay"].bitmap
    moveBase   = Color.new(64, 64, 64)
    moveShadow = Color.new(176, 176, 176)
    ppBase   = [moveBase, Color.new(248, 192, 0), Color.new(248, 136, 32), Color.new(248, 72, 72)]
    ppShadow = [moveShadow, Color.new(144, 104, 0), Color.new(144, 72, 24), Color.new(136, 48, 48)]
    @sprites["pokemon"].visible  = true
    @sprites["pokeicon"].visible = false
    @sprites["itemicon"].visible = true
    textpos  = []
    imagepos = []
    namepos  = []
    yPos = 104
    Pokemon::MAX_MOVES.times do |i|
      move = @pokemon.moves[i]
      if move
        type_number = GameData::Type.get(move.display_type(@pokemon)).icon_position
        imagepos.push([_INTL("Graphics/UI/types"), 248, yPos - 4, 0, type_number * 28, 64, 28])
        namepos.push([move.name, 316, yPos])
        if move.total_pp > 0
          textpos.push([_INTL("PP"), 342, yPos + 32, :left, moveBase, moveShadow])
          ppfraction = 0
          ppfraction = 3 if move.pp == 0
          ppfraction = 2 if move.pp > 0 && move.pp * 4 <= move.total_pp
          ppfraction = 1 if move.pp > 0 && move.pp * 2 <= move.total_pp && move.pp * 4 > move.total_pp
          textpos.push([sprintf("%d/%d", move.pp, move.total_pp), 460, yPos + 32, :right, ppBase[ppfraction], ppShadow[ppfraction]])
        end
      else
        namepos.push(["-", 316, yPos])
        textpos.push(["--", 442, yPos + 32, :right, moveBase, moveShadow])
      end
      yPos += 64
    end
    pbDrawTextPositions(overlay, textpos)
    pbDrawImagePositions(overlay, imagepos)
    namepos.each { |text, x, y| UIFixes.pbFitSingleLine(overlay, x, y, MOVE_NAME_RIGHT_EDGE - x, text, moveBase, moveShadow) }
  end

  alias __uifixes__drawPageFourSelecting drawPageFourSelecting unless method_defined?(:__uifixes__drawPageFourSelecting)
  def drawPageFourSelecting(move_to_learn)
    overlay = @sprites["overlay"].bitmap
    overlay.clear
    base   = Color.new(248, 248, 248)
    shadow = Color.new(104, 104, 104)
    moveBase   = Color.new(64, 64, 64)
    moveShadow = Color.new(176, 176, 176)
    ppBase   = [moveBase, Color.new(248, 192, 0), Color.new(248, 136, 32), Color.new(248, 72, 72)]
    ppShadow = [moveShadow, Color.new(144, 104, 0), Color.new(144, 72, 24), Color.new(136, 48, 48)]
    if move_to_learn
      @sprites["background"].setBitmap("Graphics/UI/Summary/bg_learnmove")
    else
      @sprites["background"].setBitmap("Graphics/UI/Summary/bg_movedetail")
    end
    textpos = [
      [_INTL("MOVES"), 26, 22, :left, base, shadow],
      [_INTL("CATEGORY"), 20, 128, :left, base, shadow],
      [_INTL("POWER"), 20, 160, :left, base, shadow],
      [_INTL("ACCURACY"), 20, 192, :left, base, shadow]
    ]
    imagepos = []
    namepos  = []
    yPos = 104
    yPos -= 76 if move_to_learn
    limit = (move_to_learn) ? Pokemon::MAX_MOVES + 1 : Pokemon::MAX_MOVES
    limit.times do |i|
      move = @pokemon.moves[i]
      if i == Pokemon::MAX_MOVES
        move = move_to_learn
        yPos += 20
      end
      if move
        type_number = GameData::Type.get(move.display_type(@pokemon)).icon_position
        imagepos.push([_INTL("Graphics/UI/types"), 248, yPos - 4, 0, type_number * 28, 64, 28])
        namepos.push([move.name, 316, yPos])
        if move.total_pp > 0
          textpos.push([_INTL("PP"), 342, yPos + 32, :left, moveBase, moveShadow])
          ppfraction = 0
          ppfraction = 3 if move.pp == 0
          ppfraction = 2 if move.pp > 0 && move.pp * 4 <= move.total_pp
          ppfraction = 1 if move.pp > 0 && move.pp * 2 <= move.total_pp && move.pp * 4 > move.total_pp
          textpos.push([sprintf("%d/%d", move.pp, move.total_pp), 460, yPos + 32, :right, ppBase[ppfraction], ppShadow[ppfraction]])
        end
      else
        namepos.push(["-", 316, yPos])
        textpos.push(["--", 442, yPos + 32, :right, moveBase, moveShadow])
      end
      yPos += 64
    end
    pbDrawTextPositions(overlay, textpos)
    pbDrawImagePositions(overlay, imagepos)
    namepos.each { |text, x, y| UIFixes.pbFitSingleLine(overlay, x, y, MOVE_NAME_RIGHT_EDGE - x, text, moveBase, moveShadow) }
    @pokemon.types.each_with_index do |type, i|
      type_number = GameData::Type.get(type).icon_position
      type_rect = Rect.new(0, type_number * 28, 64, 28)
      type_x = (@pokemon.types.length == 1) ? 130 : 96 + (70 * i)
      overlay.blt(type_x, 78, @typebitmap.bitmap, type_rect)
    end
  end
end

class PokemonPokedexInfo_Scene
  alias __uifixes__drawPageInfo drawPageInfo unless method_defined?(:__uifixes__drawPageInfo)
  def drawPageInfo
    @sprites["background"].setBitmap(_INTL("Graphics/UI/Pokedex/bg_info"))
    overlay = @sprites["overlay"].bitmap
    base   = Color.new(88, 88, 80)
    shadow = Color.new(168, 184, 184)
    imagepos = []
    imagepos.push([_INTL("Graphics/UI/Pokedex/overlay_info"), 0, 0]) if @brief
    species_data = GameData::Species.get_species_form(@species, @form)
    # Write various bits of text
    indexText = "???"
    if @dexlist[@index][:number] > 0
      indexNumber = @dexlist[@index][:number]
      indexNumber -= 1 if @dexlist[@index][:shift]
      indexText = sprintf("%03d", indexNumber)
    end
    textpos = [
      [_INTL("{1}{2} {3}", indexText, " ", species_data.name),
       246, 48, :left, Color.new(248, 248, 248), Color.black]
    ]
    if @show_battled_count
      textpos.push([_INTL("Number Battled"), 314, 164, :left, base, shadow])
      textpos.push([$player.pokedex.battled_count(@species).to_s, 452, 196, :right, base, shadow])
    else
      textpos.push([_INTL("Height"), 314, 164, :left, base, shadow])
      textpos.push([_INTL("Weight"), 314, 196, :left, base, shadow])
    end
    if $player.owned?(@species)
      # Write the category
      textpos.push([_INTL("{1} Pokémon", species_data.category), 246, 80, :left, base, shadow])
      # Write the height and weight
      if !@show_battled_count
        height = species_data.height
        weight = species_data.weight
        if System.user_language[3..4] == "US"   # If the user is in the United States
          inches = (height / 0.254).round
          pounds = (weight / 0.45359).round
          textpos.push([_ISPRINTF("{1:d}'{2:02d}\"", inches / 12, inches % 12), 460, 164, :right, base, shadow])
          textpos.push([_ISPRINTF("{1:4.1f} lbs.", pounds / 10.0), 494, 196, :right, base, shadow])
        else
          textpos.push([_ISPRINTF("{1:.1f} m", height / 10.0), 470, 164, :right, base, shadow])
          textpos.push([_ISPRINTF("{1:.1f} kg", weight / 10.0), 482, 196, :right, base, shadow])
        end
      end
      # Draw the Pokédex entry text
      UIFixes.pbFitDescription(overlay, 40, 246, Graphics.width - 80, 4, species_data.pokedex_entry, base, shadow)
      # Draw the footprint
      footprintfile = GameData::Species.footprint_filename(@species, @form)
      if footprintfile
        footprint = RPG::Cache.load_bitmap("", footprintfile)
        overlay.blt(226, 138, footprint, footprint.rect)
        footprint.dispose
      end
      # Show the owned icon
      imagepos.push(["Graphics/UI/Pokedex/icon_own", 212, 44])
      # Draw the type icon(s)
      species_data.types.each_with_index do |type, i|
        type_number = GameData::Type.get(type).icon_position
        type_rect = Rect.new(0, type_number * 32, 96, 32)
        overlay.blt(296 + (100 * i), 120, @typebitmap.bitmap, type_rect)
      end
    else
      # Write the category
      textpos.push([_INTL("????? Pokémon"), 246, 80, :left, base, shadow])
      # Write the height and weight
      if !@show_battled_count
        if System.user_language[3..4] == "US"   # If the user is in the United States
          textpos.push([_INTL("???'??\""), 460, 164, :right, base, shadow])
          textpos.push([_INTL("????.? lbs."), 494, 196, :right, base, shadow])
        else
          textpos.push([_INTL("????.? m"), 470, 164, :right, base, shadow])
          textpos.push([_INTL("????.? kg"), 482, 196, :right, base, shadow])
        end
      end
    end
    # Draw all text
    pbDrawTextPositions(overlay, textpos)
    # Draw all images
    pbDrawImagePositions(overlay, imagepos)
  end
end

class PokemonStorageScene
  # Nombre de habilidad y de objeto en el panel chico de la PC (centrados en
  # x=86): mismo problema que en todos los demas casos, se dibujan a su
  # ancho natural sin importar el panel. El panel es angosto (los iconos de
  # tipo van de x=18 a ~152 para dos tipos), asi que el margen disponible es
  # chico.
  STORAGE_PANEL_MAX_WIDTH = 150

  alias __uifixes__pbUpdateOverlay pbUpdateOverlay unless method_defined?(:__uifixes__pbUpdateOverlay)
  def pbUpdateOverlay(selection, party = nil)
    overlay = @sprites["overlay"].bitmap
    overlay.clear
    buttonbase = Color.new(248, 248, 248)
    buttonshadow = Color.new(80, 80, 80)
    pbDrawTextPositions(
      overlay,
      [[_INTL("Party: {1}", (@storage.party.length rescue 0)), 270, 334, :center, buttonbase, buttonshadow, :outline],
       [_INTL("Exit"), 446, 334, :center, buttonbase, buttonshadow, :outline]]
    )
    pokemon = nil
    if @screen.pbHeldPokemon
      pokemon = @screen.pbHeldPokemon
    elsif selection >= 0
      pokemon = (party) ? party[selection] : @storage[@storage.currentBox, selection]
    end
    if !pokemon
      @sprites["pokemon"].visible = false
      return
    end
    @sprites["pokemon"].visible = true
    base   = Color.new(88, 88, 80)
    shadow = Color.new(168, 184, 184)
    nonbase   = Color.new(208, 208, 208)
    nonshadow = Color.new(224, 224, 224)
    pokename = pokemon.name
    textstrings = [
      [pokename, 10, 14, :left, base, shadow]
    ]
    singlelines = []
    if !pokemon.egg?
      imagepos = []
      if pokemon.male?
        textstrings.push([_INTL("♂"), 148, 14, :left, Color.new(24, 112, 216), Color.new(136, 168, 208)])
      elsif pokemon.female?
        textstrings.push([_INTL("♀"), 148, 14, :left, Color.new(248, 56, 32), Color.new(224, 152, 144)])
      end
      imagepos.push([_INTL("Graphics/UI/Storage/overlay_lv"), 6, 246])
      textstrings.push([pokemon.level.to_s, 28, 240, :left, base, shadow])
      if pokemon.ability
        singlelines.push([pokemon.ability.name, 86, 312, base, shadow])
      else
        singlelines.push([_INTL("No ability"), 86, 312, nonbase, nonshadow])
      end
      if pokemon.item
        singlelines.push([pokemon.item.name, 86, 348, base, shadow])
      else
        singlelines.push([_INTL("No item"), 86, 348, nonbase, nonshadow])
      end
      imagepos.push(["Graphics/UI/shiny", 156, 198]) if pokemon.shiny?
      typebitmap = AnimatedBitmap.new(_INTL("Graphics/UI/types"))
      pokemon.types.each_with_index do |type, i|
        type_number = GameData::Type.get(type).icon_position
        type_rect = Rect.new(0, type_number * 28, 64, 28)
        type_x = (pokemon.types.length == 1) ? 52 : 18 + (70 * i)
        overlay.blt(type_x, 272, typebitmap.bitmap, type_rect)
      end
      drawMarkings(overlay, 70, 240, 128, 20, pokemon.markings)
      pbDrawImagePositions(overlay, imagepos)
    end
    pbDrawTextPositions(overlay, textstrings)
    singlelines.each do |text, x, y, base_color, shadow_color|
      UIFixes.pbFitSingleLine(overlay, x, y, STORAGE_PANEL_MAX_WIDTH, text, base_color, shadow_color, :center)
    end
    @sprites["pokemon"].setPokemonBitmap(pokemon)
  end
end

class MoveRelearner_Scene
  alias __uifixes__pbDrawMoveList pbDrawMoveList unless method_defined?(:__uifixes__pbDrawMoveList)
  def pbDrawMoveList
    overlay = @sprites["overlay"].bitmap
    overlay.clear
    @pokemon.types.each_with_index do |type, i|
      type_number = GameData::Type.get(type).icon_position
      type_rect = Rect.new(0, type_number * 28, 64, 28)
      type_x = (@pokemon.types.length == 1) ? 400 : 366 + (70 * i)
      overlay.blt(type_x, 70, @typebitmap.bitmap, type_rect)
    end
    textpos = [
      [_INTL("Teach which move?"), 16, 14, :left, Color.new(88, 88, 80), Color.new(168, 184, 184)]
    ]
    imagepos = []
    namepos  = []
    yPos = 88
    VISIBLEMOVES.times do |i|
      moveobject = @moves[@sprites["commands"].top_item + i]
      if moveobject
        moveData = GameData::Move.get(moveobject)
        type_number = GameData::Type.get(moveData.display_type(@pokemon)).icon_position
        imagepos.push([_INTL("Graphics/UI/types"), 12, yPos - 4, 0, type_number * 28, 64, 28])
        namepos.push([moveData.name, 80, yPos])
        textpos.push([_INTL("PP"), 112, yPos + 32, :left, Color.new(64, 64, 64), Color.new(176, 176, 176)])
        if moveData.total_pp > 0
          textpos.push([moveData.total_pp.to_s + "/" + moveData.total_pp.to_s, 230, yPos + 32, :right,
                        Color.new(64, 64, 64), Color.new(176, 176, 176)])
        else
          textpos.push(["--", 230, yPos + 32, :right, Color.new(64, 64, 64), Color.new(176, 176, 176)])
        end
      end
      yPos += 64
    end
    imagepos.push(["Graphics/UI/Move Reminder/cursor",
                   0, 78 + ((@sprites["commands"].index - @sprites["commands"].top_item) * 64),
                   0, 0, 258, 72])
    selMoveData = GameData::Move.get(@moves[@sprites["commands"].index])
    power = selMoveData.display_damage(@pokemon)
    category = selMoveData.display_category(@pokemon)
    accuracy = selMoveData.display_accuracy(@pokemon)
    textpos.push([_INTL("CATEGORY"), 272, 120, :left, Color.new(248, 248, 248), Color.black])
    textpos.push([_INTL("POWER"), 272, 152, :left, Color.new(248, 248, 248), Color.black])
    textpos.push([power <= 1 ? power == 1 ? "???" : "---" : power.to_s, 468, 152, :center,
                  Color.new(64, 64, 64), Color.new(176, 176, 176)])
    textpos.push([_INTL("ACCURACY"), 272, 184, :left, Color.new(248, 248, 248), Color.black])
    textpos.push([accuracy == 0 ? "---" : "#{accuracy}%", 468, 184, :center,
                  Color.new(64, 64, 64), Color.new(176, 176, 176)])
    pbDrawTextPositions(overlay, textpos)
    namepos.each { |text, x, y| UIFixes.pbFitSingleLine(overlay, x, y, 272 - x - 8, text, Color.new(248, 248, 248), Color.black) }
    imagepos.push(["Graphics/UI/category", 436, 116, 0, category * 28, 64, 28])
    if @sprites["commands"].index < @moves.length - 1
      imagepos.push(["Graphics/UI/Move Reminder/buttons", 48, 350, 0, 0, 76, 32])
    end
    if @sprites["commands"].index > 0
      imagepos.push(["Graphics/UI/Move Reminder/buttons", 134, 350, 76, 0, 76, 32])
    end
    pbDrawImagePositions(overlay, imagepos)
    UIFixes.pbFitDescription(overlay, 272, 216, 230, 5, selMoveData.description,
                              Color.new(64, 64, 64), Color.new(176, 176, 176))
  end
end

class PokemonLoadPanel
  MIN_MAPNAME_FONT_SIZE = 14

  alias __uifixes__refresh refresh unless method_defined?(:__uifixes__refresh)
  def refresh
    return if @refreshing
    return if disposed?
    @refreshing = true
    if !self.bitmap || self.bitmap.disposed?
      self.bitmap = Bitmap.new(@bgbitmap.width, 222)
      pbSetSystemFont(self.bitmap)
    end
    if @refreshBitmap
      @refreshBitmap = false
      self.bitmap&.clear
      if @isContinue
        self.bitmap.blt(0, 0, @bgbitmap.bitmap, Rect.new(0, (@selected) ? 222 : 0, @bgbitmap.width, 222))
      else
        self.bitmap.blt(0, 0, @bgbitmap.bitmap, Rect.new(0, 444 + ((@selected) ? 46 : 0), @bgbitmap.width, 46))
      end
      textpos = []
      if @isContinue
        textpos.push([@title, 32, 16, :left, TEXT_COLOR, TEXT_SHADOW_COLOR])
        textpos.push([_INTL("Badges:"), 32, 118, :left, TEXT_COLOR, TEXT_SHADOW_COLOR])
        textpos.push([@trainer.badge_count.to_s, 206, 118, :right, TEXT_COLOR, TEXT_SHADOW_COLOR])
        textpos.push([_INTL("Pokédex:"), 32, 150, :left, TEXT_COLOR, TEXT_SHADOW_COLOR])
        textpos.push([@trainer.pokedex.seen_count.to_s, 206, 150, :right, TEXT_COLOR, TEXT_SHADOW_COLOR])
        textpos.push([_INTL("Time:"), 32, 182, :left, TEXT_COLOR, TEXT_SHADOW_COLOR])
        hour = @totalsec / 60 / 60
        min  = @totalsec / 60 % 60
        if hour > 0
          textpos.push([_INTL("{1}h {2}m", hour, min), 206, 182, :right, TEXT_COLOR, TEXT_SHADOW_COLOR])
        else
          textpos.push([_INTL("{1}m", min), 206, 182, :right, TEXT_COLOR, TEXT_SHADOW_COLOR])
        end
        if @trainer.male?
          textpos.push([@trainer.name, 112, 70, :left, MALE_TEXT_COLOR, MALE_TEXT_SHADOW_COLOR])
        elsif @trainer.female?
          textpos.push([@trainer.name, 112, 70, :left, FEMALE_TEXT_COLOR, FEMALE_TEXT_SHADOW_COLOR])
        else
          textpos.push([@trainer.name, 112, 70, :left, TEXT_COLOR, TEXT_SHADOW_COLOR])
        end
        pbDrawTextPositions(self.bitmap, textpos)
        # Nombre de mapa: se dibuja aparte del resto para poder encogerle
        # la fuente sin afectar a los demas textos del panel.
        mapname = pbGetMapNameFromId(@mapid)
        mapname.gsub!(/\\PN/, @trainer.name)
        title_width = self.bitmap.text_size(@title).width
        available_width = 386 - (32 + title_width + 12) # 12px de margen
        original_size = self.bitmap.font.size
        size = original_size
        while size > MIN_MAPNAME_FONT_SIZE && self.bitmap.text_size(mapname).width > available_width
          size -= 1
          self.bitmap.font.size = size
        end
        pbDrawTextPositions(self.bitmap, [[mapname, 386, 16, :right, TEXT_COLOR, TEXT_SHADOW_COLOR]])
        self.bitmap.font.size = original_size
      else
        textpos.push([@title, 32, 14, :left, TEXT_COLOR, TEXT_SHADOW_COLOR])
        pbDrawTextPositions(self.bitmap, textpos)
      end
    end
    @refreshing = false
  end
end

#===============================================================================
# Badge "REG" (registrar objeto clave a un boton) pisando el nombre del
# objeto en la Mochila: el badge es una IMAGEN (pbDrawImagePositions), asi
# que el arreglo automatico de arriba (solo detecta texto contra texto) no
# lo agarra. Se saca el nombre del item del array generico y se dibuja
# aparte, limitado al espacio libre antes del badge o de la cantidad.
#===============================================================================
class Window_PokemonBag
  alias __uifixes__drawItem drawItem unless method_defined?(:__uifixes__drawItem)
  def drawItem(index, _count, rect)
    textpos = []
    rect = Rect.new(rect.x + 16, rect.y + 16, rect.width - 16, rect.height)
    thispocket = @bag.pockets[@pocket]
    if index == self.itemCount - 1
      textpos.push([_INTL("CLOSE BAG"), rect.x, rect.y + 2, :left, self.baseColor, self.shadowColor])
      pbDrawTextPositions(self.contents, textpos)
      return
    end
    item = (@filterlist) ? thispocket[@filterlist[@pocket][index]][0] : thispocket[index][0]
    baseColor   = self.baseColor
    shadowColor = self.shadowColor
    if @sorting && index == self.index
      baseColor   = Color.new(224, 0, 0)
      shadowColor = Color.new(248, 144, 144)
    end
    item_data = GameData::Item.get(item)
    showing_register_icon = false
    right_limit = rect.x + rect.width   # limite libre para el nombre, por defecto todo el ancho
    if item_data.is_important?
      if @bag.registered?(item)
        pbDrawImagePositions(self.contents, [[_INTL("Graphics/UI/Bag/icon_register"), rect.x + rect.width - 72, rect.y + 8, 0, 0, -1, 24]])
        showing_register_icon = true
        right_limit = rect.x + rect.width - 72
      elsif pbCanRegisterItem?(item)
        pbDrawImagePositions(self.contents, [[_INTL("Graphics/UI/Bag/icon_register"), rect.x + rect.width - 72, rect.y + 8, 0, 24, -1, 24]])
        showing_register_icon = true
        right_limit = rect.x + rect.width - 72
      end
    end
    if item_data.show_quantity? && !showing_register_icon
      qty = (@filterlist) ? thispocket[@filterlist[@pocket][index]][1] : thispocket[index][1]
      qtytext = _ISPRINTF("x{1: 3d}", qty)
      xQty    = rect.x + rect.width - self.contents.text_size(qtytext).width - 16
      textpos.push([qtytext, xQty, rect.y + 2, :left, baseColor, shadowColor])
      right_limit = xQty
    end
    pbDrawTextPositions(self.contents, textpos)
    UIFixes.pbFitSingleLine(self.contents, rect.x, rect.y + 2, right_limit - rect.x - 4, @adapter.getDisplayName(item), baseColor, shadowColor)
  end
end

#===============================================================================
# Fila de iconos de bolsillo: el original solo tenia lugar para 8-9 (esta
# pintada a mano dentro de cada Graphics/UI/Bag/bg_N.png, no se dibuja por
# codigo) y con 10 bolsillos (Cristales Z + Megapiedras) ya no entraban todos
# - por eso Megapiedras mostraba el icono de Cristales Z, el ultimo que
# entraba. Se borro esa fila vieja de los 10 fondos (rellenada con su mismo
# gris, Graphics/UI/Bag/bg_1.png..bg_10.png) y ahora se dibuja por codigo con
# un set de iconos nuevo (Graphics/UI/Bag/icon_pocket_strip.png, provisto por
# el usuario), a 18px de ancho cada uno (10*18=180px, entra en el espacio de
# 186px que ya existia - no hizo falta angostar flechas ni la caja de texto).
#===============================================================================
class PokemonBag_Scene
  # icon_pocket_strip.png (180x28) NO tiene los 10 iconos a ancho parejo -
  # el arte real de cada icono mide 15 o 16px con separadores de 2-3px
  # entre medio (medido pixel a pixel). Si se recorta a rejilla fija de
  # 18px, cada icono queda descentrado en su celda de forma distinta.
  # Se recorta cada icono por su bbox real de contenido (medido una vez)
  # y se reescala parejo al dibujar, en vez de asumir celdas iguales.
  POCKET_STRIP_SRC_H = 28
  POCKET_STRIP_SRC_RECTS = [
    [ 1, 16], [19, 15], [37, 15], [55, 15], [73, 15],
    [91, 15], [109, 15], [127, 15], [145, 16], [163, 15],
  ]

  # Colores de cada bolsillo (tomados del tinte de fondo de cada bg_N.png),
  # para que el selector resalte con el mismo color que la categoria en vez
  # de un blanco generico.
  POCKET_STRIP_COLORS = [
    Color.new(216, 128, 168, 160), # 1 Objetos
    Color.new(232, 128,  80, 160), # 2 Medicinas
    Color.new(224, 160,  56, 160), # 3 Pokeballs
    Color.new(144, 192,  48, 160), # 4 MT/MO
    Color.new( 48, 184,  88, 160), # 5 Bayas
    Color.new( 24, 168, 208, 160), # 6 Correo
    Color.new( 72, 128, 240, 160), # 7 Objetos de batalla
    Color.new(160,  88, 232, 160), # 8 Objetos clave
    Color.new(255, 210,  76, 160), # 9 Cristales Z
    Color.new(255,  76,  76, 160), # 10 Megapiedras
  ]

  alias __uifixes__pbRefresh pbRefresh unless method_defined?(:__uifixes__pbRefresh)
  def pbRefresh
    __uifixes__pbRefresh
    return if !@sprites["pocketicon"]
    @pocket_strip_bitmap ||= AnimatedBitmap.new("Graphics/UI/Bag/icon_pocket_strip")
    bitmap = @sprites["pocketicon"].bitmap
    bitmap.clear
    current = @sprites["itemlist"].pocket
    num_pockets = @bag.pockets.length - 1
    # Separadores (2 en los extremos + 9 entre iconos = 11) todos al ancho
    # minimo, y el resto del ancho disponible repartido en 10 iconos
    # parejos - en vez de una rejilla de celdas iguales que hereda el
    # ancho de icono desparejo del arte original.
    sep = 2
    total_sep = sep * (num_pockets + 1)
    icon_w = (bitmap.width - total_sep) / num_pockets
    leftover = bitmap.width - total_sep - icon_w * num_pockets
    cell_h = bitmap.height
    x = sep + leftover / 2
    (1...@bag.pockets.length).each do |i|
      color = POCKET_STRIP_COLORS[i - 1] || Color.new(255, 255, 255, 140)
      bitmap.fill_rect(x, 0, icon_w, cell_h, color) if i == current
      src_x, src_w = POCKET_STRIP_SRC_RECTS[i - 1]
      bitmap.stretch_blt(
        Rect.new(x, 0, icon_w, cell_h),
        @pocket_strip_bitmap.bitmap,
        Rect.new(src_x, 0, src_w, POCKET_STRIP_SRC_H)
      )
      x += icon_w + sep
    end
  end

  #-----------------------------------------------------------------------------
  # Nombre del bolsillo ("Objetos", "Objetos de Combate", etc, ver
  # pbRefreshIndexChanged en Data/Scripts.rxdata script "UI_Bag") se dibuja
  # centrado en x=94 a su ancho natural, sin caja de contencion - el nombre
  # mas largo ("Objetos de Combate") se sale por los lados. No pasa por el
  # alias generico de pbDrawTextPositions (pbAutoFitOverlaps) porque ese solo
  # actua cuando DOS textos de la misma fila se solapan entre si, y este es
  # el unico texto en su fila. Se re-dibuja aca comprimido al ancho de la
  # columna del icono de mochila (mismo ancho que "pocketicon", 186px).
  #-----------------------------------------------------------------------------
  POCKET_NAME_BOX_WIDTH = 186

  alias __uifixes__pbRefreshIndexChanged pbRefreshIndexChanged unless method_defined?(:__uifixes__pbRefreshIndexChanged)
  def pbRefreshIndexChanged
    __uifixes__pbRefreshIndexChanged
    overlay = @sprites["overlay"].bitmap
    name = PokemonBag.pocket_names[@bag.last_viewed_pocket - 1]
    box_x = 94 - POCKET_NAME_BOX_WIDTH / 2
    overlay.fill_rect(box_x, 186, POCKET_NAME_BOX_WIDTH, 32, Color.new(0, 0, 0, 0))
    UIFixes.pbFitSingleLine(overlay, 94, 186, POCKET_NAME_BOX_WIDTH, name,
                             POCKETNAMEBASECOLOR, POCKETNAMESHADOWCOLOR, :center)
  end
end
