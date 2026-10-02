from pathlib import Path
from PIL import Image

CHARS_DIR = Path(__file__).parent.parent / "Graphics" / "Characters"
OUT_DIR   = Path(__file__).parent
FRAME_W, FRAME_H = 32, 48
SCALE = 6

def extract_row(path, row):
    sheet = Image.open(path).convert("RGBA")
    frames = []
    for col in range(4):
        x, y = col * FRAME_W, row * FRAME_H
        frame = sheet.crop((x, y, x + FRAME_W, y + FRAME_H))
        bg = Image.new("RGBA", frame.size, (180, 180, 180, 255))
        bg.paste(frame, mask=frame)
        frames.append(bg.convert("RGB").resize((FRAME_W * SCALE, FRAME_H * SCALE), Image.NEAREST))
    return frames

walk_lass  = extract_row(CHARS_DIR / "trainer_LASS.png",     row=0)
run_lass   = extract_row(CHARS_DIR / "trainer_LASS_run.png", row=0)
run_boy    = extract_row(CHARS_DIR / "boy_run.png",          row=0)

fw = FRAME_W * SCALE
fh = FRAME_H * SCALE
gap = 8
combined_frames = []

for i in range(4):
    canvas = Image.new("RGB", (fw * 3 + gap * 2, fh + 20), (100, 100, 100))
    canvas.paste(walk_lass[i], (0, 20))
    canvas.paste(run_lass[i],  (fw + gap, 20))
    canvas.paste(run_boy[i],   (fw * 2 + gap * 2, 20))
    # Labels
    from PIL import ImageDraw
    draw = ImageDraw.Draw(canvas)
    draw.text((2, 2),          "LASS walk", fill=(255,255,100))
    draw.text((fw + gap + 2, 2), "LASS run (IA)", fill=(255,150,150))
    draw.text((fw*2 + gap*2+2, 2), "boy_run (ref)", fill=(150,255,150))
    combined_frames.append(canvas)

combined_frames[0].save(
    OUT_DIR / "compare_3way.gif",
    save_all=True,
    append_images=combined_frames[1:],
    loop=0,
    duration=130,
)
print("Guardado: compare_3way.gif")
