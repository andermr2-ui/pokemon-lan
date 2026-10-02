"""
Convierte dialogos Rioplatenses a Espanol de Espana en los mapas del juego.
Solo toca mapas que NO tienen contenido del Team Rocket.

Uso:
  python tools/convertir_rioplatense.py [--dry-run] [--map NNN] [--show-changes]
"""

import re
import os
import sys
import shutil
import argparse
from io import BytesIO

sys.stdout.reconfigure(encoding='utf-8')

import rubymarshal.reader as rmr
import rubymarshal.writer as rmw
from rubymarshal.classes import RubyString

# ---------------------------------------------------------------------------
# Mapas con contenido del Team Rocket — NO se tocan
# ---------------------------------------------------------------------------
ROCKET_MAPS = {
    13, 47, 100, 103, 113, 114, 119, 121, 125, 130,
    145, 148, 153, 155, 177, 187, 193, 194, 202, 203,
    205, 206, 207, 208, 213, 215, 219, 222, 223, 224,
    299, 322
}

# Codigos de comandos que contienen texto de dialogo
DIALOGUE_CODES = {101, 401, 405}

# ---------------------------------------------------------------------------
# Conversiones Rioplatense -> Espana (mas especificas primero)
# ---------------------------------------------------------------------------
_PREP_CONMIGO = re.compile(r'\bcon\s*$', re.IGNORECASE)
_PREP_TI      = re.compile(r'\b(a|para|sin|de|en|por|tras|ante|contra|hacia|hasta|sobre|bajo)\s*$', re.IGNORECASE)
_RPG_ESCAPE   = re.compile(r'\\[a-z](?:\[\d+\])?')


def _replace_vos(m: re.Match) -> str:
    """Reemplaza 'vos' por 'ti', 'contigo' o 'tu' segun el contexto."""
    full  = m.string
    start = m.start()
    # Limpiar escapes de RPG Maker del contexto previo (\b, \c[N], etc.)
    before = _RPG_ESCAPE.sub('', full[max(0, start - 12):start]).rstrip()
    if _PREP_CONMIGO.search(before):
        return 'contigo'
    if _PREP_TI.search(before):
        return 'ti'
    # Conservar mayuscula si 'Vos' era mayuscula (ya tratado por patron Vos)
    return 'tú'


