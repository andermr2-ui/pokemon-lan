# encoding: UTF-8
# Agrega un segundo punto de interaccion invisible en (29,5), la celda justo
# al norte del armario visible (29,6). Asi el jugador puede pararse en
# (29,4) -dejando un casillero libre entre el y el armario- y apretar accion
# mirando hacia abajo para abrir el mismo menu, sin quedar tapado por el
# dibujo del armario (que si el jugador estuviera pegado en (29,5) lo
# taparia casi entero, al ser mas alto que una celda).
require_relative "rpg_stubs"

map = Marshal.load(File.binread("Data/Map077.rxdata"))
template = Marshal.load(Marshal.dump(map.events[6]))  # "Calendar", pagina simple valida

new_id = map.events.keys.max + 1
ev = template
ev.id = new_id
ev.x = 29
ev.y = 5
ev.name = "armario_trigger_lejano"
page = ev.pages[0]
page.trigger = 0  # Boton de accion
page.graphic.tile_id = 0
page.graphic.character_name = ""  # invisible
page.graphic.character_hue = 0
page.direction_fix = true
page.walk_anime = false
page.step_anime = false
page.through = true  # no bloquea el paso: es solo un punto de interaccion
page.always_on_top = false
page.list = [
  begin
    cmd = RPG::EventCommand.new
    cmd.code = 355
    cmd.indent = 0
    cmd.parameters = ["CharCustom.pbAbrirArmario"]
    cmd
  end,
  begin
    cmd = RPG::EventCommand.new
    cmd.code = 0
    cmd.indent = 0
    cmd.parameters = []
    cmd
  end,
]
ev.pages = [page]
map.events[new_id] = ev

File.open("Data/Map077.rxdata", "wb") { |f| Marshal.dump(map, f) }
puts "OK: evento ##{new_id} 'armario_trigger_lejano' en (#{ev.x},#{ev.y})"
