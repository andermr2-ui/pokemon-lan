data = File.open("Data/messages_game.dat", "rb") { |f| Marshal.load(f) }
hash = data[24]
keys = [
  "Opens the Key Bindings window, where you can choose which keyboard keys to use for each control.",
  "Take a screenshot. It is put in the same folder as the save file.",
  "Use the Arrow keys to move the main character.\n\nYou can also use the Arrow keys to select entries and navigate menus.",
  "Used to confirm a choice, interact with people and things, and move through text. (Default: C)",
]
keys.each do |k|
  v = hash[k]
  puts "#{k[0,40].inspect}... => #{v ? v[0,60].inspect : 'NO ENCONTRADA'}"
end
