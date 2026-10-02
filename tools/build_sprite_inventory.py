# encoding: utf-8
"""
Genera un inventario CSV de todos los sprites relevantes para Character
Customization: por cada trainer type de PBS, si tiene charset de caminar,
variantes de movimiento (reales o solo copias placeholder del charset base),
back sprite de batalla, y si esta actualmente en el catalogo del armario.
"""
import csv
import hashlib
import re
import os

from PIL import Image

CHAR_DIR = "Graphics/Characters"
TRAINER_DIR = "Graphics/Trainers"

# Ruta absoluta del proyecto, para que las rutas que se escriben en el xlsx
# se puedan copiar y pegar directamente en el Explorador de Windows.
PROJECT_ROOT = r"C:\claudecode\pokemon lan"


def full_path(rel_path):
    """Convierte una ruta relativa (con /) en una ruta absoluta de Windows
    (con \\), completa desde C:\\, lista para pegar en el Explorador."""
    return PROJECT_ROOT + "\\" + rel_path.replace("/", "\\")


def md5(path):
    return hashlib.md5(open(path, "rb").read()).hexdigest()


def walk_animation_status(path):
    """Compara los 4 frames de la fila "abajo" (primera fila) del charset:
    si son todos identicos, el "monigote" en realidad esta quieto (no tiene
    animacion de caminar de verdad), aunque el archivo exista y pase todas
    las demas verificaciones."""
    if not os.path.exists(path):
        return "N/A"
    try:
        im = Image.open(path).convert("RGBA")
        w, h = im.size
        if w % 4 != 0 or h % 4 != 0:
            return "N/A (tamano raro)"
        fw, fh = w // 4, h // 4
        frames = [im.crop((i * fw, 0, (i + 1) * fw, fh)).tobytes() for i in range(4)]
        return "Quieto (todas las poses son iguales)" if len(set(frames)) == 1 else "Camina"
    except Exception:
        return "N/A"


def read_trainer_types():
    text = open("PBS/trainer_types.txt", encoding="utf-8").read()
    blocks = re.split(r"\n(?=\[)", text)
    types = []
    for b in blocks:
        m = re.match(r"\[([A-Z0-9_]+)\]", b)
        if not m:
            continue
        tid = m.group(1)
        nm = re.search(r"Name\s*=\s*(.+)", b)
        name = nm.group(1).strip() if nm else tid
        types.append((tid, name))
    return types


def read_catalog():
    content = open(
        "Plugins/Character Customization/Character Customization.rb", encoding="utf-8"
    ).read()
    m = re.search(r"CATALOG = \[(.*?)\n  \]\nend", content, re.S)
    entries = re.findall(r'\["([^"]+)",\s*"([^"]+)"\]', m.group(1))
    return entries


def variant_status(base_path, variant_path):
    if not os.path.exists(variant_path):
        return "FALTA"
    if not os.path.exists(base_path):
        return full_path(variant_path)
    try:
        if md5(base_path) == md5(variant_path):
            return f"{full_path(variant_path)} (placeholder, copia del de caminar)"
        return full_path(variant_path)
    except Exception:
        return full_path(variant_path)


