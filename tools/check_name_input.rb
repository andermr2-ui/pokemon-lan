class Table
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

map = File.open("Data/Map001.rxdata", "rb") { |f| Marshal.load(f) }
map.events.each do |id, event|
  event.pages.each do |page|
    page.list.each do |cmd|
      # 375 = Name Input Processing en RPG Maker XP
      if cmd.code == 375
        puts "Evento #{id} (#{event.name}): Name Input -> parametros=#{cmd.parameters.inspect}"
      end
    end
  end
end
