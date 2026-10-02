"""
Reemplaza el simbolo Euro "€" por "$" en los comandos de evento de un mapa,
donde sea que aparezca (texto de dialogo, opciones de "Mostrar Opciones",
etc.) - la fuente bitmap de este proyecto no tiene glifo para "€", asi que
se veia roto (parecia un caracter extra tipo "0").

Uso:
  python tools/fix_casino_euro_symbol.py [--dry-run] --map 263
"""
import argparse
import os
import shutil
from io import BytesIO

import rubymarshal.reader as rmr
import rubymarshal.writer as rmw
from rubymarshal.classes import RubyString


def make_ruby_string(text, original):
    return RubyString(text, original.attributes)


def fix_value(value, changes, dry_run):
    """Revisa un valor de parametro (RubyString, o lista que puede contener
    RubyStrings anidados) y reemplaza € por $. Retorna el valor (nuevo o
    igual) y si hubo cambio via `changes`."""
    if isinstance(value, RubyString):
        text = str(value)
        if "€" not in text:
            return value
        new_text = text.replace("€", "$")
        changes.append((text, new_text))
        if dry_run:
            return value
        return make_ruby_string(new_text, value)
    if isinstance(value, list):
        return [fix_value(v, changes, dry_run) for v in value]
    return value


def process_command_list(cmd_list, changes, dry_run):
    modified = False
    for cmd in cmd_list:
        if not hasattr(cmd, "attributes"):
            continue
        params = cmd.attributes.get("@parameters")
        if not params:
            continue
        for i, param in enumerate(params):
            fixed = fix_value(param, changes, dry_run)
            if fixed is not param and not dry_run:
                params[i] = fixed
                modified = True
    return modified


def walk_events(map_obj, changes, dry_run):
    modified = False
    events = map_obj.attributes.get("@events", {})
    for event in events.values():
        if not hasattr(event, "attributes"):
            continue
        pages = event.attributes.get("@pages", [])
        for page in pages:
            if not hasattr(page, "attributes"):
                continue
            cmd_list = page.attributes.get("@list", [])
            if process_command_list(cmd_list, changes, dry_run):
                modified = True
    return modified


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    ap.add_argument("--map", type=int, required=True)
    args = ap.parse_args()

    path = os.path.join("Data", f"Map{args.map:03d}.rxdata")
    with open(path, "rb") as f:
        map_obj = rmr.load(f)

    changes = []
    modified = walk_events(map_obj, changes, args.dry_run)

    if not changes:
        print(f"Map{args.map:03d}: no se encontro ningun '€' en comandos de evento.")
        return

    print(f"Map{args.map:03d}: {len(changes)} cambio(s)")
    for old, new in changes:
        print(f"  - ANTES: {old}")
        print(f"    AHORA: {new}")

    if not args.dry_run and modified:
        shutil.copy2(path, path + ".bak_euro_fix")
        buf = BytesIO()
        rmw.write(buf, map_obj)
        with open(path, "wb") as f:
            f.write(buf.getvalue())
        print("GUARDADO.")
    elif args.dry_run:
        print("[DRY-RUN] no se guardo nada.")


if __name__ == "__main__":
    main()
