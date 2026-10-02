# encoding: UTF-8
require_relative "translations_following_pkmn"

TARGET_FILES = [
  "Plugins/Following Pokemon EX/Configuration/002_Dialogue_Specific.rb",
  "Plugins/Following Pokemon EX/Configuration/003_Dialogue_Generic.rb",
  "Plugins/Following Pokemon EX/Main Module/Internal Commands.rb",
].freeze

total_replaced = 0
total_seen = 0

TARGET_FILES.each do |file|
  src = File.read(file, encoding: "UTF-8")
  changed = 0
  new_src = src.gsub(/_INTL\(\s*("(?:\\.|[^"\\])*")/m) do |match|
    lit = $1
    total_seen += 1
    begin
      val = eval(lit)
    rescue StandardError
      next match
    end
    next match if !TRANSLATIONS.key?(val)
    translated = TRANSLATIONS[val]
    changed += 1
    total_replaced += 1
    "_INTL(#{translated.dump}"
  end
  File.write(file, new_src)
  puts "#{file}: #{changed} reemplazos"
end

puts "TOTAL: #{total_replaced} reemplazos de #{total_seen} literales _INTL(...) revisados"
