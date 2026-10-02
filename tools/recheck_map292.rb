require_relative "rpg_stubs"
m = Marshal.load(File.binread("Data/Map292.rxdata"))
m.events.each do |id, ev|
  ev.pages.each_with_index do |pg, pidx|
    list = pg.list
    list.each_with_index do |cmd, i|
      next unless cmd.code == 101 || cmd.code == 355
      t = cmd.parameters[0]
      next unless t && !t.to_s.empty?
      t = t.dup.force_encoding("UTF-8") rescue t
      puts "ev#{id} pg#{pidx} [#{i}] code=#{cmd.code}: #{t.inspect}"
    end
  end
end
