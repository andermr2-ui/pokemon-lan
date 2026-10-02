KEYS = [
  "CANCEL", "Yes",
  "Welcome to the Champ Store! How can I help you?",
  "Do you need anything?",
  "You´ll find me here at night. Don´t tell the cops!",
  "You can find me here at night. Don´t tell the cops!",
  "Anything else?",
  "Welcome to Patisserie Alcremie. How can I help you?",
  "Thank you",
  "Do you need anything else?",
  "You´ve made a good deal.",
]
data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
cat24 = data[24]
KEYS.each do |k|
  status = cat24.key?(k) ? (cat24[k] == k ? "SIN TRADUCIR" : "traducido: #{cat24[k].inspect}") : "NO EXISTE"
  puts "#{k.inspect} => #{status}"
end
