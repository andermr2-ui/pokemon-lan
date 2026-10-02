"""
Para cada personaje del catalogo:
- Verifica que el sprite de walk existe y tiene animacion real (frames distintos).
- Si anima: copia el walk como _run, _bike, _surf, _dive, _fish
  (solo los que no existan ya para no pisar trabajo manual).
- Imprime un resumen al final.
"""
import shutil
from pathlib import Path
from PIL import Image

CHARS_DIR = Path(__file__).parent.parent / "Graphics" / "Characters"
FRAME_W, FRAME_H = 32, 48
SUFFIXES = ["run", "bike", "surf", "dive", "fish"]

CATALOG = [
    "NPC 01", "NPC 02", "NPC 03", "NPC 04", "NPC 05", "NPC 06", "NPC 07",
    "NPC 08", "NPC 09", "NPC 10", "NPC 11", "NPC 12", "NPC 13", "NPC 14",
    "NPC 15", "NPC 16", "NPC 17", "NPC 18", "NPC 19", "NPC 20", "NPC 21",
    "NPC 22", "NPC 23", "NPC 24", "NPC 25", "NPC 26", "NPC 27", "NPC 28",
    "trainer_POKEMONTRAINER_Red", "trainer_POKEMONTRAINER_Leaf",
    "trainer_POKEMONTRAINER_Brendan", "trainer_POKEMONTRAINER_May",
    "trainer_AROMALADY", "trainer_BEAUTY", "trainer_BIRDKEEPER",
    "trainer_BLACKBELT", "trainer_BUGCATCHER", "trainer_BURGLAR",
    "trainer_CAMPER", "trainer_CHANNELER", "trainer_COOLTRAINER_F",
    "trainer_COOLTRAINER_M", "trainer_CRUSHGIRL", "trainer_ENGINEER",
    "trainer_FISHERMAN", "trainer_GAMBLER", "trainer_GENTLEMAN",
    "trainer_HIKER", "trainer_JUGGLER", "trainer_LADY", "trainer_LASS",
    "trainer_PAINTER", "trainer_PICNICKER", "trainer_POKEMANIAC",
    "trainer_POKEMONBREEDER", "trainer_POKEMONRANGER_F",
    "trainer_POKEMONRANGER_M", "trainer_PROFESSOR", "trainer_PSYCHIC_F",
    "trainer_PSYCHIC_M", "trainer_ROCKER", "trainer_RUINMANIAC",
    "trainer_SAILOR", "trainer_SCIENTIST", "trainer_SUPERNERD",
    "trainer_SWIMMER2_F", "trainer_SWIMMER2_M", "trainer_SWIMMER_F",
    "trainer_SWIMMER_M", "trainer_TAMER", "trainer_TUBER2_F",
    "trainer_TUBER2_M", "trainer_TUBER_F", "trainer_TUBER_M",
    "trainer_TWINS", "trainer_YOUNGCOUPLE", "trainer_YOUNGCOUPLE_2",
    "trainer_YOUNGSTER",
]

def frames_of_row(img: Image.Image, row: int) -> list:
    return [
        img.crop((col * FRAME_W, row * FRAME_H,
                  (col + 1) * FRAME_W, (row + 1) * FRAME_H)).tobytes()
        for col in range(4)
    ]

def has_animation(img: Image.Image) -> bool:
    # Compara frame 0 y frame 2 de la fila sur (fila 0).
    # Si son idénticos en todas las filas, el sprite es estático.
    for row in range(4):
        frames = frames_of_row(img, row)
        if len(set(frames)) > 1:
            return True
    return False

ok, missing, static, already = [], [], [], []

for name in CATALOG:
    src = CHARS_DIR / f"{name}.png"

    if not src.exists():
        missing.append(name)
        continue

    img = Image.open(src).convert("RGBA")
    w, h = img.size

    # Verificar dimensiones mínimas
    if w < FRAME_W * 4 or h < FRAME_H * 4:
        static.append(f"{name} (dimension {w}x{h})")
        continue

    if not has_animation(img):
        static.append(name)
        continue

    # Copiar como variantes (no pisar si ya existen)
    copied = []
    skipped = []
    for suffix in SUFFIXES:
        dst = CHARS_DIR / f"{name}_{suffix}.png"
        if dst.exists():
            skipped.append(suffix)
        else:
            shutil.copy2(src, dst)
            copied.append(suffix)

    ok.append((name, copied, skipped))

# --- Resumen ---
print(f"\n{'='*60}")
print(f"PROCESADOS CON ANIMACION: {len(ok)}")
for name, copied, skipped in ok:
    parts = []
    if copied:  parts.append(f"copiados: {', '.join(copied)}")
    if skipped: parts.append(f"ya existian: {', '.join(skipped)}")
    print(f"  {name}: {' | '.join(parts)}")

if static:
    print(f"\nESTATICOS (sin animacion — no se copiaron): {len(static)}")
    for s in static:
        print(f"  {s}")

if missing:
    print(f"\nNO ENCONTRADOS (archivo no existe): {len(missing)}")
    for m in missing:
        print(f"  {m}")

print(f"\nTOTAL: {len(ok)} OK | {len(static)} estaticos | {len(missing)} faltantes")
