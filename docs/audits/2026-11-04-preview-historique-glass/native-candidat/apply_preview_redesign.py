#!/usr/bin/env python3
"""Preview only: "aurora glass" restyle of the shared native UI drawables.

Replaces the look (colours, radii, highlights) of drawables every native
screen already uses: shell background, glass rows, cards, tiles, chips,
navigation pills, mini player and buttons. No layout, ID, command, data or
asset change. Fails closed if any target drawable is missing.
"""
import sys
from pathlib import Path

NS = 'xmlns:android="http://schemas.android.com/apk/res/android"'


def glass(radius, fill='#17ffffff', top='#30ffffff', stroke='#2affffff'):
    return f'''<layer-list {NS}>
  <item><shape><solid android:color="{fill}"/><corners android:radius="{radius}"/><stroke android:width="1dp" android:color="{stroke}"/></shape></item>
  <item android:bottom="1dp"><shape><gradient android:angle="270" android:startColor="{top}" android:centerColor="#00ffffff" android:endColor="#00ffffff"/><corners android:radius="{radius}"/></shape></item>
</layer-list>'''


def ripple(color, radius, body=''):
    inner = f'\n  <item>{body}</item>' if body else ''
    return f'''<ripple {NS} android:color="{color}">{inner}
  <item android:id="@android:id/mask"><shape><solid android:color="#ffffffff"/><corners android:radius="{radius}"/></shape></item>
</ripple>'''


def strip(xml):
    return xml.replace(f'<layer-list {NS}>', '<layer-list>')


DRAWABLES = {
    'native_shell_background': f'''<layer-list {NS}>
  <item><shape><gradient android:angle="270" android:startColor="#ff120a26" android:centerColor="#ff0a0716" android:endColor="#ff06050d"/></shape></item>
  <item android:gravity="top|left" android:width="760dp" android:height="760dp"><shape><gradient android:type="radial" android:centerX="0.1" android:centerY="0.05" android:gradientRadius="380dp" android:startColor="#cc6d32e0" android:endColor="#006d32e0"/></shape></item>
  <item android:gravity="center_vertical|right" android:width="680dp" android:height="680dp"><shape><gradient android:type="radial" android:centerX="0.95" android:centerY="0.5" android:gradientRadius="340dp" android:startColor="#99d93f97" android:endColor="#00d93f97"/></shape></item>
  <item android:gravity="bottom|left" android:width="700dp" android:height="700dp"><shape><gradient android:type="radial" android:centerX="0.0" android:centerY="1.0" android:gradientRadius="350dp" android:startColor="#883b5bdb" android:endColor="#003b5bdb"/></shape></item>
</layer-list>''',
    'native_mini_player_bg': f'''<layer-list {NS}>
  <item><shape><gradient android:angle="0" android:startColor="#3a7b3fe4" android:endColor="#26e0489e"/><corners android:radius="24dp"/></shape></item>
  <item><shape><solid android:color="#1fffffff"/><corners android:radius="24dp"/><stroke android:width="1dp" android:color="#33ffffff"/></shape></item>
  <item android:bottom="1dp"><shape><gradient android:angle="270" android:startColor="#38ffffff" android:centerColor="#00ffffff" android:endColor="#00ffffff"/><corners android:radius="24dp"/></shape></item>
</layer-list>''',
    'native_nav_item': f'''<layer-list {NS}>
  <item><shape><solid android:color="#b30a0716"/><corners android:radius="30dp"/></shape></item>
  <item><shape><solid android:color="#14ffffff"/><corners android:radius="30dp"/><stroke android:width="1dp" android:color="#2effffff"/></shape></item>
  <item android:bottom="1dp"><shape><gradient android:angle="270" android:startColor="#2effffff" android:centerColor="#00ffffff" android:endColor="#00ffffff"/><corners android:radius="30dp"/></shape></item>
</layer-list>''',
    'native_card_ripple': ripple('#33ffffff', '20dp'),
    'native_tab_ripple': ripple('#407b3fe4', '20dp'),
    'native_mini_row_ripple': ripple('#407b3fe4', '14dp'),
    'native_row_ripple': ripple('#407b3fe4', '20dp', strip(glass('20dp'))),
    'native_playlist_row_glass': ripple('#477b3fe4', '18dp', strip(glass('18dp', fill='#12ffffff', top='#24ffffff', stroke='#22ffffff'))),
    'native_quick_tile': ripple('#477b3fe4', '18dp', strip(glass('18dp', fill='#1cffffff'))),
    'native_category_chip': glass('999dp'),
    'native_button_dark': ripple('#477b3fe4', '999dp', strip(glass('999dp', fill='#1cffffff', top='#33ffffff'))),
    'native_button_icon': f'''<shape {NS} android:shape="oval"><solid android:color="#1cffffff"/><stroke android:width="1dp" android:color="#33ffffff"/></shape>''',
    'native_button_green': ripple('#33ffffff', '999dp', '<shape><gradient android:angle="135" android:startColor="#ff8b4bf0" android:endColor="#ffe0489e"/><corners android:radius="999dp"/></shape>'),
    'native_playlist_heading_glass': f'''<shape {NS}><gradient android:angle="0" android:startColor="#387b3fe4" android:endColor="#1fe0489e"/><stroke android:width="1dp" android:color="#40b79cff"/><corners android:radius="20dp"/></shape>''',
    'native_genre_tile': f'''<shape {NS} android:shape="rectangle"><solid android:color="#ffffffff"/><corners android:radius="18dp"/></shape>''',
}


def apply(root):
    base = Path(root) / 'res' / 'drawable'
    missing = [n for n in DRAWABLES if not (base / f'{n}.xml').is_file()]
    if missing:
        raise ValueError('missing drawables, no changes made: ' + ', '.join(missing))
    for name, xml in DRAWABLES.items():
        (base / f'{name}.xml').write_text('<?xml version="1.0" encoding="utf-8"?>\n' + xml + '\n', encoding='utf-8')
    print('preview redesign applied to %d drawables' % len(DRAWABLES))


if __name__ == '__main__':
    if len(sys.argv) != 2:
        raise SystemExit('usage: apply_preview_redesign.py <work-dir>')
    apply(sys.argv[1])
