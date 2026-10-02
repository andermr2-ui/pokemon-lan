#===============================================================================
# Personalizacion de personaje (Armario)
#
# Uso:
#   - Evento del armario (Llamar Script): CharCustom.pbAbrirArmario
#
# Diseno (v2, tras feedback: el pack externo reescalado no convencia visualmente
# y el usuario prefirio usar los charsets 32x48 QUE YA EXISTEN en el juego):
#   - No se genera ningun grafico nuevo. CATALOG es una lista de nombres de
#     archivo REALES en Graphics/Characters (trainer_*, NPC *), ya usados por
#     el motor para NPCs, asi que el formato/tamano/columnas (128x192, 4x4 de
#     32x48) esta garantizado sin ningun proceso de reescalado.
#   - Se excluyen a proposito los personajes unicos de la historia (lideres de
#     gimnasio, alto mando, campeon, rivales, Team Rocket, NPCs con nombre
#     propio) para que nadie pueda "ser" un personaje de la trama.
#   - El jugador guarda solo un string (o nil = usar el charset por defecto del
#     protagonista) en Player#cc_walk_charset, mismo patron que "outfit" en el
#     motor base.
#   - El enganche es minimo: en Game_Player#refresh_charset, si hay un charset
#     elegido Y el jugador esta caminando (no nadando/buceando/en bici/pescando),
#     se usa ese nombre real tal cual en vez de pbGetPlayerCharset(meta.walk_charset).
#     Correr/bici/surf/buceo/pesca siguen usando los charsets genericos de
#     siempre (boy_run, girl_bike, etc.), exactamente igual que ahora mismo con
#     Red/Leaf, asi que esas mecanicas ya funcionan sin tocar nada.
#   - Multijugador: VMS ya sincroniza "character_name" tal cual para el sprite
#     de cada jugador remoto. Como aca usamos un nombre de archivo real (no uno
#     sintetico), cada cliente lo carga con el pipeline normal del motor, sin
#     ningun codigo adicional de composicion.
#===============================================================================

#===============================================================================
# Dato persistente en Player (mismo patron que "outfit" en el motor base).
#===============================================================================
class Player < Trainer
  attr_writer :cc_walk_charset

  def cc_walk_charset
    return @cc_walk_charset
  end

  def cc_enabled?
    return !@cc_walk_charset.nil?
  end
end

