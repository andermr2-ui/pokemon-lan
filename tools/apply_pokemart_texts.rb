# encoding: UTF-8
DICT = {
  "$ {1}" => "{1}€",
  "And have 1 {1} on the house!" => "¡Y ten 1 {1} por cuenta de la casa!",
  "And have {1} {2} on the house!" => "¡Y ten {1} {2} por cuenta de la casa!",
  "Do come again!" => "¡Vuelve pronto!",
  "Failed to delete stored items" => "No se pudieron eliminar los objetos guardados",
  "Here you are! Thank you!" => "¡Aquí tienes! ¡Gracias!",
  "How many {1} would you like to sell?" => "¿Cuántos {1} te gustaría vender?",
  "I can pay ${1}.\nWould that be OK?" => "Puedo pagarte {1}€.\n¿Te parece bien?",
  "I'm here to buy" => "Vengo a comprar",
  "I'm here to sell" => "Vengo a vender",
  "In Bag:<r>{1}" => "En la Mochila:<r>{1}",
  "Is there anything else I can do for you?" => "¿Hay algo más que pueda hacer por ti?",
  "Money:\n<r>{1}" => "Dinero:\n<r>{1}",
  "No" => "No",
  "No, thanks" => "No, gracias",
  "Oh, no. I can't buy {1}." => "Oh, no. No puedo comprar {1}.",
  "Quit shopping." => "Dejar de comprar.",
  "So how many {1}?" => "¿Y cuántos {1}?",
  "So you want the {1}?\nIt'll be ${2}. All right?" => "¿Así que quieres el {1}?\nSerán {2}€. ¿De acuerdo?",
  "So you want {1} {2}?\nIt'll be ${3}. All right?" => "¿Así que quieres {1} {2}?\nSerán {3}€. ¿De acuerdo?",
  "So you want {1} {2}?\nThey'll be ${3}. All right?" => "¿Así que quieres {1} {2}?\nSerán {3}€. ¿De acuerdo?",
  "Welcome! How may I help you?" => "¡Bienvenido! ¿En qué puedo ayudarte?",
  "You don't have enough money." => "No tienes suficiente dinero.",
  "You have no room in your Bag." => "No tienes sitio en tu Mochila.",
  "You turned over the {1} and got ${2}." => "Entregaste {1} y conseguiste {2}€.",
  "x{1}<r>$ {2}" => "x{1}<r>{2}€",
  "{1} {2}" => "{1} {2}",
}.freeze

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  hash = (data[24] ||= {})
  added = 0
  DICT.each do |k, v|
    added += 1 unless hash.key?(k)
    hash[k] = v
  end
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: nuevas=#{added} total=#{hash.size}"
end
