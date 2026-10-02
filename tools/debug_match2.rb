require_relative "rpg_stubs"
m = Marshal.load(File.binread("Data/Map024.rxdata"))
m.events.each_value do |ev|
  ev.pages.each do |pg|
    pg.list.each do |cmd|
      next unless cmd.code == 101
      t = cmd.parameters[0]
      next unless t
      if t.include?("Bill: Hello")
        puts "bytes=#{t.bytes.first(10).inspect}"
      end
    end
  end
end
