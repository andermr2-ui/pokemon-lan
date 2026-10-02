DICT_KEYS = [
  "$ {1}", "And have 1 {1} on the house!", "And have {1} {2} on the house!",
  "Do come again!", "Failed to delete stored items", "Here you are! Thank you!",
  "How many {1} would you like to sell?", "I can pay ${1}.\nWould that be OK?",
  "I'm here to buy", "I'm here to sell", "In Bag:<r>{1}",
  "Is there anything else I can do for you?", "Money:\n<r>{1}", "No",
  "No, thanks", "Oh, no. I can't buy {1}.", "Quit shopping.", "So how many {1}?",
  "So you want the {1}?\nIt'll be ${2}. All right?",
  "So you want {1} {2}?\nIt'll be ${3}. All right?",
  "So you want {1} {2}?\nThey'll be ${3}. All right?",
  "Welcome! How may I help you?", "You don't have enough money.",
  "You have no room in your Bag.", "You turned over the {1} and got ${2}.",
  "x{1}<r>$ {2}", "{1} {2}",
]
data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
cat24 = data[24]
DICT_KEYS.each do |k|
  status = cat24.key?(k) ? (cat24[k] == k ? "SIN TRADUCIR (self-mapped)" : "traducido: #{cat24[k].inspect}") : "NO EXISTE LA CLAVE"
  puts "#{k.inspect[0,50]} => #{status}"
end
