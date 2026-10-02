require_relative "rpg_stubs"
maps = %w[079 088 094 117 158 185 217 234 326 352 349 025 054]
symbols = {}
maps.each do |n|
  path = "Data/Map#{n}.rxdata"
  next unless File.exist?(path)
  m = Marshal.load(File.binread(path))
  m.events.each_value do |ev|
    ev.pages.each do |pg|
      list = pg.list
      list.each_with_index do |cmd, i|
        next unless cmd.code == 355
        t = cmd.parameters[0]
        next unless t && t.include?("pbPokemonMart")
        full = t.dup
        j = i + 1
        while list[j] && list[j].code == 655
          full += "\n" + list[j].parameters[0].to_s
          j += 1
        end
        full.scan(/:([A-Z0-9]+)/).each { |m2| symbols[m2[0]] ||= [] ; symbols[m2[0]] << n }
      end
    end
  end
end
symbols.keys.sort.each { |s| puts "#{s}\t(#{symbols[s].uniq.join(',')})" }
puts "TOTAL SIMBOLOS UNICOS: #{symbols.size}"
