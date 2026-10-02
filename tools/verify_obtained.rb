require "zlib"
raw = Marshal.load(File.binread("Data/Scripts.rxdata"))
targets = []
raw.each do |id, name, compressed|
  source = Zlib::Inflate.inflate(compressed).force_encoding("UTF-8")
  source.scan(/(?:_INTL|_ISPRINTF)\s*\(\s*"((?:[^"\\]|\\.)*)"/) do |m|
    targets << m[0] if m[0].include?("obtained")
  end
end

data = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
hash = data[24]

targets.uniq.each do |t|
  real = eval('"' + t + '"')
  match = hash.key?(real)
  puts "#{match ? 'OK' : 'FALTA'}: #{real.inspect} => #{hash[real].inspect}"
end
