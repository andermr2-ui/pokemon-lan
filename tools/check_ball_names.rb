data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
["Poké Ball","Great Ball","Ultra Ball","Master Ball","Feather Ball","Wing Ball","Sky Ball","Heavy Ball","Leaden Ball","Gigaton Ball","Dream Ball","Beast Ball","Sacred Ash","Adamant Orb","Lustrous Orb","Griseous Orb","Griseous Core","Normal Plate","Splash Plate","Toxic Plate","Earth Plate","Stone Plate","Insect Plate","Spooky Plate","Iron Plate","Flame Plate","Meadow Plate","Zap Plate","Mind Plate","Icicle Plate","Draco Plate","Dread Plate","Sky Plate","Pixie Plate","Fist Plate","Leppa Berry"].each do |k|
  v = data[7][k]
  puts "#{k.inspect} => #{v.nil? ? 'NO EXISTE' : v.inspect}"
end
