# encoding: UTF-8
require_relative "rpg_stubs"

REPLACEMENTS = {
  "Puerto Cristal" => "Puerto del Cristal",
  "Velo de Niebla" => "Velo Brumoso",
  "Arboleda del Prado" => "Prado Arboleda",
  "Patisserie Alcremie" => "Pastelería Crema",
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

fix("Data/Map171.rxdata", REPLACEMENTS)
fix("Data/Map183.rxdata", REPLACEMENTS)
fix("Data/Map199.rxdata", REPLACEMENTS)
