"""
Reemplaza la palabra "chico" (como el NPC generico se dirige al jugador)
por la etiqueta de mensaje \\pr (rol del jugador segun su outfit del
armario - ver tools/add_pr_message_tag.rb), en los 4 mapas donde aparece
escrita a mano.

Uso:
  python tools/replace_chico_with_pr.py [--dry-run]
"""
import argparse
import os
import re
import shutil
from io import BytesIO

import rubymarshal.reader as rmr
import rubymarshal.writer as rmw
from rubymarshal.classes import RubyString

PATTERN = re.compile(r"\bchico\b")
REPLACEMENT = "\\pr"
MAPS = [173, 176, 213, 223]


def fix_map(mapnum, dry_run):
    path = os.path.join("Data", f"Map{mapnum:03d}.rxdata")
    with open(path, "rb") as f:
        map_obj = rmr.load(f)

    events = map_obj.attributes.get("@events", {})
    changes = []
    for eid, event in events.items():
        for page in event.attributes.get("@pages", []):
            for cmd in page.attributes.get("@list", []):
                if cmd.attributes.get("@code") not in (101, 401, 405):
                    continue
                params = cmd.attributes.get("@parameters", [])
                if not params or not isinstance(params[0], RubyString):
                    continue
                text = str(params[0])
                if not PATTERN.search(text):
                    continue
                new_text = PATTERN.sub(lambda m: REPLACEMENT, text)
                changes.append((eid, text, new_text))
                if not dry_run:
                    params[0] = RubyString(new_text, dict(params[0].attributes))

    if not changes:
        return 0

    print(f"Map{mapnum:03d}:")
    for eid, old_text, new_text in changes:
        print(f"  evento {eid}: {old_text!r} -> {new_text!r}")

    if not dry_run:
        backup = path + ".bak_chico_to_pr"
        if not os.path.exists(backup):
            shutil.copy2(path, backup)
        buf = BytesIO()
        rmw.write(buf, map_obj)
        with open(path, "wb") as f:
            f.write(buf.getvalue())
    return len(changes)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    total = 0
    for mapnum in MAPS:
        total += fix_map(mapnum, args.dry_run)

    label = "encontrados" if args.dry_run else "arreglados"
    print(f"\n{total} cambio(s) {label} en total.")
    print("[DRY-RUN] no se guardo nada." if args.dry_run else "GUARDADO.")


if __name__ == "__main__":
    main()
