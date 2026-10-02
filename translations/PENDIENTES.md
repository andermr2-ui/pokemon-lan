# Hoja de ruta de traducción — Pokémon Resolute Edition (ES)

Reorganizado el 2026-09-11 a pedido del usuario: antes esto era un log
cronológico de sesiones; ahora es una lista de trabajo ordenada por
prioridad, para poder avanzar bloque por bloque sin depender de releer
todo el historial. El log técnico detallado (gotchas, scripts, bugs ya
resueltos) se movió al final, en "Archivo histórico / gotchas técnicos".

## Cómo trabajar con este documento

1. Empezar siempre por **PRIORIDAD 1** (frases de sistema): son las que el
   jugador ve todo el rato, en cualquier punto del juego.
2. Seguir con **PRIORIDAD 2** (datos funcionales: objetos, movimientos,
   habilidades, Pokédex) en el orden listado.
3. Recién después, **PRIORIDAD 3** (historia por bloques geográficos). Cada
   bloque = un pueblo/ruta/zona con todos sus mapas, NPCs, combates y
   eventos. Un bloque se da por "hecho" cuando TODOS sus mapas están
   traducidos, reinsertados y verificados en el juego.
4. Trabajar los bloques de historia en el ORDEN en que aparecen (siguen el
   recorrido real del jugador por la Región Delta). No saltar bloques.

---

## PRIORIDAD 1 — Frases universales de sistema (máxima prioridad)

Aparecen constantemente sin importar en qué mapa esté el jugador.

- [x] Conseguir/encontrar objetos (`pbReceiveItem`, objetos en el suelo):
      las 12 variantes de "Conseguiste/Encontraste" + "guardado en el
      bolsillo de tu Mochila" + "Escapaste sin problemas". **Cuidado**: ver
      gotcha de `\c[1]`/`\n` en el archivo histórico antes de tocar
      cualquier texto de SCRIPT_TEXTS con códigos de control.
- [x] Enfermera Joy + Bill/PC + Borrador de Movimientos (los 3 patrones
      duplicados en los 20 Centros Pokémon del juego).
- [x] Mochila (UI_Bag), Pantalla de guardado (UI_Save), Tienda (UI_PokeMart).
- [x] Menú de pausa y VMS (multijugador): "Juego en Red", "Combate
      Múltiple", "Desconectar". **CORREGIDO DE VERDAD (2026-09-16)**: la
      nota anterior solo cubría las opciones de menú (arrays hardcodeados
      tipo `["Crear Partida", "Unirse a Servidor", "Cancelar"]`), pero el
      usuario reportó "Host Game"/"Join Server"/"What action would you
      like to take?"/"Are you sure you want to disconnect?" en inglés
      jugando en LAN con amigos. **Causa real**: los mensajes del plugin
      `Plugins/Voltseon's Multiplayer Solution/` se definen como
      constantes de módulo (`CONST = _INTL("...")`), que Ruby evalúa UNA
      SOLA VEZ al cargar el plugin en el arranque del juego — antes de
      que el diccionario `messages_game.dat` esté cargado en memoria. Por
      eso, aunque la clave YA estuviera traducida en el diccionario
      (estaba, desde la tanda de SCRIPT_TEXTS), el juego nunca la
      resuelve: siempre devuelve el texto en inglés tal cual. Es un
      problema de orden de carga, no de traducción faltante — reiniciar
      el juego NO lo arregla, pasa en TODOS los arranques.
      **Solución aplicada**: en vez de depender del diccionario, se puso
      el texto en español DIRECTAMENTE dentro de cada `_INTL("...")` de
      los 6 archivos del plugin (95 strings), igual que ya se había
      hecho antes con los arrays de opciones. Auditado con
      `tools/audit_plugin_intl.rb` (escanea `Plugins/.../*.rb` en vez de
      solo `Data/Scripts.rxdata`, que es donde vivía el hueco: el
      auditor viejo `audit_script_texts_v2.rb` nunca miraba la carpeta
      Plugins). Script de aplicación: `tools/fix_vms_plugin_intl.rb`
      (regex `_INTL\("..."` + `eval` para decodificar escapes + lookup
      contra categoría 24 + `.inspect` para reescribir el literal Ruby
      con el escapado correcto). **Lección para el futuro**: cualquier
      plugin en `Plugins/` que defina mensajes como constantes de módulo
      con `_INTL(...)` necesita el texto en español hardcodeado
      directamente, NO alcanza con traducir la clave en
      `messages_game.dat`.
- [x] Mapa del Pokégear (nombres de región/ubicación, categorías 18/19/20).
- [x] SCRIPT_TEXTS (categoría 24, todos los mensajes `_INTL(...)` del
      código) — **COMPLETADO (2026-09-12)**. Motivo: el usuario reportó
      "Claudio is now holding the Poción" en inglés al dar un objeto
      desde el menú de Pokémon. Mismo patrón oculto que objetos/Pokédex/
      movimientos: de **3301 strings `_INTL` únicas** en todo
      `Data/Scripts.rxdata`, solo 911 tenían alguna clave en
      `messages_es_game.dat` (896 traducidas + 15 sin traducir) —
      **2730 faltaban por completo**. Auditado con
      `tools/audit_script_texts_v2.rb` (usa `eval` para decodificar
      escapes exactamente como el parser de Ruby, evitando falsos
      negativos con `\c[n]`, `\wt[n]`, etc. — la v1 sin `eval` daba 30
      falsos "faltantes"). Volcado completo en
      `tools/_script_texts_missing.tsv` (2745 entradas únicas).
      Traducido en 6 tandas paralelas en background
      (`tools/apply_script_texts_batch01.rb` a `batch06.rb` + helper
      `tools/apply_script_texts_common.rb`, mismo patrón que
      movimientos). **Verificado: 0/3301 faltantes reales.** Quedan 160
      strings iguales en inglés/español a propósito: rutas de assets
      (`Graphics/UI/...`), letras sueltas del índice de Pokédex (A-Z),
      nombres de Pokémon/personajes (Ditto, Bill, Torchic), plantillas
      sin palabras (`{1} {2}`), abreviaturas de mes que coinciden (Feb.,
      Mar., etc.) y cognados oficiales (Poké Ball, Shiny, IVs, EVs, VS,
      PP, Pokédex, Pokégear) — no son huecos de traducción.
- [x] Nombres y descripciones de movimiento — **CORREGIDO Y COMPLETADO
      (2026-09-11)**. La nota anterior ("141/142") describía solo la
      categoría 5/6 de messages_es_game.dat como si esas fueran todas las
      entradas posibles, pero igual que pasó con objetos y Pokédex, el
      alcance real era mucho mayor: `Data/moves.dat` tiene **867
      movimientos**, y de esos solo 142 tenían alguna clave — **725
      movimientos no tenían NINGUNA clave** (entre ellos "Quick Attack",
      que el usuario reportó viendo en inglés en combate contra un
      Rattata salvaje). Auditoría con `tools/audit_moves_entries.rb`,
      lista completa en `tools/_moves_all.tsv`. Traducido en 5 tandas
      (`tools/apply_moves_batch01.rb` a `apply_moves_batch05.rb` +
      helper `tools/apply_moves_common.rb`, mismo patrón que Pokédex/
      objetos) usando los nombres oficiales de movimiento en español.
      **Verificado: 867/867 nombres y 867/867 descripciones traducidas.**
      Nota: "U-turn", "Embargo", "Poltergeist", "Amnesia", "Surf" y
      "Catastropika" quedan igual en inglés y español a propósito (son
      cognados/nombres propios oficiales, no texto sin traducir).
