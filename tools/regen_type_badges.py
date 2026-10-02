from PIL import Image, ImageDraw, ImageFont
from collections import Counter

SRC = "Graphics/UI/types.png.bak"
DST = "Graphics/UI/types.png"
FONT_PATH = "Fonts/power clear bold.ttf"

BADGE_W = 64
BADGE_H = 28
N = 19
BASE_SIZE = 20
MIN_SIZE = 14
MAX_TEXT_W = 58  # matches the real max width used by the original English badges

NAMES = [
    "NORMAL", "LUCHA", "VOLADOR", "VENENO", "TIERRA", "ROCA", "BICHO",
    "FANTASMA", "ACERO", "???", "FUEGO", "AGUA", "PLANTA", "ELECT",
    "PSIQ", "HIELO", "DRAGON", "SINIES", "HADA",
]

SHADOW = (120, 120, 120, 255)
TEXT = (255, 255, 255, 255)

def background_color(src, idx):
    y0 = idx * BADGE_H
    badge = src.crop((0, y0, BADGE_W, y0 + BADGE_H))
    counts = Counter()
    # Only sample rows that are guaranteed free of glyph ink (original text
    # always sits within rows 6-19 of the 28px badge).
    for y in list(range(2, 5)) + list(range(23, 26)):
        for x in range(2, BADGE_W - 2):
            counts[badge.getpixel((x, y))] += 1
    return counts.most_common(1)[0][0]

def font_for_width(word, max_w):
    size = BASE_SIZE
    while size > MIN_SIZE:
        font = ImageFont.truetype(FONT_PATH, size)
        bbox = font.getbbox(word)
        w = bbox[2] - bbox[0]
        if w <= max_w:
            return font, bbox
        size -= 1
    font = ImageFont.truetype(FONT_PATH, MIN_SIZE)
    return font, font.getbbox(word)

src = Image.open(SRC).convert("RGBA")
out = Image.new("RGBA", (BADGE_W, BADGE_H * N), (0, 0, 0, 0))

for i, word in enumerate(NAMES):
    bg = background_color(src, i)
    y0 = i * BADGE_H
    badge = src.crop((0, y0, BADGE_W, y0 + BADGE_H)).copy()

    if i == 14:  # PSIQ badge: histogram sampling picks text color for long words
        bg = (248, 88, 136, 255)

    # Repaint the whole glyph area (rows 5..22) with the background color,
    # keeping the badge's border/bevel decoration in rows 0-4 / 23-27 intact.
    px = badge.load()
    for y in range(5, 23):
        for x in range(BADGE_W):
            px[x, y] = bg

    font, bbox = font_for_width(word, MAX_TEXT_W)
    w = bbox[2] - bbox[0]
    h = bbox[3] - bbox[1]
    x = (BADGE_W - w) // 2 - bbox[0]
    y = (BADGE_H - h) // 2 - bbox[1]

    draw = ImageDraw.Draw(badge)
    draw.text((x + 1, y + 1), word, font=font, fill=SHADOW)
    draw.text((x, y), word, font=font, fill=TEXT)

    out.paste(badge, (0, y0))

out.save(DST)
print("types.png regenerado")
