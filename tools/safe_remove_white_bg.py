"""
Version mas segura del quitado de fondo blanco: usa "erosion" antes del
flood-fill para no colarse por canales de 1 pixel de ancho hacia el
interior del dibujo.

Motivo: en POKEMANIAC_back.png, la bata del profesor es LITERALMENTE
blanco puro (255,255,255) -- el mismo color exacto que el fondo. El
flood-fill normal (conectado al borde) se filtro por el hueco entre el
brazo levantado y el hombro (un canal muy angosto) y se comio parte de
la bata, porque a nivel de color son indistinguibles. No hay umbral que
arregle esto -- hace falta un criterio TOPOLOGICO ademas del de color.

Algoritmo:
  1. "Erosionar" la mascara de blancos: un pixel blanco solo sobrevive
     la erosion si TODOS sus 4 vecinos tambien son blancos (o ya
     transparentes/fuera de imagen). Esto corta canales de 1px de ancho
     (el vecino no-blanco a un lado de un canal angosto lo elimina).
  2. Flood-fill desde el borde del frame, pero SOLO a traves de la
     mascara erosionada -- ya no puede colarse por el canal angosto
     porque la erosion lo corto.
  3. "Dilatar" el resultado 1px: cualquier pixel blanco ORIGINAL (no
     erosionado) que sea vecino de un pixel ya marcado como fondo
     tambien se marca como fondo -- esto recupera el borde real sin
     reabrir el canal (porque el canal en si nunca se marco como
     alcanzado en el paso 2).

Uso:
  python tools/safe_remove_white_bg.py <ruta.png> [--dry-run] [--threshold 235] [--frame-size 160]
"""
import argparse
import os
import shutil
from collections import deque

from PIL import Image


def is_white(p, threshold):
    r, g, b, a = p
    return a > 0 and r >= threshold and g >= threshold and b >= threshold


def erode(mask, w, h):
    eroded = [[False] * w for _ in range(h)]
    for y in range(h):
        for x in range(w):
            if not mask[y][x]:
                continue
            ok = True
            for dx, dy in ((1, 0), (-1, 0), (0, 1), (0, -1)):
                nx, ny = x + dx, y + dy
                if 0 <= nx < w and 0 <= ny < h and not mask[ny][nx]:
                    ok = False
                    break
            eroded[y][x] = ok
    return eroded


def clear_frame_safe(frame, threshold):
    w, h = frame.size
    px = frame.load()

    mask = [[is_white(px[x, y], threshold) for x in range(w)] for y in range(h)]
    eroded = erode(mask, w, h)

    reached = [[False] * w for _ in range(h)]
    q = deque()
    for x in range(w):
        for y in (0, h - 1):
            if (eroded[y][x] or px[x, y][3] == 0) and not reached[y][x]:
                reached[y][x] = True
                q.append((x, y))
    for y in range(h):
        for x in (0, w - 1):
            if (eroded[y][x] or px[x, y][3] == 0) and not reached[y][x]:
                reached[y][x] = True
                q.append((x, y))

    while q:
        x, y = q.popleft()
        for dx, dy in ((1, 0), (-1, 0), (0, 1), (0, -1)):
            nx, ny = x + dx, y + dy
            if 0 <= nx < w and 0 <= ny < h and not reached[ny][nx]:
                if eroded[ny][nx] or px[nx, ny][3] == 0:
                    reached[ny][nx] = True
                    q.append((nx, ny))

    # Dilatar 1px: cualquier blanco ORIGINAL vecino de un pixel alcanzado
    # tambien se limpia (recupera el borde real sin cruzar canales angostos)
    to_clear = set()
    for y in range(h):
        for x in range(w):
            if reached[y][x] and mask[y][x]:
                to_clear.add((x, y))
    for y in range(h):
        for x in range(w):
            if mask[y][x] and (x, y) not in to_clear:
                for dx, dy in ((1, 0), (-1, 0), (0, 1), (0, -1)):
                    nx, ny = x + dx, y + dy
                    if 0 <= nx < w and 0 <= ny < h and reached[ny][nx]:
                        to_clear.add((x, y))
                        break

    changed = 0
    for (x, y) in to_clear:
        r, g, b, a = px[x, y]
        if a != 0:
            px[x, y] = (r, g, b, 0)
            changed += 1
    return changed


def process_file(path, threshold, frame_size, dry_run):
    im = Image.open(path)
    im.load()
    im = im.convert("RGBA")
    w, h = im.size
    frames_x = w // frame_size if w % frame_size == 0 else 1

    total = 0
    for i in range(frames_x):
        box = (i * frame_size, 0, (i + 1) * frame_size, h)
        frame = im.crop(box)
        total += clear_frame_safe(frame, threshold)
        im.paste(frame, box)

    if total == 0:
        return 0

    if not dry_run:
        backup = path + ".bak_safewhitebg"
        if not os.path.exists(backup):
            shutil.copy2(path, backup)
        im.save(path)
    return total


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("path")
    ap.add_argument("--dry-run", action="store_true")
    ap.add_argument("--threshold", type=int, default=235)
    ap.add_argument("--frame-size", type=int, default=160)
    args = ap.parse_args()

    n = process_file(args.path, args.threshold, args.frame_size, args.dry_run)
    label = "DRY-RUN" if args.dry_run else "GUARDADO"
    print(f"[{label}] {args.path}: {n} pixeles vaciados")


if __name__ == "__main__":
    main()
