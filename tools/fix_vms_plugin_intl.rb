# encoding: UTF-8
FILES = [
  "Plugins/Voltseon's Multiplayer Solution/001_Base/002_VMS_Config_Messages.rb",
  "Plugins/Voltseon's Multiplayer Solution/002_Players/001_VMS_Player_Handler.rb",
  "Plugins/Voltseon's Multiplayer Solution/002_Players/002_VMS_Trade_Handler.rb",
  "Plugins/Voltseon's Multiplayer Solution/002_Players/003_VMS_Battle_Handler.rb",
  "Plugins/Voltseon's Multiplayer Solution/002_Players/004_VMS_Multibattle_Handler.rb",
  "Plugins/Voltseon's Multiplayer Solution/004_Other/001_VMS_Overrides.rb",
]

data = Marshal.load(File.binread("Data/messages_es_game.dat"))
cat = data[24] || {}

def real_key(raw_text)
  eval('"' + raw_text + '"')
rescue StandardError
  nil
end

total_replaced = 0
FILES.each do |path|
  source = File.read(path, encoding: "UTF-8")
  replaced_here = 0
  new_source = source.gsub(/_INTL\(\s*"((?:[^"\\]|\\.)*)"/) do |match|
    raw = Regexp.last_match(1)
    key = real_key(raw)
    if key && cat.key?(key) && cat[key] != key
      replaced_here += 1
      "_INTL(#{cat[key].inspect}"
    else
      match
    end
  end
  File.write(path, new_source, encoding: "UTF-8")
  total_replaced += replaced_here
  puts "#{path}: #{replaced_here} strings puestas en español directo"
end
puts "TOTAL: #{total_replaced}"
