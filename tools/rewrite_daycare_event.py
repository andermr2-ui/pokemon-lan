"""
Reemplaza el evento "Day Care Lady" (Map267, evento 3, pagina 0) por una
version minima: saludo + una sola llamada a DayCareUI.pbMainMenu, que maneja
TODA la interaccion (dejar/retirar/revisar parejas) en Ruby, en el nuevo
plugin "Day Care Expansion". Reemplaza el arbol de ramas hardcodeado para
"maximo 2 Pokemon" que tenia el evento original (y que ademas tenia 4
comandos corruptos con el mismo bug que el quiz de Ambergrove).

Uso:
  python tools/rewrite_daycare_event.py [--dry-run]
"""
import argparse
import shutil
from io import BytesIO

import rubymarshal.reader as rmr
import rubymarshal.writer as rmw
from rubymarshal.classes import RubyObject, RubyString

PATH = "Data/Map267.rxdata"


def make_cmd(code, indent, params, attrs_template):
    fixed_params = []
    for p in params:
        if isinstance(p, str):
            fixed_params.append(RubyString(p, dict(attrs_template)))
        else:
            fixed_params.append(p)
    return RubyObject("RPG::EventCommand", {
        "@code": code,
        "@indent": indent,
        "@parameters": fixed_params,
    })


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    with open(PATH, "rb") as f:
        map_obj = rmr.load(f)

    events = map_obj.attributes.get("@events", {})
    event = events[3]
    name = event.attributes.get("@name", b"")
    if isinstance(name, bytes):
        name = name.decode("utf-8", errors="replace")
    assert name == "Day Care Lady", f"evento inesperado: {name!r}"

    page = event.attributes.get("@pages", [])[0]
    old_list = page.attributes.get("@list", [])

    # Sacar un RubyString existente como plantilla de atributos (encoding).
    attrs_template = None
    for cmd in old_list:
        params = cmd.attributes.get("@parameters", [])
        if params and isinstance(params[0], RubyString):
            attrs_template = params[0].attributes
            break
    assert attrs_template is not None, "no se encontro un RubyString de referencia"

    new_list = [
        make_cmd(101, 0, ["\\rSoy Laura de la Guardería. Podemos criar Pokémon por ti."], attrs_template),
        make_cmd(401, 0, [""], attrs_template),
        make_cmd(355, 0, ["DayCareUI.pbMainMenu"], attrs_template),
        make_cmd(0, 0, [], attrs_template),
    ]

    print(f"Comandos originales: {len(old_list)} -> nuevos: {len(new_list)}")

    if not args.dry_run:
        backup = PATH + ".bak_rewrite_daycare"
        shutil.copy2(PATH, backup) if not __import__("os").path.exists(backup) else None
        page.attributes["@list"] = new_list
        buf = BytesIO()
        rmw.write(buf, map_obj)
        with open(PATH, "wb") as f:
            f.write(buf.getvalue())
        print("GUARDADO.")
    else:
        print("[DRY-RUN] no se guardo nada.")


if __name__ == "__main__":
    main()