- [x] Habilidades: confirmado 304/306 nombres (solo faltan "Simple" y
      "Transistor", decisión del usuario). 294/294 descripciones.

## PRIORIDAD 2 — Datos funcionales pendientes (por orden de visibilidad)

- [x] **Los 27 objetos vendidos en TODAS las tiendas del juego** (Poción,
      Antídoto, Repelente, Súper Ball, Ultra Ball, Cura Total, Restaurar
      Todo, Revivir, Objetos Reliquia, etc. — `tools/apply_core_shop_items.rb`)
      + Leche Moomoo y los 7 Dulces de Milcery (`tools/apply_sweets_and_milk.rb`,
      encontrados en la Pastelería Crema). Confirmado con
      `tools/list_all_mart_symbols.rb` que son TODOS los símbolos que usan
      los 13 Marts del juego — cualquier tienda que visite el jugador desde
      ahora debería mostrarse completa en español.
- [x] **Objetos — resto (794 total)** — **COMPLETADO (2026-09-12)**.
      Auditado con `tools/audit_items_full.rb` contra `Data/items.dat`
      (fuente de verdad real): 597 nombres, 598 plurales y 636
      descripciones no tenían ninguna clave. Volcado completo en
      `tools/_items_all.tsv` (794 filas) y `tools/_items_pending.tsv`
      (685 filas que necesitaban algo). Traducido en 5 tandas paralelas
      en background (`tools/apply_items_batch_full01.rb` a
      `batch_full05.rb` + helper `tools/apply_items_full_common.rb`),
      con bayas verificadas contra PokeAPI/WikiDex (nombres oficiales
      España, ej. Sitrus→Zidra, Pecha→Meloc, Cheri→Zreza — no son
      transliteración directa). **Verificado: 0 nombres/plurales/
      descripciones faltantes.** Quedan 65 nombres iguales a propósito:
      variantes de Poké Ball (oficialmente solo "Great Ball"→"Súper
      Ball" cambia), los 35 Cristales Z (nombres inventados, se
      mantienen en toda localización oficial) y Protector/Elixir/Zinc
      (misma palabra en ambos idiomas).
      **Gotcha de esta tanda**: un agente delegado reportó `status:
      completed` sin haber hecho el trabajo real — había delegado a un
      sub-agente propio y devolvió el resultado antes de que ese
      sub-agente terminara. Se detectó verificando que el archivo
      `.rb` esperado no existía pese al reporte de éxito, y se corrigió
      relanzando la tarea con instrucción explícita de no delegar.
      Lección: **verificar siempre que el artefacto (archivo/script)
      exista de verdad antes de dar por buena una tanda delegada**,
      no confiar solo en el texto del reporte.
- [x] Nombres de especie — categoría 2 (categorías tipo "Pokémon Semilla"):
      81/81, 67 contrastadas contra WikiDex, 14 sin verificar (ver detalle
      en archivo histórico).
- [x] Nombres de especie — categoría 1 — **CONFIRMADO, NO REQUIERE
      TRADUCCIÓN (2026-09-12)**. Los 127 sin traducir son TODOS especies/
      formas de Gen 8-9 (formas de Hisui, Paldea, Pokémon de paradoja
      tipo "Great Tusk"/"Iron Hands"). Política oficial de Game Freak:
      los nombres de especie NUNCA se traducen al español en ninguna
      generación — se dejan intencionalmente iguales al inglés.
- [x] `SPECIES_FORM_NAMES` (categoría 4) — **HECHO (2026-09-12)**. 47/47
      traducidas (`tools/apply_forms_and_phone.rb`): formas de Hisui/
      Paldea, máscaras de Ogerpon, formas de Dudunsparce/Gimmighoul/
      Tatsugiri/Poltchageist-Sinistcha, gorras de Pikachu, etc.
