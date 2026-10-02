require_relative "rpg_stubs"
[33, 183, 293].each do |n|
  path = format("Data/Map%03d.rxdata", n)
  map = Marshal.load(File.binread(path))
  map.events.each_value do |ev|
    ev.pages.each do |pg|
      pg.list.each do |cmd|
        next unless cmd.code == 101
        text = cmd.parameters[0]
        next unless text && text.include?("Alcremie")
        puts "map#{n}: #{text.inspect}"
      end
    end
  end
end