#===============================================================================
# Catalogo: nombres reales de archivo en Graphics/Characters (sin ".png"),
# ya en formato 32x48 (128x192, 4x4). Se excluyen personajes unicos de la
# historia (lideres, alto mando, campeon, rivales, Team Rocket, NPCs con
# nombre propio) para no poder "vestirse" como un personaje de la trama.
#===============================================================================
module CharCustom
  # Segundo elemento = clave en ingles (se traduce con _INTL al mostrarla,
  # ver pbAbrirArmario). El diccionario espanol vive en
  # Data/messages_es_game.dat, no hardcodeado aca, para que el selector de
  # idioma del motor (Settings::LANGUAGES) funcione tambien con esto.
  # Se sacaron del catalogo los 28 "NPC XX" (charsets sin TrainerType
  # asociado -- no tienen forma de conseguir un back sprite de batalla,
  # ver GameData::TrainerType.player_back_sprite_filename mas abajo) y los
  # 3 trainer_ sin *_back.png (TUBER2_F, TUBER2_M, YOUNGCOUPLE). El
  # jugador pidio ver solo opciones con back sprite real en combate.
  CATALOG = [
    ["trainer_POKEMONTRAINER_Red", "Trainer (Red)"],
    ["trainer_POKEMONTRAINER_Leaf", "Trainer (Leaf)"],
    ["trainer_POKEMONTRAINER_Brendan", "Trainer (Brendan)"],
    ["trainer_POKEMONTRAINER_May", "Trainer (May)"],
    ["trainer_AROMALADY", "Aroma Lady"],
    ["trainer_BEAUTY", "Beauty"],
    ["trainer_BIRDKEEPER", "Bird Keeper"],
    ["trainer_BLACKBELT", "Black Belt"],
    ["trainer_BUGCATCHER", "Bug Catcher"],
    ["trainer_BURGLAR", "Burglar"],
    ["trainer_CAMPER", "Camper"],
    ["trainer_CHANNELER", "Channeler"],
    ["trainer_COOLTRAINER_F", "Ace Trainer (F)"],
    ["trainer_COOLTRAINER_M", "Ace Trainer (M)"],
    ["trainer_CRUSHGIRL", "Crush Girl"],
    ["trainer_ENGINEER", "Engineer"],
    ["trainer_FISHERMAN", "Fisherman"],
    ["trainer_GAMBLER", "Gambler"],
    ["trainer_GENTLEMAN", "Gentleman"],
    ["trainer_HIKER", "Hiker"],
    ["trainer_JUGGLER", "Juggler"],
    ["trainer_LADY", "Lady"],
    ["trainer_LASS", "Lass"],
    ["trainer_NURSE", "Nurse"],
    ["trainer_PAINTER", "Painter"],
    ["trainer_PICNICKER", "Picnicker"],
    ["trainer_POKEMANIAC", "Poke Maniac"],
    ["trainer_POKEMONBREEDER", "Pokémon Breeder"],
    ["trainer_POKEMONRANGER_F", "Pokémon Ranger (F)"],
    ["trainer_POKEMONRANGER_M", "Pokémon Ranger (M)"],
    ["trainer_PROFESSOR", "Professor"],
    ["trainer_PSYCHIC_F", "Psychic (F)"],
    ["trainer_PSYCHIC_M", "Psychic (M)"],
    ["trainer_ROCKER", "Rocker"],
    ["trainer_RUINMANIAC", "Ruin Maniac"],
    ["trainer_SAILOR", "Sailor"],
    ["trainer_SCIENTIST", "Scientist"],
    ["trainer_SUPERNERD", "Super Nerd"],
    ["trainer_SWIMMER_F", "Swimmer (F)"],
    ["trainer_SWIMMER_M", "Swimmer (M)"],
    ["trainer_TAMER", "Tamer"],
    ["trainer_TEAMROCKET_F", "Team Rocket (F)"],
    ["trainer_TEAMROCKET_M", "Team Rocket (M)"],
    ["trainer_TEENAGERF", "Teenager (F)"],
    ["trainer_TEENAGERM", "Teenager (M)"],
    ["trainer_TUBER_F", "Tuber (F)"],
    ["trainer_TUBER_M", "Tuber (M)"],
    ["trainer_YOUNGSTER", "Youngster"],
  ]

  # Texto con el que un NPC generico se dirige al jugador cuando no sabe su
  # nombre (etiqueta \pr en los mensajes, ver mas abajo). Si hay un outfit
  # del armario puesto, usa la etiqueta de ese outfit (la misma traducida que
  # ya se ve en el menu del armario, CATALOG[i][1]) en vez de "chico"/"chica"
  # generico por genero. Ej: vestido de Enfermera Joy, un NPC te dice
  # "Oye, Enfermera" en vez de "Oye, chico".
  def self.player_role_text
    if $player&.cc_enabled?
      entry = CATALOG.find { |name, _| name == $player.cc_walk_charset }
      return _INTL(entry[1]) if entry
    end
    return ($player&.female?) ? _INTL("girl") : _INTL("boy")
  end
end

