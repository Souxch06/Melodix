#!/usr/bin/env python3
"""User request (after 1022256): Liner-like neutral glass, no pink/violet tint.
Last patch pass: every known violet/pink colour literal becomes a neutral grey of the
same lightness and alpha, in res XML and in com/melodix smali. Display only."""
import colorsys, os, re, sys

# Exact literals found in the decoded 1022256 candidate (ids/floats excluded on purpose).
KNOWN = """ffc9c0ea ffe0489e ffa78bfa ffcfc6f2 ff3700b3 477b3fe4 407b3fe4 ff7b3fe4 ffc7bbdc
447b3fe4 ffb5a3d2 ffded4ed ff8b5cf6 ffe6e6f2 ffcdb6ff ffbcaed5 ff2b1456 44110b20 ee302342
f2170b33 99c4b5fd 148b5cf6 448b5cf6 808b5cf6 668b5cf6 ffc4b5fd ffb9aed6 2a8b5cf6 b3c9c0ea
ff29213e ff3a1f38 ff6e3c9d ff24193d ff8056e5 ff362d94 ff764fa7 ffe6dcf1 e85b3680 ffe5d5ff
ffd9cce5 55c9a8ff ffe3d2ff aa8057aa 88634382 ffa86df2 ffd751a5 ff57417c 45bca2ed ffb995ed
ffba86fc ffcf6679 287c3aed 13db2777 30a78bfa 407c3aed ff7c3aed ffdb2777
ff6200ee ff120a26 cc6d32e0 006d32e0 99d93f97 00d93f97 ff170b33 737b3fe4 007b3fe4 59e0489e
00e0489e ff8b4bf0 387b3fe4 1fe0489e 40b79cff 3a7b3fe4 26e0489e
ffb7aacd ff120d1e fff15e6c ff272038 d6211a30 ff20172f ff110e19 400a0614 b30a0614 f20a0614
ee171421 ff090613 ffeee9ff c8382c49 d51b1726""".split()

def grey(argb):
    a = argb >> 24; r, g, b = [(argb >> s & 255) / 255 for s in (16, 8, 0)]
    v = round(colorsys.rgb_to_hls(r, g, b)[1] * 255)
    return a << 24 | v << 16 | v << 8 | v

MAP = {int(k, 16): grey(int(k, 16)) for k in KNOWN}

def xml(text):
    def sub(m):
        h = m.group(1); v = int(h if len(h) == 8 else 'ff' + h, 16)
        return '#%08x' % MAP[v] if v in MAP else m.group(0)
    return re.sub(r'#([0-9a-fA-F]{8}|[0-9a-fA-F]{6})\b', sub, text)

def smali(text):
    def sub(m):
        v = int(m.group(2), 16) & 0xffffffff
        if v not in MAP: return m.group(0)
        n = MAP[v]; n = n - (1 << 32) if n >= 1 << 31 else n
        return m.group(1) + ('-0x%x' % -n if n < 0 else '0x%x' % n)
    text = re.sub(r'(const [vp]\d+, )(-?0x[0-9a-f]+)\b', sub, text)
    # Gradient int[] literals compile to array-data, not const.
    return re.sub(r'\.array-data 4\n.*?\.end array-data', lambda b: re.sub(r'(\n\s+)(-?0x[0-9a-f]+)(?=\n)', sub, b.group(0)), text, flags=re.S)

def main(root):
    changed = 0
    for d, _, fs in os.walk(root):
        for f in fs:
            p = os.path.join(d, f)
            fn = xml if f.endswith('.xml') and os.sep + 'res' + os.sep in p else smali if f.endswith('.smali') and '/com/melodix/' in p else None
            if not fn: continue
            try: s = open(p, encoding='utf-8').read()
            except UnicodeDecodeError: continue  # binary XML (not decoded by apktool): no literal to change
            t = fn(s)
            if t != s: open(p, 'w', encoding='utf-8').write(t); changed += 1
    liner_res(root)
    print('neutral palette: %d files' % changed)
    if not changed: sys.exit('no violet literal found: patch order changed?')

def liner_res(root):
    """Liner look: white play disc with dark icon, flat track rows (no card per row)."""
    import pathlib
    r = pathlib.Path(root) / 'res'
    w = r / 'drawable/native_button_white.xml'
    t = w.read_text(encoding='utf-8')
    t2 = re.sub(r'<gradient [^>]*/>', '<solid android:color="#fff5f5f7" />', t).replace('android:color="#24ffffff"', 'android:color="#1f000000"')
    assert t2 != t, 'play disc drawable changed shape'
    w.write_text(t2, encoding='utf-8')
    m = r / 'layout/activity_main.xml'
    t = m.read_text(encoding='utf-8'); n = 0
    def tint(x):
        nonlocal n; n += 1
        return x.group(0).replace('android:tint="#ffffffff"', 'android:tint="#ff111113"')
    t = re.sub(r'<[^<>]*android:background="@drawable/native_button_white"[^<>]*android:src="@drawable/play"[^<>]*>', tint, t)
    assert n == 2, 'expected 2 play discs, found %d' % n
    m.write_text(t, encoding='utf-8')
    g = r / 'drawable/native_playlist_row_glass.xml'
    if g.exists():
        t = g.read_text(encoding='utf-8')
        t = re.sub(r'<solid android:color="#[0-9a-f]{8}" />\s*<corners android:radius="18.0dip" />\s*<stroke [^>]*/>', '<solid android:color="#00000000" /><corners android:radius="10.0dip" />', t)
        t = re.sub(r'<gradient [^>]*/>', '<solid android:color="#00000000" />', t).replace('#47929292', '#1affffff')
        g.write_text(t, encoding='utf-8')

assert grey(0xff8b5cf6) & 0xff == grey(0xff8b5cf6) >> 8 & 0xff and grey(0x148b5cf6) >> 24 == 0x14
assert xml('#407C3AED x #ff000000') == '#40%s x #ff000000' % ('%06x' % (grey(0x407c3aed) & 0xffffff))
assert smali('    .array-data 4\n        -0x84c01c\n    .end array-data') != '    .array-data 4\n        -0x84c01c\n    .end array-data'
if __name__ == '__main__': main(sys.argv[1])
