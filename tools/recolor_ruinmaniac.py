# encoding: UTF-8
"""
Recolorea trainer_RUINMANIAC (charset y variantes de movimiento):
  - Mochila: de rojo/naranja a beige/ocre (remap global de color, seguro
    porque esos 4 tonos solo se usan en la mochila/correas en todo el
    sheet).
  - Bigote: de "56,56,24" (el mismo tono oscuro que el sombrero) a gris,
    SOLO en la franja de 12px de ancho donde esta el bigote (filas 0-2:
    abajo/izquierda/derecha), nunca en la fila 3 (espalda), donde ese
    mismo color pertenece al sombrero.
"""
from PIL import Image

BACKPACK_REMAP = {
    (144, 64, 40, 255): (150, 120, 70, 255),
    (224, 112, 80, 255): (210, 180, 130, 255),
    (120, 64, 64, 255): (100, 78, 48, 255),
    (80, 16, 0, 255): (70, 52, 28, 255),
}
MUSTACHE_OLD = (56, 56, 24, 255)
MUSTACHE_NEW = (175, 172, 165, 255)
MUSTACHE_Y = {0: (18, 19), 1: (20, 21), 2: (18, 19), 3: (20, 21)}

FILES = [
    "Graphics/Characters/trainer_RUINMANIAC.png",
    "Graphics/Characters/trainer_RUINMANIAC_run.png",
    "Graphics/Characters/trainer_RUINMANIAC_bike.png",
    "Graphics/Characters/trainer_RUINMANIAC_dive.png",
    "Graphics/Characters/trainer_RUINMANIAC_fish.png",
    "Graphics/Characters/trainer_RUINMANIAC_surf.png",
]


def process(path, skip_mustache=False):
    im = Image.open(path)
    im.load()
    im = im.convert("RGBA")
    w, h = im.size
    px = im.load()

    backpack_changed = 0
    for y in range(h):
        for x in range(w):
            p = px[x, y]
            if p in BACKPACK_REMAP:
                px[x, y] = BACKPACK_REMAP[p]
                backpack_changed += 1

    mustache_changed = 0
    if not skip_mustache:
        rows = h // 48
        cols = w // 32
        for row in range(min(3, rows)):  # nunca la fila 3 (espalda)
            for col in range(cols):
                y0, y1 = MUSTACHE_Y[col % 4]
                cell_y0 = row * 48
                # verificar que la franja tenga el ancho esperado (12px)
                # antes de tocar nada, para no arriesgarse en variantes
                # con pose distinta
                width = sum(
                    1 for x in range(col * 32 + 10, col * 32 + 22)
                    if px[x, cell_y0 + y0] == MUSTACHE_OLD
                )
                if width < 10:
                    continue
                for y in range(cell_y0 + y0, cell_y0 + y1 + 1):
                    for x in range(col * 32 + 10, col * 32 + 22):
                        if px[x, y] == MUSTACHE_OLD:
                            px[x, y] = MUSTACHE_NEW
                            mustache_changed += 1

    return im, backpack_changed, mustache_changed


if __name__ == "__main__":
    import os
    import shutil
    for path in FILES:
        backup = path + ".bak_recolor"
        if not os.path.exists(backup):
            shutil.copy2(path, backup)
        im, bp, mu = process(path)
        im.save(path)
        print(f"{path}: mochila={bp} bigote={mu}")
