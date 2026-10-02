require_relative "rpg_stubs"
m = Marshal.load(File.binread("Data/Map024.rxdata"))
puts "carga OK, eventos=#{m.events.size}"
m.events.each_value do |ev|
  ev.pages.each do |pg|
    pg.list.each do |cmd|
      if cmd.code == 101
        t = cmd.parameters[0]
        next unless t && !t.empty?
        puts "101: #{t.dup.force_encoding('UTF-8').inspect}"
      elsif cmd.code == 102
        puts "102: #{cmd.parameters[0].inspect}"
      end
    end
  end
end
