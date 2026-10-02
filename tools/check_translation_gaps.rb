# encoding: UTF-8
require "set"

# String -> Set de archivos donde aparece
sources = Hash.new { |h, k| h[k] = Set.new }

Dir.glob("Plugins/**/*.rb").each do |file|
  src = File.read(file, encoding: "UTF-8") rescue next
  src.scan(/_INTL\(\s*("(?:\\.|[^"\\])*")/m) do |m|
    lit = m[0]
    begin
      val = eval(lit)
      sources[val] << file if val.is_a?(String)
    rescue StandardError
      next
    end
  end
end

# Archivos que YO escribi directamente en espanol: si un string SOLO aparece
# ahi, no es un problema de traduccion (ya esta en espanol, aunque no tenga
# tildes que lo delaten).
MINE = [
  "Plugins/Mom Bank/Mom Bank.rb",
  "Plugins/Character Customization/Character Customization.rb",
].freeze

english_like = sources.keys.select do |s|
  next false if s !~ /[A-Za-z]/
  next false if s =~ /[áéíóúñÁÉÍÓÚÑ¿¡]/
  next false if s =~ %r{\AGraphics/}
  # si TODOS los archivos donde aparece son mios, no cuenta
  next false if sources[s].all? { |f| MINE.include?(f) }
  true
end

dicts = []
["Data/messages_es_game.dat", "Data/messages_es_core.dat"].each do |f|
  d = Marshal.load(File.binread(f)) rescue next
  d.each { |s| dicts << s if s.is_a?(Hash) }
end

missing = []
english_like.each do |c|
  best = nil
  dicts.each do |section|
    if section.key?(c) && section[c] != c
      best = section[c]
      break
    end
  end
  missing << c if !best
end

puts "candidatos: #{english_like.size}  faltantes reales: #{missing.length}"
File.open("tools/_translation_gaps.txt", "w") do |f|
  missing.sort.each do |m|
    f.puts "#{m.inspect}\t<= #{sources[m].to_a.join(', ')}"
  end
end
