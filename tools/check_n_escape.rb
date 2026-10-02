require_relative "rpg_stubs"
m = Marshal.load(File.binread("Data/Map054.rxdata"))
m.events.each_value do |ev|
  ev.pages.each do |pg|
    pg.list.each do |cmd|
      next unless cmd.code == 101
      t = cmd.parameters[0]
      next unless t && t.include?("questionnaire")
      puts t.bytes.first(30).inspect
      break
    end
  end
end
