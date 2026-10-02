"""
Crea GIFs animados de la fila "south" del walk y del run para comparar en movimiento.
"""
from pathlib import Path
from PIL import Image

CHARS_DIR = Path(__file__).parent.parent / "Graphics" / "Characters"
OUT_DIR   = Path(__file__).parent
FRAME_W, FRAME_H = 32, 48
SCALE = 6  # ampliar x6 para verlo bien

def extract_row(sheet_path, row):
    sheet = Image.open(sheet_path).convert("RGBA")
    frames = []
    for col in range(4):
        x, y = col * FRAME_W, row * FRAME_H
        frame = sheet.crop((x, y, x + FRAME_W, y + FRAME_H))
        # Fondo blanco para GIF (transparencia no soportada bien en GIF animado)
        bg = Image.new("RGBA", frame.size, (200, 200, 200, 255))
        bg.paste(frame, mask=frame)
        frames.append(bg.convert("RGB").resize(
            (FRAME_W * SCALE, FRAME_H * SCALE), Image.NEAREST
        ))
    return frames

def save_gif(frames, path, duration_ms):
    frames[0].save(
        path,
        save_all=True,
        append_images=frames[1:],
        loop=0,
        duration=duration_ms,
    )
    print(f"Guardado: {path}")

walk_frames = extract_row(CHARS_DIR / "trainer_LASS.png",     row=0)
run_frames  = extract_row(CHARS_DIR / "trainer_LASS_run.png", row=0)

save_gif(walk_frames, OUT_DIR / "compare_walk.gif", duration_ms=180)
save_gif(run_frames,  OUT_DIR / "compare_run.gif",  duration_ms=110)
