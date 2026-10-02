"""
Encuentra todos los mapas que mencionan 'Rocket' en cualquier parte del binario.
Esos mapas se trataran como 'zona Rocket' y no se modificaran.
"""
import re, os, sys
sys.stdout.reconfigure(encoding='utf-8')

ROCKET_RE = re.compile(rb'(?i)rocket|giovanni|james\b|jessie\b|musashi|kojiro')
RIOPLAT_RE = re.compile(
    r'\b(vos\b|sos\b|ten[eé]s\b|pod[eé]s\b|sab[eé]s\b|hac[eé]s\b|quer[eé]s\b|'
    r'ven[ií]s\b|sal[ií]s\b|ac[aá]\b)',
    re.IGNORECASE
)

maps_dir = 'Data'
rocket_maps = set()
all_maps_with_rioplat = {}

for fname in sorted(os.listdir(maps_dir)):
    if not re.match(r'^Map\d+\.rxdata$', fname):
        continue
    mapnum = int(fname.replace('Map', '').replace('.rxdata', ''))
    with open(os.path.join(maps_dir, fname), 'rb') as f:
        raw = f.read()

    if ROCKET_RE.search(raw):
        rocket_maps.add(mapnum)

    # Tambien contar lineas rioplatenses por mapa
    text = raw.decode('utf-8', errors='replace')
    lines = re.findall(r'\\b([^\x00-\x1f"]{10,})', text)
    rioplat_lines = [l for l in lines if RIOPLAT_RE.search(l)]
    if rioplat_lines:
        all_maps_with_rioplat[mapnum] = len(rioplat_lines)

rocket_with_rioplat = {k: v for k, v in all_maps_with_rioplat.items() if k in rocket_maps}
nonrocket_with_rioplat = {k: v for k, v in all_maps_with_rioplat.items() if k not in rocket_maps}

print(f"Mapas con 'Rocket' en cualquier parte: {sorted(rocket_maps)}")
print()
print(f"De esos, mapas que ADEMAS tienen rioplatense ({len(rocket_with_rioplat)}):")
for m, n in sorted(rocket_with_rioplat.items()):
    print(f"  Map{m:03d}: {n} lineas rioplatenses")
print()
print(f"Mapas SIN Rocket que tienen rioplatense ({len(nonrocket_with_rioplat)}):")
for m, n in sorted(nonrocket_with_rioplat.items()):
    print(f"  Map{m:03d}: {n} lineas")
print()
total_to_convert = sum(nonrocket_with_rioplat.values())
print(f"Total lineas a convertir (aprox): {total_to_convert}")
