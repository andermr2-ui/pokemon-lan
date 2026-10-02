"""
Arregla el crash NoMethodError en Intl_Messages al hablar con los dos
vendedores de premios de la derecha del casino (Prize vendor middle/right,
eventos 23 y 24 de Data/Map263.rxdata). Mismo patron que fix_quizguy_crash.py
y fix_plate_crash.py: comandos "Show Text" (101) cuyo parametro quedo como
un RPG::EventCommand anidado (o una lista vacia/mal tipada) en vez de un
string, artefacto del editor.

Los textos correctos para el saludo, la pregunta, la despedida y el "no
te alcanzan las monedas" ya existen intactos en el evento 22 (Prize vendor
left, que funciona) o anidados dentro de los propios comandos corruptos -
se copian de ahi (como objetos NUEVOS e independientes, nunca reutilizando
la misma referencia, por el bug de rubymarshal documentado en sesiones
anteriores: mutar solo algunos de varios comandos que comparten el mismo
string deduplicado por Marshal corrompe los que no se tocan al guardar).

Uso:
  python tools/fix_gambler_crash.py [--dry-run]
"""
import argparse
import shutil

import rubymarshal.reader as rmr
import rubymarshal.writer as rmw
from rubymarshal.classes import RubyString


def fresh_string(s):
    return RubyString(str(s), {})


def set_text(cmd, text_source_cmd):
    """text_source_cmd: an EventCommand whose parameters[0] holds the
    correct string (possibly nested one level via a corrupted wrapper)."""
    src = text_source_cmd.attributes["@parameters"][0]
    cmd.attributes["@parameters"] = [fresh_string(src)]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    path = "Data/Map263.rxdata"
    with open(path, "rb") as f:
        data = rmr.load(f)

    events = data.attributes["@events"]
    ev22 = events[22].attributes["@pages"][0].attributes["@list"]
    ev23 = events[23].attributes["@pages"][0].attributes["@list"]
    ev24 = events[24].attributes["@pages"][0].attributes["@list"]

    greeting_src = ev23[2].attributes["@parameters"][0]  # nested RubyObject
    pregunta_src = ev22[2]
    farewell_src = ev22[31]
    not_enough_src = ev22[44]
    pregunta2_src = ev23[47]
    no_bag_space_src = ev22[54]

    # --- Event 23 (Prize vendor middle) ---
    ev23[0].attributes["@parameters"] = [fresh_string(greeting_src.attributes["@parameters"][0])]
    set_text(ev23[2], pregunta_src)
    set_text(ev23[32], farewell_src)
    set_text(ev23[51], not_enough_src)
    del ev23[54]   # leftover "itm = GameData::Item.get(...)" garbage, flow works without it

    # --- Event 24 (Prize vendor right) ---
    ev24[0].attributes["@parameters"] = [fresh_string(greeting_src.attributes["@parameters"][0])]
    set_text(ev24[14], pregunta_src)
    set_text(ev24[39], farewell_src)
    set_text(ev24[50], pregunta2_src)   # missing "Te gustaria X?" prompt before Yes/No
    set_text(ev24[54], not_enough_src)
    set_text(ev24[64], no_bag_space_src)
    del ev24[58]   # leftover "itm = GameData::Item.get(...)" garbage, flow works without it

    print("Preview event 23 fixed entries (post-delete indices):")
    for i in [0, 2, 32, 51]:
        print(" ", i, ev23[i].attributes["@parameters"])
    print("Preview event 24 fixed entries (post-delete indices, everything from 58+ shifted -1):")
    for i in [0, 14, 39, 50, 54, 63]:
        print(" ", i, ev24[i].attributes["@parameters"])

    if args.dry_run:
        print("[DRY-RUN] no se guardo nada.")
        return

    with open(path, "wb") as f:
        rmw.write(f, data)
    print("GUARDADO.")


if __name__ == "__main__":
    main()
