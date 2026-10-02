require_relative "rpg_stubs"
[183, 293].each do |n|
  path = format("Data/Map%03d.rxdata", n)
  map = Marshal.load(File.binread(path))
  map.events.each_value do |ev|
    ev.pages.each do |pg|
      pg.list.each do |cmd|
        next unless [101,401,102].include?(cmd.code)
        text = cmd.parameters[0]
        next unless text.is_a?(String) && text.include?("Alcremie")
        puts "map#{n} code=#{cmd.code}: #{text.inspect}"
      end
    end
  end
end
