data = File.binread("Data/messages_core.dat")
puts "Tamano messages_core.dat: #{data.bytesize} bytes"
obj = Marshal.load(data)
puts "Clase raiz: #{obj.class}"
if obj.is_a?(Hash)
  puts "Cantidad de entradas: #{obj.size}"
  obj.first(10).each { |k,v| puts "#{k.inspect} => #{v.inspect}" }
elsif obj.is_a?(Array)
  puts "Cantidad de entradas: #{obj.size}"
  obj.first(10).each { |e| puts e.inspect }
end
