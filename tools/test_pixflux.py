"""
Test puntual: genera UN frame de LASS corriendo (south, frame 0)
usando generate_image_pixflux con parámetros explícitos de pixel art.
1 sola generación.
"""
import base64, sys
from io import BytesIO
from pathlib import Path
import requests
from PIL import Image

API_KEY  = "233b15f4-a716-4f44-903e-e1ad41b4578d"
API_BASE = "https://api.pixellab.ai/v1"
CHARS_DIR = Path(__file__).parent.parent / "Graphics" / "Characters"
INPUT_PNG = CHARS_DIR / "trainer_LASS.png"
OUT_DIR   = Path(__file__).parent
FRAME_W, FRAME_H = 32, 48
GEN_SIZE = 64

def pil_to_b64(img):
    buf = BytesIO()
    img.save(buf, format="PNG")
    return base64.b64encode(buf.getvalue()).decode()

def b64_to_pil(b64str):
    return Image.open(BytesIO(base64.b64decode(b64str))).convert("RGBA")

def pad_to_square(frame: Image.Image, size: int) -> Image.Image:
    canvas = Image.new("RGBA", (size, size), (0, 0, 0, 0))
    scaled = frame.resize((int(FRAME_W * size / FRAME_H), size), Image.NEAREST)
    canvas.paste(scaled, ((size - scaled.width) // 2, 0))
    return canvas

def main():
    walk = Image.open(INPUT_PNG).convert("RGBA")

    # Frame neutral mirando al sur (fila 0, col 1)
    ref = walk.crop((FRAME_W, 0, FRAME_W * 2, FRAME_H))
    ref_sq = pad_to_square(ref, GEN_SIZE)

    # Color image: hoja entera escalada a 64×64 para que el modelo tenga
    # toda la paleta de colores del personaje
    color_ref = walk.resize((GEN_SIZE, GEN_SIZE), Image.NEAREST)

    payload = {
        "description": (
            "female character running toward viewer, body leaning forward, "
            "blonde pigtails, pink purple top, blue denim shorts, light skin, "
            "Pokemon HGSS overworld sprite, top-down RPG, single frame"
        ),
        "image_size": {"width": GEN_SIZE, "height": GEN_SIZE},
        "negative_description": (
            "blurry, anti-aliasing, gradient, white background, shadow, "
            "3D, realistic, extra characters, watermark, standing still"
        ),
        "outline":  "single color black outline",
        "shading":  "basic shading",
        "detail":   "low detail",
        "view":     "high top-down",
        "direction": "south",
        "no_background": True,
        "init_image": {"type": "base64", "base64": pil_to_b64(ref_sq), "format": "png"},
        "init_image_strength": 600,
        "color_image": {"type": "base64", "base64": pil_to_b64(color_ref), "format": "png"},
        "text_guidance_scale": 8,
        "seed": 42,
    }

    headers = {"Authorization": f"Bearer {API_KEY}", "Content-Type": "application/json"}
    print("Llamando a pixflux...")
    resp = requests.post(f"{API_BASE}/generate-image-pixflux", json=payload, headers=headers, timeout=120)
    resp.raise_for_status()
    data = resp.json()
    print("Uso:", data.get("usage"))

    result = b64_to_pil(data["image"]["base64"])

    # Guardar en grande (64×64) para poder comparar bien
    out_64 = OUT_DIR / "test_pixflux_64x64.png"
    result.save(out_64)
    print(f"Guardado 64x64: {out_64}")

    # También escalar a 32×48 (tamaño real en el juego)
    result_small = result.resize((FRAME_W, FRAME_H), Image.NEAREST)
    out_small = OUT_DIR / "test_pixflux_32x48.png"
    result_small.save(out_small)
    print(f"Guardado 32x48: {out_small}")

if __name__ == "__main__":
    main()
