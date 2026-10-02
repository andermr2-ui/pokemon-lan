require_relative "rpg_stubs"
m = Marshal.load(File.binread("Data/Map292.rxdata"))
m.events.each do |id, ev|
  ev.pages.each_with_index do |pg, pidx|
    pg.list.each_with_index do |cmd, i|
      next if cmd.code == 0
      puts "ev#{id} pg#{pidx} [#{i}] code=#{cmd.code} params=#{cmd.parameters.inspect[0,150]}"
    end
  end
end
