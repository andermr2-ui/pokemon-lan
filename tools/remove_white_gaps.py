"""
Segunda pasada sobre los back sprites ya procesados por
remove_white_bg_backsprites.py: vacia bolsones de blanco AISLADOS
(no conectados al borde del frame), tipicos de huecos anatomicos donde
el fondo blanco quedo atrapado entre brazo/torso/pierna.

Umbral bajo (min-size=2) a proposito: en un back sprite (vista de espalda
o 3/4), perder un highlight blanco puntual de 2-5px es practicamente
invisible a la escala en la que se ve en batalla; en cambio dejar un
hueco blanco de fondo es muy visible (como en el caso del Fisherman).

Uso:
  python tools/remove_white_gaps.py [--dry-run] [--min-size 2]
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


def clear_isolated(frame, threshold, min_size):
    w, h = frame.size
    px = frame.load()
    visited = [[False] * w for _ in range(h)]
    total_cleared = 0
    for y in range(h):
        for x in range(w):
            if not is_white(px[x, y], threshold) or visited[y][x]:
                continue
            comp = []
            q = deque([(x, y)])
            visited[y][x] = True
            touches_border = False
            while q:
                cx, cy = q.popleft()
                comp.append((cx, cy))
                if cx in (0, w - 1) or cy in (0, h - 1):
                    touches_border = True
                for dx, dy in ((1, 0), (-1, 0), (0, 1), (0, -1)):
                    nx, ny = cx + dx, cy + dy
                    if 0 <= nx < w and 0 <= ny < h and not visited[ny][nx] and is_white(px[nx, ny], threshold):
                        visited[ny][nx] = True
                        q.append((nx, ny))
            if not touches_border and len(comp) >= min_size:
                for (cx, cy) in comp:
                    r, g, b, a = px[cx, cy]
                    px[cx, cy] = (r, g, b, 0)
                total_cleared += len(comp)
    return total_cleared


def process_file(path, threshold, min_size, dry_run):
    im = Image.open(path)
    im.load()
    im = im.convert("RGBA")
    w, h = im.size
    frames_x = w // FRAME_SIZE if w % FRAME_SIZE == 0 else 1

    total = 0
    for i in range(frames_x):
        box = (i * FRAME_SIZE, 0, (i + 1) * FRAME_SIZE, h)
        frame = im.crop(box)
        total += clear_isolated(frame, threshold, min_size)
        im.paste(frame, box)

    if total == 0:
        return 0

    if not dry_run:
        backup = path + ".bak_whitegaps"
        if not os.path.exists(backup):
            shutil.copy2(path, backup)
        im.save(path)
    return total


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    ap.add_argument("--threshold", type=int, default=235)
    ap.add_argument("--min-size", type=int, default=2)
    args = ap.parse_args()

    files = sorted(glob.glob("Graphics/Trainers/*_back.png"))
    # Los 4 sprites vanilla del protagonista (Red/Leaf/Brendan/May) ya estan
    # bien -- tienen blancos legitimos y grandes (remera, medias) que un
    # flood-fill de "cualquier blanco aislado" destruiria por error. Solo
    # tocar los back sprites generados para Character Customization.
    files = [f for f in files if "POKEMONTRAINER" not in f]
    total_files = 0
    for f in files:
        n = process_file(f, args.threshold, args.min_size, args.dry_run)
        if n:
            total_files += 1
            print(f"{f}: {n} pixeles vaciados")

    label = "DRY-RUN" if args.dry_run else "GUARDADO"
    print(f"\n[{label}] {total_files} archivos modificados de {len(files)} totales")


if __name__ == "__main__":
    main()
