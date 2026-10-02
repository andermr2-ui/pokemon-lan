require_relative "rpg_stubs"
m = Marshal.load(File.binread("Data/Map031.rxdata"))
m.events.each_value do |ev|
  ev.pages.each do |pg|
    pg.list.each do |cmd|
      if cmd.code == 101
        t = cmd.parameters[0]
        next unless t
        t = t.dup.force_encoding("UTF-8")
        puts "101: #{t.inspect}"
      elsif cmd.code == 102
        puts "102 choices: #{cmd.parameters[0].inspect}"
      end
    end
  end
end
