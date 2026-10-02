from PIL import Image

SRC = r"Referencia Armario de Skins/FRLG Accurate NPC Megapack (Relic Castle Edition)/FRLG Accurate NPC Megapack (Relic Castle Edition)/RSE NPCs/Characters/NPC_ProfBirch.png"
OUT_DIR = "Graphics/Characters"

# (main, dark/shadow, highlight) replacing the original auburn hair ramp
HAIR_MAIN = (148, 58, 41)
HAIR_DARK = (82, 16, 0)
HAIR_HI = (206, 99, 74)

STYLES = {
    "MOVEDELETER_AUBURN":  ((148, 58, 41), (82, 16, 0), (206, 99, 74)),   # original, unchanged
    "MOVEDELETER_BLACK":   ((45, 42, 42), (20, 18, 18), (75, 70, 70)),
    "MOVEDELETER_BLONDE":  ((224, 188, 120), (176, 138, 70), (245, 220, 165)),
    "MOVEDELETER_PLATINUM":((225, 222, 210), (180, 175, 160), (245, 245, 238)),
    "MOVEDELETER_GINGER":  ((198, 78, 35), (140, 45, 10), (228, 130, 70)),
    "MOVEDELETER_CHESTNUT":((92, 55, 38), (52, 28, 16), (128, 85, 58)),
    "MOVEDELETER_SILVER":  ((150, 150, 155), (100, 100, 105), (195, 195, 200)),
    "MOVEDELETER_BLUE":    ((60, 90, 170), (30, 50, 110), (110, 140, 210)),
    "MOVEDELETER_GREEN":   ((60, 140, 70), (30, 95, 40), (110, 180, 110)),
    "MOVEDELETER_PURPLE":  ((120, 60, 160), (75, 30, 110), (165, 110, 205)),
    "MOVEDELETER_PINK":    ((220, 100, 160), (175, 55, 120), (240, 150, 195)),
    "MOVEDELETER_TEAL":    ((40, 150, 150), (15, 100, 100), (90, 195, 195)),
    "MOVEDELETER_ORANGE":  ((220, 120, 30), (170, 80, 10), (240, 160, 70)),
    "MOVEDELETER_WHITE":   ((240, 240, 235), (205, 205, 198), (252, 252, 250)),
}

base = Image.open(SRC).convert("RGBA")
pixels = base.load()
w, h = base.size

for name, (main, dark, hi) in STYLES.items():
    img = base.copy()
    px = img.load()
    for y in range(h):
        for x in range(w):
            p = pixels[x, y]
            rgb = p[:3]
            if rgb == HAIR_MAIN:
                px[x, y] = main + (p[3],)
            elif rgb == HAIR_DARK:
                px[x, y] = dark + (p[3],)
            elif rgb == HAIR_HI:
                px[x, y] = hi + (p[3],)
    out_path = f"{OUT_DIR}/trainer_{name}.png"
    img.save(out_path)
    print("saved", out_path)