def main():
    catalog = read_catalog()
    catalog_by_file = {f: label for f, label in catalog}
    seen = set()
    rows = []

    def add(filename, label, no_trainer_type=False):
        if filename in seen:
            return
        seen.add(filename)
        rows.append(build_row(filename, label, catalog_by_file, no_trainer_type=no_trainer_type))

    # --- Primero, TODO lo que ya esta en el catalogo actual del armario
    # (garantiza cobertura total, incluso de entradas como NURSE/TEENAGERF/
    # TEENAGERM que no tienen bloque propio en PBS/trainer_types.txt) ---
    for filename, label in catalog:
        add(filename, label, no_trainer_type=not filename.startswith("trainer_"))

    # --- Protagonistas (por si no estuvieran ya en el catalogo) ---
    for pid, label in [
        ("POKEMONTRAINER_Red", "Trainer (Red)"),
        ("POKEMONTRAINER_Leaf", "Trainer (Leaf)"),
        ("POKEMONTRAINER_Brendan", "Trainer (Brendan)"),
        ("POKEMONTRAINER_May", "Trainer (May)"),
    ]:
        add(f"trainer_{pid}", label)

    # --- Trainer types de PBS (el resto, los que no estan en el catalogo) ---
    for tid, name in read_trainer_types():
        add(f"trainer_{tid}", name)

    # --- NPCs genericos (sin TrainerType, nunca pueden tener back sprite) ---
    for i in range(1, 29):
        add(f"NPC {i:02d}", f"Neighbor {i}", no_trainer_type=True)

    # --- Otros personajes mencionados como descartados en el handoff ---
    for filename, label in [
        ("trainer_TWINS", "Twins"),
        ("trainer_YOUNGCOUPLE_2", "Young Couple 2"),
        ("trainer_ALESSIO", "Alessio"),
        ("trainer_ZEKE", "Zeke"),
        ("trainer_TUBER2_F", "Tuber Alt (F)"),
        ("trainer_TUBER2_M", "Tuber Alt (M)"),
        ("trainer_SWIMMER2_F", "Swimmer Alt (F)"),
        ("trainer_SWIMMER2_M", "Swimmer Alt (M)"),
        ("trainer_YOUNGCOUPLE", "Young Couple"),
    ]:
        add(filename, label)

    with open("tools/_sprite_inventory.csv", "w", newline="", encoding="utf-8") as f:
        w = csv.writer(f)
        w.writerow([
            "Personaje", "Archivo base", "En catalogo", "Charset caminar",
            "Camina o esta quieto", "Correr (_run)", "Bici (_bike)", "Surf (_surf)",
            "Buceo (_dive)", "Pesca (_fish)", "Back sprite batalla", "Notas",
        ])
        for r in rows:
            w.writerow(r)
    print(f"{len(rows)} filas escritas en tools/_sprite_inventory.csv")


def build_row(filename, label, catalog_by_file, no_trainer_type=False):
    base_path = f"{CHAR_DIR}/{filename}.png"
    walk_exists = os.path.exists(base_path)
    walk_anim = walk_animation_status(base_path)

    variants = {}
    for suf in ["run", "bike", "surf", "fish"]:
        vpath = f"{CHAR_DIR}/{filename}_{suf}.png"
        variants[suf] = variant_status(base_path, vpath)

    # Buceo: el motor (PlayerMetadata#dive_charset) y nuestro plugin (ver
    # Game_Player.charcustom_dive_variant) caen automaticamente al charset
    # de surf si no hay uno de buceo dedicado -- asi que si existe el de
    # surf, buceo ya esta cubierto aunque no haya un archivo "_dive.png".
    dive_path = f"{CHAR_DIR}/{filename}_dive.png"
    surf_path = f"{CHAR_DIR}/{filename}_surf.png"
    if os.path.exists(dive_path):
        variants["dive"] = variant_status(base_path, dive_path)
    elif os.path.exists(surf_path):
        variants["dive"] = f"{full_path(surf_path)} (usa el de surf; el motor cae ahi automaticamente si no hay uno de buceo)"
    else:
        variants["dive"] = "FALTA"

    if no_trainer_type:
        back_status = "N/A (sin TrainerType)"
    else:
        type_name = filename.replace("trainer_", "")
        back_path = f"{TRAINER_DIR}/{type_name}_back.png"
        back_status = full_path(back_path) if os.path.exists(back_path) else "FALTA"

    en_catalogo = "Si" if filename in catalog_by_file else "No"

    notas = []
    if not walk_exists:
        notas.append("sin charset de caminar")
    elif walk_anim.startswith("Quieto"):
        notas.append("el charset no tiene animacion de caminar real, falta dibujarla")
    if no_trainer_type:
        notas.append("sin TrainerType (no puede tener back sprite)")
    elif back_status == "FALTA":
        notas.append("sin back sprite de batalla")

    return [
        label,
        filename,
        en_catalogo,
        full_path(base_path) if walk_exists else "FALTA",
        walk_anim,
        variants["run"],
        variants["bike"],
        variants["surf"],
        variants["dive"],
        variants["fish"],
        back_status,
        "; ".join(notas),
    ]


if __name__ == "__main__":
    main()
