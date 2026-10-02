require_relative "rpg_stubs"
Dir.glob("Data/Map*.rxdata").sort.each do |path|
  n = File.basename(path)[/\d+/].to_i
  begin
    m = Marshal.load(File.binread(path))
  rescue StandardError => e
    next
  end
  m.events.each_value do |ev|
    ev.pages.each do |pg|
      pg.list.each do |cmd|
        next unless cmd.code == 101
        t = cmd.parameters[0]
        next unless t && !t.empty?
        t = t.dup.force_encoding("UTF-8")
        puts "map#{n}: #{t.inspect}" if t =~ /Delta Island|Islas Delta/i
      end
    end
  end
end
