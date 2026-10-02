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

map = File.open("Data/Map001.rxdata", "rb") { |f| Marshal.load(f) }
event = map.events[1]
page = event.pages[0]
page.list.each_with_index do |cmd, idx|
  next unless idx.between?(30, 55)
  params = cmd.parameters.map { |p| p.is_a?(String) ? p.dup.force_encoding("UTF-8") : p }
  puts "#{idx}: code=#{cmd.code} indent=#{cmd.indent} params=#{params.inspect}"
end
