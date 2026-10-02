module GameData
  class Species
  end
end

species_data = Marshal.load(File.binread("Data/species.dat"))
msg_data = Marshal.load(File.binread("Data/messages_es_game.dat"))
cat3 = msg_data[3]

entries = {}
species_data.each do |key, sp|
  txt = sp.instance_variable_get(:@real_pokedex_entry)
  next unless txt && !txt.empty?
  entries[key] = txt
end

puts "especies con entrada pokedex (incl. formas): #{entries.size}"
unique_texts = entries.values.uniq
puts "textos unicos: #{unique_texts.size}"

missing = 0
untranslated = 0
translated = 0
unique_texts.each do |txt|
  if cat3.key?(txt)
    if cat3[txt] == txt
      untranslated += 1
    else
      translated += 1
    end
  else
    missing += 1
  end
end

puts "traducidos: #{translated}"
puts "presentes pero sin traducir (key==val): #{untranslated}"
puts "sin ninguna clave (no existe en absoluto): #{missing}"
