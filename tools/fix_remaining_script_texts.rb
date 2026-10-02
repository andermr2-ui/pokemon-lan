# encoding: UTF-8
require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
scripts = raw.map { |id, name, c| Zlib::Inflate.inflate(c).force_encoding("UTF-8") }
all_source = scripts.join("\n")
intl_strings = all_source.scan(/_INTL\(\s*"((?:[^"\\]|\\.)*)"/).flatten.uniq

es_data = Marshal.load(File.binread("Data/messages_es_game.dat"))
en_data = Marshal.load(File.binread("Data/messages_game.dat"))
cat_es = (es_data[24] ||= {})
cat_en = (en_data[24] ||= {})

SUBS = [
  [/\bsurvived the poisoning\.\b/, "sobrevivió al envenenamiento."],
  [/\bThe poison faded away!\b/, "¡El veneno se desvaneció!"],
  [/\bYou found\b/, "Encontraste"],
  [/\bYou obtained\b/, "Obtuviste"],
  [/\byour Bag's\b/, "el bolsillo de"],
  [/\bpocket\.\b/, "de tu Bolsa."],
  [/\bYou put the\b/, "Guardaste"],
  [/\bin\\\\n/, "en\\\\n"],
  [/\bThere are\b/, "¡Hay"],
  [/\bWant to pick them\?/, "¿Querés recogerlos?"],
  [/\bThere is 1\b/, "¡Hay 1"],
  [/\bWant to pick it\?/, "¿Querés recogerlo?"],
  [/\bYou picked the\b/, "Recogiste"],
  [/\bTa-da!/, "¡Tachán!"],
  [/\bforgot how to use\b/, "olvidó cómo usar"],
  [/\bAnd\.\.\.\b/, "Y..."],
  [/\bNope! There's no response\.\b/, "¡Nada! No hay respuesta."],
  [/\bRegistered\b(?=.*Pokégear)/, "Registraste a"],
  [/\bin the Pokégear!\b/, "en la Pokégear!"],
  [/\bClick!\b/, "¡Click!"],
  [/\bSearching for online gifts\.\.\.\b/, "Buscando regalos en línea..."],
  [/\bNo online Mystery Gifts found\.\b/, "No se encontraron Regalos Misteriosos en línea."],
  [/\bOnline Mystery Gifts found\.\b/, "Se encontraron Regalos Misteriosos en línea."],
  [/\bHere you go!\b/, "¡Aquí tenés!"],
  [/\bYou have no room left in the Bag\.\b/, "No te queda espacio en la Bolsa."],
  [/\bYou don't have enough money\.\b/, "No tenés suficiente dinero."],
]

fixed = 0
intl_strings.each do |s|
  key = s.gsub('\"', '"').gsub('\\n', "\n").gsub("\\'", "'")
  next if cat_es.key?(key) && cat_es[key] != key
  next unless SUBS.any? { |pat, _| key =~ pat }
  translated = key.dup
  SUBS.each { |pat, rep| translated = translated.gsub(pat, rep) }
  cat_es[key] = translated
  cat_en[key] = translated
  fixed += 1
  puts "FIXED: #{key.inspect}\n  -> #{translated.inspect}"
end

File.open("Data/messages_es_game.dat", "wb") { |f| Marshal.dump(es_data, f) }
File.open("Data/messages_game.dat", "wb") { |f| Marshal.dump(en_data, f) }
puts "Total corregidas: #{fixed}"
