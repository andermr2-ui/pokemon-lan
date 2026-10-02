import re

path = "PBS/trainer_types.txt"
with open(path, encoding="utf-8") as f:
    content = f.read()

# Ordenado de mas especifico a menos especifico para no pisar substrings
# (ej. "Ex-Champion" antes que "Champion").
REPLACEMENTS = [
    ("Name = Hoenn Champion", "Name = Campeón de Hoenn"),
    ("Name = Sinnoh Champion", "Name = Campeón de Sinnoh"),
    ("Name = Alola Champion", "Name = Campeón de Alola"),
    ("Name = Ex-Champion", "Name = Ex Campeón"),
    ("Name = Champion", "Name = Campeón"),
    ("Name = Team Rocket Scientist", "Name = Científico del Team Rocket"),
    ("Name = Rocket Boss", "Name = Jefe del Team Rocket"),
    ("Name = Team Rocket", "Name = Team Rocket"),
    ("Name = Gym Leader", "Name = Líder de Gimnasio"),
    ("Name = Elite Four", "Name = Alto Mando"),
    ("Name = Mega Trainer", "Name = Mega Entrenador"),
    ("Name = Pokémon Trainer", "Name = Entrenador Pokémon"),
    ("Name = Pokémon Ranger", "Name = Ranger Pokémon"),
    ("Name = Pokémon Breeder", "Name = Criador Pokémon"),
    ("Name = Poké Maniac", "Name = Poké Maníaco"),
    ("Name = Aroma Lady", "Name = Dama Aroma"),
    ("Name = Bird Keeper", "Name = Ornitólogo"),
    ("Name = Bug Catcher", "Name = Insectólogo"),
    ("Name = Ruin Maniac", "Name = Arqueólogo"),
    ("Name = Super Nerd", "Name = Empollón"),
    ("Name = Black Belt", "Name = Cinturón Negro"),
    ("Name = Crush Girl", "Name = Karateca"),
    ("Name = Cool Trainer", "Name = Entrenador Experto"),
    ("Name = Cool Couple", "Name = Pareja Guay"),
    ("Name = Crush Kin", "Name = Familia Forzuda"),
    ("Name = Sis and Bro", "Name = Hermanos"),
    ("Name = Young Couple", "Name = Pareja Joven"),
    ("Name = Chill Guy", "Name = Tío Zen"),
    ("Name = Cue Ball", "Name = Calvorota"),
    ("Name = Rival", "Name = Rival"),
    ("Name = Beauty", "Name = Bella"),
    ("Name = Biker", "Name = Motorista"),
    ("Name = Burglar", "Name = Ladrón"),
    ("Name = Channeler", "Name = Médium"),
    ("Name = Engineer", "Name = Ingeniero"),
    ("Name = Electrician", "Name = Electricista"),
    ("Name = Fisherman", "Name = Pescador"),
    ("Name = Gambler", "Name = Apostador"),
    ("Name = Gentleman", "Name = Caballero"),
    ("Name = Hiker", "Name = Montañero"),
    ("Name = Juggler", "Name = Malabarista"),
    ("Name = Lady", "Name = Dama"),
    ("Name = Painter", "Name = Pintora"),
    ("Name = Professor", "Name = Profesor"),
    ("Name = Rocker", "Name = Rockero"),
    ("Name = Sailor", "Name = Marinero"),
    ("Name = Scientist", "Name = Científico"),
    ("Name = Tamer", "Name = Domador"),
    ("Name = Camper", "Name = Campista"),
    ("Name = Picnicker", "Name = Excursionista"),
    ("Name = Youngster", "Name = Chico"),
    ("Name = Lass", "Name = Chica"),
    ("Name = Psychic", "Name = Psíquico"),
    ("Name = Swimmer", "Name = Nadador"),
    ("Name = Tuber", "Name = Bañista"),
    ("Name = Officer", "Name = Oficial"),
    ("Name = Twins", "Name = Gemelas"),
    ("Name = Neckbeard", "Name = Friki Barbudo"),
    ("Name = Elder", "Name = Anciano"),
]

for old, new in REPLACEMENTS:
    content = content.replace(old, new)

with open(path, "w", encoding="utf-8") as f:
    f.write(content)

remaining = re.findall(r"^Name = .+$", content, re.MULTILINE)
untranslated = [l for l in remaining if not any(l == new for _, new in REPLACEMENTS)]
print(f"Lineas Name= totales: {len(remaining)}")
print(f"Sin traducir (revisar): {untranslated}")
