# encoding: UTF-8
require_relative "rpg_stubs"

# 1) Nombre de mapa (categorías 19 y 21 de messages_*.dat)
["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  [19, 21].each do |cat|
    h = data[cat]
    next unless h
    if h.key?("Delta Islands Harbor")
      h["Delta Islands Harbor"] = "Puerto de Islas Deliciosas"
    end
  end
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: nombre de mapa actualizado"
end

# 2) Diálogo ya traducido que menciona "Islas Delta"
REPLACEMENTS = {
  "Islas Delta" => "Islas Deliciosas",
}

def fix(path, replacements)
  map = File.open(path, "rb") { |f| Marshal.load(f) }
  count = 0
  map.events.each_value do |event|
    event.pages.each do |page|
      page.list.each do |cmd|
        next unless cmd.code == 101
        t = cmd.parameters[0]
        next unless t && !t.empty?
        t = t.dup.force_encoding("UTF-8")
        changed = false
        replacements.each do |old, new|
          if t.include?(old)
            t = t.gsub(old, new)
            changed = true
          end
        end
        if changed
          cmd.parameters[0] = t
          count += 1
        end
      end
    end
  end
  File.open(path, "wb") { |f| Marshal.dump(map, f) }
  puts "#{path}: #{count} correcciones"
end

fix("Data/Map196.rxdata", REPLACEMENTS)
fix("Data/Map258.rxdata", REPLACEMENTS)
fix("Data/Map315.rxdata", REPLACEMENTS)
fix("Data/Map324.rxdata", REPLACEMENTS)
