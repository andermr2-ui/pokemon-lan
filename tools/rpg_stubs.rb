# Clases "stub" necesarias para poder Marshal.load/dump un Map*.rxdata de
# RPG Maker XP / Essentials sin tener el motor RGSS real instalado.
#
# Table, Tone y Color usan el protocolo de Marshal custom (_dump/_load) en el
# motor original (son extensiones C). Aca los tratamos como una caja negra:
# guardamos los bytes crudos tal cual al cargar, y devolvemos esos mismos
# bytes tal cual al volver a guardar. Asi el roundtrip es perfecto (no
# necesitamos entender el formato interno de la tabla de tiles para no
# corromperla).
#
# Las demas clases RPG::* son objetos "planos": Marshal graba/restaura sus
# variables de instancia automaticamente con solo que la clase exista, sin
# necesitar attr_accessor (los accessors son solo para que NUESTRO script
# pueda leerlas comodamente).

class Table
  def self._load(str)
    obj = allocate
    obj.instance_variable_set(:@__raw, str)
    obj
  end
  def _dump(limit)
    @__raw
  end
end

class Tone
  def self._load(str)
    obj = allocate
    obj.instance_variable_set(:@__raw, str)
    obj
  end
  def _dump(limit)
    @__raw
  end
end

class Color
  def self._load(str)
    obj = allocate
    obj.instance_variable_set(:@__raw, str)
    obj
  end
  def _dump(limit)
    @__raw
  end
end

module RPG
  class Map; attr_accessor :events, :tileset_id, :width, :height, :data; end
  class Event
    attr_accessor :id, :name, :x, :y, :pages
    class Page
      attr_accessor :condition, :graphic, :move_type, :move_speed, :move_frequency,
                    :move_route, :walk_anime, :step_anime, :direction_fix, :through,
                    :always_on_top, :trigger, :list
      class Condition
        attr_accessor :switch1_valid, :switch1_id, :switch2_valid, :switch2_id,
                      :variable_valid, :variable_id, :variable_value,
                      :self_switch_valid, :self_switch_ch
      end
      class Graphic
        attr_accessor :tile_id, :character_name, :character_hue, :direction,
                      :pattern, :opacity, :blend_type
      end
    end
  end
  class EventCommand; attr_accessor :code, :parameters, :indent; end
  class MoveRoute; attr_accessor :list, :repeat, :skippable; end
  class MoveCommand; attr_accessor :code, :parameters; end
  class AudioFile; attr_accessor :name, :volume, :pitch; end
end
