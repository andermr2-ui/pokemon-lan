# encoding: UTF-8
# v2: reemplaza el armario de tileset (3x2, tiles 573-583) por un evento con
# grafico propio (el dibujo del usuario, Graphics/Characters/ArmarioCustom.png),
# ocupando UNA sola celda para que se pueda rodear e interactuar desde
# cualquiera de los 4 lados (izquierda, derecha, arriba, abajo).
require_relative "rpg_stubs"
require_relative "table_codec"

map = Marshal.load(File.binread("Data/Map077.rxdata"))
raw = map.data.instance_variable_get(:@__raw)
tbl = TableCodec.decode(raw)

# 1) Borra el mueble de tileset viejo (3 columnas x 2 filas).
[28, 29, 30].each do |x|
  [5, 6].each do |y|
    TableCodec.set(tbl, x, y, 1, 0)
  end
end

new_raw = TableCodec.encode(tbl)
map.data.instance_variable_set(:@__raw, new_raw)

# 2) Reubica el evento disparador como objeto de una sola celda, con su
#    propio grafico (no un tile de pared), en (28,6). Vecinos libres en las
#    4 direcciones: (28,5) norte, (28,7) sur, (29,6) este, (27,6) alfombra
#    al oeste (transitable).
ev = map.events.values.find { |e| e.name == "armario" }
raise "no se encontro el evento 'armario'" if !ev
ev.x = 28
ev.y = 6
page = ev.pages[0]
page.graphic.tile_id = 0
page.graphic.character_name = "ArmarioCustom"
page.graphic.character_hue = 0
page.graphic.direction = 2  # abajo (da igual, el arte es igual en las 4 direcciones)
page.graphic.pattern = 0
page.direction_fix = true
page.walk_anime = false
page.step_anime = false
page.through = false
page.always_on_top = false

File.open("Data/Map077.rxdata", "wb") { |f| Marshal.dump(map, f) }
puts "OK: armario v2 (grafico propio) colocado en (#{ev.x},#{ev.y})"