CONVERSIONS = [
    # Verbos voseo (acento en la ultima silaba)
    (re.compile(r'\btenés\b'),    'tienes'),
    (re.compile(r'\bTenés\b'),    'Tienes'),
    (re.compile(r'\bTENÉS\b'),    'TIENES'),
    (re.compile(r'\bpodés\b'),    'puedes'),
    (re.compile(r'\bPodés\b'),    'Puedes'),
    (re.compile(r'\bPODÉS\b'),    'PUEDES'),
    (re.compile(r'\bquerés\b'),   'quieres'),
    (re.compile(r'\bQuerés\b'),   'Quieres'),
    (re.compile(r'\bvenís\b'),    'vienes'),
    (re.compile(r'\bVenís\b'),    'Vienes'),
    (re.compile(r'\bsabés\b'),    'sabes'),
    (re.compile(r'\bSabés\b'),    'Sabes'),
    (re.compile(r'\bhacés\b'),    'haces'),
    (re.compile(r'\bHacés\b'),    'Haces'),
    (re.compile(r'\bsalís\b'),    'sales'),
    (re.compile(r'\bSalís\b'),    'Sales'),
    (re.compile(r'\bvolvé\b'),    'vuelve'),
    (re.compile(r'\bVolvé\b'),    'Vuelve'),
    (re.compile(r'\bmirá\b'),     'mira'),
    (re.compile(r'\bMirá\b'),     'Mira'),
    (re.compile(r'\bescuchá\b'),  'escucha'),
    (re.compile(r'\bEscuchá\b'),  'Escucha'),
    (re.compile(r'\bhablá\b'),    'habla'),
    (re.compile(r'\bHablá\b'),    'Habla'),
    (re.compile(r'\btomá\b'),     'toma'),
    (re.compile(r'\bTomá\b'),     'Toma'),
    (re.compile(r'\bseguí\b'),    'sigue'),
    (re.compile(r'\bSeguí\b'),    'Sigue'),
    (re.compile(r'\bsos\b'),      'eres'),
    (re.compile(r'\bSos\b'),      'Eres'),
    (re.compile(r'\bSOS\b'),      'ERES'),
    (re.compile(r'\bvos\b'),      _replace_vos),
    (re.compile(r'\bVos\b'),      'Tú'),
    (re.compile(r'\bVOS\b'),      'TÚ'),
    (re.compile(r'\bacá\b'),      'aquí'),
    (re.compile(r'\bAcá\b'),      'Aquí'),
    (re.compile(r'\bACÁ\b'),      'AQUÍ'),
    (re.compile(r'\bquedate\b'),  'quédate'),
    (re.compile(r'\bQuedate\b'),  'Quédate'),
    (re.compile(r'\bparecés\b'),  'pareces'),
    (re.compile(r'\bParecés\b'),  'Pareces'),
    (re.compile(r'\bsonás\b'),    'suenas'),
    (re.compile(r'\bSonás\b'),    'Suenas'),
    (re.compile(r'\besperá\b'),   'espera'),
    (re.compile(r'\bEsperá\b'),   'Espera'),
    (re.compile(r'\bnecesitás\b'), 'necesitas'),
    (re.compile(r'\bNecesitás\b'), 'Necesitas'),
    (re.compile(r'\bdisfrutá\b'),  'disfruta'),
    (re.compile(r'\bDisfrutá\b'),  'Disfruta'),
    (re.compile(r'\bandá\b'),      'anda'),
    (re.compile(r'\bAndá\b'),      'Anda'),
    (re.compile(r'\brecordá\b'),   'recuerda'),
    (re.compile(r'\bRecordá\b'),   'Recuerda'),
    (re.compile(r'\bapurate\b'),   'apúrate'),
    (re.compile(r'\bApurate\b'),   'Apúrate'),
    (re.compile(r'\bretá\b'),      'reta'),
    (re.compile(r'\bRetá\b'),      'Reta'),
    (re.compile(r'\bretame\b'),    'rétame'),
    (re.compile(r'\bRetame\b'),    'Rétame'),
]

# "che" (muletilla sin equivalente neutro, encontrada via Map232/Map316 -
# esos dos no los procesa este script porque fallan al cargar con
# rubymarshal, ver tools/convertir_rioplatense_broken_maps.rb, pero el
# patron se agrega aca tambien por si aparece en algun mapa que si carga).
_CHE_AFTER_OPEN_PUNCT = re.compile(r'([¡¿])\s*[Cc]he,?\s*(\w)')
_CHE_ANYWHERE = re.compile(r',?\s*\bche\b,?', re.IGNORECASE)

# Codigos de control al INICIO del texto ("\b" negrita, "\c[1]" color, etc)
# quedan pegados sin espacio a la primera palabra real ("\bPodés..."). Como
# son letras, el \b de "limite de palabra" de los patrones de arriba NO
# dispara ahi (para el regex, "b" y "P" son dos letras seguidas, sin limite
# entre ellas) y la conversion se saltea en silencio (encontrado via
# "\bPodés..." en Map196 - "podés" estaba en el diccionario desde el
# principio y jamas se convertia ahi). Se saca el prefijo antes de
# convertir y se vuelve a pegar despues.
_LEADING_CONTROL_CODES = re.compile(r'\A(?:\\[a-zA-Z](?:\[[^\]]*\])?)+')


def convert_text(text: str) -> str:
    m = _LEADING_CONTROL_CODES.match(text)
    prefix = m.group(0) if m else ''
    text = text[len(prefix):]
    for pattern, replacement in CONVERSIONS:
        text = pattern.sub(replacement, text)
    # Igual que en la version Ruby: solo capitalizar si "che" quedaba
    # pegado justo al ¡/¿ de apertura, nunca en medio de una oracion ya
    # bien puntuada (romperia frases como "todo, ¡pero lo lograste!").
    text = _CHE_AFTER_OPEN_PUNCT.sub(lambda m: m.group(1) + m.group(2).upper(), text)
    text = _CHE_ANYWHERE.sub('', text)
    text = re.sub(r'[ \t]{2,}', ' ', text)
    text = re.sub(r'\s+([.!?])', r'\1', text)
    text = re.sub(r'([¡¿])\s+', r'\1', text)
    return prefix + text


