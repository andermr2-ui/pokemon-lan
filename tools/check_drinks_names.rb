module GameData
  class Item
    attr_reader :id, :real_name
  end
end
data = Marshal.load(File.binread("Data/items.dat"))
msgs = File.open("Data/messages_es_game.dat", "rb") { |f| Marshal.load(f) }
[:FRESHWATER, :SODAPOP, :LEMONADE, :BERRYJUICE, :HONEY, :SACREDASH, :MAXHONEY].each do |id|
  item = data[id]
  name = item.real_name
  puts "#{id}: #{name.inspect} => #{msgs[7][name].inspect}"
end
