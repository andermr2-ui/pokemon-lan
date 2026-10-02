require_relative "rpg_stubs"
ARGV.each do |n|
  path = format("Data/Map%03d.rxdata", n.to_i)
  next unless File.exist?(path)
  m = Marshal.load(File.binread(path))
  count = 0
  m.events.each_value do |ev|
    ev.pages.each do |pg|
      pg.list.each do |cmd|
        count += 1 if cmd.code == 101 && cmd.parameters[0] && !cmd.parameters[0].empty?
      end
    end
  end
  puts "map#{n} lineas: #{count}"
end
