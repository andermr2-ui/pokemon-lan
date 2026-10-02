# encoding: UTF-8
module GameData
  class Item
    attr_reader :id, :real_name, :real_portion_name, :real_portion_name_plural
  end
end

CONTAINER_ES = {
  "bag" => ["bolsa", "bolsas"],
  "blob" => ["masa", "masas"],
  "bottle" => ["botella", "botellas"],
  "can" => ["lata", "latas"],
  "capsule" => ["cápsula", "cápsulas"],
  "clump" => ["puñado", "puñados"],
  "cluster" => ["racimo", "racimos"],
  "comb" => ["panal", "panales"],
  "cup" => ["taza", "tazas"],
  "dollop" => ["porción", "porciones"],
  "dose" => ["dosis", "dosis"],
  "hunk" => ["trozo", "trozos"],
  "jar" => ["tarro", "tarros"],
  "lump" => ["pella", "pellas"],
  "pair" => ["par", "pares"],
  "piece" => ["pieza", "piezas"],
  "pile" => ["montón", "montones"],
  "scrap" => ["retazo", "retazos"],
  "serving" => ["ración", "raciones"],
  "set" => ["set", "sets"],
  "sprig" => ["ramita", "ramitas"],
  "coin" => ["moneda", "monedas"],
}

items = Marshal.load(File.binread("Data/items.dat"))

["Data/messages_es_game.dat", "Data/messages_game.dat"].each do |path|
  data = File.open(path, "rb") { |f| Marshal.load(f) }
  cat7 = data[7]
  cat28 = (data[28] ||= {})
  cat29 = (data[29] ||= {})
  added = 0
  skipped = []

  items.each_value do |item|
    next unless item.real_portion_name
    en_name = item.real_name
    es_name = cat7[en_name] || en_name

    portion = item.real_portion_name
    portion_pl = item.real_portion_name_plural

    if portion =~ /^(.*?) of #{Regexp.escape(en_name)}$/
      container = $1
      es = CONTAINER_ES[container]
      unless es
        skipped << portion
        next
      end
      cat28[portion] = "#{es[0]} de #{es_name}"
      cat29[portion_pl] = "#{es[1]} de #{es_name}"
      added += 1
    elsif portion =~ /^#{Regexp.escape(en_name)} coin$/
      cat28[portion] = "moneda de #{es_name}"
      cat29[portion_pl] = "monedas de #{es_name}"
      added += 1
    elsif portion =~ /^voucher for #{Regexp.escape(en_name)}$/
      cat28[portion] = "vale de #{es_name}"
      cat29[portion_pl] = "vales de #{es_name}"
      added += 1
    else
      skipped << portion
    end
  end

  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "#{path}: #{added} aplicadas, #{skipped.size} sin patrón reconocido"
  skipped.each { |s| puts "  SIN PATRON: #{s.inspect}" }
end
