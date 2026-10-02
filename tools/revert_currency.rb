# encoding: UTF-8
# El usuario pidio cambiar $ por € y ahora se retracta: vuelve a poner el
# simbolo de dolar original, en la misma posicion (prefijo) que tenia el
# texto en ingles original, deshaciendo exactamente lo que hizo
# tools/apply_currency.rb.
FIX = {
  "${1}" => "${1}",
  "You got ${1} for winning!" => "¡Conseguiste ${1} por ganar!",
  "You picked up ${1}!" => "¡Recogiste ${1}!",
  "You gave ${1} to the winner..." => "Le diste ${1} al ganador...",
  "You panicked and dropped ${1}..." => "Te entró el pánico y se te cayeron ${1}...",
  "$ {1}" => "$ {1}",
  "I can pay ${1}.\nWould that be OK?" => "Puedo pagarte ${1}.\n¿Te parece bien?",
  "So you want the {1}?\nIt'll be ${2}. All right?" => "¿Así que quieres el {1}?\nSerán ${2}. ¿De acuerdo?",
  "So you want {1} {2}?\nIt'll be ${3}. All right?" => "¿Así que quieres {1} {2}?\nSerán ${3}. ¿De acuerdo?",
  "So you want {1} {2}?\nThey'll be ${3}. All right?" => "¿Así que quieres {1} {2}?\nSerán ${3}. ¿De acuerdo?",
  "You turned over the {1} and got ${2}." => "Entregaste {1} y conseguiste ${2}.",
  "x{1}<r>$ {2}" => "x{1}<r>$ {2}",
}.freeze

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  hash = data[24]
  updated = 0
  missing = []
  FIX.each do |k, v|
    unless hash.key?(k)
      missing << k
      next
    end
    hash[k] = v
    updated += 1
  end
  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: revertidas=#{updated}, no encontradas=#{missing.size}"
  missing.each { |m| puts "  FALTA: #{m}" }
end
