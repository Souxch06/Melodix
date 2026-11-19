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
    liner_liked(root)
    print('neutral palette: %d files' % changed)
    if not changed: sys.exit('no violet literal found: patch order changed?')

LIKED_GUARD = """    if-eqz p0, :cond_2

    if-eqz p1, :liner_not_liked
    const-string v0, "/liked-songs/"
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v0
    if-eqz v0, :liner_not_liked
    # Liner look: neutral liked tile instead of Spotify's purple artwork.
    invoke-static {}, Lcom/squareup/picasso/Picasso;->get()Lcom/squareup/picasso/Picasso;
    move-result-object v0
    invoke-virtual {v0, p0}, Lcom/squareup/picasso/Picasso;->cancelRequest(Landroid/widget/ImageView;)V
    invoke-static {p0}, Lcom/melodix/music/PreviewUiRestyle;->likedTile(Landroid/widget/ImageView;)V
    return-void

    :liner_not_liked
"""

def liner_liked(root):
    import pathlib
    r = pathlib.Path(root)
    f = next(r.glob('smali*/com/melodix/music/NativeImageLoader.smali'))
    t = f.read_text(encoding='utf-8')
    # Insert right after the method's first null check of the ImageView, whatever its label or .locals.
    m = re.search(r'(\.method public static load\(Landroid/widget/ImageView;Ljava/lang/String;I\)V\n\s*\.(?:locals|registers) (\d+)\n(?:(?!\.end method)[^\n]*\n){0,6}?\s*if-eqz p0, :[\w]+\n)', t)
    assert m and int(m.group(2)) >= 1, 'NativeImageLoader.load changed'
    f.write_text(t[:m.end()] + LIKED_GUARD.split('\n', 1)[1] + t[m.end():], encoding='utf-8')

FLAT = """<?xml version="1.0" encoding="utf-8"?>
<ripple xmlns:android="http://schemas.android.com/apk/res/android" android:color="#1affffff">
    <item><shape><solid android:color="#00000000" /><corners android:radius="%ddp" /></shape></item>
    <item android:id="@android:id/mask"><shape><solid android:color="#ffffffff" /><corners android:radius="%ddp" /></shape></item>
</ripple>
"""
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
        nonlocal n
        tag = x.group(0)
        if 'native_button_white' not in tag or not re.search(r'src="@drawable/(play|pause)"', tag): return tag
        n += 1
        if 'android:tint=' in tag: return re.sub(r'android:tint="[^"]*"', 'android:tint="#ff111113"', tag)
        return tag.replace(' android:src=', ' android:tint="#ff111113" android:src=', 1)
    t = re.sub(r'<[^<>!?/][^<>]*>', tint, t)
    assert n >= 1, 'no play disc found'
    m.write_text(t, encoding='utf-8')
    for name, radius in (('native_playlist_row_glass', 10), ('native_quick_tile', 12)):  # Liner: no card frames
        g = r / 'drawable' / (name + '.xml')
        if g.exists(): g.write_text(FLAT % (radius, radius), encoding='utf-8')

assert grey(0xff8b5cf6) & 0xff == grey(0xff8b5cf6) >> 8 & 0xff and grey(0x148b5cf6) >> 24 == 0x14
assert xml('#407C3AED x #ff000000') == '#40%s x #ff000000' % ('%06x' % (grey(0x407c3aed) & 0xffffff))
assert smali('    .array-data 4\n        -0x84c01c\n    .end array-data') != '    .array-data 4\n        -0x84c01c\n    .end array-data'
if __name__ == '__main__': main(sys.argv[1])
