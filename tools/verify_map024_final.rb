require_relative "rpg_stubs"
m = Marshal.load(File.binread("Data/Map024.rxdata"))
puts "carga OK, eventos=#{m.events.size}"
m.events.each_value do |ev|
  ev.pages.each do |pg|
    pg.list.each do |cmd|
      next unless cmd.code == 101
      t = cmd.parameters[0]
      next unless t
      t = t.dup.force_encoding("UTF-8")
      puts t.inspect if t.include?("Pok") 
    end
  end
end
