require_relative "rpg_stubs"

DICT_130_KEYS = [
  "\\bMolly: If he actually managed to catch these legendary Pokémon, you need to hurry!",
  "\\bMolly: Hm? Oh, it´s you again. So you were successful. That´s fantastic. An evil maniac like that Giovanni guy had to be stopped.",
  "\\bMolly: Amazing. Fantastic. Excellent. Let me reward you with this.",
  "\\bMolly: If anyone will discover the true secret behind the Mega Evolution, it´ll be you.",
  "\\bMolly: I should visit my granddaughter again. I haven´t seen her in a while.",
]

m = Marshal.load(File.binread("Data/Map130.rxdata"))
m.events.each_value do |ev|
  ev.pages.each_with_index do |pg, pidx|
    list = pg.list
    list.each_with_index do |cmd, i|
      next unless cmd.code == 101
      t = cmd.parameters[0]
      next unless t
      t2 = t.dup.force_encoding("UTF-8")
      j = i + 1
      full = t2.dup
      while list[j] && list[j].code == 401
        c2 = list[j].parameters[0]
        full += c2.dup.force_encoding("UTF-8") if c2 && !c2.empty?
        j += 1
      end
      next unless full.include?("Molly:")
      match_idx = DICT_130_KEYS.index(full)
      puts "pg#{pidx} [#{i}] full=#{full.inspect}"
      puts "  matches DICT index: #{match_idx.inspect}"
    end
  end
end
