raw = Marshal.load(File.binread("Data/PluginScripts.rxdata"))
puts "Tipo raiz: #{raw.class}, tamano: #{raw.size}"
raw.each_with_index do |entry, i|
  next if i > 10
  puts "#{i}: #{entry.class} -> #{entry.is_a?(Array) ? entry.first(2).inspect : entry.inspect[0,200]}"
end
