# Prompt para generar sprites de Correr / Bici / Surf / Bucear / Pescar

## Contexto para pegar antes del prompt (una sola vez)

Estoy trabajando en un fangame de Pokémon (RPG Maker XP / Pokémon Essentials v21.1).
Tengo 78 personajes jugables ("monigotes") que hoy SOLO tienen sprite de caminar
(formato: PNG 128x192px, transparente, cuadrícula 4 columnas x 4 filas de 32x48px
cada cuadro — fila 1 = mirando abajo, fila 2 = mirando izquierda, fila 3 = mirando
derecha, fila 4 = mirando arriba; cada fila tiene 4 cuadros del ciclo de caminar).

Necesito que, para cada personaje, generes la MISMA hoja pero con la pose de
[correr / ir en bicicleta / surfear / bucear / pescar], manteniendo EXACTAMENTE
la paleta de colores, el diseño de ropa/pelo/cara y las proporciones del
personaje original — solo cambia la pose, no el diseño.

## El prompt en sí (repetir una vez por cada combinación personaje+estado)

```
Pixel art, 2D top-down RPG character spritesheet, Pokémon HGSS/DPPt overworld style.
Reference image attached: the WALKING spritesheet of this exact character (keep the
identical color palette, outfit, hair, and proportions — do not redesign the character).

Task: generate the {ESTADO} version of this same character.

Output format (must match exactly):
- Single PNG, transparent background, no drop shadow.
- 128x192 pixels total: a 4x4 grid of 32x48 px frames.
- Row 1 = facing down, Row 2 = facing left, Row 3 = facing right, Row 4 = facing up.
- Each row has 4 frames of a {ESTADO} cycle (not standing still), same pacing as a
  standard RPG Maker XP character animation for this state.
- {DETALLE_POSE}
- Sharp pixel edges, no anti-aliasing/blur, no gradients beyond what's already in
  the reference image's shading style.
- Consistent ground-level foot alignment across all frames (character's feet stay
  anchored to the same baseline as the reference walking sheet).
```

Reemplazá `{ESTADO}` y `{DETALLE_POSE}` según el estado que estés generando:

| Estado | `{ESTADO}` | `{DETALLE_POSE}` |
|---|---|---|
| Correr | running | Body leaned slightly forward, arms bent and pumping, legs raised higher/more extended than the walk cycle. |
| Bicicleta | riding a bicycle | Character seated on a simple bicycle (frame, handlebars, two wheels), pedaling motion across the 4 frames, same color palette as the character (bike itself can be a neutral dark metal/grey unless the reference shows one already). |
| Surf | surfing on a Pokémon's back | Character seated/kneeling as if riding on a surfing Pokémon's back (legs tucked, slight side-to-side bob across frames), upper body and face matching the reference exactly. No surfboard, no Pokémon drawn — just the rider's pose. |
| Bucear | diving underwater | Character wearing a simple diving mask and snorkel added on top of their existing design, horizontal swimming pose (not standing), gentle up/down bob across the 4 frames. |
| Pescar | fishing rod cast | Character standing, holding a fishing rod out in front, arms cast forward, subtle rod-tip bounce across the 4 frames. |

## Nombre de archivo de salida (IMPORTANTE, así el juego los detecta solo)

Guardá cada resultado como `<nombre_base>_<sufijo>.png` dentro de
`Graphics/Characters/`, sin espacios extra, respetando mayúsculas/minúsculas
exactas del nombre base. Sufijos: `_run`, `_bike`, `_surf`, `_dive`, `_fish`.

Ejemplo: para `trainer_LASS.png` corriendo → `trainer_LASS_run.png`.

## Los 78 nombres base (uno por personaje del catálogo)

```
NPC 01
NPC 02
NPC 03
NPC 04
NPC 05
NPC 06
NPC 07
NPC 08
NPC 09
NPC 10
NPC 11
NPC 12
NPC 13
NPC 14
NPC 15
NPC 16
NPC 17
NPC 18
NPC 19
NPC 20
NPC 21
NPC 22
NPC 23
NPC 24
NPC 25
NPC 26
NPC 27
NPC 28
trainer_POKEMONTRAINER_Red
trainer_POKEMONTRAINER_Leaf
trainer_POKEMONTRAINER_Brendan
trainer_POKEMONTRAINER_May
trainer_AROMALADY
trainer_BEAUTY
trainer_BIRDKEEPER
trainer_BLACKBELT
trainer_BUGCATCHER
trainer_BURGLAR
trainer_CAMPER
trainer_CHANNELER
trainer_COOLTRAINER_F
trainer_COOLTRAINER_M
trainer_CRUSHGIRL
trainer_ENGINEER
trainer_FISHERMAN
trainer_GAMBLER
trainer_GENTLEMAN
trainer_HIKER
trainer_JUGGLER
trainer_LADY
trainer_LASS
trainer_PAINTER
trainer_PICNICKER
trainer_POKEMANIAC
trainer_POKEMONBREEDER
trainer_POKEMONRANGER_F
trainer_POKEMONRANGER_M
trainer_PROFESSOR
trainer_PSYCHIC_F
trainer_PSYCHIC_M
trainer_ROCKER
trainer_RUINMANIAC
trainer_SAILOR
trainer_SCIENTIST
trainer_SUPERNERD
trainer_SWIMMER2_F
trainer_SWIMMER2_M
trainer_SWIMMER_F
trainer_SWIMMER_M
trainer_TAMER
trainer_TUBER2_F
trainer_TUBER2_M
trainer_TUBER_F
trainer_TUBER_M
trainer_TWINS
trainer_YOUNGCOUPLE
trainer_YOUNGCOUPLE_2
trainer_YOUNGSTER
```

## Notas realistas antes de empezar

- Son 78 personajes x hasta 5 estados = hasta 390 hojas de sprites. Es MUCHO
  trabajo aunque la IA acierte a la primera. Quizás tenga sentido arrancar
  solo con "correr" (el estado que más se nota, porque es de uso constante)
  y dejar bici/surf/bucear/pescar para después si el resultado convence.
- Casi ningún generador de imágenes comunes (Midjourney, DALL-E, etc.) va a
  respetar la cuadrícula de 32x48 exacta ni el fondo transparente a la
  primera. Conviene una herramienta pensada para pixel art con img2img
  (Retro Diffusion, PixelLab, o Stable Diffusion + LoRA de pixel art), y
  igual esperar tener que retocar a mano en un editor (alinear píxeles,
  ajustar paleta, limpiar bordes) antes de que el archivo quede usable.
- El juego no necesita que existan TODOS los sufijos para un personaje: si
  solo generás `_run` para uno y no `_bike`, ese personaje corre con su
  propio sprite pero sigue yendo en bici con el genérico de siempre. Podés
  ir completando de a poco sin romper nada.
