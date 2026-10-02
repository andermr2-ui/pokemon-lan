"""
Arregla el crash en el mostrador izquierdo del casino (Coin seller y Coin
Case giver, eventos 19 y 21 de Data/Map263.rxdata). Mismo patron que
fix_gambler_crash.py: comandos "Show Text"/"Show Choices"/"Call Script"
cuyo parametro quedo mal tipado (objeto anidado, lista con una capa de mas,
o un fragmento de OTRO evento pegado por error) en vez del valor real.

Uso:
  python tools/fix_coinseller_crash.py [--dry-run]
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

    path = "Data/Map263.rxdata"
    with open(path, "rb") as f:
        data = rmr.load(f)

    events = data.attributes["@events"]
    ev19 = events[19].attributes["@pages"][0].attributes["@list"]
    ev21 = events[21].attributes["@pages"][0].attributes["@list"]

    # --- Event 19 "Coin seller" ---
    # [8]: garbage fragment (a Show-Choices param list from the TM vendor,
    # left over from a copy-paste) sitting where the "how many coins would
    # you like to buy?" prompt should be (its blank continuation line
    # already exists correctly at [9]).
    ev19[8].attributes["@parameters"] = [
        fresh_string(r"\G\CN\b" + "\u00bfCu\u00e1ntas monedas te gustar\u00eda comprar?")
    ]
    # [31]: should mirror [13] ("coincase full" warning) for the 500-coin branch.
    full_text = ev19[13].attributes["@parameters"][0]
    ev19[31].attributes["@parameters"] = [fresh_string(full_text)]
    # [35]: should mirror [17] ("can't afford") for the 500-coin branch.
    afford_text = ev19[17].attributes["@parameters"][0]
    ev19[35].attributes["@parameters"] = [fresh_string(afford_text)]
    # [41]: should mirror [23] ("thanks, here are your coins") for the 500-coin branch.
    thanks_text = ev19[23].attributes["@parameters"][0]
    ev19[41].attributes["@parameters"] = [fresh_string(thanks_text)]

    # --- Event 21 "Coin Case giver" ---
    # [14]: text wrapped in an extra Array layer ([["texto"]] instead of
    # ["texto"]) - same class of bug as fix_plate_crash.py.
    inner = ev21[14].attributes["@parameters"][0][0]
    ev21[14].attributes["@parameters"] = [fresh_string(inner)]

    print("Event 19 fixed entries:")
    for i in [8, 31, 35, 41]:
        print(" ", i, ev19[i].attributes["@parameters"])
    print("Event 21 fixed entries:")
    for i in [14]:
        print(" ", i, ev21[i].attributes["@parameters"])

    if args.dry_run:
        print("[DRY-RUN] no se guardo nada.")
        return

    with open(path, "wb") as f:
        rmw.write(f, data)
    print("GUARDADO.")


if __name__ == "__main__":
    main()
