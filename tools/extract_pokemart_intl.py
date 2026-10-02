import re

with open("tools/_ui_pokemart_full.rb", encoding="utf-8") as f:
    src = f.read()

pattern = re.compile(r'_INTL\(\s*("(?:[^"\\]|\\.)*"|\'(?:[^\'\\]|\\.)*\')')
matches = pattern.findall(src)
seen = []
for m in matches:
    if m not in seen:
        seen.append(m)
print(len(seen))
for m in seen:
    print(m)
