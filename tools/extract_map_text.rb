# Extrae el texto traducible (comandos "Show Text") de un Map*.rxdata de RPG Maker XP / Essentials.
# Uso: ruby extract_map_text.rb Data/Map001.rxdata

class Table
  def self._load(str)
    allocate
  end
end

module RPG
  class Map
    attr_accessor :events
  end
  class Event
    attr_accessor :name, :pages
    class Page
      attr_accessor :list
      class Condition; end
      class Graphic; end
    end
  end
  class EventCommand
    attr_accessor :code, :parameters, :indent
  end
  class MoveRoute; end
  class MoveCommand; end
  class AudioFile; end
end

path = ARGV[0] or abort "Uso: ruby extract_map_text.rb <ruta al .rxdata>"
map = File.open(path, "rb") { |f| Marshal.load(f) }

SHOW_TEXT = 101   # en esta build de Essentials cada linea de dialogo va en su propio comando 101

count = 0
map.events.each do |event_id, event|
  event.pages.each_with_index do |page, page_index|
    lines = []
    page.list.each do |cmd|
      if cmd.code == SHOW_TEXT
        lines << cmd.parameters[0]
      end
    end
    next if lines.empty?
    count += 1
    puts "--- Evento #{event_id} (#{event.name}) / Pagina #{page_index + 1} ---"
    puts lines.join("\n")
    puts
  end
end

puts "===================="
puts "Total de bloques de texto encontrados: #{count}"
