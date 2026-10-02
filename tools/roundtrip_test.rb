# Prueba de seguridad SEMANTICA: carga un .rxdata, lo vuelve a guardar SIN
# CAMBIOS, lo vuelve a cargar, y compara los dos OBJETOS recursivamente
# (no los bytes crudos: Marshal no garantiza bytes identicos entre dos
# serializaciones distintas del mismo grafo de objetos, solo garantiza que el
# VALOR final sea equivalente).

require_relative "rpg_stubs"

path = ARGV[0] or abort "Uso: ruby roundtrip_test.rb <ruta al .rxdata>"

def deep_equal(a, b, path = "root")
  if a.class != b.class
    puts "DIFF en #{path}: clases distintas #{a.class} vs #{b.class}"
    return false
  end

  case a
  when String, Integer, Float, Symbol, TrueClass, FalseClass, NilClass
    if a != b
      puts "DIFF en #{path}: #{a.inspect} vs #{b.inspect}"
      return false
    end
    true
  when Array
    if a.size != b.size
      puts "DIFF en #{path}: tamanos de array distintos #{a.size} vs #{b.size}"
      return false
    end
    ok = true
    a.each_index { |i| ok = false unless deep_equal(a[i], b[i], "#{path}[#{i}]") }
    ok
  when Hash
    if a.keys.sort_by(&:to_s) != b.keys.sort_by(&:to_s)
      puts "DIFF en #{path}: claves distintas"
      return false
    end
    ok = true
    a.each_key { |k| ok = false unless deep_equal(a[k], b[k], "#{path}[#{k.inspect}]") }
    ok
  else
    # Objeto generico: comparar por instance_variables (cubre Table/Tone/Color
    # via @__raw, y cualquier RPG::* generico via sus ivars reales)
    ivars_a = a.instance_variables.sort
    ivars_b = b.instance_variables.sort
    if ivars_a != ivars_b
      puts "DIFF en #{path}: ivars distintos #{ivars_a} vs #{ivars_b}"
      return false
    end
    ok = true
    ivars_a.each do |iv|
      va = a.instance_variable_get(iv)
      vb = b.instance_variable_get(iv)
      ok = false unless deep_equal(va, vb, "#{path}.#{iv}")
    end
    ok
  end
end

original_bytes = File.binread(path)
obj1 = Marshal.load(original_bytes)
roundtrip_bytes = Marshal.dump(obj1)
obj2 = Marshal.load(roundtrip_bytes)

if deep_equal(obj1, obj2)
  puts "OK: equivalencia semantica confirmada (tamano original=#{original_bytes.bytesize}, roundtrip=#{roundtrip_bytes.bytesize})."
else
  puts "HAY DIFERENCIAS REALES -- no es seguro reinsertar todavia."
end
