# Handoff — Plugin Character Customization (Armario)

## Estado actual

El plugin está **funcionalmente completo en el overworld** (cambio de skin al caminar).
El override del **back sprite en batalla** quedó arreglado (ver "Bug resuelto" más abajo) —
falta probarlo en el juego después de reiniciar (el fix no aplica a una partida ya
abierta, porque `Data/PluginScripts.rxdata` solo se lee al arrancar).

---

## Qué hace el plugin

Agrega un sistema de personalización de personaje accesible desde un armario en el juego.
El jugador puede elegir entre **78 opciones** (28 NPCs genéricos + 4 protagonistas + 46 trainer types).
La elección persiste en `$player.cc_walk_charset` (string con el nombre del archivo, o `nil` = default).

---

## Archivos modificados / creados

### Plugin (código)
- **`Plugins/Character Customization/Character Customization.rb`**
  - Clase `Player`: atributo `cc_walk_charset` + `cc_enabled?`
  - Módulo `CharCustom`: `CATALOG` (lista completa) + `pbAbrirArmario` (UI del armario)
  - Clase `Game_Player`: hooks en `refresh_charset` y `set_movement_type` para el overworld
  - Módulo `GameData::TrainerType`: override de `back_sprite_filename` (clase) — ver bug pendiente

### Sprites de batalla (back)
Todos en `Graphics/Trainers/`, formato `TYPE_back.png` (800×160 RGBA, 5 frames × 160×160px):
- Procesados: `ROCKER_back`, `TUBER_F_back`, `TUBER_M_back`, `SWIMMER2_F_back`, `SWIMMER2_M_back`
- **50 trainer types** tienen back sprite completo
- **3 sin back sprite** (fallback al sprite original en batalla): `TUBER2_F`, `TUBER2_M`, `YOUNGCOUPLE`

### Charsets de overworld (walk)
Todos en `Graphics/Characters/`, formato `trainer_TYPE.png` (128×192, grilla 4×4 de 32×48):
- **`trainer_NURSE.png`** — creado desde sprite de DeviantArt (Nurse Joy con animación real)
- **`trainer_TEENAGERF.png`** — copiado de `trTeenager_F.png`
- **`trainer_TEENAGERM.png`** — copiado de `trTeenager_M.png`

---

## Cómo activar el armario en RPG Maker

En el evento del armario, agregar **"Llamar Script"**:

```ruby
CharCustom.pbAbrirArmario
```

---

## Bug resuelto: back sprite no cambiaba en batalla

### Causa real
`back_sprite_filename` (el método que interceptaba el hook original) **nunca se llama
para el propio jugador**. Es el método que usa el motor para trainers NPC. El jugador
tiene su PROPIO método separado: `GameData::TrainerType.player_back_sprite_filename`,
que es el único invocado desde `Scene_Initialize#pbCreateTrainerBackSprite` al armar la
escena de batalla (confirmado leyendo `Data/Scripts.rxdata` — es el único call site en
todo el proyecto). Por eso `cc_debug.txt` nunca se creaba: el método interceptado
correcto era otro.

`player_back_sprite_filename` original ya contempla el sistema nativo de "outfit"
(`$player.outfit`, sin relación con nuestro Character Customization) antes de caer al
back sprite base — nuestro override respeta ese fallback intacto.

### Fix aplicado
Se movió el override de `back_sprite_filename` a `player_back_sprite_filename` en
`Plugins/Character Customization/Character Customization.rb`, se sacó todo el
`File.open("cc_debug.txt", ...)` de debug, y se simplificó la condición (ya no hace
falta comparar `trainer_type == $player.trainer_type` porque este método SOLO se llama
para el jugador).

### Pendiente de verificar
El fix se compiló y se probó que el juego arranca sin errores, pero **no se probó
visualmente en una batalla real** — hace falta reiniciar el juego (una partida ya
abierta sigue con el plugin viejo en memoria) y entrar a un combate con una skin
`trainer_*` puesta para confirmar que el back sprite cambia de verdad.

---

## Cómo funciona el overworld (esto SÍ funciona)

Los hooks en `Game_Player` interceptan:
- `refresh_charset` — al cambiar skin/outfit
- `set_movement_type(type)` — en cada paso/movimiento

Si `$player.cc_walk_charset` tiene valor, pisan `@character_name` con el nombre correcto.

**Variantes de movimiento (futuro-compatible):**  
Si existe `Graphics/Characters/trainer_TYPE_run.png`, se usa al correr.  
Sufijos soportados: `_run`, `_bike`, `_surf`, `_dive`, `_fish`.  
Sin el archivo, cae al genérico (`boy_run`, `girl_bike`, etc.).

---

## Personajes eliminados del CATALOG

| Personaje | Razón |
|-----------|-------|
| TWINS | Sprite de dos personas simultáneas |
| YOUNGCOUPLE_2 | Sin sprites en el proyecto |
| ALESSIO | Sin charset identificable |
| ZEKE | Sin charset identificable |

---

## Labels corregidos (esta sesión)

`SWIMMER2_F/M` → `"Swimmer Alt (F/M)"` y `TUBER2_F/M` → `"Tuber Alt (F/M)"` para evitar duplicados en la lista del armario.

---

## Checklist para el hilo principal

- [x] Diagnosticar el bug del back sprite (era el método equivocado: `player_back_sprite_filename`, no `back_sprite_filename`)
- [x] Arreglar el hook y quitar el bloque `File.open("cc_debug.txt"...)` del plugin
- [ ] Crear el evento del armario en RPG Maker si no existe todavía
- [ ] Reiniciar el juego y probar de verdad: elegir skin `trainer_*` → entrar en batalla → verificar back sprite → cancelar → verificar que vuelve al original
- [x] Quitar el fondo blanco opaco de los 48 back sprites generados (`tools/remove_white_bg_backsprites.py`, flood-fill desde los bordes de cada frame, no color-key global — no toca blancos internos del dibujo). Los 4 vanilla (Red/Leaf/Brendan/May) no se tocaron, ya estaban bien.
- [ ] (Opcional futuro) `TUBER2_F_back.png`, `TUBER2_M_back.png`, `YOUNGCOUPLE_back.png` si se quieren cubrir los 3 faltantes
