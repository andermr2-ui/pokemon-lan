"""
Mueve todas las megapiedras (item con Flags que incluye "MegaStone") del
bolsillo 1 (Objetos) al bolsillo 10 (nuevo, dedicado - ver plugin
"Mega Stone Pocket"). Actualiza tanto el dato compilado (Data/items.dat, lo
que el juego realmente lee) como PBS/items.txt (para que quede sincronizado
si alguna vez se recompila el PBS a mano).

Uso:
  python tools/move_megastones_to_new_pocket.py [--dry-run]
"""
import argparse
import re
import shutil
from io import BytesIO

import rubymarshal.reader as rmr
import rubymarshal.writer as rmw

NEW_POCKET = 10


def fix_items_dat(dry_run):
    path = "Data/items.dat"
    with open(path, "rb") as f:
        data = rmr.load(f)

    changed = []
    for key, item in data.items():
        flags = item.attributes.get("@flags") or []
        if "MegaStone" not in flags:
            continue
        old_pocket = item.attributes.get("@pocket")
        if old_pocket == NEW_POCKET:
            continue
        changed.append((key, old_pocket))
        if not dry_run:
            item.attributes["@pocket"] = NEW_POCKET

    print(f"{path}: {len(changed)} megapiedra(s) {'encontradas' if dry_run else 'movidas'}.")
    for key, old_pocket in changed[:5]:
        print(f"  {key}: pocket {old_pocket} -> {NEW_POCKET}")
    if len(changed) > 5:
        print(f"  ... y {len(changed) - 5} mas")

    if changed and not dry_run:
        backup = path + ".bak_megastone_pocket"
        import os
        if not os.path.exists(backup):
            shutil.copy2(path, backup)
        buf = BytesIO()
        rmw.write(buf, data)
        with open(path, "wb") as f:
            f.write(buf.getvalue())
    return len(changed)


def fix_pbs_items(dry_run):
    path = "PBS/items.txt"
    with open(path, "r", encoding="utf-8") as f:
        text = f.read()

    # Recorrer bloques [SYMBOL] ... hasta el proximo "#---" o "[" y, si el
    # bloque tiene "Flags = ...MegaStone..." y "Pocket = 1", cambiarlo a 10.
    blocks = re.split(r"(?=^\[)", text, flags=re.M)
    changed = 0
    new_blocks = []
    for block in blocks:
        if "MegaStone" in block and re.search(r"^Pocket\s*=\s*1\s*$", block, re.M):
            block = re.sub(r"^Pocket\s*=\s*1\s*$", f"Pocket = {NEW_POCKET}", block, flags=re.M)
            changed += 1
        new_blocks.append(block)

    print(f"{path}: {changed} bloque(s) {'encontrados' if dry_run else 'cambiados'}.")

    if changed and not dry_run:
        backup = path + ".bak_megastone_pocket"
        import os
        if not os.path.exists(backup):
            shutil.copy2(path, backup)
        with open(path, "w", encoding="utf-8") as f:
            f.write("".join(new_blocks))
    return changed


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    n1 = fix_items_dat(args.dry_run)
    n2 = fix_pbs_items(args.dry_run)
    print("[DRY-RUN] no se guardo nada." if args.dry_run else f"GUARDADO ({n1} + {n2}).")


if __name__ == "__main__":
    main()
