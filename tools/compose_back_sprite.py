"""
Convierte imagenes en back sprites para PE v21.1 (800x160, 5 frames de 160x160).

MODO 1 — Una imagen con 5 poses (raw de Gemini, strip o grid):
  python tools/compose_back_sprite.py imagen.png TRAINER_TYPE

MODO 2 — Varias imagenes raw con 1-2 poses cada una:
  python tools/compose_back_sprite.py raw1.png raw2.png raw3.png TRAINER_TYPE

MODO 3 — Strip ya armado con N frames exactos:
  python tools/compose_back_sprite.py --strip N strip.png TRAINER_TYPE

FLAG EDICION — genera tambien una copia con lineas guia discontinuas:
  python tools/compose_back_sprite.py imagen.png TRAINER_TYPE --guide

Ejemplos:
  python tools/compose_back_sprite.py "gemini/birdkeeper.png" BIRDKEEPER
  python tools/compose_back_sprite.py raw1.png raw2.png raw3.png NURSE
  python tools/compose_back_sprite.py --strip 5 "Graphics/enfermeras joy.png" NURSE

Output: Graphics/Trainers/TRAINER_TYPE_back.png
         Graphics/Trainers/TRAINER_TYPE_back_edit.png  (solo con --guide)
"""

import sys
from pathlib import Path
import numpy as np
from PIL import Image

sys.stdout.reconfigure(encoding="utf-8")

FRAME_W = 160
FRAME_H = 160
NUM_FRAMES = 5
OUT_DIR = Path("Graphics/Trainers")

WHITE_THRESH = 235


def find_bounds(arr: np.ndarray, padding: int = 6):
    """Devuelve (x0,y0,x1,y1) del bounding box de contenido no-blanco."""
    rgb = arr[:, :, :3]
    alpha = arr[:, :, 3] if arr.shape[2] == 4 else np.full(arr.shape[:2], 255)
    is_bg = (np.all(rgb >= WHITE_THRESH, axis=2)) | (alpha < 20)
    mask = ~is_bg
    rows = np.where(np.any(mask, axis=1))[0]
    cols = np.where(np.any(mask, axis=0))[0]
    if len(rows) == 0 or len(cols) == 0:
        return None
    h, w = arr.shape[:2]
    y0 = max(rows[0] - padding, 0)
    y1 = min(rows[-1] + padding + 1, h)
    x0 = max(cols[0] - padding, 0)
    x1 = min(cols[-1] + padding + 1, w)
    return x0, y0, x1, y1


def fit_to_frame(sprite: Image.Image) -> Image.Image:
    """Escala el sprite para que quepa en FRAME_W x FRAME_H y lo centra."""
    sprite = sprite.convert("RGBA")
    sprite.thumbnail((FRAME_W, FRAME_H), Image.NEAREST)
    frame = Image.new("RGBA", (FRAME_W, FRAME_H), (255, 255, 255, 255))
    x = (FRAME_W - sprite.width) // 2
    y = (FRAME_H - sprite.height) // 2
    frame.paste(sprite, (x, y), sprite)
    return frame


def _trim_isolated(col_pixels: np.ndarray, pct: float = 0.02):
    """
    Devuelve (left, right) — indices relativos al array — recortando columnas
    que representen menos de `pct` del contenido total en cada extremo.
    Esto excluye pokeballs flotantes aisladas lejos del personaje.
    """
    total = col_pixels.sum()
    if total == 0:
        return 0, len(col_pixels)
    cumsum = np.cumsum(col_pixels)
    threshold = total * pct
    left = int(np.searchsorted(cumsum, threshold))
    right = int(np.searchsorted(cumsum, total - threshold))
    return left, right


