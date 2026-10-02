import os
from PIL import Image

PACK = r"C:\Users\xarls\AppData\Local\Temp\claude\C--claudecode\c718be2e-2394-4170-9601-532f866f8ec1\scratchpad\CharCustom_extracted\pokemon png"
OUT_ROOT = r"C:\claudecode\pokemon lan\Graphics\Characters\CharacterCustomization"

# Recorte/escala ya validado visualmente con el usuario:
CROP = (14, 16, 48, 60)  # dentro de cada celda de 64x64
FACTOR = 38 / 44
BOTTOM_MARGIN = 2
CELL_IN = 64
CELL_OUT_W = 32
CELL_OUT_H = 48
GRID_COLS = 4
GRID_ROWS = 4

STATES = {
    "walk": "overworld walk",
    "run": "overworld run",
    "bike": "overworld bike",
}

# Catalogo curado. Cada entrada: id_estable -> ruta relativa dentro del
# folder de estado (sin extension, se agrega .png). "None" para hats usa
# un id 0 especial (sin archivo).
CATALOG = {
    "skin": {
        1: r"bases mf\m base light",
        2: r"bases mf\m base medium",
        3: r"bases mf\m base dark",
        4: r"bases mf\m base pale",
        5: r"bases mf\f base light",
        6: r"bases mf\f base medium",
        7: r"bases mf\f base dark",
        8: r"bases mf\f base pale",
    },
    "hair": {
        1: r"hair\boy 1\boy 1 brown",
        2: r"hair\boy 2\boy 2 black",
        3: r"hair\boy 3\boy 3 blond",
        4: r"hair\boy 4\boy 4 black",
        5: r"hair\girl 1\1 blonde",
        6: r"hair\girl 2\2 black",
        7: r"hair\girl  3\3 brown",
        8: r"hair\girl 4\4 black",
    },
    "top": {
        1: r"tops\collared shirt\collared shirt navy",
        2: r"tops\hoodie\hoodie blue",
        3: r"tops\t-shirt\t-shirt black",
        4: r"tops\tank top\tank top navy",
        5: r"tops\vest\vest black",
        6: r"tops\v-neck\v-neck black",
        7: r"tops\formal top\formal  black",
        8: r"tops\trenchcoat\trenchcoat black",
    },
    "bottom": {
        1: r"bottoms\jeans\jeans black",
        2: r"bottoms\jeans\jeans navy",
        3: r"bottoms\capris\capris black",
        4: r"bottoms\shorts\shorts black",
        5: r"bottoms\jumpsuit pants\jumpsuit pants black",
        6: r"bottoms\pants and boots\pants and boots black",
    },
    "hat": {
        1: r"hats\beanie\beanie black",
        2: r"hats\beret",
        3: r"hats\fedora",
        4: r"hats\cat",
        5: r"hats\devil",
        6: r"hats\feather hat",
    },
}


def process_sheet(src_path, dst_path):
    img = Image.open(src_path).convert("RGBA")
    out = Image.new("RGBA", (CELL_OUT_W * GRID_COLS, CELL_OUT_H * GRID_ROWS), (0, 0, 0, 0))
    for row in range(GRID_ROWS):
        for col in range(GRID_COLS):
            cell = img.crop((
                col * CELL_IN, row * CELL_IN,
                col * CELL_IN + CELL_IN, row * CELL_IN + CELL_IN,
            ))
            content = cell.crop(CROP)
            w = round((CROP[2] - CROP[0]) * FACTOR)
            h = round((CROP[3] - CROP[1]) * FACTOR)
            content = content.resize((w, h), Image.NEAREST)
            x = col * CELL_OUT_W + (CELL_OUT_W - w) // 2
            y = row * CELL_OUT_H + (CELL_OUT_H - BOTTOM_MARGIN - h)
            out.paste(content, (x, y), content)
    os.makedirs(os.path.dirname(dst_path), exist_ok=True)
    out.save(dst_path)


def main():
    report = []
    for state_key, state_folder in STATES.items():
        for category, items in CATALOG.items():
            for item_id, rel_path in items.items():
                src = os.path.join(PACK, state_folder, rel_path + ".png")
                if not os.path.exists(src):
                    report.append(f"FALTA: {src}")
                    continue
                dst = os.path.join(OUT_ROOT, state_key, category, f"{item_id}.png")
                process_sheet(src, dst)
        report.append(f"estado '{state_key}' listo")
    print("\n".join(report))


if __name__ == "__main__":
    main()
