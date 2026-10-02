# encoding: UTF-8
require_relative "_following_pkmn_final_dict"
require_relative "_mom_bank_dict"
require_relative "_charcustom_dict"
require_relative "_vms_new_dict"

ALL = {}
sources = {
  "FollowingPkmn" => FOLLOWING_PKMN_DICT,
  "MomBank" => MOM_BANK_DICT,
  "CharCustom" => CHARCUSTOM_DICT,
  "VMS_new" => VMS_NEW_DICT,
}
sources.each do |src, dict|
  dict.each { |en, es| ALL[en] = es }
end
puts "total combinado (unicos): #{ALL.size}"

# Cargar diccionarios existentes para chequear colisiones (misma clave
# inglesa, valor español YA distinto al que queremos escribir).
dicts = []
["Data/messages_es_game.dat", "Data/messages_es_core.dat"].each do |f|
  d = Marshal.load(File.binread(f)) rescue next
  d.each_with_index { |s, i| dicts << [f, i, s] if s.is_a?(Hash) }
end

conflicts = []
ALL.each do |en, es|
  dicts.each do |file, idx, section|
    next unless section.key?(en)
    existing = section[en]
    if existing != es && existing != en
      conflicts << [en, es, existing, file, idx]
    end
  end
end

if conflicts.empty?
  puts "SIN CONFLICTOS: ninguna de las claves nuevas choca con una traduccion ya existente distinta."
else
  puts "CONFLICTOS (#{conflicts.size}):"
  conflicts.each do |en, es, existing, file, idx|
    puts "  #{en.inspect}"
    puts "    nuevo:      #{es.inspect}"
    puts "    ya existia: #{existing.inspect}  (#{file} seccion #{idx})"
  end
end

File.write("tools/_merge_report.txt", conflicts.empty? ? "sin conflictos, #{ALL.size} entradas listas" : "#{conflicts.size} conflictos")