#===============================================================================
# Enganches: hay DOS puntos donde el motor fija @character_name, no uno solo.
#
#   - refresh_charset: se llama al cambiar de personaje/outfit (asume que el
#     jugador no se esta moviendo), p.ej. al cerrar el menu del armario.
#   - set_movement_type: se llama constantemente durante el juego (cada vez
#     que el jugador empieza a caminar/correr/saltar/etc.), y es el que MANDA
#     mientras el jugador se mueve. Si solo tocaramos refresh_charset, el
#     charset elegido se veria un instante y luego el motor lo pisaria con el
#     charset por defecto en el primer paso.
#
# En ambos casos dejamos que el motor original haga TODO su trabajo (velocidad
# de movimiento, cacheo de pbGetPlayerCharset, etc.) y despues, si corresponde,
# pisamos @character_name con el charset elegido.
#
# Variantes por estado (correr/bici/surf/buceo/pesca): NO existen sprites de
# estas poses para los ~78 monigotes del catalogo (no existen en ningun lado,
# ni oficial ni de fans, salvo para los 2 protagonistas genericos boy_/girl_).
# En vez de resignarnos a "siempre generico" para siempre, el sistema busca
# un archivo con la convencion "<nombre_base>_<sufijo>.png" (ej.
# "trainer_LASS_run.png") y lo usa SI EXISTE; si no existe, cae en el charset
# generico de siempre (boy_run/girl_run/etc., el mismo comportamiento que sin
# este plugin). Esto permite ir agregando esas variantes con el tiempo (a
# mano, con IA, como sea) sin tener que tocar mas codigo: alcanza con dejar el
# archivo en Graphics/Characters/ con el nombre correcto.
#===============================================================================
class Game_Player
  CHARCUSTOM_WALK_TYPES = [:walking, :jumping, :walking_stopped, :ice_sliding]
  CHARCUSTOM_VARIANT_SUFFIX = {
    running: "run",
    cycling: "bike", cycling_fast: "bike", cycling_jumping: "bike", cycling_stopped: "bike",
    surfing: "surf", surfing_fast: "surf", surfing_jumping: "surf", surfing_stopped: "surf",
    descending_waterfall: "surf", ascending_waterfall: "surf",
    diving: "dive", diving_fast: "dive", diving_jumping: "dive", diving_stopped: "dive",
    fishing: "fish", surf_fishing: "fish",
  }

  # Devuelve "<base>_<sufijo>" (sin ".png") si ese archivo existe en
  # Graphics/Characters/, o nil si todavia no fue creado.
  def self.charcustom_variant(base, suffix)
    return nil if !base || !suffix
    name = "#{base}_#{suffix}"
    return FileTest.exist?("Graphics/Characters/#{name}.png") ? name : nil
  end

  # Buceo: el motor original (PlayerMetadata#dive_charset) ya usa el charset
  # de surf como respaldo si no hay uno de buceo dedicado ("Uses SurfCharset
  # if undefined"), porque debajo del agua casi no se ve diferencia. Repetimos
  # el mismo criterio aca: dive -> surf -> caminar normal.
  def self.charcustom_dive_variant(base)
    charcustom_variant(base, "dive") || charcustom_variant(base, "surf")
  end

  # Tuber/Swimmer: el jugador pidio que, vestido de nadador, la pose de
  # CAMINAR sea la de flotar (mas natural para alguien en traje de bano) y
  # la de CORRER sea la de caminar con piernas de verdad (trainer_*_run.png).
  # Esto NO puede resolverse recoloreando/intercambiando el archivo base
  # (trainer_SWIMMER_F.png etc.), porque ese archivo es el UNICO grafico que
  # usa el motor tanto para la skin del jugador COMO para cualquier NPC del
  # mapa con ese mismo trainer type -- intercambiarlo hacia que los NPC de la
  # playa "nadaran" caminando por tierra (bug real, reportado y revertido).
  # El archivo base se queda con la pose de caminar normal (para que los NPC
  # se vean bien) y solo para la skin del JUGADOR se sustituye por la
  # variante "2" (que ya existe y tiene la pose de flotar) al caminar.
  CHARCUSTOM_SWIM_WALK_OVERRIDE = {
    "trainer_SWIMMER_F" => "trainer_SWIMMER2_F",
    "trainer_SWIMMER_M" => "trainer_SWIMMER2_M",
    "trainer_TUBER_F"   => "trainer_TUBER2_F",
    "trainer_TUBER_M"   => "trainer_TUBER2_M",
  }

  def self.charcustom_walk_charset(base)
    CHARCUSTOM_SWIM_WALK_OVERRIDE[base] || base
  end

  alias __charcustom__refresh_charset refresh_charset unless method_defined?(:__charcustom__refresh_charset)
  def refresh_charset
    __charcustom__refresh_charset
    charset = $player&.cc_walk_charset
    return if !charset
    if $PokemonGlobal&.diving
      variant = Game_Player.charcustom_dive_variant(charset)
    elsif $PokemonGlobal&.surfing
      variant = Game_Player.charcustom_variant(charset, "surf")
    elsif $PokemonGlobal&.bicycle
      variant = Game_Player.charcustom_variant(charset, "bike")
    else
      variant = Game_Player.charcustom_walk_charset(charset)
    end
    @character_name = variant || charset
    @character_hue  = 0
  end

  alias __charcustom__set_movement_type set_movement_type unless method_defined?(:__charcustom__set_movement_type)
  def set_movement_type(type)
    __charcustom__set_movement_type(type)
    charset = $player&.cc_walk_charset
    return if !charset
    if CHARCUSTOM_WALK_TYPES.include?(type)
      @character_name = Game_Player.charcustom_walk_charset(charset)
      @character_hue  = 0
    elsif (suffix = CHARCUSTOM_VARIANT_SUFFIX[type])
      variant = (suffix == "dive") ? Game_Player.charcustom_dive_variant(charset) : Game_Player.charcustom_variant(charset, suffix)
      # Si no existe el archivo variante (ej. "trainer_NURSE_run.png"), en
      # vez de caer en el generico de siempre (boy_run/girl_bike/etc., que
      # rompe la identidad del monigote elegido -- ej. se ve "Rojo" al
      # correr con Nurse puesta) se mantiene el charset de caminar normal.
      # Se pierde la animacion especifica de esa accion, pero el personaje
      # sigue siendo el elegido.
      @character_name = variant || charset
      @character_hue  = 0
    end
  end
