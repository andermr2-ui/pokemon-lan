# encoding: UTF-8
require_relative "rpg_stubs"
require_relative "table_codec"

map = Marshal.load(File.binread("Data/Map077.rxdata"))
raw = map.data.instance_variable_get(:@__raw)
tbl = TableCodec.decode(raw)

# Armario (2x2 celdas, capa de "objetos" z=1), a la derecha de la alfombra,
# a la misma altura que la cama.
TableCodec.set(tbl, 29, 6, 1, 573)
TableCodec.set(tbl, 30, 6, 1, 574)
TableCodec.set(tbl, 29, 7, 1, 581)
TableCodec.set(tbl, 30, 7, 1, 582)

new_raw = TableCodec.encode(tbl)
map.data.instance_variable_set(:@__raw, new_raw)

def make_cmd(code, indent, params)
  cmd = RPG::EventCommand.new
  cmd.code = code
  cmd.indent = indent
  cmd.parameters = params
  cmd
end

# Evento invisible sobre el armario que abre el menu de personalizacion
# (mismo patron simple ya usado para Mama/PC: una linea de sabor + llamada
# a script, sin ramas de Si/No para no arriesgar una estructura de choice
# mal formada).
new_id = map.events.keys.max + 1

# Clonamos un evento simple ya existente (el "Calendar", un objeto con una
# sola pagina sin condiciones raras) como plantilla, para heredar objetos
# Condition/Graphic/MoveRoute ya validos tal cual los espera el motor real,
# en vez de intentar adivinar sus valores por defecto desde cero.
template = Marshal.load(Marshal.dump(map.events[6]))
ev = template
ev.id = new_id
ev.x = 29
ev.y = 7
ev.name = "armario"
page = ev.pages[0]
page.trigger = 0  # Boton de accion
page.graphic.character_name = ""  # invisible: el grafico ya esta pintado en el tile
page.list = [
  make_cmd(101, 0, ["\\bEs tu armario. Puedes cambiarte de ropa aquí."]),
  make_cmd(355, 0, ["CharCustom.pbAbrirArmario"]),
  make_cmd(0, 0, []),
]
ev.pages = [page]
map.events[new_id] = ev

File.open("Data/Map077.rxdata", "wb") { |f| Marshal.dump(map, f) }
puts "OK: armario colocado en (29,7)-(30,7), evento ##{new_id}"
