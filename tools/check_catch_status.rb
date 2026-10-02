data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
cat24 = data[24]
KEYS = [
  "Would you like to give a nickname to {1}?",
  "{1}'s nickname?",
  "Add to your party",
  "Send to a Box",
  "See {1}'s summary",
  "Check party",
  "Where do you want to send {1} to?",
  "Choose a Pokémon in your party to send to your Boxes.",
  "{1} has been sent to Box \"{2}\".",
  "{1} has been added to your party.",
  "{1} has been sent to Box \"{2}\"!",
  "{1}'s data was added to the Pokédex.",
  "{1} threw an {2}!",
  "{1} threw a {2}!",
  "But there was no target...",
  "The Trainer blocked your Poké Ball! Don't be a thief!",
  "Oh no! The Pokémon broke free!",
  "Aww! It appeared to be caught!",
  "Aargh! Almost had it!",
  "Gah! It was so close, too!",
  "Gotcha! {1} was caught!",
]
KEYS.each do |k|
  status = cat24.key?(k) ? (cat24[k] == k ? "SIN TRADUCIR" : cat24[k].inspect) : "NO EXISTE"
  puts "#{k.inspect} => #{status}"
end
