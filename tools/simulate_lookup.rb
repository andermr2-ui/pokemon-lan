require "zlib"

raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
target = nil
raw.each do |id, name, compressed|
  next unless id == 372389
  source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  source.scan(/(?:_INTL|_ISPRINTF)\s*\(\s*"((?:[^"\\]|\\.)*)"/) do |m|
    target = m[0] if m[0].include?("Arrow keys to select")
  end
end

abort "no encontrado" unless target
puts "Capturado crudo (fuente): #{target.inspect}"
real_string = eval('"' + target + '"')
puts "String real evaluado: #{real_string.inspect}"

def stringToKey(str)
  if str && str[/[\r\n\t\1]|^\s+|\s+$|\s{2,}/]
    key = str.clone
    key.gsub!(/^\s+/, "")
    key.gsub!(/\s+$/, "")
    key.gsub!(/\s{2,}/, " ")
    return key
  end
  return str
end

computed_key = stringToKey(real_string)
puts "Clave calculada: #{computed_key.inspect}"

data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
hash = data[24]
puts "Coincide?: #{hash.key?(computed_key)}"
puts "Valor: #{hash[computed_key].inspect}" if hash.key?(computed_key)

# Tambien probar la clave CRUDA (sin normalizar) por si acaso
puts "Existe la clave cruda (sin normalizar)?: #{hash.key?(real_string)}"
