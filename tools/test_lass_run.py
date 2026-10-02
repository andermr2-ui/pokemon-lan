"""
Test: genera trainer_LASS_run.png usando PixelLab animate_with_text.
4 llamadas a la API (una por dirección: south, west, east, north).
Resultado: Graphics/Characters/trainer_LASS_run.png (128x192, 4x4 grid, 32x48 por frame).
"""
import sys
import base64
from io import BytesIO
from pathlib import Path
import requests
from PIL import Image

# --- Config ---
API_KEY    = "233b15f4-a716-4f44-903e-e1ad41b4578d"
CHARS_DIR  = Path(__file__).parent.parent / "Graphics" / "Characters"
INPUT_PNG  = CHARS_DIR / "trainer_LASS.png"
OUTPUT_PNG = CHARS_DIR / "trainer_LASS_run.png"

FRAME_W, FRAME_H = 32, 48
GEN_W,   GEN_H   = 64, 64   # API acepta exactamente 64×64

# Fila del charset → dirección PixelLab
DIRECTIONS = [
    ("south", 0),   # fila 0 = mirando abajo
    ("west",  1),   # fila 1 = mirando izquierda
    ("east",  2),   # fila 2 = mirando derecha
    ("north", 3),   # fila 3 = mirando arriba
]

CHARACTER_DESC = (
    "female character, blonde pigtails, pink purple top, blue denim shorts, "
    "light skin, pixel art, Pokemon HGSS overworld sprite style, top-down RPG"
)
NEGATIVE_DESC = (
    "blurry, anti-aliasing, gradient, white background, drop shadow, 3D, "
    "realistic, extra characters, watermark, border"
)

def extract_frame(sheet: Image.Image, row: int, col: int) -> Image.Image:
    x = col * FRAME_W
    y = row * FRAME_H
    return sheet.crop((x, y, x + FRAME_W, y + FRAME_H)).convert("RGBA")

API_BASE = "https://api.pixellab.ai/v1"

def pil_to_b64(img: Image.Image) -> str:
    buf = BytesIO()
    img.save(buf, format="PNG")
    return base64.b64encode(buf.getvalue()).decode()

def b64_to_pil(b64str: str) -> Image.Image:
    return Image.open(BytesIO(base64.b64decode(b64str))).convert("RGBA")

def animate_with_text_raw(ref_img: Image.Image, direction: str, action: str) -> list[Image.Image]:
    payload = {
        "image_size": {"width": GEN_W, "height": GEN_H},
        "description": CHARACTER_DESC,
        "action": action,
        "reference_image": {"type": "base64", "base64": pil_to_b64(ref_img), "format": "png"},
        "view": "high top-down",
        "direction": direction,
        "negative_description": NEGATIVE_DESC,
        "n_frames": 4,
        "text_guidance_scale": 7.5,
        "image_guidance_scale": 2.0,
        "seed": 42,
    }
    headers = {"Authorization": f"Bearer {API_KEY}", "Content-Type": "application/json"}
    resp = requests.post(f"{API_BASE}/animate-with-text", json=payload, headers=headers, timeout=120)
    resp.raise_for_status()
    data = resp.json()
    usage = data.get("usage", {})
    print(f"    uso: {usage}")
    return [b64_to_pil(img["base64"]) for img in data["images"]]

def main():
    if not INPUT_PNG.exists():
        print(f"ERROR: no se encuentra {INPUT_PNG}")
        sys.exit(1)

    walk_sheet = Image.open(INPUT_PNG).convert("RGBA")
    output = Image.new("RGBA", (FRAME_W * 4, FRAME_H * 4), (0, 0, 0, 0))

    for direction, row_idx in DIRECTIONS:
        print(f"  Generando dirección: {direction} (fila {row_idx})...")

        # Usar el frame neutral (col 1) de esa misma dirección como referencia
        ref_frame = extract_frame(walk_sheet, row=row_idx, col=1)
        # Redimensionar la referencia a 64×64 conservando aspecto + padding transparente
        ref_frame_scaled = Image.new("RGBA", (GEN_W, GEN_H), (0, 0, 0, 0))
        ref_fitted = ref_frame.resize((int(FRAME_W * GEN_H / FRAME_H), GEN_H), Image.NEAREST)
        x_offset = (GEN_W - ref_fitted.width) // 2
        ref_frame_scaled.paste(ref_fitted, (x_offset, 0))

        frames = animate_with_text_raw(
            ref_img=ref_frame_scaled,
            direction=direction,
            action="running, body leaning forward, arms pumping, legs raised",
        )

        for frame_idx, frame_pil in enumerate(frames):
            frame_small = frame_pil.resize((FRAME_W, FRAME_H), Image.NEAREST)
            x = frame_idx * FRAME_W
            y = row_idx   * FRAME_H
            output.paste(frame_small, (x, y))

        print(f"    OK {direction} - {len(frames)} frames")

    output.save(OUTPUT_PNG)
    print(f"\nGuardado: {OUTPUT_PNG}")
    print("Listo. Revisá el sprite en Graphics/Characters/trainer_LASS_run.png")

if __name__ == "__main__":
    main()
