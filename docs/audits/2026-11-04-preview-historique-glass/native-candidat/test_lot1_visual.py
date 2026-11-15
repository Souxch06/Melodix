#!/usr/bin/env python3
"""Static/structural Preview checks; not a device rendering test."""
import importlib.util
import os
import re
import unittest
import xml.etree.ElementTree as ET
from pathlib import Path

here = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('patch', here / 'apply_lot1_visual.py')
patch = importlib.util.module_from_spec(spec)
spec.loader.exec_module(patch)
root = Path(os.environ['MELODIX_PREVIEW_ROOT'])
A = '{http://schemas.android.com/apk/res/android}'


def method(src, name):
    found = re.search(r'^\.method [^\n]*\b' + re.escape(name) + r'\([^\n]*\n([\s\S]*?)^\.end method', src, re.M)
    if not found: raise AssertionError('missing ' + name)
    # apktool's Smali decoder escapes non-ASCII string literals.
    return re.sub(r'\\u([0-9a-fA-F]{4})', lambda m: chr(int(m.group(1), 16)), found.group(1))


class VisualTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.files = patch.prepare(root) if os.environ.get('MELODIX_PATCH_INPUT') else {
            name: (root / name).read_text(encoding='utf8') for name in patch.EXPECTED
        }

    def test_scope_never_changes_js_or_protected_assets(self):
        self.assertEqual(set(self.files), set(patch.EXPECTED))
        self.assertTrue(all(not name.startswith('assets/') for name in self.files))

    def test_sections_are_headings_not_chip_buttons(self):
        s = self.files['smali/com/melodix/music/NativeHomeShelfPreview.smali']
        heading = method(s, 'groupLabel')
        self.assertIn('Votre bibliothèque', heading)
        self.assertIn('À découvrir sur Spotify', heading)
        self.assertNotIn('native_category_chip', heading)
        self.assertNotIn('setOnClickListener', heading)
        self.assertNotIn('setClickable', heading)
        paint = method(s, 'paint')
        self.assertIn('groupLabel(', paint)
        self.assertIn('homeOrigin', paint)

    def test_settings_gear_and_neutral_label_are_scoped(self):
        layout = ET.fromstring(self.files['res/layout/activity_main.xml'])
        gear = [x for x in layout.iter() if x.get(A + 'tag') == 'nativeSettingsGear']
        self.assertEqual(len(gear), 1)
        self.assertEqual(gear[0].get(A + 'onClick'), 'onNativeSettingsClick')
        activity = self.files['smali/com/melodix/music/MainActivity.smali']
        screen = method(activity, 'setNativeScreen')
        self.assertIn('styleLot1Screen', screen)
        style = method(activity, 'styleLot1Screen')
        self.assertIn('"settings"', style)
        self.assertIn('nativeSettingsGear', style)
        self.assertIn('setVisibility(I)V', style)
        self.assertIn('0x41800000', style)  # 16dp left/right only in settings
        s = method(self.files['smali/com/melodix/music/NativeSettingsRowFactory.smali'], 'create')
        self.assertIn('Réglage Spotify non disponible dans cette Preview', s)
        self.assertIn('Géré par Spotify', s)
        self.assertIn('Ljava/lang/String;->equals(', s)
        self.assertIn('setText(Ljava/lang/CharSequence;)', s)

    def test_scroll_area_is_above_player_and_tabs_in_the_vertical_parent(self):
        rootxml = ET.fromstring(self.files['res/layout/activity_main.xml'])
        native = next(x for x in rootxml.iter() if x.get(A + 'id') == '@id/nativeRoot')
        children = list(native)
        ids = [x.get(A + 'id') for x in children]
        self.assertLess(ids.index('@id/nativeRowsScroll'), ids.index('@id/nativeMiniPlayerContainer'))
        self.assertLess(ids.index('@id/nativeMiniPlayerContainer'), ids.index('@id/nativeTabBar'))
        self.assertLess(ids.index('@id/nativeGenreScroll'), ids.index('@id/nativeMiniPlayerContainer'))
        for name in ('nativeRowsScroll', 'nativeGenreScroll'):
            scroll = next(x for x in children if x.get(A+'id') == '@id/'+name)
            self.assertEqual(scroll.get(A+'layout_weight'), '1.0')
            self.assertEqual(scroll[0].get(A+'paddingBottom'), '32.0dip')

    def test_artwork_loading_and_error_paths_exist(self):
        loader = method(self.files['smali/com/melodix/music/NativeImageLoader.smali'], 'load')
        for s in ('cancelRequest', 'placeholder(Landroid/graphics/drawable/Drawable;)', '->error(I)',
                  'native_cover_placeholder', 'setImageResource(I)V', '->resize(II)', '->centerCrop()'):
            self.assertIn(s, loader)
        fallback = ET.fromstring(self.files['res/drawable/native_cover_placeholder.xml'])
        self.assertEqual(fallback.tag, 'layer-list')
        self.assertIsNotNone(fallback.find('.//gradient'))
        self.assertIsNotNone(fallback.find('.//vector/path'))

    def test_all_resource_ids_match_prior_apk(self):
        previous = os.environ.get('MELODIX_PRIOR_PUBLIC')
        if not previous or os.environ.get('MELODIX_PATCH_INPUT'): self.skipTest('requires two decoded APKs')
        def ids(path): return {(e.get('type'), e.get('name')): e.get('id') for e in ET.parse(path).getroot() if e.tag == 'public'}
        self.assertEqual(ids(previous), ids(root / 'res/values/public.xml'))


if __name__ == '__main__': unittest.main(verbosity=2)