def make_ruby_string(text: str, original: RubyString) -> RubyString:
    """Crea un nuevo RubyString con el texto convertido, preservando atributos."""
    return RubyString(text, original.attributes)


def process_command_list(cmd_list: list, changes: list, dry_run: bool) -> bool:
    """Procesa una lista de comandos de evento. Retorna True si hubo cambios."""
    modified = False
    for cmd in cmd_list:
        if not hasattr(cmd, 'attributes'):
            continue
        code = cmd.attributes.get('@code')
        if code not in DIALOGUE_CODES:
            continue
        params = cmd.attributes.get('@parameters')
        if not params:
            continue
        for i, param in enumerate(params):
            if not isinstance(param, RubyString):
                continue
            text = str(param)
            new_text = convert_text(text)
            if new_text != text:
                changes.append((text, new_text))
                if not dry_run:
                    params[i] = make_ruby_string(new_text, param)
                    modified = True
    return modified


def walk_events(map_obj, changes: list, dry_run: bool) -> bool:
    """Recorre todos los eventos y paginas del mapa."""
    modified = False
    events = map_obj.attributes.get('@events', {})
    for event in events.values():
        if not hasattr(event, 'attributes'):
            continue
        pages = event.attributes.get('@pages', [])
        for page in pages:
            if not hasattr(page, 'attributes'):
                continue
            cmd_list = page.attributes.get('@list', [])
            if process_command_list(cmd_list, changes, dry_run):
                modified = True
    return modified


def process_map(mapnum: int, maps_dir: str, dry_run: bool, show_changes: bool) -> int:
    path = os.path.join(maps_dir, f'Map{mapnum:03d}.rxdata')
    if not os.path.exists(path):
        return 0

    with open(path, 'rb') as f:
        map_obj = rmr.load(f)

    changes = []
    modified = walk_events(map_obj, changes, dry_run)

    if not changes:
        return 0

    print(f'Map{mapnum:03d}: {len(changes)} cambio(s)')
    if show_changes:
        for old, new in changes:
            print(f'  - ANTES: {old[:100]}')
            print(f'    AHORA: {new[:100]}')

    if not dry_run and modified:
        shutil.copy2(path, path + '.bak_rioplatense')
        buf = BytesIO()
        rmw.write(buf, map_obj)
        with open(path, 'wb') as f:
            f.write(buf.getvalue())

    return len(changes)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--dry-run', action='store_true')
    parser.add_argument('--map', type=int, default=None)
    parser.add_argument('--show-changes', action='store_true')
    args = parser.parse_args()

    maps_dir = 'Data'
    total_maps = 0
    total_changes = 0

    if args.map:
        map_numbers = [args.map]
    else:
        map_numbers = []
        for fname in sorted(os.listdir(maps_dir)):
            m = re.match(r'^Map(\d+)\.rxdata$', fname)
            if m:
                map_numbers.append(int(m.group(1)))

    for mapnum in map_numbers:
        if mapnum in ROCKET_MAPS:
            if args.map:
                print(f'Map{mapnum:03d}: OMITIDO (zona Rocket)')
            continue

        try:
            n = process_map(mapnum, maps_dir, args.dry_run, args.show_changes or bool(args.map))
        except Exception as e:
            # Algunos mapas tienen referencias circulares que la libreria
            # rubymarshal de Python no sabe resolver (limitacion de la lib,
            # no necesariamente un bug real del mapa - Ruby los lee bien).
            # No frenar el lote entero por eso: reportar y seguir.
            print(f'Map{mapnum:03d}: ERROR ({e}) - omitido')
            continue
        if n:
            total_maps += 1
            total_changes += n

    label = 'DRY-RUN' if args.dry_run else 'GUARDADO'
    print(f'\n[{label}] {total_maps} mapas, {total_changes} cambios totales')
    if args.dry_run:
        print('Ejecuta sin --dry-run para aplicar.')


if __name__ == '__main__':
    main()
