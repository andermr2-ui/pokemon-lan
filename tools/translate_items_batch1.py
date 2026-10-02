import re

path = "PBS/items.txt"
with open(path, encoding="utf-8") as f:
    content = f.read()

# id -> (nombre, plural, descripcion)
ITEMS = {
    "POKEBALL": ("Poké Ball", "Poké Balls", "Aparato para capturar Pokémon salvajes. Se lanza como una pelota hacia el objetivo. Está diseñada como un sistema de cápsulas."),
    "POTION": ("Poción", "Pociones", "Medicina en espray para tratar heridas. Puede usarse para restaurar 20 PS a un solo Pokémon."),
    "ANTIDOTE": ("Antídoto", "Antídotos", "Medicina en espray. Elimina el efecto del veneno de un Pokémon."),
    "PARALYZEHEAL": ("Antiparalizador", "Antiparalizadores", "Medicina en espray. Cura a un Pokémon paralizado."),
    "AWAKENING": ("Despertar", "Despertares", "Medicina en espray. Despierta a un Pokémon de las garras del sueño."),
    "BURNHEAL": ("Pomada Antiquemazón", "Pomadas Antiquemazón", "Medicina en espray. Cura a un solo Pokémon que sufre una quemadura."),
    "ICEHEAL": ("Antihielo", "Antihielos", "Medicina en espray. Descongela a un Pokémon que está congelado."),
    "FULLHEAL": ("Cura Total", "Curas Totales", "Medicina en espray. Cura todos los problemas de estado de un solo Pokémon."),
}

def replace_block(match):
    item_id = match.group(1)
    block = match.group(0)
    if item_id not in ITEMS:
        return block
    name, plural, desc = ITEMS[item_id]
    block = re.sub(r"^Name = .*$", f"Name = {name}", block, count=1, flags=re.MULTILINE)
    block = re.sub(r"^NamePlural = .*$", f"NamePlural = {plural}", block, count=1, flags=re.MULTILINE)
    block = re.sub(r"^Description = .*$", f"Description = {desc}", block, count=1, flags=re.MULTILINE)
    return block

new_content = re.sub(r"\[(\w+)\].*?(?=#-{10,}|\Z)", replace_block, content, flags=re.DOTALL)

with open(path, "w", encoding="utf-8") as f:
    f.write(new_content)

for item_id in ITEMS:
    assert f"Name = {ITEMS[item_id][0]}" in new_content, f"FALLO: {item_id}"
print(f"{len(ITEMS)} objetos traducidos y verificados.")
