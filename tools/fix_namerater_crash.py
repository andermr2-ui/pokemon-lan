"""
Arregla el crash al decirle "No" al Inspector de Motes (Data/Map311.rxdata,
evento 2 "Name Rater"). Mismo patron de siempre: comandos "Show Text" (101)
cuyo parametro quedo como un comentario (108) anidado en vez de un string,
en las dos ramas de "No" (la interna - "no quiero un nombre mas lindo" - y
la externa - "no quiero que evalues mis apodos").

Uso:
  python tools/fix_namerater_crash.py [--dry-run]
"""
import argparse

import rubymarshal.reader as rmr
import rubymarshal.writer as rmw
from rubymarshal.classes import RubyString


def fresh_string(s):
    return RubyString(str(s), {})


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    path = "Data/Map311.rxdata"
    with open(path, "rb") as f:
        data = rmr.load(f)

    events = data.attributes["@events"]
    ev = events[2].attributes["@pages"][0].attributes["@list"]

    # [84]: rama "No" interna (declino que le de un nombre mas lindo a un
    # apodo que ya estaba bien).
    ev[84].attributes["@parameters"] = [
        fresh_string(r"\bYa veo. Como prefieras, entonces.")
    ]
    # [89]: rama "No" externa (declino directamente que evalue los apodos).
    ev[89].attributes["@parameters"] = [
        fresh_string(r"\bYa veo. Vuelve a visitarme cuando quieras.")
    ]

    print("Fixed entries:")
    for i in [84, 89]:
        print(" ", i, ev[i].attributes["@parameters"])

    if args.dry_run:
        print("[DRY-RUN] no se guardo nada.")
        return

    with open(path, "wb") as f:
        rmw.write(f, data)
    print("GUARDADO.")


if __name__ == "__main__":
    main()
