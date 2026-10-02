"""
Arregla el crash real "Intl_Messages line 482: TypeError, no implicit
conversion of Regexp into Integer" en el evento QuizGuy (Map182, evento 3).

Causa: varias ramas de "respuesta incorrecta" del quiz tienen un comando
"Mostrar Texto" (code 101) CORRUPTO - en vez de un string en @parameters[0],
tiene un objeto RPG::EventCommand vacio anidado (bug clasico del editor de
RPG Maker XP al dejar un cuadro de mensaje en blanco sin escribir texto).
Cuando el motor intenta traducir/mostrar ese "texto" que en realidad no es
un String, Translation.stringToKey (Intl_Messages linea 482) explota.

Fix: reemplaza cada comando 101 corrupto por el mismo texto de "respuesta
incorrecta" que ya usa la primera pregunta (la unica que quedo bien escrita).

Uso:
  python tools/fix_quizguy_crash.py [--dry-run]
"""
import argparse
import os
import shutil
from io import BytesIO

import rubymarshal.reader as rmr
import rubymarshal.writer as rmw
from rubymarshal.classes import RubyString

CORRECT_TEXT = "\\bLo siento, pero esa es la respuesta incorrecta."


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    path = os.path.join("Data", "Map182.rxdata")
    with open(path, "rb") as f:
        map_obj = rmr.load(f)

    events = map_obj.attributes.get("@events", {})
    event = events[3]
    pages = event.attributes.get("@pages", [])
    page = pages[0]
    cmd_list = page.attributes.get("@list", [])

    # Tomamos los atributos de un RubyString real ya existente en este mismo
    # evento para que el nuevo string quede con el mismo formato de encoding.
    template_attrs = None
    for cmd in cmd_list:
        if cmd.attributes.get("@code") != 101:
            continue
        params = cmd.attributes.get("@parameters", [])
        if params and isinstance(params[0], RubyString):
            template_attrs = params[0].attributes
            break
    if template_attrs is None:
        raise RuntimeError("No se encontro ningun RubyString de referencia en el evento")

    fixed = 0
    for cmd in cmd_list:
        if cmd.attributes.get("@code") != 101:
            continue
        params = cmd.attributes.get("@parameters", [])
        if not params or isinstance(params[0], RubyString):
            continue
        print(f"Comando corrupto encontrado: parameters={params!r}")
        if not args.dry_run:
            cmd.attributes["@parameters"] = [RubyString(CORRECT_TEXT, template_attrs)]
        fixed += 1

    print(f"{fixed} comando(s) corrupto(s) {'encontrados' if args.dry_run else 'arreglados'}.")

    if fixed and not args.dry_run:
        shutil.copy2(path, path + ".bak_quizguy_crash")
        buf = BytesIO()
        rmw.write(buf, map_obj)
        with open(path, "wb") as f:
            f.write(buf.getvalue())
        print("GUARDADO.")
    elif args.dry_run:
        print("[DRY-RUN] no se guardo nada.")


if __name__ == "__main__":
    main()
