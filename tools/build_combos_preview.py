import os
from PIL import Image, ImageDraw

SCRATCH = r"C:\Users\xarls\AppData\Local\Temp\claude\C--claudecode\c718be2e-2394-4170-9601-532f866f8ec1\scratchpad\CharCustom_extracted\pokemon png\overworld walk"
CROP = (14, 16, 48, 60)
FACTOR = 38 / 44
BOTTOM_MARGIN = 2


def load(rel):
    return Image.open(os.path.join(SCRATCH, rel)).crop((0, 0, 64, 64))


def build(layers):
    comp = Image.new("RGBA", (64, 64), (0, 0, 0, 0))
    for l in layers:
        comp.paste(l, (0, 0), l)
    content = comp.crop(CROP)
    w = round((CROP[2] - CROP[0]) * FACTOR)
    h = round((CROP[3] - CROP[1]) * FACTOR)
    content = content.resize((w, h), Image.NEAREST)
    canvas = Image.new("RGBA", (32, 48), (0, 0, 0, 0))
    x = (32 - w) // 2
    y = 48 - BOTTOM_MARGIN - h
    canvas.paste(content, (x, y), content)
    return canvas


combos = []

combos.append((build([
    load(r"bases mf\m base light.png"),
    load(r"hair\boy 1\boy 1 brown.png"),
    load(r"bottoms\jeans\jeans black.png"),
    load(r"tops\collared shirt\collared shirt navy.png"),
]), "Camisa + jean"))

combos.append((build([
    load(r"bases mf\m base medium.png"),
    load(r"hair\boy 2\boy 2 blond.png"),
    load(r"bottoms\capris\capris black.png"),
    load(r"tops\hoodie\hoodie blue.png"),
]), "Hoodie + capri"))

combos.append((build([
    load(r"bases mf\f base dark.png"),
    load(r"hair\girl 1\1 blonde.png"),
    load(r"bottoms\beach bottom f\beach bottom f pink.png"),
    load(r"tops\beach top f\beach  top f pink.png"),
]), "Playera (mujer)"))

combos.append((build([
    load(r"bases mf\m base pale.png"),
    load(r"bottoms\formal bottoms m\formal bottoms m black.png"),
    load(r"tops\formal top\formal  black.png"),
    load(r"hats\fedora.png"),
]), "Formal + sombrero"))

combos.append((build([
    load(r"bases mf\m base light.png"),
    load(r"bottoms\jeans\jeans navy.png"),
    load(r"tops\hoodie\hoodie green.png"),
    load(r"hats\beanie\beanie black.png"),
]), "Hoodie + gorro"))

scale = 8
cell_w, cell_h = 32 * scale, 48 * scale
pad = 20
label_h = 30
cols = len(combos)
W = cols * (cell_w + pad) + pad
H = cell_h + label_h + pad * 2
out = Image.new("RGBA", (W, H), (255, 255, 255, 255))
draw = ImageDraw.Draw(out)
for i, (img, label) in enumerate(combos):
    big = img.resize((cell_w, cell_h), Image.NEAREST)
    ox = pad + i * (cell_w + pad)
    draw.text((ox, 10), label, fill=(0, 0, 0, 255))
    out.paste(big, (ox, label_h + pad), big)
out.save(r"C:\claudecode\pokemon lan\tools\_combos_preview.png")
print("ok")
