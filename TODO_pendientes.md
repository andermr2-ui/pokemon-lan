# Pendientes reportados (2026-09-23)

Lista de bugs/pedidos reportados por el usuario en una sola tanda, para retomar en la
próxima sesión (se cortó por límite de tokens). Ninguno de estos se implementó
todavía — es solo el registro de la tarea.

## 1. Surf/dive: mostrar al Pokémon montado, no el sprite genérico

**RESUELTA (2026-09-24)**. Dos bugs separados:
- Posición: `Plugins/Following Pokemon EX/Script Additions/Field Moves.rb`
  (`pbStartSurfing`) movía al seguidor un paso manual en la dirección del
  jugador al empezar a surfear (pensado para el seguidor normal que camina
  detrás), pisando la lógica de montura ya implementada. Ahora, si
  `FollowingPkmn.mounted?`, se hace `event.moveto` directo al tile del
  jugador en vez de caminar un paso.
- Visual: de las 49 skins del catálogo, solo 4 (Nurse, Painter, Leaf, Red)
  tenían arte de surf propio (las otras 45 eran copias exactas del sprite de
  caminar - nunca se hizo arte de surf para ellas). El personaje sentado
  (o la balsa negra de Nurse) chocaba visualmente con el Pokémon real de
  abajo. Se recortó (alpha=0) la mitad inferior de cada frame en las 49
  `Graphics/Characters/trainer_*_surf.png` (fracción de corte distinta según
  el tamaño real del sprite: 80% para los charsets estándar de 32x48, 58%
  para el arte grande de Nurse de 64x64), dejando solo torso/cabeza visible
  montado sobre el Pokémon. Backups en `Graphics/Characters/_bak_surf_crop/`.

## 2. Nadadores NPC caminando con pose de nadar en tierra (playa Tushi)

**RESUELTA (2026-09-23)**. Confirmada la sospecha: el swap se había hecho
directo en `trainer_SWIMMER_F/M.png` y `trainer_TUBER_F/M.png` (los archivos
BASE, compartidos por NPCs y por la skin del jugador — Essentials solo tiene
un gráfico por trainer type, no hay forma de que NPC y jugador usen archivos
distintos para el mismo nombre). Arreglo: se restauraron los 4 archivos base
a la pose de caminar normal (desde `.bak_swap`, así los NPCs de la playa
vuelven a caminar bien) y se movió el swap a lógica de código en vez de
archivo: `Character Customization.rb` ahora tiene
`CHARCUSTOM_SWIM_WALK_OVERRIDE` (mapa trainer_SWIMMER_F→trainer_SWIMMER2_F,
etc.) que solo sustituye la pose de flotar cuando el JUGADOR tiene esa skin
puesta y está caminando; correr sigue usando `_run.png` (pose real), y los
NPCs del mapa nunca pasan por este código, quedan intactos. Verificado con
boot de prueba limpio, inventario regenerado. Falta confirmación visual del
usuario en la playa.

## 3. Banco de Mamá: botón B activa/desactiva ahorros en vez de cancelar

