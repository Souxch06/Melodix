#!/usr/bin/env python3
"""Test the preparation script on minimal disposable fixtures, never on a real install.
The certificate and delivery SHA below are dummy public-shaped test strings, not keys.
"""
import hashlib
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import unittest
import xml.etree.ElementTree as ET

AUDIT = Path(__file__).resolve().parent
SOURCE = Path(os.environ['MELODIX_HISTORICAL_ROOT']).resolve()
SCRIPT = AUDIT / 'prepare_preview.py'
CSS = AUDIT / 'css_hacks_glass_complet.css'
CERT = 'AB' * 32
DELIVERY = '1' * 40
ANDROID = '{http://schemas.android.com/apk/res/android}'
FILES = (
    'AndroidManifest.xml', 'apktool.yml', 'res/values/strings.xml',
    'assets/spotify_bridge.js', 'assets/native_ui_shell.js',
    'smali/ub2.smali', 'smali/com/melodix/music/MainActivity.smali',
)

class PreviewPreparationTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory(prefix='melodix-preview-fixture-')
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name) / 'project'
        for name in FILES:
            dest = self.root / name
            dest.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(SOURCE / name, dest)
        (self.root / 'assets/css_hacks.css').write_text('/* fixture original CSS */\n')
        # An unrelated asset checks that the script does not replace the fixture tree.
        (self.root / 'assets/unrelated.js').write_text('/* unchanged */\n')

    def run_prepare(self, css=CSS, cert=CERT, code='1021488', delivery=DELIVERY):
        return subprocess.run([sys.executable, str(SCRIPT), str(self.root), str(css), cert, code, delivery], text=True, capture_output=True)

    def snapshot(self):
        return {p.relative_to(self.root).as_posix(): hashlib.sha256(p.read_bytes()).hexdigest()
                for p in self.root.rglob('*') if p.is_file()}

    def test_success_changes_only_expected_files_and_preview_identity(self):
        before = self.snapshot()
        original_manifest = ET.parse(self.root / 'AndroidManifest.xml').getroot()
        result = self.run_prepare()
        self.assertEqual(result.returncode, 0, result.stderr)
        changed = {name for name, digest in self.snapshot().items() if before[name] != digest}
        self.assertEqual(changed, {'AndroidManifest.xml','apktool.yml','res/values/strings.xml',
                                   'assets/css_hacks.css','smali/ub2.smali','smali/com/melodix/music/MainActivity.smali'})
        self.assertEqual((self.root / 'assets/css_hacks.css').read_bytes(), CSS.read_bytes())
        actual = ET.parse(self.root / 'AndroidManifest.xml').getroot()
        old, preview = 'com.melodix.music', 'com.melodix.music.preview'
        original_manifest.set('package', preview)
        original_manifest.find('application').attrib.pop(ANDROID+'debuggable', None)
        for el in original_manifest.iter():
            if el.get(ANDROID+'name') == old+'.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION':
                el.set(ANDROID+'name', preview+'.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION')
            auth = el.get(ANDROID+'authorities')
            if auth and auth.startswith(old+'.'):
                el.set(ANDROID+'authorities', preview+auth[len(old):])
            if el.get(ANDROID+'label') == 'Melodix':
                el.set(ANDROID+'label', 'Melodix Preview historique')
        self.assertEqual(ET.tostring(actual), ET.tostring(original_manifest))
        strings = (self.root/'res/values/strings.xml').read_text()
        self.assertIn(':'.join(['AB']*32), strings)
        self.assertIn('<string name="preview_delivery_commit">'+DELIVERY+'</string>', strings)
        self.assertIn('<string name="preview_source_commit">d0f206b08b3db7c2d41a1e844f6dd4abf196a5f6</string>', strings)
        self.assertIn('  versionCode: 1021488', (self.root/'apktool.yml').read_text())
        for name in FILES[-2:]:
            expected = (SOURCE/name).read_text().replace('com.melodix.music.PIP_', 'com.melodix.music.preview.PIP_')
            self.assertEqual((self.root/name).read_text(), expected)

    def test_debuggable_attribute_is_removed_on_fixture(self):
        manifest = self.root/'AndroidManifest.xml'
        tree = ET.parse(manifest)
        tree.getroot().find('application').set(ANDROID+'debuggable', 'true')
        tree.write(manifest, encoding='utf-8', xml_declaration=True)
        self.assertEqual(self.run_prepare().returncode, 0)
        self.assertNotIn(ANDROID+'debuggable', ET.parse(manifest).getroot().find('application').attrib)

    def test_bad_certificate_version_or_delivery_fail_before_any_writes(self):
        before = self.snapshot()
        for args in ({'cert':'bad'}, {'code':'1021487'}, {'code':'x'}, {'delivery':'BAD'}):
            with self.subTest(args=args):
                self.assertNotEqual(self.run_prepare(**args).returncode, 0)
                self.assertEqual(self.snapshot(), before)

    def test_wrong_css_fails_before_any_writes(self):
        bad = Path(self.tmp.name)/'bad.css'
        bad.write_text('/* not the pinned CSS */')
        before = self.snapshot()
        self.assertNotEqual(self.run_prepare(css=bad).returncode, 0)
        self.assertEqual(self.snapshot(), before)

    def test_altered_historical_js_fails_before_any_writes(self):
        for name in ('assets/spotify_bridge.js', 'assets/native_ui_shell.js'):
            with self.subTest(name=name):
                target=self.root/name
                original=target.read_bytes()
                target.write_bytes(original+b'\n/* altered */\n')
                before=self.snapshot()
                self.assertNotEqual(self.run_prepare().returncode, 0)
                self.assertEqual(self.snapshot(), before)
                target.write_bytes(original)

    def test_reusing_prepared_project_fails(self):
        self.assertEqual(self.run_prepare().returncode, 0)
        self.assertNotEqual(self.run_prepare().returncode, 0)

    def test_bad_manifest_package_fails_after_css_was_already_replaced(self):
        manifest=self.root/'AndroidManifest.xml'
        tree=ET.parse(manifest)
        tree.getroot().set('package','example.fixture')
        tree.write(manifest,encoding='utf-8',xml_declaration=True)
        before=self.snapshot()
        self.assertNotEqual(self.run_prepare().returncode,0)
        after=self.snapshot()
        self.assertEqual({name for name in before if before[name] != after[name]}, {'assets/css_hacks.css'})
        self.assertEqual((self.root/'assets/css_hacks.css').read_bytes(),CSS.read_bytes())

    def test_bad_apktool_metadata_fails_after_earlier_files_have_been_changed(self):
        yaml=self.root/'apktool.yml'
        yaml.write_text(yaml.read_text().replace('  versionCode:', '  noVersionCode:'))
        before=self.snapshot()
        self.assertNotEqual(self.run_prepare().returncode,0)
        after=self.snapshot()
        self.assertEqual({name for name in before if before[name] != after[name]},
                         {'assets/css_hacks.css','AndroidManifest.xml','res/values/strings.xml'})
        self.assertEqual(ET.parse(self.root/'AndroidManifest.xml').getroot().get('package'),'com.melodix.music.preview')
        self.assertEqual((self.root/'apktool.yml').read_bytes(), (SOURCE/'apktool.yml').read_bytes().replace(b'  versionCode:',b'  noVersionCode:'))

if __name__ == '__main__':
    unittest.main(verbosity=2)
