["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  hash = data[24]
  hash["SKILLS"] = "HABILIDADES"
  hash["Sp. Atk"] = "Atq. Esp."
  hash["Sp. Def"] = "Def. Esp."
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
end
puts "aplicado"
