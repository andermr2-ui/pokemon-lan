require_relative "rpg_stubs"
maps = [234,79,349,217,117,352,185,54,88,158,326,25,94]
maps.each do |n|
  path = format("Data/Map%03d.rxdata", n)
  next unless File.exist?(path)
  m = Marshal.load(File.binread(path))
  texts = []
  m.events.each_value do |ev|
    ev.pages.each do |pg|
      pg.list.each do |cmd|
        texts << cmd.parameters[0] if cmd.code == 101 && cmd.parameters[0] && !cmd.parameters[0].empty?
      end
    end
  end
  puts "map#{n}: #{texts.size} lineas de texto"
end
