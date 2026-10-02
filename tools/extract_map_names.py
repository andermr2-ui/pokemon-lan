import sys
sys.stdout.reconfigure(encoding='utf-8')

with open('Data/MapInfos.rxdata', 'rb') as f:
    raw = f.read()

results = []
i = 0
while i < len(raw) - 2:
    if raw[i] == 0x22:  # '"' starts a string in Marshal
        lb = raw[i + 1]
        if lb == 0:
            length = 0
        elif lb > 4:
            length = lb - 5
        else:
            i += 1
            continue
        if 4 <= length <= 60:
            s_bytes = raw[i + 2:i + 2 + length]
            try:
                s = s_bytes.decode('utf-8')
                if all(32 <= ord(c) < 127 or ord(c) > 127 for c in s):
                    results.append(s)
            except Exception:
                pass
    i += 1

seen = set()
for r in sorted(results):
    if r not in seen and '\\' not in r:
        seen.add(r)
        print(r)
