"""
Quita el fondo blanco de un charset de overworld (grilla de celdas de
32x48), con el mismo algoritmo seguro (flood-fill conectado al borde de
cada celda) usado para los back sprites de batalla.

Uso:
  python tools/remove_white_bg_charset.py <ruta.png> [--dry-run] [--threshold 210]
"""
import argparse
import os
import shutil
from collections import deque

from PIL import Image

CELL_W = 32
CELL_H = 48


def is_white(p, threshold):
    r, g, b, a = p
    return a > 0 and r >= threshold and g >= threshold and b >= threshold


def clear_cell_background(cell, threshold):
    w, h = cell.size
    px = cell.load()
    visited = [[False] * w for _ in range(h)]
    q = deque()

    for x in range(w):
        for y in (0, h - 1):
            p = px[x, y]
            if (p[3] == 0 or is_white(p, threshold)) and not visited[y][x]:
                visited[y][x] = True
                q.append((x, y))
    for y in range(h):
        for x in (0, w - 1):
            p = px[x, y]
            if (p[3] == 0 or is_white(p, threshold)) and not visited[y][x]:
                visited[y][x] = True
                q.append((x, y))

    changed = 0
    while q:
        x, y = q.popleft()
        r, g, b, a = px[x, y]
        if a != 0:
            px[x, y] = (r, g, b, 0)
            changed += 1
        for dx, dy in ((1, 0), (-1, 0), (0, 1), (0, -1)):
            nx, ny = x + dx, y + dy
            if 0 <= nx < w and 0 <= ny < h and not visited[ny][nx]:
                p = px[nx, ny]
                if p[3] == 0 or is_white(p, threshold):
                    visited[ny][nx] = True
                    q.append((nx, ny))
    return changed


def process_file(path, threshold, dry_run):
    im = Image.open(path)
    im.load()
    im = im.convert("RGBA")
    w, h = im.size
    cols = w // CELL_W
    rows = h // CELL_H

    total = 0
    for row in range(rows):
        for col in range(cols):
            box = (col * CELL_W, row * CELL_H, (col + 1) * CELL_W, (row + 1) * CELL_H)
            cell = im.crop(box)
            total += clear_cell_background(cell, threshold)
            im.paste(cell, box)

    if total == 0:
        return 0

    if not dry_run:
        backup = path + ".bak_whitebg"
        if not os.path.exists(backup):
            shutil.copy2(path, backup)
        im.save(path)
    return total


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("path")
    ap.add_argument("--dry-run", action="store_true")
    ap.add_argument("--threshold", type=int, default=210)
    args = ap.parse_args()

    n = process_file(args.path, args.threshold, args.dry_run)
    label = "DRY-RUN" if args.dry_run else "GUARDADO"
    print(f"[{label}] {args.path}: {n} pixeles vaciados")


if __name__ == "__main__":
    main()
