require "./tools/rpg_stubs"
data = Marshal.load(File.binread("Data/Map176.rxdata"))
ev = data.events[6]
ev.pages.each_with_index do |page, pi|
  puts "=== page #{pi} ==="
  page.list.each_with_index do |c, i|
    next if c.code == 0
    params_preview = c.parameters.map { |p| p.is_a?(String) ? p[0,60] : p.class }
    puts "  #{i} code=#{c.code} params=#{params_preview.inspect}"
  end
end
