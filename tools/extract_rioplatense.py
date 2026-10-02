"""
Extrae todas las lineas con marcadores de rioplatense de los mapas,
clasifica las que mencionan Team Rocket explicitamente vs el resto.
"""
import re, os, sys
sys.stdout.reconfigure(encoding='utf-8')

RIOPLATENSE = re.compile(
    r'\b(vos\b|sos\b|ten[eé]s\b|pod[eé]s\b|sab[eé]s\b|hac[eé]s\b|quer[eé]s\b|'
    r'ven[ií]s\b|deb[eé]s\b|est[aá]s\b.*\bvos\b|ac[aá]\b|vol[vb][eé]|\bche\b)',
    re.IGNORECASE
)
ROCKET = re.compile(r'rocket|team r|giovanni|james|jessie|meowthr|grunt|musashi', re.IGNORECASE)

maps_dir = 'Data'
rocket_lines = []
other_lines = []

for fname in sorted(os.listdir(maps_dir)):
    if not re.match(r'^Map\d+\.rxdata$', fname):
        continue
    mapnum = int(fname.replace('Map', '').replace('.rxdata', ''))
    with open(os.path.join(maps_dir, fname), 'rb') as f:
        data = f.read()
    text = data.decode('utf-8', errors='replace')

    # Extraer bloques de dialogo (entre \b y siguiente ")
    for m in re.finditer(r'\\b([^\x00-\x1f"]{10,})', text):
        line = m.group(1).strip()
        # Limpiar escapes de control de RPG Maker
        line_clean = re.sub(r'\\[a-z\[\]][^\]]*\]?', '', line).strip()
        if not RIOPLATENSE.search(line_clean):
            continue
        entry = (mapnum, line_clean[:250])
        if ROCKET.search(line_clean):
            rocket_lines.append(entry)
        else:
            other_lines.append(entry)

print(f"=== CON 'ROCKET' EN EL TEXTO ({len(rocket_lines)} lineas) ===")
for mapnum, line in rocket_lines:
    print(f"[Map{mapnum:03d}] {line}")
    print()

print(f"\n=== SIN 'ROCKET' EN EL TEXTO ({len(other_lines)} lineas) - candidatas a convertir ===")
for mapnum, line in other_lines:
    print(f"[Map{mapnum:03d}] {line}")
    print()
