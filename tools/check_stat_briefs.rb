data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
["HP","Attack","Atk","Defense","Def","Special Attack","SpAtk","Special Defense","SpDef","Speed","Spd","accuracy","Acc","evasion","Eva"].each do |k|
  v = data[24][k]
  puts "#{k.inspect} => #{v.nil? ? 'NO EXISTE' : v.inspect}"
end