- [x] `POKEDEX_ENTRIES` — **HECHO (2026-09-11)**. Prioridad 1 pedida
      explícitamente por el usuario (capturó un Meowth raro y vio su
      descripción en inglés; pidió traducir TODAS las entradas antes de
      seguir con la historia). Alcance real descubierto: las
      descripciones NO vivían en messages_es_game.dat categoría 3 como
      decía la documentación vieja, sino en `Data/species.dat` (campo
      `@real_pokedex_entry`); de 1201 textos únicos (1429 especies/formas
      con entrada), solo 173 tenían clave sin traducir y 1028 no tenían
      NINGUNA clave (mismo patrón que los ~692 objetos sin extraer).
      Solución: añadir clave para cada texto único en
      messages_es_game.dat/messages_game.dat categoría 3 (mismo patrón
      usado para items), traducido en 12 tandas de ~100.
      **Verificado con `tools/audit_pokedex_entries.rb`: 1201/1201
      traducidas, 0 sin traducir, 0 sin clave.** Scripts:
      `tools/apply_dex_batch01.rb` a `tools/apply_dex_batch12.rb`
      (#1-1201), helper compartido `tools/apply_dex_common.rb`.
- [x] `PHONE_MESSAGES` (categoría 22) — **HECHO (2026-09-12)**. 41/41
      traducidas (`tools/apply_forms_and_phone.rb`), placeholders
      `\PN`/`\TN`/`\TP`/`\TE`/`\TM`/`\m` preservados intactos.
- [ ] `REGION_NAMES` (Essen/Tiall/Delta): decisión ya tomada de dejar sin
      traducir (nombres propios de región, igual que en localizaciones
      oficiales).
- [ ] `TRAINER_NAMES`: 905 sin traducir — decisión ya tomada de NO
      traducir nombres propios de entrenadores genéricos (solo Xarly).
- [x] `TRAINER_SPEECHES_LOSE` (categoría 23) — **CONFIRMADO YA HECHO
      (2026-09-16)**. La nota vieja ("264 de 269 sin traducir") estaba
      desactualizada — auditoría real mostró 268/269 ya traducidas de
      una sesión anterior no reflejada en esta lista. La única "sin
      traducir" es `"..."` (igual en ambos idiomas, no es un hueco).
- [x] `FRONTIER_INTRO/END_SPEECHES` (categorías 15/16/17,
      desafío/victoria/derrota del Battle Frontier) — **HECHO
      (2026-09-16)**. 912 frases en total (299+298+315), TODAS sin
      ninguna clave. Volcadas en `tools/_frontier_speeches.tsv`,
      traducidas en 5 tandas paralelas en background
      (`tools/apply_frontier_batch01.rb` a `batch05.rb` + helper
      `tools/apply_frontier_common.rb`), en castellano de España, TODO
      EN MAYÚSCULAS como el original. **Verificado: cat15 299/299,
      cat16 297/298 (1 cognado "OH"), cat17 298/315 reales + 17
      entradas de padding numérico no traducibles ("0","3","149",etc,
      residuos del array del .dat, no son diálogo).** Nota: una tanda
      tradujo referencias a movimientos/habilidades Pokémon de forma
      libre en vez de usar los nombres oficiales ya establecidos en el
      resto del juego (ej. Mach Punch, Brick Break, Belly Drum) — de
      bajo impacto por ser chat de sabor del Frontier, no bloquea, se
      dejó una tarea de revisión aparte para evaluar si conviene
      unificar terminología.

## PRIORIDAD 3 — Historia por bloques (Región Delta, orden del recorrido)

Cada bloque lista sus mapas (número interno). "Hecho" = todo el diálogo
del bloque traducido y reinsertado. Los renombres de lugar ya aplicados
(categoría MAP_NAMES/REGION_LOCATION_NAMES) están vigentes en TODOS los
bloques automáticamente vía Pokégear/carteles — lo que falta acá es el
diálogo de mapa (NPCs, carteles internos, eventos, combates).

### ✅ Prado Arboleda [Meadow Grove] — HECHO
Mapas: 33 (exterior), 43 (Centro Pokémon), 79 (Tienda, sin texto propio),
86 (Casa de Marcus), 290/291/292 (casas genéricas), 293 (Pastelería
Crema), 313 (Casa de Xarly), 3 (Route2Connection — corregido 2026-09-11,
tenía un oficial de policía sin traducir que se me había pasado), 105
(Route6Connection — mismo descuido, corregido).

### ✅ Valle del Rocío [Starter Valley] — HECHO (2026-09-11)
Mapas: 22 (exterior, sin diálogo propio), 48 (Laboratorio, entrega de
starter), 77 (Casa del jugador, diálogo de la madre), 76 (Roca de Jirachi,
evento legendario).

### ✅ Ruta 1/2 (Delta) — HECHO (2026-09-11)
Mapas: 32 (batalla de rival Xarly, evento Manaphy), 362 (sin diálogo), 80
(evento legendario Shaymin + entrenadores), 98 (evento legendario Suicune
+ Azelf + entrenadores).

### ✅ Cordillera Flecha [Arrow Ridge] — HECHO (2026-09-11)
Mapas: 42 (exterior, historia del corrimiento de tierras), 81 (Gimnasio,
Rose), 87 (Centro Pokémon), 88 (Tienda), 258 (Academia, Prof. McAvoy —
regalo de Squirtle + Mega Piedra, incluye renombres Zeke→Xarly y
Oak→Profesor Miyagi), 294 (Ranger regala un Snivy), 295 (Casa b).

### ✅ Montaña Calada [Rumble Mountain] — HECHO (2026-09-11)
Mapas: 83 (Sur, entrenadores + combate doble), 85 (Centro, portero), 366
(sin diálogo), 89 (Norte, evento legendario Diancie + NPCs), 283 (sin
diálogo), 284 (Cámara del Gólem, evento Regirock).

### ✅ Velo Brumoso [Mistveil] — HECHO (2026-09-11)
Mapas: 91 (exterior, historia de la niebla + policía corrupto + revancha
con Xarly), 92 (Instituto, 3 científicos de fósiles incl. el parodia
"Carl Ess" de fósiles combinados), 93 (Centro Pokémon), 94 (Tienda), 95
(Tienda Campeona, sin diálogo), 96/97 (Gimnasio, Solan — Medalla Solar +
MT Ariete Ígneo), 259 (anciana regala un Bulbasaur), 282 (evento
legendario Magearna), 296 (chica regala un Tepig), 297 (casa NPC), 298/299
(Mercado Subterráneo — 8 vendedores de starters robados/de mercado negro).
De paso se tradujeron los 6 objetos Fósil (nombre+plural+descripción).

### ✅ Bosque Oscuro / Pradera Florida — HECHO (2026-09-11)
Mapas: 101 (Bosque Oscuro, evento legendario Spectrier + ladrón), 102
(Route5Connection, guardabosques), 103 (Pradera Florida, evento Giovanni/
Team Rocket + legendarios Virizion y Keldeo).

### ✅ Monte Hierro [Iron Mountain] — HECHO (2026-09-11)
Mapas: 108/109/111 (pisos, entrenadores + aviso sobre Duraludon), 273/275
(sin diálogo), 110 (Cámara del Dragón), 274 (Cámara del Gólem, evento
Registeel), 276 (Cámara Térmica, evento Heatran).

### ✅ Pico Plata [Silver Peak] — HECHO (2026-09-11)
Mapas: 115 (exterior, 2 máquinas expendedoras + varios NPCs), 116 (Centro
Pokémon), 117 (Tienda), 118/119 (Gimnasio, Azura — Medalla Piscina + MT
Salmuera), 261/262/300 (apartamentos, varios regalos de Pokémon/objetos).

### ✅ Pantanos del Trueno [Thunder Swamps] — HECHO (2026-09-11)
Mapas: 122 (principal, entrenadores + mención a Wooper de Paldea), 277
(Norte, evento legendario Zapdos).

### ✅ Río el Último [Riverstone] — HECHO (2026-09-11)
Mapas: 125 (exterior, incl. easter egg Breaking Bad "Say my name"), 124
(puente), 123/272 (parque, Victini), 126/131 (sin diálogo, confirmado con
check_lines.rb), 127 (Centro Pokémon), 128 (Tienda Campeona), 129
(Instituto, quest Mega Evolución), 130 (Casa de Molly, lore
Giovanni/Virizion/Cobalion/Terrakion/Keldeo/Kyurem), 132-137 (Grandes
Almacenes), 138 (Sala de Intercambios, 7 stands de trade), 139/140
(Gimnasio Emmett — tipo Eevee), 141 (Route8Connection), 142 (Cementerio,
evento Marshadow), 188 (Route10Connection), 263 (Sala de Juegos completa:
Mr. Game, 3 mostradores de premios, Lotería Pokémon, cambio de monedas),
264 (Casa Chiko), 268 (Apt 1, easter egg Heisenberg/Exp-Candy), 301 (Casa
del Alcalde, easter egg Eminem/Marshall Mathers), 302-305 (apartamento
grande, incl. quest Piedras Mega artificiales Slowbronita/Medichamita, y
easter egg CS:GO), 308 (Grandes Almacenes 2).

### ✅ Ruta 3/4/5/6/7 (Delta), conectores — HECHO (2026-09-12)
Mapas: 82 (Ruta 3, entrenadores de Montaña Calada), 90 (Ruta 4, evento
legendario Celebi + Lago Calada + pescador), 99 (Ruta 5, sur, pescadores),
100 (Ruta 5, norte, evento legendario Wo-Chien + Zamazenta + Bosque
Oscuro), 104 (Ruta 6, sur, policía/Hypno + parejas entrenadoras), 106
(Ruta 6, norte, entrada a Monte Hierro), 112 (Ruta 7, puente sur), 113
(Ruta 7, puente norte — lore Giovanni/Virizion/Cobalion con Azura +
evento legendario Zarude), 114 (Ruta 7, extra).
**Hallazgo importante**: estos 9 mapas NUNCA habían sido revisados como
bloque propio — quedaron fuera de todos los bloques nombrados anteriores
(que usan nombres de zona, no "Route N (Delta)"). El usuario estaba por
entrar a Ruta 3 y preguntó explícitamente si se iba a encontrar inglés;
se detectó el hueco cruzando `MapInfos.rxdata` (nombres "Route N (Delta)")
contra los bloques ya marcados HECHO, confirmado con
`tools/check_lines.rb` (91 líneas de diálogo en total, ninguna vacía).
Traducido y verificado con `tools/translate_route3to7.rb` — 0 líneas en
inglés remanentes. **Lección: antes de decirle "sí, está todo" al
usuario sobre una zona, cruzar `MapInfos.rxdata` completo contra la
lista de bloques HECHO, no confiar en que el orden narrativo de
PENDIENTES.md cubre todos los mapas intermedios.**

Aprovechando la pregunta del usuario se hizo una auditoría completa de
los 366 mapas del juego con `tools/scan_all_maps_english.rb` (heurística
de detección de inglés). Se encontraron y corrigieron más huecos:
- **Ruta 12** (map211, 26 líneas — evento legendario Chien-Pao +
  Glastrier), **Ruta 13** (map231, 16 líneas — evento legendario
  Thundurus, es la ruta que lleva a Alta Roca). Script:
  `tools/translate_new_gaps.rb`.
- **Casa del Corte** (map107, Maestro del Corte/HM Corte, 4 líneas),
  **Casa Destrozarrocas** (map120, Maestro de Golpe Roca, 5 líneas),
  **Santuario de Hierro** (map121, 13 líneas — escena Giovanni/Cobalion,
  ligada a la charla con Azura en Ruta 7).
- 2 líneas sueltas que se habían escapado dentro de bloques YA marcados
  HECHO: map116 (Centro Pokémon Pico Plata) y map93 (Centro Pokémon
  Velo Brumoso, chiste de Zelda TOTK). Script: `tools/fix_map93.rb`.
Confirmado con el mismo scan que el resto de líneas "sospechosas"
restantes corresponde solo a: la región Kanto-style sin confirmar
alcanzable (ver sección más abajo) y los bloques de PRIORIDAD 3 ya
marcados ⬜ pendiente explícitamente. **No quedan más huecos ocultos.**

### ✅ Ruta 8 (Delta), tramo A/B/C — HECHO (2026-09-11)
Mapas: 143 (entrenadores), 144 (laberinto natural, evento Tornadus,
Kleavor), 145 (cráteres, Jardín de Bayas de Remina), 146 (lago, Lilligant
antigua), 147 (tormenta de arena, tumba de Ting-Lu), 148 (Bosque Lumínico,
evento Uxie + diálogo largo de Arthur sobre Kyurem/Zekrom/Reshiram/
Genesect, entrega Master Ball), 149 (Casa Surf, Maestro del Surf), 150
(evento Lugia, NPC "Greg"), 151 (territorio de Luna de Sangre/Ursaluna,
estatua Meloetta), 152 (entrada Camino de la Victoria, cerrada por
Torneo de Aspirantes), 279 (Cámara del Desierto, evento Tapu Bulu).

### ✅ Cueva de la Meta / Playa Tushi [Crystal Cove/Beach] — HECHO (2026-09-11)
Mapas: 153 (exterior, incl. combate contra rival Xarly/Zeke), 156
(Route8Connection), 158 (Tienda), 154 (Playa Tushi, lore Arthur/Aura
Delta/Tapu Fini), 159 (Faro), 160 (Faro interior, escena de despedida de
Xarly), 161 (menú plantas, ya en español), 164/165(sin diálogo)/166/168/
169 (tramos de playa, eventos Cresselia/Latios/Latias, trade Exeggutor),
172 (Casa Fly, Maestro del Vuelo), 170 (Cámara del Océano, evento Tapu
Fini), 155 (Puerta Piedra, evento Giovanni/Keldeo/Terrakion), 162/163
(Gimnasio Watron — tipo Eléctrico, Medalla Voltio), 265 (Casa Mudkip,
historia del padre con hija fallecida por cáncer), 289 (Casa Creselia,
lore Darkrai/Reddit), 175 (Casa del Criador), 306 (Casa NPC), 157 (Centro
Pokémon).

### ✅ Ruta 9 / Bosque Susurrante — HECHO (2026-09-11)
Mapas: 167 (encuentro Mesprit, NPCs Rangers Pokémon), 171 (guardia,
Puerto Cristal cerrado por filmación Pokéwood), 178 (sin eventos de
texto), 173/174 (Bosque Susurrante — encuentro Zacian, guardias
advirtiendo sobre "gente rara"; contenido humor negro/creepypasta ya
presente en el original en inglés — bodycount, NPCs con líneas tipo
grooming hacia un "kid" — traducido literal por pedido explícito del
usuario, sin suavizar), 278 (Cámara del Bosque, encuentro Tapu Lele).

### ✅ Arboleda Ámbar [Ambergrove] — HECHO (2026-09-11)
Mapas: 176 (exterior, lore Ogerpon/Loyal Three farsantes, quest Kubfu de
Mustard), 177 (exterior, Maestro de Fuerza, invocación Spiritomb,
Darkrai, trade Marowak, trade Megapiedra/Vasija Reliquia), 184 (Centro
Pokémon, ya estaba en español), 185/186 (Tienda/Tienda Campeona, sin
texto propio), 257 (Casa de Intercambio Shelmet/Karrablast), 266 (Casa
Treecko, meta-humor creepypasta "NPCs atrapados en un fangame"), 267
(Guardería Pokémon), 182/183 (Gimnasio tipo Bicho — familia de Nyssa,
trivia con nombres de movimientos/Pokémon/región, arco de cita con
Nyssa post-Liga).

### ✅ Valle Abrasador / Cueva del Groove — HECHO (2026-09-11)
Mapas: 179 (encuentro Entei, tumba de Chi-Yu), 180 (encuentro Reshiram,
estatua de Moltres), 181 (Cueva de Arboleda Ámbar — placas antiguas,
escena de Nyssa examinando lore de un Pokémon legendario).

### ✅ Ruta 10 / Ruinas de la Espada — HECHO (2026-09-11)
Mapas: 187 (encuentro Pecharunt, NPCs Team Rocket), 189 (NPC pescador
meme, familias entrenando), 190/191/192 (sin diálogo), 193 (Nyssa
advierte sobre Keldeo capturado, entrada al Team Rocket), 199 (fósiles,
Instituto Velo de Niebla), 200 (encuentro Calyrex, NPC Cueva Fetiche),
194 (Ruinas de la Espada — escena completa de Giovanni invocando y
capturando a Virizion/Cobalion/Terrakion/Keldeo, luego liberando las
Espadas de la Justicia tras perder contra el jugador).

### ✅ Estadio [Stadium] — HECHO (2026-09-11)
Mapas: 195 (exterior, Gary anuncia que Ash Ketchum espera en Ruta 1),
196 (Estadio Río el Último — Torneo de Aspirantes completo y luego el
Torneo del Campeonato Mundial con Steven/Cynthia/Lance/Iris/Diantha/Leon/
Xarly), 197 (campo de batalla — combates contra Alessio/Freya/Xarly/
Steven/Cynthia/Xarly final). Corregidos también 3 nombres inconsistentes
de sesiones/tandas anteriores de esta misma sesión: "Puerto Cristal"→
"Puerto del Cristal" (map171), "Velo de Niebla"→"Velo Brumoso" (map199),
"Patisserie Alcremie en Arboleda del Prado"→"Pastelería Crema en Prado
Arboleda" (map183), vía `tools/fix_naming_consistency.rb`.

### ✅ Ruta 11 / Cámara de la Deidad — HECHO (2026-09-11)
Mapas: 198 (Ruta 11, NPCs buscando la entrada a Cueva Fetiche), 281
(Cámara de la Deidad, encuentro Tapu Koko).

### ✅ Cueva Fetiche [Relic Cave] — HECHO (2026-09-11)
Mapas: 201 (sin diálogo), 202 (grunt Team Rocket, restauración de Piedra
Delta), 203 (Team Rocket bloqueando el paso), 288 (Cámara del Gigante,
encuentro Regigigas).

### ✅ Base del Team Rocket — HECHO (2026-09-11)
Mapas: 204 (principal), 205 (sala de miembros), 206 (pasillo — escena
violenta de tortura con elección de golpe/patada, lenguaje crudo
censurado con asteriscos, traducido literal), 207 (almacén — rescate
Porygon, celda del jugador), 208 (dormitorios, referencia Mercado
Subterráneo de Velo Brumoso), 212 (piso superior, sin diálogo), 213
(oficina — Giovanni encontrado muerto/asesinado, traición de Anthony con
Genesect, roba el Módulo de Buceo, lore del Trío Tao Zekrom/Reshiram/
Kyurem, menciona Playa del Sur y la Cueva del Cristal Z).

### ✅ Bosque Lumínico [Glimmerwood] — HECHO (2026-09-11)
Mapas: 209 (exterior, Arthur presenta la Bola Deidad y su vínculo con
Type: Null/Aura Delta), 210 (Centro Pokémon), 214 (bloqueo por ventisca),
269 (regalo de Piplup, lore de los 5 Regis sellados en cuevas de la
región), 307 (Casa NPC).

### ✅ Cumbres Auroreales + Monte/Pico Auroreal — HECHO (2026-09-11)
Mapas: 215 (exterior — clímax emocional completo de Giovanni: backstory
trágico, libera a Kyurem, dice que se pegará un tiro si su plan de
redención falla; los 4 ancianos custodiando el Anillo Z), 216 (Centro
Pokémon, ya en español), 217 (sin diálogo), 218/219 (Gimnasio tipo
Normal — Wesley y el running gag "tipo relajado", Medalla Estándar, MT
Culmen), 270 (Casa Turtwig), 309 (Casa NPC), 310 (Profesor de
Movimientos), 311 (Evaluador de Nombres), 220 (los 4 ancianos ponen a
prueba al jugador), 221 (Anillo Z), 222/223 (Team Rocket bloqueando el
paso, groserías censuradas con asteriscos traducidas literal), 224
(batalla final completa contra Giovanni/Kyurem/Keldeo — Forma Resoluta,
Espada Santa), 225-228 (sin diálogo), 280 (Pico Auroreal, encuentro
Articuno), 286 (cámara, encuentro Regice).

### ✅ Alta Roca [Granite Heights] — HECHO (2026-09-12)
Mapas: 232 (exterior, regalos de bienvenida + intercambio Weezing Galar/
Kanto + Xarly anuncia el Torneo de Retadores), 233 (Centro Pokémon, ya
estaba en español), 234 (Tienda, sin diálogo propio), 236 (interior
Gimnasio, entrenadores tipo Acero), 237 (sala de Galvano — Medalla
Magneto, MT Cañón Destello, revancha post-Liga), 271 (Casa Chimchar,
regalo de starter), 312 (Casa NPC, chiste del marido cocinero).
Script: `tools/translate_altaroca.rb`. Verificado con
`tools/scan_all_maps_english.rb`: 0 líneas en inglés remanentes.

### ✅ Avenida Victoriosa [Victory Road] — HECHO (2026-09-12)
Mapas: 235 (puerta, escáner de 8 medallas), 239-242 (entrenadores +
eventos legendarios Volcanion/Solgaleo/Lunala), 243 (Maestro de Cascada),
244 (evento legendario Ho-Oh + rival Theodor), 287 (Cámara del Gólem,
evento Regidrago). Script: `tools/translate_victoryroad.rb`. Verificado
con `tools/scan_all_maps_english.rb`: 0 líneas en inglés remanentes.

### ✅ Liga Pokémon — HECHO (2026-09-12)
Mapas: 245 (voz misteriosa, evento previo a Isla Reliquia), 246 (entrada,
Centro Pokémon + Theodor + quest evolución Kubfu→Urshifu con pergaminos
Oscuro/Acuático), 247/249/251/253 (pasillos, sin diálogo propio), 248
(Cassian, Alto Mando #1), 250 (Ardenia, Alto Mando #2, fósiles), 252
(Morgana, Alto Mando #3, tipo Siniestro), 254 (Elysio, Alto Mando #4,
tipo Hada), 255 (Salón de la Fama), 256 (Arthur, Campeón — clímax +
cameo Gary Oak/Kanto). Script: `tools/translate_league.rb`. Verificado
con `tools/scan_all_maps_english.rb`: 0 líneas en inglés remanentes.

### ✅ Paso del Trueno [Thunder Pass] — HECHO (2026-09-16)
Mapas: 229 (evento legendario Zekrom + Zeraora, ciclistas/marineros
entrenando), 230 (Oeste, evento legendario Raikou, NPCs de acantilado),
285 (Cámara del Gólem, evento Regieleki). Script:
`tools/translate_thunderpass.rb`. Verificado con
`tools/scan_all_maps_english.rb`: 0 líneas en inglés remanentes.

### ✅ Puerto del Cristal [Crystal Harbor] — HECHO (2026-09-16)
Mapas: 314 (exterior — Anillo Z ancestral, Dr. Anthony Reed), 315
(estación de ferry), 316 (Compañía de IA Rotom, 55 líneas), 338
(Laboratorio del Dr. Reed, incubadoras), 324 (Compañía Delta Tech,
Arthur + Bolas Deidad + Type: Null), 325 (Centro Pokémon, ya hecho),
326 (Tienda, sin diálogo propio), 343 (Route9Connection, ya estaba
traducido), 358/359 (Museo de Kalos + archivo — Xerneas/Yveltal/Zygarde,
Ruinas de la Espada), 360 (Agencia de Autónomos), 361 (Club de Fans de
Pikachu, sin diálogo propio). Traducido en 3 tandas paralelas en
background (`tools/translate_ch_314_315.rb`,
`tools/translate_ch_316_338_324.rb`,
`tools/translate_ch_358_359_360_343.rb`). Se corrigieron 2 inconsistencias
de terminología introducidas por los agentes: "Deity Balls" sin
traducir en map324 (`tools/fix_deityball_324.rb` → "Bolas Deidad") y
"Anillo Poder Z" en vez del término ya establecido "Anillo Z" en map314
(`tools/fix_zring_314.rb`). Verificado con `tools/scan_all_maps_english.rb`
sobre el bloque completo: 0 líneas en inglés remanentes.

### ✅ Playa del Sur [Southside Beach] — HECHO (2026-09-16)
Mapas: 317, 363/364/365 (sin diálogo propio, confirmado con
check_lines.rb), 318-320 (Anthony busca pistas, referencia a Jojo,
evento captura Kyurem con Arthur). Script: `tools/translate_southbeach.rb`.
Verificado con `tools/scan_all_maps_english.rb`: 0 líneas en inglés
remanentes.

### ✅ Ruta 14 / Cueva de Cristales Z / Cueva Falsa — HECHO (2026-09-16)
Mapas: 321 (Ruta 14 — Hoopa Liberado destruye Fuerte Sur, contenido
oscuro/explícito traducido literal), 322 (Cueva Falsa — revelación de
Anthony Reed como ex cofundador del Team Rocket), 323 (Cueva de
Cristales Z — clímax final: Anthony traicionado por su propio plan,
batalla con Reshiram/Zekrom, Genesect, Terapagos). Script:
`tools/translate_route14.rb`. **Primer bloque traducido en español de
España (castellano) en vez de rioplatense, por pedido explícito del
usuario — ver sección de convenciones.** Verificado con
`tools/scan_all_maps_english.rb`: 0 líneas en inglés reales (1 falso
positivo por el corte de acento en "dejáis"/"juguéis").

### ✅ Puerto de Islas Deliciosas [Delta Islands Harbor] — HECHO (2026-09-16)
Mapas: 327 (puerto, sin diálogo propio), 328 (estación de ferry).
Script: `tools/translate_puertoislasdeliciosas.rb`. Verificado con
`tools/scan_all_maps_english.rb`: 0 líneas en inglés remanentes.

### ✅ Ruta 15 / Estación de Vida Silvestre del Verde — HECHO (2026-09-16)
Mapas: 329 (Ruta 15, entrada a Villa Deliciosa), 330 (Estación, ya
hecho), 331/332 (evento legendario Enamorus, lore de extinción), 333
(puerta, registro de visitantes). Script: `tools/translate_route15.rb`.
Verificado con `tools/scan_all_maps_english.rb`: 0 líneas en inglés
remanentes.

### ✅ Villa Deliciosa [Champions Village] — HECHO (2026-09-16)
Mapas: 334 (exterior — cameos Bruno/Brock, quest Riendas de la Unidad,
Rockruff, dobles Urshifu), 351 (Centro Pokémon, ya hecho), 352/353
(Tiendas, sin diálogo propio), 354 (Torre Conmemorativa — Deoxys, cameo
Ryu), 355 (Casa de Steven — traductor Pokémon, Kyogre/Groudon/Rayquaza,
Meteorito), 357 (Casa de Cynthia — Trío del Lago, Trío de la Dimensión,
Isla Reliquia). Script: `tools/translate_villadeliciosa.rb`. Verificado
con `tools/scan_all_maps_english.rb`: 0 líneas en inglés remanentes.

### ✅ Playa de la Victoria Absoluta / Cueva Envuelta / Playa del Este / Isla Reliquia — HECHO (2026-09-16)
Mapas: 335 (cameo Lorelei, quest Espada/Escudo de Zacian/Zamazenta),
336 (sin diálogo propio), 337/356 (Cueva Envuelta + Cámara — pelea
Groudon/Kyogre con insultos explícitos, cameo Rayquaza/Deoxys/Steven,
contenido traducido literal sin suavizar), 339 (Playa del Este), 340/341
(Isla Reliquia + Templo de la Distorsión — Arceus con lista de chistes
absurdos, evento Dialga/Palkia/Giratina con Cynthia). Script:
`tools/translate_victoriabeach.rb` + `tools/fix_map337.rb` (2 líneas
duplicadas "It wants to battle!" que se me pasaron en la primera
pasada). Verificado con `tools/scan_all_maps_english.rb`: 0 líneas en
inglés reales (1 falso positivo).

### ✅ Fuerte Sur [Southford] — HECHO (2026-09-16)
Mapas: 344 (exterior — masacre de Hoopa, cadáveres, Cosmog rescatado,
eventos legendarios Necrozma/Raging Bolt/Gouging Fire/Walking Wake), 345
(casa, evento Iron Boulder), 346 (casa, evento Iron Crown), 347 (casa,
evento Iron Leaves), 348 (Centro Pokémon, evento Koraidon), 349 (Tienda,
ya hecho), 350 (Instituto del Dr. Reed destruido — climax final Hoopa,
contenido gráfico traducido literal). Script: `tools/translate_southford.rb`.
Verificado con `tools/scan_all_maps_english.rb`: 0 líneas en inglés
remanentes.

**Con esto, PRIORIDAD 3 (historia completa, todos los bloques
geográficos) queda 100% traducida y verificada.**

---

## BLOQUE DESCARTADO — Región Tiall (confirmado: plantilla del motor, inalcanzable)

**Decisión final (2026-09-19): NO se traduce.** Investigado a fondo tras
pedido del usuario de arrancar este bloque:

- Los NPCs (Contest Ribbon Giver, Stats Judge, Dr. Footstep, un evento
  llamado literalmente "Door explainer" con texto tutorial sobre cómo
  hacer puertas) son el contenido de MUESTRA que trae Pokémon Essentials
  de fábrica, no personajes propios de Resolute Edition — a diferencia de
  TODO lo demás en Región Delta, que tiene nombre y trama propios.
- `map78` dentro de este bloque se llama "Player's house" pero es la casa
  vieja del proyecto de muestra — la casa real del jugador en la partida
  es `map77` (Región Delta, ya traducido).
- **Verificado programáticamente que es inalcanzable**: se recorrieron
  los ~370 mapas reales del juego buscando cualquier evento de
  transferencia (code 201) hacia alguno de los ~66 mapas de este bloque.
  Se encontró exactamente UNO, y es un NPC llamado "Warp NPC" en un mapa
  llamado literalmente "Tiall Region" que pregunta "¿Quieres volver a la
  Región Essen?" — un teletransporte de desarrollador para probar la otra
  región durante el desarrollo, no parte de la historia. Ese mapa en sí
  tampoco tiene NINGUNA entrada desde el mundo real: solo se llega desde
  dentro del propio bloque Tiall. Es un cluster completamente aislado.
- Tampoco hay ninguna alusión narrativa en Delta (ningún NPC menciona un
  barco pendiente, una región por descubrir, etc.) que sugiera que esto
  sea contenido futuro a medio conectar.
- El usuario preguntó si valdría la pena reescribirlo como región nueva
  de verdad (personajes propios, trama, entrenadores balanceados,
  conectarlo al mapa real) — eso es un proyecto de diseño de juego y
  escritura desde cero, no de traducción, y se dejó como posible
  iniciativa aparte a futuro, no como tarea de traducción pendiente.

Mapas involucrados (para referencia si se retoma en el futuro): 2 (Lappet
Town), 8 (Casa de Daisy), 4 (Laboratorio Pokémon), 78 (Casa del jugador,
vieja/sin usar), 5 (Ruta 1), 6 (Casa de Kurt), 7 (Cedolan City), 10
(Gimnasio), 11 (Instituto Pokémon), 12 (Condominio), 13 (Sala de Juegos),
14-20 (Grandes Almacenes Cedolan, 6 pisos + ascensor), 9 (Centro
Pokémon), 21 (Ruta 2), 23 (Lerucean Town), 24 (Centro Pokémon), 25
(Tienda, **hecho** — NPC de Regalo Misterioso), 26 (Club de Fans Pokémon),
27 (Guardería), 28-30 (Parque Natural), 31 (Ruta 3), 34 (Cueva de Hielo),
35-38 (Meseta Ingido, Liga, Salón de la Fama), 39/40/46 (Ruta 4 +
Ciclovía), 41 (Ruta 5), 52-65 (Battle Frontier completo: Centro Pokémon,
Tienda **hecha** — NPC de Regalo Misterioso, Torre/Palacio/Arena/Fábrica
de Batalla), 44/45/74 (Ruta 6 + Ciclovía), 47 (Ruta 7), 49-51 (Cueva de
Roca + Mazmorra), 66-68 (Zona Safari), 69-71 (Ruta 8 + submarino +
puerto), 72/73 (Islas Berth/Faraday), 75 ("Tiall Region", el hub de warp
de desarrollador).

Mapas: 2 (Lappet Town), 8 (Casa de Daisy), 4 (Laboratorio Pokémon), 78
(Casa del jugador), 5 (Ruta 1), 6 (Casa de Kurt), 7 (Cedolan City), 10
(Gimnasio), 11 (Instituto Pokémon), 12 (Condominio), 13 (Sala de Juegos),
14-20 (Grandes Almacenes Cedolan, 6 pisos + ascensor), 9 (Centro
Pokémon), 21 (Ruta 2), 23 (Lerucean Town), 24 (Centro Pokémon), 25
(Tienda, **hecho** — NPC de Regalo Misterioso), 26 (Club de Fans Pokémon),
27 (Guardería), 28-30 (Parque Natural), 31 (Ruta 3), 34 (Cueva de Hielo),
35-38 (Meseta Ingido, Liga, Salón de la Fama), 39/40/46 (Ruta 4 +
Ciclovía), 41 (Ruta 5), 52-65 (Battle Frontier completo: Centro Pokémon,
Tienda **hecha** — NPC de Regalo Misterioso, Torre/Palacio/Arena/Fábrica
de Batalla), 44/45/74 (Ruta 6 + Ciclovía), 47 (Ruta 7), 49-51 (Cueva de
Roca + Mazmorra), 66-68 (Zona Safari), 69-71 (Ruta 8 + submarino +
puerto), 72/73 (Islas Berth/Faraday).

---

## Archivo histórico / gotchas técnicos (no perder, pero no es lista de tareas)

### GOTCHA CRÍTICO: `\r`/`\b`/`\v[n]`/`\c[n]`/`\n` son códigos de control LITERALES

En TANTO texto de mapas (`cmd.parameters[0]`) COMO texto de scripts
(`Scripts.rxdata`), estos prefijos son 2+ caracteres LITERALES (backslash +
letra/código), NO secuencias de escape reales de Ruby. En el código fuente
original, el desarrollador escribió DOBLE backslash (`"\\r"`, `"\\c[1]"`)
para lograr esto. Si se escriben con UN solo backslash en un script Ruby
propio, Ruby los interpreta como escape real (retorno de carro, ESC, etc.)
y la clave NUNCA hace match contra el texto real del juego.

**Regla obligatoria**: escribir SIEMPRE estos diccionarios con la
herramienta de edición de archivos directa (Write), **nunca con heredoc de
Bash** (`cat > archivo.rb <<'EOF'`) — Bash colapsa el doble backslash a
uno solo antes de que Ruby lo vea, lo que hace que hasta los scripts de
*verificación* mientan (comparan contra la misma clave mal calculada).
Verificar siempre con `.bytes.inspect` contra un dump fresco del
Scripts.rxdata o mapa real antes de dar por buena una traducción con
códigos de control.

### Nunca asumir "sin diálogo" sin comprobar con tools/check_lines.rb

Los mapas "Connection" (conectores entre rutas) y otros mapas de paso
suelen asumirse como vacíos, pero a veces tienen un NPC suelto (ej. un
policía que regala un objeto). Pasó con map003 (Route2Connection) y
map105 (Route6Connection), marcados como "sin diálogo" sin verificar y
que en realidad tenían un guardia con 1-2 líneas. Regla: correr siempre
`ruby tools/check_lines.rb NNN` antes de dar un mapa por vacío, nunca
asumir por el nombre del mapa.

### Multi-línea: 101+401 en mapas

Algunas líneas largas se parten en el mapa en comandos 101+401
consecutivos aunque en `translations/mapXXX.txt` aparezcan como un solo
bloque. Si un diccionario no matchea con el texto completo esperado,
reconstruir concatenando 101 + los 401 siguientes antes de comparar (ver
`tools/fix_multiline_pokecenter.rb`).

### PBS/*.txt nunca se recompila

Movimientos, objetos, tipos de entrenador, nombres de entrenador y frases
de derrota/victoria NO se traducen editando PBS/*.txt — solo se recompila
a .dat si `$DEBUG` está activo, y esta build no lo tiene. Todos estos
campos pasan por `pbGetMessageFromHash(MessageTypes::CATEGORIA,
@campo_en_ingles)`, el mismo diccionario `messages_es_game.dat` que se usa
para SCRIPT_TEXTS. Usar siempre `tools/apply_pbs_via_messages.rb` como
plantilla, nunca editar los .txt de PBS.

### ⚠️ DIALECTO — cambio vigente desde 2026-09-16

Todo bloque de historia traducido a partir de "Ruta 14 / Cueva de
Cristales Z / Cueva Falsa" (map321/322/323) en adelante usa **español
de España (castellano)**: tú/tienes/puedes/quieres, imperativos
"espera"/"déjame"/"ven"/"mira", vosotros para 2da persona plural. Los
bloques anteriores a ese usan **español rioplatense** (vos/tenés/podés)
y NO deben corregirse retroactivamente — así lo pidió el usuario
explícitamente. Al traducir diálogo nuevo de acá en adelante, usar
SIEMPRE castellano de España, nunca voseo.

### Renombres personalizados de lugares vigentes

Ver el detalle completo de nombres viejo→nuevo en el historial de git de
este archivo o en la sección "Renombres personalizados" de sesiones
anteriores. Resumen rápido de los más importantes: Meadow Grove→Prado
Arboleda, Starter Valley→Valle del Rocío, Arrow Ridge→Cordillera Flecha,
Silver Peak→Pico Plata, Mistveil→Velo Brumoso, Southford→Fuerte Sur,
Crystal Harbor→Puerto del Cristal, Crystal Cove→Cueva de la Meta, Crystal
Beach→Playa Tushi, Aurora Summit→Cumbres Auroreales, Granite Heights→Alta
Roca, Glimmerwood→Bosque Lumínico, Rumble Mountain→Montaña Calada,
Riverstone→Río el Último, Relic Cave→Cueva Fetiche, Ambergrove Cave→Cueva
del Groove (solo la cueva), Southside Beach→Playa del Sur, Rocky
Gate→Puerta Piedra, Eastern Beach→Playa del Este, Shrouded Cove→Cueva
Envuelta, Delta Islands→Islas Deliciosas, Delta Islands Harbor→Puerto de
Islas Deliciosas (reemplaza el nombre viejo "Puerto D", decisión del
usuario 2026-09-16 — cualquier lugar/cosa llamado "Delta" por referencia
a las Islas Delta pasa a "Delicioso/Deliciosa", NO afecta a "Región
Delta"/"Piedra Delta"/"Liga Pokémon Delta"/"Compañía Delta Tech" que se
llaman así por la región en general, no por las islas), Victory Road→Avenida Victoriosa,
Champions Beach→Playa de la Victoria Absoluta, Champions Village→Villa
Deliciosa, Ruin Island→Isla Reliquia, Patisserie Alcremie→Pastelería
Crema. Rename de personajes: Oak→Nariyoshi Miyagi/Profesor Miyagi,
Zeke→Xarly (rival).

### Objetos: 689 de 794 nunca extraídos (descubrimiento grande)

Ver PRIORIDAD 2 arriba. Las 46 Mega Piedras + Eviolita + Meteorito + Mena
Negra (50 objetos) ya están traducidas siguiendo el patrón oficial
"Pokémon+ita". Quedan ~639 objetos sin ninguna clave todavía.

### Decisiones del usuario (no tocar)

- "Catastropika" (movimiento), "Simple" y "Transistor" (habilidades),
  "Team Rocket" (tipo de entrenador): dejar sin traducir a pedido expreso.
- Z-Crystals (35) y "Poké Ball": nunca se traducen en localizaciones
  oficiales, es intencional que queden en inglés.

### Flujo de captura de Pokémon con Poké Ball — HECHO (2026-09-11)

El usuario reportó "Anderón threw a Poké Ball!" y "Gah! It was so close,
too!" en inglés durante un combate salvaje. TODO el flujo de captura
(`Battle_CatchAndStoreMixin`) nunca se había tocado -- pasa en CADA
intento de captura de todo el juego, asi que era maxima prioridad.
Traducidas las 19 frases que faltaban con `tools/apply_catch_texts.rb`:
"¡X lanzó una Poké Ball!", los 4 niveles de "casi se escapa" (Oh no/Aww/
Aargh/Gah), "¡Ya está! ¡X fue capturado!", "El Entrenador bloqueó tu
Poké Ball", y las pantallas de qué hacer con el Pokémon atrapado (añadir
al equipo/enviar a caja/ver resumen). De paso tambien "¡X le lanzó una
roca a Y!" de la Zona Safari (`tools/apply_safari_rock.rb`).

### GOTCHA: `ruby -e` en Bash también corrompe caracteres no-ASCII

No es solo el doble backslash de los códigos de control (ver arriba). Un
`ruby -e '...'` con acentos/eñes dentro del string (ej. "Pokémon") puede
llegar corrompido a Ruby por el mismo tipo de problema de transporte de
Bash, dando un falso "clave no encontrada" aunque la traducción SI se haya
guardado bien. Confirmado reproduciendo el mismo chequeo con un script
escrito con la herramienta Write (da `true`/valor correcto) contra el
mismo chequeo via `ruby -e` en Bash (da `false`/nil). Regla ampliada:
CUALQUIER verificación o script que toque texto con tildes, eñes, códigos
de control o caracteres especiales debe escribirse con la herramienta
Write, nunca con `ruby -e` de Bash ni heredoc.

### Categoría 28/29 (ITEM_PORTION_NAMES) — descubrimiento nuevo

Es un campo APARTE del nombre normal del objeto ("bottle of Moomoo Milk"
en vez de "Moomoo Milk"), usado cuando se cuenta el objeto por unidades de
su envase. Es su propia categoría (28/29), nunca tocada, con el mismo
problema que el resto de objetos (clave inexistente). Se tradujeron
Leche Moomoo, Agua Fresca, Refresco, Limonada, Zumo de Bayas, Miel,
Ceniza Sagrada y Miel Máxima (nombre + plural + descripción + las 2
categorías de "portion") con `tools/apply_drinks_and_portions.rb`.
**COMPLETADO EL RESTO (2026-09-16)**: quedaban 90 objetos más con este
campo sin traducir (Inciensos, Vitaminas, Mentas de naturaleza, Correos,
Armadura Fasta/Nefasta, Energía Potenciadora, Aleación de Metal, monedas
Reliquia, Riendas de la Unidad, etc — 99 objetos en total según
`tools/list_portion_items.rb`). Resuelto de forma **programática y
mecánica** con `tools/apply_all_portion_names.rb`: el patrón
"`<envase>` of `<objeto>`" (o "`<objeto>` coin" / "voucher for
`<objeto>`") se parsea automáticamente, se mapean 21 palabras de envase
al español (bag→bolsa, jar→tarro, capsule→cápsula, etc.) y se combina
con el nombre YA traducido del objeto (categoría 7). Sin necesidad de
traducir cada combinación a mano. **Verificado: 101/101 en ambas
categorías (28/29), 0 sin traducir.**

### Objetos de tienda (los 27 que se venden en TODOS los Marts) — HECHO

`tools/list_all_mart_symbols.rb` escanea los 13 Marts del juego (llamadas
`pbPokemonMart(...)`) y confirma que solo usan 27 símbolos de objeto
distintos. Los 25 que faltaban (Poción, Antídoto, Repelente, Súper/Ultra
Ball, Cura Total, Restaurar Todo, Revivir, Objetos Reliquia, Globo Aéreo,
Polvo Brillante, Cuerda Huida, Escama Bella, etc.) se tradujeron con
`tools/apply_core_shop_items.rb` (nombre + plural + descripción cada uno).
De paso tambien Leche Moomoo + los 7 Dulces de Milcery
(`tools/apply_sweets_and_milk.rb`), encontrados en la Pastelería Crema.
- Nombres de entrenadores genéricos (905): no traducir, solo Xarly.
