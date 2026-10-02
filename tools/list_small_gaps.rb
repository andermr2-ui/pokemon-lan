data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
LABELS = {5=>"MOVE_NAMES",10=>"ABILITY_NAMES",12=>"TYPE_NAMES",13=>"TRAINER_TYPE_NAMES",20=>"REGION_LOCATION_DESCRIPTIONS",21=>"MAP_NAMES",23=>"TRAINER_SPEECHES_LOSE"}
LABELS.each do |i, name|
  hash = data[i]
  missing = hash.select { |k,v| k == v }
  puts "== #{name} (#{missing.size}) =="
  missing.each_key { |k| puts "  #{k}" }
end