def _find_split_points(col_pixels: np.ndarray, n: int = 5) -> list[int]:
    """
    Encuentra n-1 puntos de corte en col_pixels buscando gaps (valles de contenido).
    Si no hay exactamente n-1 gaps claros, cae en division igual.
    Devuelve lista de n+1 posiciones (incluyendo 0 y len).
    """
    w = len(col_pixels)
    if w == 0:
        return list(range(n + 1))

    # Suavizar para eliminar ruido de 1-2px
    ks = max(3, w // 80)
    kernel = np.ones(ks) / ks
    smoothed = np.convolve(col_pixels.astype(float), kernel, mode='same')

    peak = smoothed.max()
    if peak == 0:
        return [i * w // n for i in range(n + 1)]

    # Gaps: columnas con menos del 12% del pico
    is_gap = smoothed <= peak * 0.12
    changes = np.diff(is_gap.astype(int))
    gs = list(np.where(changes == 1)[0] + 1)
    ge = list(np.where(changes == -1)[0] + 1)
    if is_gap[0]:  gs = [0] + gs
    if is_gap[-1]: ge = ge + [w]
    gaps = list(zip(gs, ge))

    need = n - 1
    if len(gaps) >= need:
        # Tomar los `need` gaps mas anchos
        best = sorted(sorted(gaps, key=lambda g: g[1] - g[0], reverse=True)[:need],
                      key=lambda g: g[0])
        mids = [(s + e) // 2 for s, e in best]
        return [0] + mids + [w]
    else:
        # Fallback: division igual
        return [i * w // n for i in range(n + 1)]


def as_5_strip(img: Image.Image) -> list[Image.Image]:
    """
    Metodo robusto para imagenes de Gemini con 5 poses (strip o grid).
    1. Encuentra el bbox de contenido
    2. Recorta extremos con < 2% del contenido (pokeballs aisladas)
    3. Detecta gaps naturales entre los 5 sprites para partir ahi
    4. Si no hay gaps claros, divide en 5 partes iguales
    """
    arr = np.array(img.convert("RGBA"))
    bounds = find_bounds(arr, padding=4)
    if bounds is None:
        return []
    x0, y0, x1, y1 = bounds

    # Proyectar contenido en eje X
    region = arr[y0:y1, x0:x1]
    rgb = region[:, :, :3]
    alpha = region[:, :, 3] if region.shape[2] == 4 else np.full(region.shape[:2], 255)
    is_bg = (np.all(rgb >= WHITE_THRESH, axis=2)) | (alpha < 20)
    col_pixels = np.sum(~is_bg, axis=0)

    # Excluir elementos aislados en los extremos
    lt, rt = _trim_isolated(col_pixels)
    adj_x0 = x0 + lt
    adj_x1 = x0 + rt

    # Encontrar puntos de corte optimos dentro del area ajustada
    col_trimmed = col_pixels[lt:rt]
    split_pts = _find_split_points(col_trimmed, n=5)

    frames = []
    for i in range(5):
        sx0 = adj_x0 + split_pts[i]
        sx1 = adj_x0 + split_pts[i + 1]
        col = img.crop((sx0, y0, sx1, y1))
        frames.append(fit_to_frame(col))

    return frames


def halves(img: Image.Image) -> list[Image.Image]:
    """Divide una imagen con 2 sprites en mitad izquierda y derecha."""
    w, h = img.size
    return [img.crop((0, 0, w // 2, h)), img.crop((w // 2, 0, w, h))]


def crop_sprite(img: Image.Image) -> Image.Image | None:
    """Recorta el sprite del fondo blanco. Devuelve None si no hay nada."""
    arr = np.array(img.convert("RGBA"))
    bounds = find_bounds(arr)
    if bounds is None:
        return None
    x0, y0, x1, y1 = bounds
    return img.crop((x0, y0, x1, y1))


def extract_frames_multi(paths: list[Path]) -> list[Image.Image]:
    """
    Para multiples imagenes raw (cada una con 1-2 poses).
    Detecta si cada imagen tiene 1 o 2 sprites y los extrae.
    """
    frames = []
    for path in paths:
        img = Image.open(path).convert("RGBA")
        w, h = img.size
        if w > h * 1.4 and w > 400:
            parts = halves(img)
        elif 0.8 < w / h < 1.3 and w > 400:
            parts = halves(img)
        else:
            parts = [img]

        for part in parts:
            cropped = crop_sprite(part)
            if cropped is not None:
                frames.append(fit_to_frame(cropped))

    return frames


def add_frame_guides(sheet: Image.Image, dash: int = 5, gap: int = 4) -> Image.Image:
    """
    Devuelve una copia del spritesheet con lineas verticales discontinuas
    en cada borde de frame (magenta, 1px). Solo para edicion manual.
    """
    from PIL import ImageDraw
    guide = sheet.copy().convert("RGBA")
    draw = ImageDraw.Draw(guide)
    h = guide.height
    color = (220, 0, 220, 255)  # magenta solido
    for i in range(1, NUM_FRAMES):
        x = i * FRAME_W
        y = 0
        while y < h:
            draw.line([(x, y), (x, min(y + dash - 1, h - 1))], fill=color, width=1)
            y += dash + gap
    return guide


def compose_sheet(frames: list[Image.Image], output: Path, with_guide: bool = False):
    """Arma el spritesheet 800x160 de 5 frames y lo guarda."""
    if not frames:
        print("ERROR: no se encontraron sprites.")
        sys.exit(1)

    result = [frames[i % len(frames)] for i in range(NUM_FRAMES)]

    sheet = Image.new("RGBA", (FRAME_W * NUM_FRAMES, FRAME_H), (255, 255, 255, 255))
    for i, frame in enumerate(result):
        frame = frame.convert("RGBA")
        sheet.paste(frame, (i * FRAME_W, 0), frame)

    output.parent.mkdir(parents=True, exist_ok=True)
    sheet.save(str(output))
    print(f"OK  ({sheet.width}x{sheet.height})  ->  {output}")

    if with_guide:
        guide_path = output.with_name(output.stem + "_edit.png")
        add_frame_guides(sheet).save(str(guide_path))
        print(f"Guia ({sheet.width}x{sheet.height})  ->  {guide_path}")


def frames_from_strip(path: Path, n: int) -> list[Image.Image]:
    """Divide un strip horizontal exacto en n frames iguales."""
    img = Image.open(path).convert("RGBA")
    w, h = img.size
    fw = w // n
    frames = []
    for i in range(n):
        frame = img.crop((i * fw, 0, (i + 1) * fw, h))
        frame = frame.resize((FRAME_W, FRAME_H), Image.LANCZOS)
        frames.append(frame)
    return frames


def main():
    args = sys.argv[1:]

    # Extraer flag --guide si esta presente
    with_guide = "--guide" in args
    args = [a for a in args if a != "--guide"]

    if len(args) < 2:
        print(__doc__)
        sys.exit(1)

    # Modo --strip N archivo.png TRAINER_TYPE
    if args[0] == "--strip":
        if len(args) < 4:
            print("Uso: --strip N archivo.png TRAINER_TYPE")
            sys.exit(1)
        n = int(args[1])
        strip_path = Path(args[2])
        trainer_type = args[3]
        if not strip_path.exists():
            print(f"Archivo no encontrado: {strip_path}")
            sys.exit(1)
        frames = frames_from_strip(strip_path, n)
        print(f"Frames desde strip: {len(frames)}")

    else:
        trainer_type = args[-1]
        image_paths = [Path(p) for p in args[:-1]]
        missing = [p for p in image_paths if not p.exists()]
        if missing:
            print("Archivos no encontrados:", *missing)
            sys.exit(1)

        if len(image_paths) == 1:
            img = Image.open(image_paths[0]).convert("RGBA")
            print(f"Imagen: {image_paths[0].name}  ({img.width}x{img.height})")
            frames = as_5_strip(img)
            print(f"Frames extraidos: {len(frames)}")
        else:
            frames = extract_frames_multi(image_paths)
            print(f"Poses detectadas: {len(frames)}")

    output = OUT_DIR / f"{trainer_type}_back.png"
    compose_sheet(frames, output, with_guide=with_guide)


if __name__ == "__main__":
    main()
