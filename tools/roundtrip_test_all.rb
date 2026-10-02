require_relative "rpg_stubs"

def deep_equal(a, b)
  return false if a.class != b.class
  case a
  when String, Integer, Float, Symbol, TrueClass, FalseClass, NilClass
    a == b
  when Array
    return false if a.size != b.size
    a.each_index.all? { |i| deep_equal(a[i], b[i]) }
  when Hash
    return false if a.keys.sort_by(&:to_s) != b.keys.sort_by(&:to_s)
    a.keys.all? { |k| deep_equal(a[k], b[k]) }
  else
    ivars_a = a.instance_variables.sort
    ivars_b = b.instance_variables.sort
    return false if ivars_a != ivars_b
    ivars_a.all? { |iv| deep_equal(a.instance_variable_get(iv), b.instance_variable_get(iv)) }
  end
end

map_files = Dir.glob("Data/Map*.rxdata").select { |f| File.basename(f) =~ /\AMap\d+\.rxdata\z/ }.sort
failures = []
map_files.each do |path|
  begin
    original = File.binread(path)
    obj1 = Marshal.load(original)
    obj2 = Marshal.load(Marshal.dump(obj1))
    failures << path unless deep_equal(obj1, obj2)
  rescue => e
    failures << "#{path} (ERROR: #{e.class}: #{e.message})"
  end
end

puts "Mapas probados: #{map_files.size}"
puts "Fallas: #{failures.size}"
failures.each { |f| puts "  - #{f}" }
