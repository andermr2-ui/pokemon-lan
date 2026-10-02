module GameData
  class Move
  end
end

moves_data = Marshal.load(File.binread("Data/moves.dat"))
msg_data = Marshal.load(File.binread("Data/messages_es_game.dat"))
cat5 = msg_data[5] # nombres de movimientos
cat6 = msg_data[6] # descripciones de movimientos

total = moves_data.size
puts "Movimientos totales en moves.dat: #{total}"

name_translated = 0
name_untranslated_key = 0 # tiene clave en cat5 pero key==value
name_missing = 0
name_direct_es = 0 # real_name ya esta en español directo en moves.dat (no ingles)

desc_translated = 0
desc_untranslated_key = 0
desc_missing = 0

moves_data.each do |id, mv|
  real_name = mv.instance_variable_get(:@real_name)
  real_desc = mv.instance_variable_get(:@real_description)

  if cat5.key?(real_name)
    if cat5[real_name] == real_name
      name_untranslated_key += 1
    else
      name_translated += 1
    end
  else
    name_missing += 1
  end

  if cat6.key?(real_desc)
    if cat6[real_desc] == real_desc
      desc_untranslated_key += 1
    else
      desc_translated += 1
    end
  else
    desc_missing += 1
  end
end

puts "\n--- NOMBRES (cat5, size actual #{cat5.size}) ---"
puts "traducidos: #{name_translated}"
puts "presentes pero sin traducir (key==val): #{name_untranslated_key}"
puts "sin ninguna clave (no existe en absoluto): #{name_missing}"

puts "\n--- DESCRIPCIONES (cat6, size actual #{cat6.size}) ---"
puts "traducidas: #{desc_translated}"
puts "presentes pero sin traducir (key==val): #{desc_untranslated_key}"
puts "sin ninguna clave (no existe en absoluto): #{desc_missing}"

puts "\nNOTA: 'sin ninguna clave' cuenta movimientos cuyo real_name/real_description en moves.dat"
puts "no tiene entrada en la categoria, ya sea porque falta el par, o porque el nombre/desc en"
puts "moves.dat ya fue editado directamente a español en PBS/moves.txt (entonces la clave en ingles no calza)."
