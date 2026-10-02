require_relative "rpg_stubs"
m = Marshal.load(File.binread("Data/Map043.rxdata"))
m.events.each do |id, ev|
  ev.pages.each_with_index do |pg, pidx|
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
        puts "ev#{id} pg#{pidx} [#{i}]: #{full.inspect}"
      elsif cmd.code == 102
        puts "ev#{id} pg#{pidx} [#{i}] CHOICES: #{cmd.parameters[0].inspect}"
      end
    end
  end
end