end

#===============================================================================
# Override de batalla: back sprite del jugador en combate.
#
# PE v21.1 NO resuelve el back sprite del jugador via back_sprite_filename
# (ese metodo es para trainers NPC). El propio jugador usa un metodo aparte,
# player_back_sprite_filename, llamado unicamente desde
# Scene_Initialize#pbCreateTrainerBackSprite al armar la escena de batalla
# (confirmado: es el unico call site en todo Data/Scripts.rxdata). Interceptar
# back_sprite_filename (como se intento antes) nunca disparaba nada: por eso
# cc_debug.txt jamas se creaba.
#
# Si CC esta activo y el charset elegido es uno de tipo entrenador
# ("trainer_XXXX"), devolvemos su back sprite si el archivo existe. Si no,
# cae al comportamiento original (outfit nativo + back sprite base).
#
# El front sprite (trainer card) tiene su propio override mas abajo
# (player_front_sprite_filename), y la pantalla de "Continuar" el suyo
# (pbGetPlayerCharset) - los 3 casos (charset de overworld, back sprite,
# front sprite/trainer card) ya reflejan el outfit elegido.
#===============================================================================
module GameData
  class TrainerType
    class << self
      alias_method :__charcustom__player_back_sprite_filename, :player_back_sprite_filename unless method_defined?(:__charcustom__player_back_sprite_filename)
      def player_back_sprite_filename(trainer_type)
        if $player&.cc_enabled?
          charset = $player.cc_walk_charset
          if charset&.start_with?("trainer_")
            type_name = charset.sub(/\Atrainer_/, "")
            cc_path   = "Graphics/Trainers/#{type_name}_back.png"
            return "Graphics/Trainers/#{type_name}_back" if FileTest.exist?(cc_path)
          end
        end
        return __charcustom__player_back_sprite_filename(trainer_type)
      end
    end
  end
end

#===============================================================================
# Override: retrato del jugador en la Trainer Card (mismo patron que el back
# sprite de arriba). player_front_sprite_filename es el metodo real que usa
# PokemonTrainerCard_Scene#pbStartScene (UI_TrainerCard) para el retrato de
# 128x128 a la derecha de la tarjeta.
#===============================================================================
module GameData
  class TrainerType
    class << self
      alias_method :__charcustom__player_front_sprite_filename, :player_front_sprite_filename unless method_defined?(:__charcustom__player_front_sprite_filename)
      def player_front_sprite_filename(tr_type)
        if $player&.cc_enabled?
          charset = $player.cc_walk_charset
          if charset&.start_with?("trainer_")
            type_name = charset.sub(/\Atrainer_/, "")
            cc_path   = "Graphics/Trainers/#{type_name}.png"
            return "Graphics/Trainers/#{type_name}" if FileTest.exist?(cc_path)
          end
        end
        return __charcustom__player_front_sprite_filename(tr_type)
      end
    end
  end
end

#===============================================================================
# Override: charset que se ve en la pantalla de "Continuar" (UI_Load,
# PokemonLoad_Scene#pbSetParty), que arma su propio sprite de charset ANTES de
# que exista $game_player, llamando directamente a pbGetPlayerCharset con el
# trainer deserializado del archivo guardado. cc_walk_charset se guarda en el
# propio objeto Player (ver arriba), asi que sobrevive tal cual al guardado y
# esta disponible en ese "trainer" deserializado sin nada extra.
#===============================================================================
alias __charcustom__pbGetPlayerCharset pbGetPlayerCharset unless defined?(__charcustom__pbGetPlayerCharset)
def pbGetPlayerCharset(charset, trainer = nil, force = false)
  t = trainer || $player
  return t.cc_walk_charset if t.respond_to?(:cc_walk_charset) && t.cc_walk_charset
  return __charcustom__pbGetPlayerCharset(charset, trainer, force)
