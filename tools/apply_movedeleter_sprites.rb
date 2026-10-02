require "./tools/rpg_stubs"
require "fileutils"

ASSIGN = {
  12  => "trainer_MOVEDELETER_AUBURN",
  43  => "trainer_MOVEDELETER_BLACK",
  87  => "trainer_MOVEDELETER_BLONDE",
  93  => "trainer_MOVEDELETER_PLATINUM",
  116 => "trainer_MOVEDELETER_GINGER",
  127 => "trainer_MOVEDELETER_CHESTNUT",
  157 => "trainer_MOVEDELETER_SILVER",
  184 => "trainer_MOVEDELETER_BLUE",
  210 => "trainer_MOVEDELETER_GREEN",
  216 => "trainer_MOVEDELETER_PURPLE",
  233 => "trainer_MOVEDELETER_PINK",
  246 => "trainer_MOVEDELETER_TEAL",
  325 => "trainer_MOVEDELETER_ORANGE",
  351 => "trainer_MOVEDELETER_WHITE",
}

ASSIGN.each do |n, char_name|
  path = "Data/Map#{n.to_s.rjust(3, '0')}.rxdata"
  bak = "#{path}.bak_movedeleter"
  FileUtils.cp(path, bak) unless File.exist?(bak)

  data = Marshal.load(File.binread(path))
  found = false
  data.events.each do |eid, ev|
    next unless ev.name.to_s =~ /move ?deleter/i
    ev.pages.each do |page|
      page.graphic.character_name = char_name
    end
    found = true
  end
  raise "Move Deleter not found in Map#{n}" unless found

  File.open(path, "wb") { |f| Marshal.dump(data, f) }
  puts "Map#{n}: -> #{char_name}"
end
