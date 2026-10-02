module GameData
  class Move
  end
end

moves_data = Marshal.load(File.binread("Data/moves.dat"))
msg_data = Marshal.load(File.binread("Data/messages_es_game.dat"))
cat5 = msg_data[5] # nombres de movimientos
cat6 = msg_data[6] # descripciones de movimientos

def status_for(hash, text)
  if hash.key?(text)
    hash[text] == text ? "UNTRANSLATED" : "TRANSLATED"
  else
    "MISSING"
  end
end

count = 0
File.open("tools/_moves_all.tsv", "wb") do |f|
  f.puts(%w[id nombre_interno nombre_ingles descripcion_ingles categoria_nombre_index categoria_desc_index estado_nombre estado_desc].join("\t"))
  moves_data.each do |id, mv|
    name = mv.instance_variable_get(:@real_name)
    desc = mv.instance_variable_get(:@real_description)
    estado_nombre = status_for(cat5, name)
    estado_desc = status_for(cat6, desc)
    f.puts([id.inspect, id.to_s, name, desc.to_s.gsub("\t", " ").gsub("\n", "\\n"), 5, 6, estado_nombre, estado_desc].join("\t"))
    count += 1
  end
end
puts "escrito tools/_moves_all.tsv, total movimientos: #{count}"
