module GameData
  class Item
    attr_reader :id, :real_name, :real_name_plural, :real_description
  end
end
data = Marshal.load(File.binread("Data/items.dat"))
ids = [:AIRBALLOON, :ANTIDOTE, :PARALYZEHEAL, :AWAKENING, :BURNHEAL, :ICEHEAL,
       :BRIGHTPOWDER, :ESCAPEROPE, :FULLHEAL, :FULLRESTORE, :REVIVE,
       :HEARTSCALE, :HYPERPOTION, :MAXPOTION, :GREATBALL, :ULTRABALL,
       :POTION, :SUPERPOTION, :RELICBAND, :RELICCROWN, :RELICSTATUE,
       :RELICVASE, :REPEL, :SUPERREPEL, :MAXREPEL]
ids.each do |id|
  item = data[id]
  if item
    puts "#{id}\tname=#{item.real_name.inspect}\tplural=#{item.real_name_plural.inspect}"
    puts "\tdesc=#{item.real_description.inspect}"
  else
    puts "#{id}: NO EXISTE"
  end
end