**RESUELTA (2026-09-23)**. Causa real: `pbShowCommands` (Data/Scripts.rxdata,
script "Messages", línea 738) espera el índice de cancelar en **base 1**
(`command = cmdIfCancel - 1` internamente), pero `Mom Bank.rb` le pasaba
`salir_idx` ya en base 0 — quedaba apuntando UNA posición antes ("Activar/
desactivar ahorros"). Arreglado pasando `salir_idx + 1`.

**Bonus encontrado de paso**: el mismo bug exacto estaba en el armario
(`Character Customization.rb`, `pbAbrirArmario`) — pasaba `3` para un array de
4 opciones [Previous,Next,Confirm,Cancel], así que B resolvía a índice 2
("Confirm") en vez de 3 ("Cancel"): **apretar B en el armario CONFIRMABA el
outfit en vez de cancelarlo**, al revés de lo documentado. También arreglado
(ahora pasa `4`). Verificado con boot de prueba limpio — falta confirmar en
el juego real (hablar con Mamá y apretar B sin elegir nada; y en el armario,
probar un outfit y apretar B para ver que vuelve al original).

## 4. Armario: "Chica" (Lass) y "Pintor" comparten el mismo sprite

**RESUELTA (2026-09-23)**. Confirmado: "Chica" = `trainer_LASS` (Lass), no
Teenager F. No era un bug de código (archivos correctamente enlazados, no
duplicados) — eran visualmente casi idénticos por limitación real del set de
sprites (mismo pelo, mismo overol violeta). El usuario encontró un sprite de
Pintor distinto en internet (retrato/bust con boina rosa y bata blanca, hoja
de 9 poses: parado y 2 poses de caminar — pierna izq/der — para abajo, arriba
e izquierda; sin poses de derecha). Se extrajo, se quitó el fondo (color-key),
se armó un charset 128x192 (4x4, 32x48/frame) completo con animación de
caminar REAL (no estática) para las 4 direcciones, espejando horizontalmente
las 3 poses de "izquierda" para construir "derecha" (mismo criterio usado
para Tuber/Swimmer antes). Reemplazó `Graphics/Characters/trainer_PAINTER.png`
(backup: `.bak_before_new_art`). Verificado: inventario ahora marca "Camina"
(antes probablemente estático), boot de prueba limpio.

**No se tocó**: back sprite de batalla ni frontsprite de Pintor (la hoja
fuente no traía esas poses) — siguen siendo los que había antes.

## 5. Traducción: NPCs del mapa siguen hablando en Rioplatense

**RESUELTA en gran parte (2026-09-24)**, con una limitación conocida (ver abajo).
Causa raíz real encontrada: 17-19 mapas tienen referencias circulares que la
librería Python `rubymarshal` no puede leer ("invalid link destination") —
`convertir_rioplatense.py` los saltaba en silencio desde siempre, así que nunca
se procesaron. Se escribió `tools/convertir_rioplatense_broken_maps.rb` (Ruby +
`tools/rpg_stubs.rb`, que sí los lee) para cubrirlos. Ademas se encontró un bug
sistemático: cuando la palabra rioplatense queda pegada sin espacio justo
después de un código de control ("\bPodés..."), el patrón `\bWORD\b` nunca
matcheaba (para el regex, "b" y "P" son letras seguidas, sin límite entre
ellas) — palabras que estaban en el diccionario desde el principio jamás se
convertían si eran la primera de la caja de texto. Arreglado en ambos
scripts (se saca el prefijo de control antes de convertir). Se agregaron
~15 patrones nuevos al diccionario (che, quedate, parecés, sonás, esperá,
necesitás, disfrutá, andá, recordá, apurate, retá, retame, etc.) encontrados
sobre la marcha. Un barrido final de restos de inglés en los 366 mapas
(heurística de palabras comunes en inglés sin tildes) dio 0 resultados — el
diálogo de mapa está traducido al castellano.

**Limitación conocida**: el diccionario cubre los patrones de voseo
encontrados hasta ahora, pero es una lista cerrada — cualquier NUEVO
modismo rioplatense (dichos, jerga, verbos no listados) que aparezca en
texto no revisado todavía no se detecta automáticamente. Si el usuario
encuentra una frase nueva, hay que agregarla a mano a `CONVERSIONS` en
`tools/convertir_rioplatense.py` Y a `tools/convertir_rioplatense_broken_maps.rb`
(mismo patrón en ambos, o se pierde cobertura en los mapas rotos).

## 6. Guardería: subir el límite de 2 a 12 Pokémon, con cría múltiple real

**RESUELTA (2026-09-23)**. Investigación confirmó: `MAX_SLOTS = 2` estaba
hardcodeado en la clase `DayCare` (`Data/Scripts.rxdata`, script
"Overworld_DayCare"), pero el problema real no era ese número — era que
`generate_egg`/`compatibility`/etc. asumían que solo podía existir UNA pareja
posible ("los primeros 2 espacios llenos, los que sean"), así que con 12
depositados simplemente ignoraría a los otros 10.

El usuario pidió explícitamente la versión completa: 12 espacios, elegir con
libertad creativa la interfaz, y cría múltiple real en simultáneo (hasta 6
parejas). Implementado como plugin nuevo `Plugins/Day Care Expansion/`:

- **Diseño de parejas**: los 12 espacios se agrupan de a 2 por posición
  (espacios 0-1 = Pareja A, 2-3 = Pareja B, ... 10-11 = Pareja F) — como 6
  "jaulas", no elección libre de pareja entre los 12. Mucho más simple de
  usar y mantener, y ya cumple el pedido (dos equipos completos criando a la
  vez, o hasta 6 parejas). Cada pareja lleva su PROPIO progreso de huevo
  (compatibilidad, contador de pasos, huevo listo) — totalmente
  independiente de las demás.
- **Evento de la Guardería reescrito** (`Data/Map267.rxdata`, evento "Day
  Care Lady"): el árbol de ramas de RPG Maker hardcodeado para "máximo 2"
  (171 comandos) se reemplazó por un menú nuevo, todo en Ruby
  (`DayCareUI.pbMainMenu`, mismo patrón que `CharCustom.pbAbrirArmario` para
  el armario) — mucho más simple y mantenible que reconstruir el árbol
  visual a mano. Menú: "Dejar un Pokémon" (loop hasta llenar los 12 o
  quedarse sin Pokémon), "Retirar un Pokémon" (reusa `DayCare.choose`, ya
  escalaba solo a 12), "Revisar crías" (lista las 6 parejas con su estado y
  deja recoger el huevo de cualquiera que esté lista), "Nada, gracias".
- **Bonus encontrado de paso**: el evento original tenía 4 comandos
  corruptos con el mismo bug del quiz de Ambergrove (objeto anidado en vez
  de texto) — desaparecieron solos al reescribir el evento entero.

Backups: `Data/Map267.rxdata.bak_rewrite_daycare`. Verificado con boot de
prueba limpio. **No probado en el juego real** (depositar, esperar 256
pasos, revisar parejas, recoger huevo) — es la parte que no puedo simular yo
mismo, necesito que lo pruebes.

## 7. Textos de UNA línea cortados (nombre de habilidad, nombres de ataque)

**RESUELTA (2026-09-23)**. Alcance final más amplio que el pedido original
(el usuario reportó después que también pasaba con nombres de ataque largos en
Resumen y con "Generador de Niebla" en la pantalla de la PC — se arregló todo
junto). Causa: `pbDrawTextPositions` (Data/Scripts.rxdata, script "DrawText")
dibuja cada texto a su ANCHO NATURAL sin ningún control de caja — a diferencia
de `drawTextEx` (usado para descripciones), no hace wrap ni tiene límite.

Solución final (`UIFixes.pbFitSingleLine` en `Plugins/UI Fixes/UI Fixes.rb`):
a pedido del usuario, en vez de achicar el tamaño de fuente (se veían más
chicas Y más bajas), se dibuja el texto a tamaño normal en un bitmap aparte y
se pega comprimido horizontalmente (mismo alto, menos ancho — como una fuente
condensada). Se encontró y corrigió de paso un bug real en esa técnica:
`pbSetSystemFont` aplica un `text_offset_y` (desplazamiento vertical
calibrado) que el bitmap temporal no heredaba, haciendo que el texto quedara
pegado al borde inferior de su caja — arreglado dándole margen extra al
bitmap temporal y centrando el dibujo adentro.

Aplicado en 4 lugares: nombre de habilidad (Resumen pág. 3), nombres de
ataque (Resumen pág. 4, lista y detalle), nombre de habilidad/objeto en la
pantalla de la PC (`PokemonStorageScene#pbUpdateOverlay`), y nombres de
ataque en "Recordar Movimiento". Confirmado por el usuario en el juego real.

**No verificado todavía**: si algún NOMBRE de Pokémon (no de ataque/habilidad)
también se corta en algún lado — el usuario lo mencionó de pasada pero no dio
un caso concreto. Si vuelve a aparecer, aplicar el mismo `pbFitSingleLine`
donde corresponda.

## 8. Crash real: "Intl_Messages line 482: TypeError, no implicit conversion of
Regexp into Integer" — el juego se CIERRA después del popup

**RESUELTA (2026-09-23)**, dos causas distintas, mismo síntoma (ambas eran datos
de mapa corruptos con un objeto no-String donde el motor espera texto plano —
ni un bug de motor ni algo que vuelva a pasar solo por seguir jugando):

- **Gimnasio de Ambergrove** (`Data/Map182.rxdata`, evento 3 "QuizGuy"): 7 ramas
  de "respuesta incorrecta" del quiz tenían un comando "Mostrar Texto" (code 101)
  con un objeto `RPG::EventCommand` vacío anidado en `@parameters[0]` en vez de un
  string (bug clásico del editor de RPG Maker XP al guardar un cuadro de mensaje
  sin escribir texto). Arreglado con `tools/fix_quizguy_crash.py` (reemplaza esas
  7 ramas por el mismo texto "Lo siento, pero esa es la respuesta incorrecta." que
  ya usaba la primera pregunta). Backup: `Data/Map182.rxdata.bak_quizguy_crash`.
- **Ambergrove Cave** (`Data/Map181.rxdata`, los 5 eventos "Plate" — las placas
  antiguas): tenían el texto envuelto en una capa extra de lista
  (`@parameters = [["texto"]]` en vez de `["texto"]`). Arreglado con
  `tools/fix_plate_crash.py`. Backup: `Data/Map181.rxdata.bak_plate_crash`.

Ambos verificados con boot de prueba limpio (sin errorlog.txt) — falta que el
usuario confirme en el juego real (fallar una pregunta del quiz, interactuar con
una Plate).

## 9. Personalizar cómo te llaman los NPCs según la skin elegida

**RESUELTA (2026-09-23)**. El texto "chico"/"chica" NO estaba centralizado en
ningún helper — cada NPC lo tenía escrito a mano en su diálogo (solo 4 casos
reales en todo el juego: Map173 evento 5, Map176 evento 11, Map213 evento 7,
Map223 evento 8; no había ningún "chica" en femenino en ningún lado). En vez
de mapear las 47 entradas del catálogo a mano en un hash separado, se
reutilizó la traducción que YA existe para cada una (el label del `CATALOG`
de `Character Customization.rb`, la misma que se ve en el menú del armario) —
cero mapeo duplicado.

Implementación: se agregó una etiqueta de mensaje nueva `\pr` (rol del
jugador) en `pbMessageDisplay` (`Data/Scripts.rxdata`, script "Messages",
junto a `\pn`/`\pm` que ya existían — vía `tools/add_pr_message_tag.rb`), que
llama a `CharCustom.player_role_text` (nuevo método en el plugin): si hay
outfit puesto, devuelve el label traducido de ese outfit; si no, cae a
"chico"/"chica" por género (nuevas entradas en el diccionario, categoría 24).
Se reemplazó la palabra "chico" por `\pr` en los 4 diálogos encontrados
(`tools/replace_chico_with_pr.py`). Verificado en disco y boot de prueba
limpio. Backups: `Data/Map{173,176,213,223}.rxdata.bak_chico_to_pr`.

Nota para el futuro: si aparecen más NPCs con "chico"/"chica" hardcodeado (no
se puede descartar al 100% con una búsqueda de texto), el arreglo es
simplemente reemplazar esa palabra por `\pr` en el editor de eventos — la
etiqueta ya funciona en cualquier cuadro de texto del juego.

## 10. Renombrar "Evaluador de nombres" a "Inspector de motes"

**RESUELTA (2026-09-23)**. Cambiado en 3 lugares:
- Diccionario (`Data/messages_es_game.dat` y `Data/messages_game.dat`, categoría
  20, clave `"Name Rater"`, era el nombre del TrainerType).
- Texto de diálogo escrito directamente en mapas (`Data/Map215.rxdata` evento 23
  y evento 20, `Data/Map311.rxdata` eventos 2 y 3) vía `tools/rename_name_rater.py`.
Verificado en disco (`grep` confirma 0 ocurrencias de "Evaluador de Nombres"
restantes, 2+2 de "Inspector de Motes") y boot de prueba limpio.

---

**Orden sugerido para la próxima sesión** (crítico primero, después cosas rápidas,
después las más grandes/inciertas):
1. Item 8 (crash real) — prioridad máxima, rompe el juego.
2. Item 3 (Banco de Mamá, botón B) — bug de UX simple, rápido de arreglar.
3. Item 10 (Inspector de motes) — cambio de texto trivial.
4. Item 7 (título de habilidad cortado) — ya sabemos el patrón exacto a aplicar.
5. Item 4 (Chica/Pintor mismo sprite) — investigar y corregir, acotado.
6. Item 2 (nadadores NPC con pose rota) — investigar alcance del bug de raíz.
7. Item 5 (rioplatense persistente) — investigar por qué el script no cubrió todo.
8. Item 1 (surf/dive con Pokémon montado, arte por skin) — trabajo de arte grande.
9. Item 9 (NPCs te llaman por tu rol) — feature nueva, alcance grande (muchos eventos).
10. Item 6 (guardería a 12 Pokémon) — feature nueva, investigar alcance antes de prometer.
