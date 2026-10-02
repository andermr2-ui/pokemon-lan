module GameData
  class Species
  end
end

data = Marshal.load(File.binread("Data/species.dat"))
puts "class: #{data.class}"
if data.is_a?(Hash)
  puts "size: #{data.size}"
  meowth_key = data.keys.find { |kk| kk.to_s.upcase.include?("MEOWTH") }
  puts "meowth_key: #{meowth_key.inspect}"
  if meowth_key
    mv = data[meowth_key]
    mv.instance_variables.each do |iv|
      val = mv.instance_variable_get(iv)
      puts "#{iv}: #{val.inspect[0,200]}"
    end
  end
end
