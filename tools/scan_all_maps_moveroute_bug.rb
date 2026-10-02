require "./tools/rpg_stubs"
Dir.glob("Data/Map*.rxdata").sort.each do |path|
  begin
    data = Marshal.load(File.binread(path))
  rescue => e
    puts "#{path}: UNREADABLE (#{e.class})"
    next
  end
  next unless data.respond_to?(:events) && data.events
  bad = []
  data.events.each do |eid, ev|
    next unless ev
    ev.pages.each_with_index do |page, pi|
      page.list.each_with_index do |c, i|
        c.parameters.each do |p|
          next unless p.is_a?(RPG::MoveRoute)
          next if [209, 205, 509].include?(c.code) # legit "set move route" codes
          bad << "event=#{eid} name=#{ev.name.inspect} page=#{pi} cmd=#{i} code=#{c.code}"
        end
      end
    end
  end
  puts "#{path}: #{bad.join('; ')}" unless bad.empty?
end
puts "done"
