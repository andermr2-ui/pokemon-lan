# encoding: UTF-8
require_relative "_following_pkmn_final_dict"
require_relative "_mom_bank_dict"
require_relative "_charcustom_dict"
require_relative "_vms_new_dict"

ALL = {}
[FOLLOWING_PKMN_DICT, MOM_BANK_DICT, CHARCUSTOM_DICT, VMS_NEW_DICT].each do |dict|
  dict.each { |en, es| ALL[en] = es }
end

path = "Data/messages_es_game.dat"
data = File.open(path, "rb") { |f| Marshal.load(f) }
cat = (data[24] ||= {})  # SCRIPT_TEXTS
added = 0
updated = 0
ALL.each do |en, es|
  if cat.key?(en)
    updated += 1
  else
    added += 1
  end
  cat[en] = es
end
File.open(path, "wb") { |f| Marshal.dump(data, f) }
puts "#{path}: nuevas=#{added} actualizadas=#{updated} total_categoria24=#{cat.size}"
