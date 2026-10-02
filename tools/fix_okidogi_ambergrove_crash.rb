# Arregla el mismo bug de siempre ("undefined method `[]' for #<RPG::MoveRoute>"
# en Intl_Messages) en la estatua de Okidogi de Ambergrove (Map176, evento 6).
# Mismo patron: paginas 1, 2 y 4 (0-indexed) tienen su primer comando
# code=101 corrupto (parametro MoveRoute en vez de String). Texto original
# confirmado en translations/map176.txt: "It's a Pokémon Statue dedicated
# to Okidogi." (paginas 1,2,3,5 en ese archivo 1-indexado).
require "./tools/rpg_stubs"
require "fileutils"

path = "Data/Map176.rxdata"
bak = "#{path}.bak_okidogi_crash"
FileUtils.cp(path, bak) unless File.exist?(bak)

data = Marshal.load(File.binread(path))
ev = data.events[6]
text = "Es una estatua Pokémon dedicada a Okidogi."

[1, 2, 4].each do |pi|
  cmd = ev.pages[pi].list[0]
  raise "page #{pi} cmd0 not code=101" unless cmd.code == 101
  puts "page #{pi} antes: #{cmd.parameters.inspect}"
  cmd.parameters = [text]
  puts "page #{pi} despues: #{cmd.parameters.inspect}"
end

File.open(path, "wb") { |f| Marshal.dump(data, f) }
puts "GUARDADO."
