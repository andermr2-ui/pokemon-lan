require_relative "rpg_stubs"
m = Marshal.load(File.binread("Data/Map003.rxdata"))
target = "\\bHello young Trainer. Route 2 lies ahead. Take this for your journey."
m.events.each_value do |ev|
  ev.pages.each do |pg|
    pg.list.each_with_index do |cmd, i|
      next unless cmd.code == 101
      t = cmd.parameters[0]
      next unless t
      t2 = t.dup.force_encoding("UTF-8")
      next unless t2.include?("Hello young")
      puts "match?: #{t2 == target}"
      puts "actual bytes: #{t2.bytes.inspect}"
      puts "target bytes: #{target.bytes.inspect}"
    end
  end
end
