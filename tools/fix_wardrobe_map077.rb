# encoding: UTF-8
# Corrige el armario colocado por place_wardrobe_map077.rb:
#   - Estaba mal ubicado: (29,6)-(30,7), lejos de la cama/alfombra.
#   - Usaba solo 2 de las 3 columnas del mueble real (573/574 arriba,
#     581/582 abajo), por eso se veia como puertas de ascensor en vez de
#     un armario con cajonera lateral.
#
# Posicion correcta: a la derecha de la alfombra (que ocupa x=23..27,
# y=4..7), a la misma altura que la cama (que ocupa x=20..22, y=5..6),
# simetrica: 3 columnas libres x=28..30, y=5..6.
require_relative "rpg_stubs"
require_relative "table_codec"

map = Marshal.load(File.binread("Data/Map077.rxdata"))
raw = map.data.instance_variable_get(:@__raw)
tbl = TableCodec.decode(raw)

# 1) Borra el armario viejo, mal ubicado (29,6)/(30,6)/(29,7)/(30,7).
[[29, 6], [30, 6], [29, 7], [30, 7]].each do |x, y|
  TableCodec.set(tbl, x, y, 1, 0)
end

# 2) Coloca el armario real (3 columnas x 2 filas) en su lugar correcto.
#    Fila superior (remate + cajonera): 573,574,575
#    Fila inferior (puertas dobles):    581,582,583
[573, 574, 575].each_with_index { |tid, i| TableCodec.set(tbl, 28 + i, 5, 1, tid) }
[581, 582, 583].each_with_index { |tid, i| TableCodec.set(tbl, 28 + i, 6, 1, tid) }

new_raw = TableCodec.encode(tbl)
map.data.instance_variable_set(:@__raw, new_raw)

# 3) Mueve el evento disparador (creado por place_wardrobe_map077.rb) al
#    nuevo centro del mueble.
ev = map.events.values.find { |e| e.name == "armario" }
raise "no se encontro el evento 'armario'" if !ev
ev.x = 29
ev.y = 6

File.open("Data/Map077.rxdata", "wb") { |f| Marshal.dump(map, f) }
puts "OK: armario reubicado en (28-30,5-6), evento ##{ev.id} movido a (#{ev.x},#{ev.y})"
