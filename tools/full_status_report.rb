data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
NAMES = {
  1=>"SPECIES_NAMES",2=>"SPECIES_CATEGORIES",3=>"POKEDEX_ENTRIES",4=>"SPECIES_FORM_NAMES",
  5=>"MOVE_NAMES",6=>"MOVE_DESCRIPTIONS",7=>"ITEM_NAMES",8=>"ITEM_NAME_PLURALS",9=>"ITEM_DESCRIPTIONS",
  10=>"ABILITY_NAMES",11=>"ABILITY_DESCRIPTIONS",12=>"TYPE_NAMES",13=>"TRAINER_TYPE_NAMES",
  14=>"TRAINER_NAMES",15=>"FRONTIER_INTRO_SPEECHES",16=>"FRONTIER_END_SPEECHES_WIN",
  17=>"FRONTIER_END_SPEECHES_LOSE",18=>"REGION_NAMES",19=>"REGION_LOCATION_NAMES",
  20=>"REGION_LOCATION_DESCRIPTIONS",21=>"MAP_NAMES",22=>"PHONE_MESSAGES",
  23=>"TRAINER_SPEECHES_LOSE",24=>"SCRIPT_TEXTS",25=>"RIBBON_NAMES",26=>"RIBBON_DESCRIPTIONS",
  27=>"STORAGE_CREATOR_NAME",28=>"ITEM_PORTION_NAMES",29=>"ITEM_PORTION_NAME_PLURALS",
  30=>"POKEMON_NICKNAMES"
}
(1..30).each do |i|
  hash = data[i]
  next unless hash.is_a?(Hash)
  total = hash.size
  untrans = hash.count { |k,v| k == v }
  trans = total - untrans
  puts "#{i} #{NAMES[i]}: total=#{total} traducidos=#{trans} sin_traducir=#{untrans}"
end
