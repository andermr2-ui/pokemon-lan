# encoding: UTF-8
require_relative "rpg_stubs"

path = "Data/Map314.rxdata"
m = Marshal.load(File.binread(path))
count = 0
m.events.each_value do |ev|
  ev.pages.each do |pg|
    pg.list.each do |cmd|
      next unless cmd.code == 101
      t = cmd.parameters[0]
      next unless t && !t.empty?
      t = t.dup.force_encoding("UTF-8")
      next unless t.include?("Anillo Poder Z")
      t = t.gsub("Anillo Poder Z", "Anillo Z")
      cmd.parameters[0] = t
      count += 1
    end
  end
end
File.open(path, "wb") { |f| Marshal.dump(m, f) }
puts "#{path}: #{count} correcciones"
