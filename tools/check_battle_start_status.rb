data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
cat24 = data[24]
KEYS = [
  "{1} is about to send out {2}. Will you switch your Pokémon?",
  "{1} sent out {2}!",
  "You defeated {1} and {2}!",
  "You defeated {1}!",
  "You defeated {1}, {2} and {3}!",
  "{1} sent out {2} and {3}!",
  "{1} sent out {2}, {3} and {4}!",
]
KEYS.each do |k|
  status = cat24.key?(k) ? (cat24[k] == k ? "SIN TRADUCIR" : cat24[k].inspect) : "NO EXISTE"
  puts "#{k.inspect} => #{status}"
end
