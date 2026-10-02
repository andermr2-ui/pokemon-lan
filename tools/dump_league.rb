require_relative "rpg_stubs"
(245..256).each do |n|
  path = format("Data/Map%03d.rxdata", n)
  next unless File.exist?(path)
  m = Marshal.load(File.binread(path))
  puts "=== map#{n} ==="
  m.events.each_value do |ev|
    ev.pages.each do |pg|
      list = pg.list
      list.each_with_index do |cmd, i|
        if cmd.code == 101
          t = cmd.parameters[0]
          next unless t && !t.empty?
          t = t.dup.force_encoding("UTF-8")
          j = i + 1
          full = t.dup
          while list[j] && list[j].code == 401
            c2 = list[j].parameters[0]
            full += c2.dup.force_encoding("UTF-8") if c2 && !c2.empty?
            j += 1
          end
          puts full.inspect
        elsif cmd.code == 102
          opts = cmd.parameters[0]
          next unless opts.is_a?(Array)
          puts "CHOICE: #{opts.map { |o| o.dup.force_encoding('UTF-8') }.inspect}"
        end
      end
    end
  end
end
