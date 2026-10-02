"""
Renombra "Evaluador de Nombres" -> "Inspector de Motes" en el texto de los
mapas donde aparece escrito directamente (Map215, Map311).

Uso:
  python tools/rename_name_rater.py [--dry-run]
"""
import argparse
import os
import shutil
from io import BytesIO

import rubymarshal.reader as rmr
import rubymarshal.writer as rmw
from rubymarshal.classes import RubyString

OLD = "Evaluador de Nombres"
NEW = "Inspector de Motes"
MAPS = [215, 311]


def fix_map(mapnum, dry_run):
    path = os.path.join("Data", f"Map{mapnum:03d}.rxdata")
    with open(path, "rb") as f:
        map_obj = rmr.load(f)

    events = map_obj.attributes.get("@events", {})
    changes = []
    for eid, event in events.items():
        for page in event.attributes.get("@pages", []):
            for cmd in page.attributes.get("@list", []):
                params = cmd.attributes.get("@parameters", [])
                for i, p in enumerate(params):
                    if isinstance(p, RubyString) and OLD in str(p):
                        new_text = str(p).replace(OLD, NEW)
                        changes.append((eid, str(p), new_text))
                        if not dry_run:
                            params[i] = RubyString(new_text, dict(p.attributes))

    if not changes:
        return 0

    print(f"Map{mapnum:03d}:")
    for eid, old_text, new_text in changes:
        print(f"  evento {eid}: {old_text!r} -> {new_text!r}")

    if not dry_run:
        backup = path + ".bak_rename_rater"
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
    if args.dry_run:
        print("[DRY-RUN] no se guardo nada.")
    else:
        print("GUARDADO.")


if __name__ == "__main__":
    main()
