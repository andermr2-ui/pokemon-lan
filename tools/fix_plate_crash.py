"""
Arregla el crash "Intl_Messages line 482: TypeError, no implicit conversion of
Regexp into Integer" al interactuar con las "Plate" (placas antiguas) de
Ambergrove Cave (Map181).

Causa: los 5 eventos "Plate" tienen su comando "Mostrar Texto" (code 101) con
una capa extra de lista en @parameters: en vez de ["texto"], tienen [["texto"]].

IMPORTANTE: los 5 eventos comparten el MISMO objeto de texto internamente
(copiado/pegado en el editor de RPG Maker XP, Marshal lo deduplica por
referencia). rubymarshal.writer tiene un bug con referencias compartidas: si
se reasignan @parameters reusando ese mismo objeto de texto compartido en
SOLO ALGUNOS de los 5 comandos, la re-serializacion corrompe los otros
comandos que no se tocaron (les mete un EventCommand entero donde va el
texto). La solucion es usar una COPIA independiente del string (un RubyString
nuevo, no el objeto compartido) en los 5 a la vez.

Uso:
  python tools/fix_plate_crash.py [--dry-run]
"""
import argparse
import os
import shutil
from io import BytesIO

import rubymarshal.reader as rmr
import rubymarshal.writer as rmw
from rubymarshal.classes import RubyString

MAP_PATH = os.path.join("Data", "Map181.rxdata")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    with open(MAP_PATH, "rb") as f:
        map_obj = rmr.load(f)

    events = map_obj.attributes.get("@events", {})
    fixed = 0
    for eid, event in events.items():
        name = event.attributes.get("@name", b"")
        if isinstance(name, bytes):
            name = name.decode("utf-8", errors="replace")
        if name != "Plate":
            continue
        for page in event.attributes.get("@pages", []):
            for cmd in page.attributes.get("@list", []):
                if cmd.attributes.get("@code") != 101:
                    continue
                params = cmd.attributes.get("@parameters", [])
                if not (params and isinstance(params[0], list)):
                    continue
                inner = params[0][0]
                attrs = dict(inner.attributes) if isinstance(inner, RubyString) else {}
                fresh = RubyString(str(inner), attrs)
                print(f"Evento {eid}: desenvolviendo {params!r} -> [{str(inner)!r}]")
                if not args.dry_run:
                    cmd.attributes["@parameters"] = [fresh]
                fixed += 1

    print(f"{fixed} comando(s) {'encontrados' if args.dry_run else 'arreglados'}.")

    if fixed and not args.dry_run:
        if not os.path.exists(MAP_PATH + ".bak_plate_crash"):
            shutil.copy2(MAP_PATH, MAP_PATH + ".bak_plate_crash")
        buf = BytesIO()
        rmw.write(buf, map_obj)
        with open(MAP_PATH, "wb") as f:
            f.write(buf.getvalue())
        print("GUARDADO.")
    elif args.dry_run:
        print("[DRY-RUN] no se guardo nada.")


if __name__ == "__main__":
    main()
