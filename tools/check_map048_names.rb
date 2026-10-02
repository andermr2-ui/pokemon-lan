require_relative "rpg_stubs"
map = File.open("Data/Map048.rxdata", "rb") { |f| Marshal.load(f) }
map.events.each_value do |event|
  event.pages.each do |page|
    page.list.each do |cmd|
      next unless [101, 102].include?(cmd.code)
      text = cmd.parameters[0]
      text = text.is_a?(Array) ? text.join("|") : text.to_s
      text = text.dup.force_encoding("UTF-8")
      puts "QUEDA: #{text}" if text.include?("Oak") || text.include?("Zeke")
    end
  end
end
puts "listo (sin salida arriba = todo limpio)"
