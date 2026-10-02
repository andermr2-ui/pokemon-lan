import re

path = "PBS/moves.txt"
with open(path, encoding="utf-8") as f:
    content = f.read()

# id -> (nuevo nombre, nueva descripcion)
MOVES = {
    "TACKLE": ("Placaje", "Ataque físico en el que el usuario carga y golpea al objetivo con todo su cuerpo."),
    "GROWL": ("Gruñido", "El usuario gruñe de forma entrañable, haciendo que el rival baje la guardia. El Ataque del rival se reduce."),
    "POISONSTING": ("Picotazo Veneno", "El usuario clava al objetivo un aguijón venenoso. También puede envenenar al objetivo."),
    "ABSORB": ("Absorción", "Ataque que drena nutrientes. Los PS del usuario se restauran a la mitad del daño infligido al objetivo."),
    "STRINGSHOT": ("Disparo Demora", "El rival queda atado con hilo de seda que sale de la boca del usuario. Este hilo reduce la Velocidad del objetivo."),
    "FURYCUTTER": ("Corte Furia", "Se ataca al objetivo con guadañas o garras. Su potencia aumenta si acierta varias veces seguidas."),
    "LEAFAGE": ("Follaje", "El usuario ataca arrojando hojas al objetivo."),
    "GROWTH": ("Desarrollo", "El cuerpo del usuario crece de golpe, aumentando el Ataque y el Ataque Especial."),
    "SCRATCH": ("Arañazo", "Garras duras, puntiagudas y afiladas rasgan al objetivo para infligir daño."),
    "LEER": ("Malicioso", "El usuario mira de forma intimidante con ojos afilados. La Defensa del objetivo se reduce."),
}

def replace_block(match):
    move_id = match.group(1)
    block = match.group(0)
    if move_id not in MOVES:
        return block
    name, desc = MOVES[move_id]
    block = re.sub(r"^Name = .*$", f"Name = {name}", block, count=1, flags=re.MULTILINE)
    block = re.sub(r"^Description = .*$", f"Description = {desc}", block, count=1, flags=re.MULTILINE)
    return block

new_content = re.sub(r"\[(\w+)\].*?(?=#-{10,}|\Z)", replace_block, content, flags=re.DOTALL)

with open(path, "w", encoding="utf-8") as f:
    f.write(new_content)

for move_id in MOVES:
    assert f"Name = {MOVES[move_id][0]}" in new_content, f"FALLO: {move_id}"
print(f"{len(MOVES)} movimientos traducidos y verificados.")
