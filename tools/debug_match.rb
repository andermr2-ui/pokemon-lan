require_relative "rpg_stubs"
m = Marshal.load(File.binread("Data/Map024.rxdata"))
target = "\rHello, and welcome to the Pokémon Center."
found = nil
m.events.each_value do |ev|
  ev.pages.each do |pg|
    pg.list.each do |cmd|
      next unless cmd.code == 101
      t = cmd.parameters[0]
      next unless t
      t2 = t.dup.force_encoding("UTF-8")
      if t2.include?("welcome to the")
        found = t2
        puts "encoding=#{t.encoding} bytes=#{t.bytes.first(20).inspect}"
        puts "match exact? #{t2 == target}"
        puts "t2 bytesize=#{t2.bytesize} target bytesize=#{target.bytesize}"
      end
    end
  end
end
