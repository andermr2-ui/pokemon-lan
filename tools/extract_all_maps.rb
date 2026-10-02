# Extrae el texto traducible de TODOS los Map*.rxdata y genera un archivo de
# revision por mapa en translations/mapNNN.txt.
#
# Un mensaje en pantalla puede ocupar varios comandos: el codigo 101 abre el
# cuadro de dialogo (primera linea, con prefijo de control tipo <ac>\c[0]\l[3])
# y los codigos 401 que le siguen inmediatamente son continuacion de la MISMA
# oracion (mismo cuadro). Hay que agruparlos para traducir la oracion completa,
# no fragmentos sueltos.
#
# Formato de cada bloque:
#   [evento|pagina|indice_inicial|cantidad_de_comandos]
#   ORIGINAL: <texto completo concatenado, codigos de control intactos>
#   TRADUCCION:
#
# cantidad_de_comandos = 1 (solo el 101) + N continuaciones 401.
# El script de reinsercion usara indice_inicial y cantidad para saber en que
# comandos exactos repartir la traduccion.

class Table
  def self._load(str); allocate; end
end
class Tone
  def self._load(str); allocate; end
end
class Color
  def self._load(str); allocate; end
end

module RPG
  class Map; attr_accessor :events; end
  class Event
    attr_accessor :name, :pages
    class Page
      attr_accessor :list
      class Condition; end
      class Graphic; end
    end
  end
  class EventCommand; attr_accessor :code, :parameters, :indent; end
  class MoveRoute; end
  class MoveCommand; end
  class AudioFile; end
end

SHOW_TEXT_START = 101
SHOW_TEXT_CONT  = 401
SHOW_CHOICES    = 102

Dir.mkdir("translations") unless Dir.exist?("translations")

map_files = Dir.glob("Data/Map*.rxdata").select { |f| File.basename(f) =~ /\AMap\d+\.rxdata\z/ }.sort
total_blocks = 0
empty_maps = 0

def clean(text)
  return nil if text.nil?
  t = text.dup.force_encoding("UTF-8")
  t
end

map_files.each do |path|
  map_num = File.basename(path, ".rxdata").sub("Map", "")
  map = File.open(path, "rb") { |f| Marshal.load(f) }

  out_lines = []
  map.events.each do |event_id, event|
    event.pages.each_with_index do |page, page_index|
      list = page.list
      i = 0
      while i < list.size
        cmd = list[i]
        if cmd.code == SHOW_TEXT_START
          start_idx = i
          parts = [clean(cmd.parameters[0])]
          j = i + 1
          while j < list.size && list[j].code == SHOW_TEXT_CONT
            parts << clean(list[j].parameters[0])
            j += 1
          end
          full_text = parts.join("")
          unless full_text.strip.empty?
            out_lines << "[#{event_id}|#{page_index + 1}|#{start_idx}|#{parts.size}]"
            out_lines << "ORIGINAL: #{full_text}"
            out_lines << "TRADUCCION:"
            out_lines << ""
            total_blocks += 1
          end
          i = j
        elsif cmd.code == SHOW_CHOICES
          choices = cmd.parameters[0].map { |c| clean(c) }
          unless choices.all? { |c| c.strip.empty? }
            out_lines << "[#{event_id}|#{page_index + 1}|#{i}|OPCIONES]"
            out_lines << "ORIGINAL: #{choices.join('|')}"
            out_lines << "TRADUCCION:"
            out_lines << ""
            total_blocks += 1
          end
          i += 1
        else
          i += 1
        end
      end
    end
  end

  if out_lines.empty?
    empty_maps += 1
    next
  end

  File.write("translations/map#{map_num}.txt", out_lines.join("\n"))
end

puts "Mapas procesados: #{map_files.size}"
puts "Mapas sin texto: #{empty_maps}"
puts "Bloques de texto totales: #{total_blocks}"
