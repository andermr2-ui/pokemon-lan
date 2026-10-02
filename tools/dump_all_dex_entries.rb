module GameData
  class Species
  end
end

species_data = Marshal.load(File.binread("Data/species.dat"))
msg_data = Marshal.load(File.binread("Data/messages_es_game.dat"))
cat3 = msg_data[3]

seen = {}
File.open("tools/_dex_entries_all.tsv", "wb") do |f|
  species_data.each do |key, sp|
    next if key.is_a?(Array) # skip form-keyed duplicates entries if any, we want base pass first
    txt = sp.instance_variable_get(:@real_pokedex_entry)
    next unless txt && !txt.empty?
    next if seen[txt]
    seen[txt] = true
    status = cat3.key?(txt) ? (cat3[txt] == txt ? "UNTRANSLATED" : "TRANSLATED") : "MISSING"
    name = sp.instance_variable_get(:@real_name)
    f.puts([key.inspect, name, status, txt.gsub("\t"," ").gsub("\n","\\n")].join("\t"))
  end
end
puts "escrito tools/_dex_entries_all.tsv, total unicos: #{seen.size}"
