# encoding: UTF-8
require_relative "rpg_stubs"

path = "Data/Map324.rxdata"
m = Marshal.load(File.binread(path))
count = 0
m.events.each_value do |ev|
  ev.pages.each do |pg|
    pg.list.each do |cmd|
      next unless cmd.code == 101
      t = cmd.parameters[0]
      next unless t && !t.empty?
      t = t.dup.force_encoding("UTF-8")
      next unless t.include?("Deity Ball")
      t = t.gsub("Deity Balls", "Bolas Deidad").gsub("Deity Ball", "Bola Deidad")
      cmd.parameters[0] = t
      count += 1
    end
  end
end
File.open(path, "wb") { |f| Marshal.dump(m, f) }
puts "#{path}: #{count} correcciones"
