data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
h = data[10]
["Stench", "Drizzle", "Speed Boost", "Levitate", "Intimidate"].each do |k|
  puts "#{k.inspect} => #{h[k].inspect}"
end
pending = h.select { |k,v| k == v }
puts "Total: #{h.size}, pendientes: #{pending.size}"
