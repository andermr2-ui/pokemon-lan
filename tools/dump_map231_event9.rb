require "./tools/rpg_stubs"
data = Marshal.load(File.binread("Data/Map231.rxdata"))
ev = data.events[9]
ev.pages.each_with_index do |page, pi|
  puts "=== page #{pi} (condition: #{page.condition.inspect}) ==="
  page.list.each_with_index do |c, i|
    params_preview = c.parameters.map { |p| p.is_a?(String) ? p[0,80] : p.class }
    puts "  #{i} code=#{c.code} indent=#{c.indent} params=#{params_preview.inspect}"
  end
end
