require_relative "rpg_stubs"
map = File.open("Data/Map001.rxdata", "rb") { |f| Marshal.load(f) }
event = map.events[1]
page = event.pages[0]
cmd = page.list[19]
puts "ANTES: #{cmd.object_id} #{cmd.parameters.inspect}"
cmd.parameters[0] = ["TEST_A", "TEST_B", "TEST_C"]
puts "DESPUES DE MUTAR (en memoria): #{page.list[19].parameters.inspect}"

File.open("Data/Map001.rxdata.test", "wb") { |f| f.write(Marshal.dump(map)) }

reloaded = File.open("Data/Map001.rxdata.test", "rb") { |f| Marshal.load(f) }
cmd2 = reloaded.events[1].pages[0].list[19]
puts "RELEIDO DESDE DISCO: #{cmd2.parameters.inspect}"
