require_relative "rpg_stubs"
["031","036"].each do |n|
  m = Marshal.load(File.binread("Data/Map#{n}.rxdata"))
  m.events.each_value do |ev|
    ev.pages.each do |pg|
      pg.list.each do |cmd|
        next unless cmd.code == 101
        t = cmd.parameters[0]
        next unless t
        puts "map#{n}: #{t.inspect}" if t.include?("Centro Pokémon") || t.include?("descansaran")
      end
    end
  end
end
