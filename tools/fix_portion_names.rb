# encoding: UTF-8
["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  cat28 = data[28]
  cat29 = data[29]
  cat28["set of Auspicious Armor"] = "set de Armadura Fasta"
  cat28["set of Malicious Armor"] = "set de Armadura Nefasta"
  cat28["capsule of Booster Energy"] = "cápsula de Energía Potenciadora"
  cat28["hunk of Metal Alloy"] = "trozo de Aleación de Metal"
  cat29["sets of Auspicious Armor"] = "sets de Armadura Fasta"
  cat29["sets of Malicious Armor"] = "sets de Armadura Nefasta"
  cat29["capsules of Booster Energy"] = "cápsulas de Energía Potenciadora"
  cat29["hunks of Metal Alloy"] = "trozos de Aleación de Metal"
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: corregido"
end
