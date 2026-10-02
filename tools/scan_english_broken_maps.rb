require "./tools/rpg_stubs"
broken = [82,171,180,195,196,197,209,220,230,232,243,244,256,314,316,358,359]
hint = /\b(the|you|your|and|is|was|were|have|has|with|this|that|what|where|when|how)\b/i
accent = /[áéíóúñÁÉÍÓÚÑ¿¡]/
count = 0
broken.each do |n|
  path = "Data/Map#{n.to_s.rjust(3, '0')}.rxdata"
  next unless File.exist?(path)
  begin
    data = Marshal.load(File.binread(path))
  rescue
    next
  end
  data.events.each do |eid, ev|
    ev.pages.each do |page|
      page.list.each do |c|
        next unless [101, 401, 405].include?(c.code)
        p = c.parameters
        next unless p && p[0].is_a?(String) && p[0].length > 15
        t = p[0]
        if t =~ hint && t !~ accent
          puts "Map#{n} event=#{eid} #{ev.name}: #{t[0, 100]}"
          count += 1
        end
      end
    end
  end
end
puts "total: #{count}"
