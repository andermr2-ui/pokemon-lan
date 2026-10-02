require "./tools/rpg_stubs"
[231, 238, 232, 230].each do |n|
  path = "Data/Map#{n.to_s.rjust(3,'0')}.rxdata"
  next unless File.exist?(path)
  begin
    data = Marshal.load(File.binread(path))
  rescue => e
    puts "Map#{n}: UNREADABLE (#{e.class}: #{e.message})"
    next
  end
  bad = []
  data.events.each do |eid, ev|
    ev.pages.each_with_index do |page, pi|
      page.list.each_with_index do |c, i|
        c.parameters.each do |p|
          if [101,102,105,108,401,402,408].include?(c.code) && !(p.is_a?(String) || p.is_a?(Array) || p.is_a?(Integer))
            bad << "event=#{eid} name=#{ev.name.inspect} page=#{pi} cmd=#{i} code=#{c.code} bad_type=#{p.class}"
          end
        end
      end
    end
  end
  puts "Map#{n}: #{bad.empty? ? 'clean' : bad.join("; ")}"
end
