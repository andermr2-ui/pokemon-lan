require_relative "rpg_stubs"
ARGV.each do |n|
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
        puts "=== map#{n} ==="
        puts full
        puts "---"
      end
    end
  end
end
