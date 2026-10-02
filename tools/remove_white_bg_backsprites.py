"""
Elimina el fondo blanco de los back sprites de batalla generados para
Character Customization (Graphics/Trainers/*_back.png).

No hace un simple color-key global (eso rompería blancos legitimos del
sprite, como ropa o guantes). Hace flood-fill desde los bordes de CADA
frame de 160x160, marcando como transparente solo el blanco conectado
al borde -- el blanco "interior" (aislado, dentro del dibujo) queda
intacto.

Uso:
  python tools/remove_white_bg_backsprites.py [--dry-run] [--threshold 235]
"""
import argparse
import glob
import os
import shutil
from collections import deque

from PIL import Image

FRAME_SIZE = 160


def is_white(px, threshold):
    r, g, b, a = px
    return a > 0 and r >= threshold and g >= threshold and b >= threshold


def clear_frame_background(frame, threshold):
    """Flood-fill desde los bordes del frame, vacia el blanco conectado."""
    w, h = frame.size
    px = frame.load()
    visited = [[False] * w for _ in range(h)]
    q = deque()

    for x in range(w):
        for y in (0, h - 1):
            if is_white(px[x, y], threshold) and not visited[y][x]:
                visited[y][x] = True
                q.append((x, y))
    for y in range(h):
        for x in (0, w - 1):
            if is_white(px[x, y], threshold) and not visited[y][x]:
                visited[y][x] = True
                q.append((x, y))

    changed = 0
    while q:
        x, y = q.popleft()
        r, g, b, a = px[x, y]
        px[x, y] = (r, g, b, 0)
        changed += 1
        for dx, dy in ((1, 0), (-1, 0), (0, 1), (0, -1)):
            nx, ny = x + dx, y + dy
            if 0 <= nx < w and 0 <= ny < h and not visited[ny][nx]:
                if is_white(px[nx, ny], threshold):
                    visited[ny][nx] = True
                    q.append((nx, ny))
    return changed


def looks_broken(im, threshold):
    """Solo tocar archivos cuya esquina (0,0) sea blanco opaco -- el patron
    real del bug. Evita procesar sprites ya correctos (como los vanilla de
    los protagonistas) que pueden tener algun pixel blanco legitimo cerca
    del borde por antialiasing."""
    r, g, b, a = im.getpixel((0, 0))
    return a > 200 and r >= threshold and g >= threshold and b >= threshold


def process_file(path, threshold, dry_run):
    im = Image.open(path)
    im.load()  # fuerza la lectura completa y cierra el file handle (Windows
               # no deja sobreescribir un archivo que PIL todavia tiene abierto)
    im = im.convert("RGBA")
    if not looks_broken(im, threshold):
        return 0
    w, h = im.size
    if w % FRAME_SIZE != 0:
        print(f"  AVISO: {path} ancho {w} no es multiplo de {FRAME_SIZE}, se procesa igual como 1 frame")
        frames_x = 1
    else:
        frames_x = w // FRAME_SIZE

    total_changed = 0
    for i in range(frames_x):
        box = (i * FRAME_SIZE, 0, (i + 1) * FRAME_SIZE, h)
        frame = im.crop(box)
        changed = clear_frame_background(frame, threshold)
        total_changed += changed
        im.paste(frame, box)

    if total_changed == 0:
        return 0

    if not dry_run:
        backup = path + ".bak_whitebg"
        if not os.path.exists(backup):
            shutil.copy2(path, backup)
        im.save(path)
    return total_changed


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    ap.add_argument("--threshold", type=int, default=235)
    args = ap.parse_args()

    files = sorted(glob.glob("Graphics/Trainers/*_back.png"))
    total_files = 0
    for f in files:
        changed = process_file(f, args.threshold, args.dry_run)
        if changed:
            total_files += 1
            print(f"{f}: {changed} pixeles vaciados")

    label = "DRY-RUN" if args.dry_run else "GUARDADO"
    print(f"\n[{label}] {total_files} archivos modificados de {len(files)} totales")


if __name__ == "__main__":
    main()
