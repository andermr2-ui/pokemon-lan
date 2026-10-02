class Table
  def self._load(str)
    allocate
  end
end

module RPG
  class System
    attr_accessor :start_map_id, :start_x, :start_y, :game_title
    class Words; end
    class TestBattler; end
  end
  class AudioFile; end
end

sys = File.open("Data/System.rxdata", "rb") { |f| Marshal.load(f) }
puts "start_map_id: #{sys.start_map_id}"
puts "start_x: #{sys.start_x}"
puts "start_y: #{sys.start_y}"
puts "game_title: #{sys.game_title}"
