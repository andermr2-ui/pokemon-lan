"""
Segunda pasada de limpieza de fondo para los back sprites de Character
Customization: baja el umbral de "blanco" del flood-fill original (235)
a uno mas permisivo, para comerse el halo de antialiasing que quedo en
los bordes (pixeles casi-blancos, ej. (233,233,243), que no llegaban al
235 pero se ven como un borde blanco pegado al dibujo).

Sigue siendo flood-fill CONECTADO AL BORDE del frame (el mismo algoritmo
seguro de remove_white_bg_backsprites.py, no el de bolsones aislados que
resulto no ser seguro) -- solo cambia el umbral. Se eligio 210 porque:
  - el tono de piel mas claro visto en estos sprites tiene canales minimos
    ~135-200 (con buen margen)
  - el halo de antialiasing detectado tiene canales minimos ~228-243
  - 210 separa ambos con margen de sobra sin arriesgar comerse piel o tela

Uso:
  python tools/fix_edge_halo_backsprites.py [--dry-run] [--threshold 210]
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
    w, h = frame.size
    px = frame.load()
    visited = [[False] * w for _ in range(h)]
    q = deque()

    for x in range(w):
        for y in (0, h - 1):
            if px[x, y][3] == 0 and not visited[y][x]:
                visited[y][x] = True
                q.append((x, y))
    for y in range(h):
        for x in (0, w - 1):
            if px[x, y][3] == 0 and not visited[y][x]:
                visited[y][x] = True
                q.append((x, y))

    changed = 0
    while q:
        x, y = q.popleft()
        for dx, dy in ((1, 0), (-1, 0), (0, 1), (0, -1)):
            nx, ny = x + dx, y + dy
            if 0 <= nx < w and 0 <= ny < h and not visited[ny][nx]:
                p = px[nx, ny]
                if p[3] == 0:
                    visited[ny][nx] = True
                    q.append((nx, ny))
                elif is_white(p, threshold):
                    visited[ny][nx] = True
                    q.append((nx, ny))
                    r, g, b, a = p
                    px[nx, ny] = (r, g, b, 0)
                    changed += 1
    return changed


def process_file(path, threshold, dry_run):
    im = Image.open(path)
    im.load()
    im = im.convert("RGBA")
    w, h = im.size
    frames_x = w // FRAME_SIZE if w % FRAME_SIZE == 0 else 1

    total = 0
    for i in range(frames_x):
        box = (i * FRAME_SIZE, 0, (i + 1) * FRAME_SIZE, h)
        frame = im.crop(box)
        total += clear_frame_background(frame, threshold)
        im.paste(frame, box)

    if total == 0:
        return 0

    if not dry_run:
        backup = path + ".bak_edgehalo"
        if not os.path.exists(backup):
            shutil.copy2(path, backup)
        im.save(path)
    return total


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    ap.add_argument("--threshold", type=int, default=210)
    args = ap.parse_args()

    files = sorted(glob.glob("Graphics/Trainers/*_back.png"))
    files = [f for f in files if "POKEMONTRAINER" not in f]

    total_files = 0
    for f in files:
        n = process_file(f, args.threshold, args.dry_run)
        if n:
            total_files += 1
            print(f"{f}: {n} pixeles vaciados")

    label = "DRY-RUN" if args.dry_run else "GUARDADO"
    print(f"\n[{label}] {total_files} archivos modificados de {len(files)} totales")


if __name__ == "__main__":
    main()
