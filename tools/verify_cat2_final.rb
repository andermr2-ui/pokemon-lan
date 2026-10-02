data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
puts "categorias: #{data.size}"
puts "cat2 sin_traducir=#{data[2].count{|k,v| k==v}}/#{data[2].size}"
puts data[24]["{1} Pokémon"]
puts data[2]["Paradox"]
puts data[2]["Ambush"]
