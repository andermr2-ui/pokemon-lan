data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
puts "categorias: #{data.size}"
cat9 = data[9]
puts "cat9 total=#{cat9.size} sin_traducir=#{cat9.count{|k,v| k==v}}"
[7,8,9].each { |c| puts "cat#{c} size=#{data[c].size}" }
