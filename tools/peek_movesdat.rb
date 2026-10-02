obj = Marshal.load(File.binread("Data/moves.dat"))
puts "Clase raiz: #{obj.class}"
if obj.is_a?(Hash)
  puts "Entradas: #{obj.size}"
  k, v = obj.first
  puts "Ejemplo clave: #{k.inspect}"
  puts "Ejemplo valor clase: #{v.class}"
  puts "Ejemplo valor ivars: #{v.instance_variables.inspect}" if v.respond_to?(:instance_variables)
end