end

#===============================================================================
# Menu del armario (v3): pantalla propia con vista previa del frontsprite de
# batalla, flechas a los costados para izquierda/derecha, y una ventana
# Confirmar/Cancelar aparte - en vez de la lista de texto Anterior/Siguiente/
# Confirmar/Cancelar de la v2. Basado en una captura de referencia que paso
# el usuario.
#
# Controles: Izquierda/Derecha en cualquier momento cambia de outfit (no hace
# falta "enfocar" las flechas primero). Arriba/Abajo mueve el cursor entre
# Confirmar/Cancelar. C confirma la opcion resaltada, B cancela directo.
#
# Bugs heredados de la v2 (se mantienen arreglados):
#   - Cancelar (o B) revierte al outfit que tenia ANTES de entrar al armario,
#     no al ultimo que se probo.
#===============================================================================
module CharCustom
  # x=296 para que la flecha derecha (40px de ancho, pegada al borde
  # derecho de la caja) entre completa en los 512px de pantalla:
  # 296+160(caja)+40(flecha) = 496, con 16px de margen. Con x=336 (v3
  # original) se salia (336+160+40=536 > 512).
  WARDROBE_PREVIEW_RECT = Rect.new(296, 16, 160, 160)
  WARDROBE_ARROW_Y      = 16 + (160 - 28) / 2
  WARDROBE_CMDBOX_RECT  = Rect.new(296, 192, 160, 96)
  WARDROBE_TEXTBOX_RECT = Rect.new(0, 288, 512, 96)
  # Sin _INTL() aca (mismo motivo que CATALOG mas arriba: la tabla de
  # traduccion puede no estar cargada todavia al definirse esta constante) -
  # se traduce recien al usarlas.
  WARDROBE_CMD_LABELS   = ["Confirm", "Cancel"]

  def self.pbAbrirArmario
    pbAbrirArmarioImpl
  rescue Exception => e
    # Que crashee "en silencio" (EventScriptError generico, sin
    # errorlog.txt) hace muy dificil saber que linea revento. Se escribe el
    # detalle completo a mano en un archivo aparte para poder diagnosticar
    # sin tener que adivinar.
    File.open("wardrobe_crash_log.txt", "a") do |f|
      f.puts "=== #{Time.now} ==="
      f.puts "#{e.class}: #{e.message}"
      f.puts e.backtrace.join("\n")
      f.puts ""
    end
    raise
  end

  def self.pbAbrirArmarioImpl
    pbMessage(_INTL("It's your wardrobe. You can change your outfit here."))
    original = $player.cc_walk_charset
    idx = CATALOG.index { |name, _| name == original } || 0

    viewport = Viewport.new(0, 0, Graphics.width, Graphics.height)
    viewport.z = 99999

    # No existe "Window_Base" en este motor (mkxp-z) - la clase real para
    # una ventana con marco/contenido propio es SpriteWindow_Base (ver
    # Data/Scripts.rxdata). Mismo constructor (x,y,width,height), y ya trae
    # windowskin y bitmap de contenido armados solos.
    preview_window = SpriteWindow_Base.new(WARDROBE_PREVIEW_RECT.x, WARDROBE_PREVIEW_RECT.y,
                                            WARDROBE_PREVIEW_RECT.width, WARDROBE_PREVIEW_RECT.height)
    preview_window.viewport = viewport
    # Se fuerza el tamano del contenido igual (resta el margen tipico de
    # windowskin, 32px = 16 por lado) para tener control exacto del area
    # utilizable, en vez de confiar en el auto-calculo del skin cargado.
    preview_window.contents = Bitmap.new(
      [WARDROBE_PREVIEW_RECT.width - 32, 1].max,
      [WARDROBE_PREVIEW_RECT.height - 32, 1].max
    )

    # AnimatedSprite (Data/Scripts.rxdata) no tiene metodo .play - es
    # .start/.stop, y hay que llamar a .update() cada frame (se hace mas
    # abajo, en el loop principal) para que la animacion avance.
    leftarrow  = AnimatedSprite.new("Graphics/UI/left_arrow", 8, 40, 28, 2, viewport)
    leftarrow.x = WARDROBE_PREVIEW_RECT.x - 40
    leftarrow.y = WARDROBE_ARROW_Y
    leftarrow.start

    rightarrow = AnimatedSprite.new("Graphics/UI/right_arrow", 8, 40, 28, 2, viewport)
    rightarrow.x = WARDROBE_PREVIEW_RECT.x + WARDROBE_PREVIEW_RECT.width
    rightarrow.y = WARDROBE_ARROW_Y
    rightarrow.start

    # Window_CommandPokemonEx es la MISMA clase que usa el pbShowCommands
    # nucleo del juego (el que arma Mom Bank via pbMessage con lista de
    # opciones) - con su propio triangulo "> " prolijo y bien alineado. La
    # v3 anterior forzaba un ancho/alto fijo con Window_CommandPokemon +
    # newWithSize, lo que rompia el calculo interno del cursor. Aca se la
    # deja auto-medirse con resizeToFit (como hace el juego posta) y solo
    # se la reposiciona en las coordenadas del armario.
    cmdwindow = Window_CommandPokemonEx.new(WARDROBE_CMD_LABELS.map { |l| _INTL(l) })
    cmdwindow.viewport = viewport
    cmdwindow.resizeToFit(cmdwindow.commands)
    cmdwindow.x = WARDROBE_CMDBOX_RECT.x
    cmdwindow.y = WARDROBE_CMDBOX_RECT.y
    cmdwindow.z = 99999
    cmdwindow.index = 0

    textwindow = SpriteWindow_Base.new(WARDROBE_TEXTBOX_RECT.x, WARDROBE_TEXTBOX_RECT.y,
                                        WARDROBE_TEXTBOX_RECT.width, WARDROBE_TEXTBOX_RECT.height)
    textwindow.viewport = viewport
    textwindow.contents = Bitmap.new(
      [WARDROBE_TEXTBOX_RECT.width - 32, 1].max,
      [WARDROBE_TEXTBOX_RECT.height - 32, 1].max
    )

    refresh_preview = lambda do
      key = CATALOG[idx][0].sub(/\Atrainer_/, "")
      preview_window.contents.clear
      front = pbResolveBitmap("Graphics/Trainers/#{key}")
      if front
        bmp = Bitmap.new(front)
        dest_w = preview_window.contents.width
        dest_h = preview_window.contents.height
        preview_window.contents.stretch_blt(Rect.new(0, 0, dest_w, dest_h), bmp, bmp.rect)
        bmp.dispose
      end
    end

    refresh_text = lambda do
      _name, label = CATALOG[idx]
      textwindow.contents.clear
      pbSetSystemFont(textwindow.contents)
      # Window_Base (la clase base RGSS) no tiene baseColor/shadowColor
      # propios como las ventanas de Essentials - se usan colores fijos.
      # y=8 en vez de 0: sin margen superior el texto quedaba pegado al
      # borde del cuadro, mas arriba de lo habitual en el resto del juego.
      drawTextEx(textwindow.contents, 0, 8, textwindow.contents.width, 2,
                 _INTL("{1}\nUsa Izquierda/Derecha para probar.", _INTL(label)),
                 Color.new(88, 88, 80), Color.new(168, 184, 184))
    end

    apply_preview = lambda do
      $player.cc_walk_charset = CATALOG[idx][0]
      $game_player.refresh_charset
      $game_player.refresh
      refresh_preview.call
      refresh_text.call
    end
    apply_preview.call

    loop do
      Graphics.update
      Input.update
      pbUpdateSceneMap
      leftarrow.update
      rightarrow.update
      cmdwindow.update
      if Input.trigger?(Input::LEFT)
        idx = (idx - 1) % CATALOG.length
        apply_preview.call
      elsif Input.trigger?(Input::RIGHT)
        idx = (idx + 1) % CATALOG.length
        apply_preview.call
      elsif Input.trigger?(Input::C)
        if cmdwindow.index == 0
          $player.cc_walk_charset = CATALOG[idx][0]
          apply_preview.call
          pbPlayDecisionSE
          pbMessage(_INTL("All set! This is how you'll look from now on."))
        else
          $player.cc_walk_charset = original
          apply_preview.call
          pbPlayCancelSE
        end
        break
      elsif Input.trigger?(Input::B)
        $player.cc_walk_charset = original
        apply_preview.call
        pbPlayCancelSE
        break
      end
    end

    preview_window.dispose
    leftarrow.dispose
    rightarrow.dispose
    cmdwindow.dispose
    textwindow.dispose
    viewport.dispose
  end
end
