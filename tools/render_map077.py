import subprocess
import struct
from PIL import Image

# Extraer los bytes crudos de la tabla de tiles via ruby (stub Table = passthrough)
result = subprocess.run(
    ["ruby", "-e", '''
require_relative "tools/rpg_stubs"
map = Marshal.load(File.binread("Data/Map077.rxdata"))
raw = map.data.instance_variable_get(:@__raw)
STDOUT.binmode
STDOUT.write(raw)
'''],
    cwd=r"C:\claudecode\pokemon lan",
    capture_output=True,
)
raw = result.stdout
if len(raw) < 20:
    print("ERROR obteniendo datos:", result.stderr.decode(errors="replace"))
    raise SystemExit(1)

dim, xs, ys, zs, count = struct.unpack("<5l", raw[0:20])
items = struct.unpack(f"<{count}h", raw[20:20 + count * 2])
print(f"dim={dim} xs={xs} ys={ys} zs={zs} count={count}")

def tile_at(x, y, z):
    idx = (z * ys + y) * xs + x
    return items[idx]

tileset = Image.open(r"C:\claudecode\pokemon lan\Graphics\Tilesets\Interior general.png").convert("RGBA")
TS_COLS = tileset.width // 32

def draw_tile(canvas, tile_id, px, py):
    if tile_id < 384:
        return  # autotile: no lo dibujamos en este preview simple
    idx = tile_id - 384
    col = idx % TS_COLS
    row = idx // TS_COLS
    src = tileset.crop((col * 32, row * 32, col * 32 + 32, row * 32 + 32))
    canvas.paste(src, (px, py), src)

canvas = Image.new("RGBA", (xs * 32, ys * 32), (255, 255, 255, 255))
for z in range(zs):
    for y in range(ys):
        for x in range(xs):
            tid = tile_at(x, y, z)
            if tid and tid != 0:
                draw_tile(canvas, tid, x * 32, y * 32)

canvas = canvas.resize((canvas.width * 3, canvas.height * 3), Image.NEAREST)
canvas.save(r"C:\claudecode\pokemon lan\tools\_map077_render.png")
print("guardado, tamaño mapa:", xs, "x", ys)
