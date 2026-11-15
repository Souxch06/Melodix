#!/usr/bin/env python3
"""Structural checks for the Preview-only player patch and decoded APK.

This is not Android ART or a real Spotify session.
"""
import hashlib
import importlib.util
import os
import unittest
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = Path(os.environ['MELODIX_PREVIEW_ROOT'])
INPUT = os.environ.get('MELODIX_PATCH_INPUT') == '1'

def load_patch():
    spec = importlib.util.spec_from_file_location('apply_preview_player', HERE/'apply_preview_player.py')
    module = importlib.util.module_from_spec(spec); spec.loader.exec_module(module)
    return module

def method(text, signature):
    start=text.index(signature); end=text.index('.end method',start)
    return text[start:end]

class PreviewPlayer(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.patch=load_patch()
        cls.files=cls.patch.prepare(ROOT) if INPUT else None
    def get(self, path):
        return self.files[path] if INPUT else (ROOT/path).read_text()
    def test_only_preview_paths_and_exact_pinned_helpers(self):
        if INPUT:
            self.assertEqual(set(self.files), set(self.patch.EXPECTED)|{'smali/com/melodix/music/'+x for x in self.patch.HELPER_SHA})
            from verify_9016_protected_assets import ASSET_SHA256
            self.assertFalse(set(self.files)&set(ASSET_SHA256))
        for name, digest in self.patch.HELPER_SHA.items():
            data=(HERE/'preview-player/smali'/name).read_bytes()
            self.assertEqual(hashlib.sha256(data).hexdigest(),digest)
            if INPUT: self.assertEqual(self.files['smali/com/melodix/music/'+name],data.decode())
    def test_compiled_helpers_have_no_replacement_characters(self):
        # The exact generated dex/Smali must not contain Unicode replacement
        # characters; JVM source-only tests missed a compiler encoding error.
        for name in self.patch.HELPER_SHA:
            helper=self.get('smali/com/melodix/music/'+name)
            self.assertNotIn('\ufffd', helper)
            self.assertNotIn(r'\ufffd', helper.lower())
        helper=self.get('smali/com/melodix/music/PreviewPlayerController.smali')
        self.assertTrue('—' in helper or r'\u2014' in helper)
        self.assertTrue('é' in helper or r'\u00e9' in helper)

    def test_player_progress_style_keeps_real_clipping_and_no_tint_override(self):
        import xml.etree.ElementTree as ET
        android = '{http://schemas.android.com/apk/res/android}'
        drawable = ET.fromstring(self.get('res/drawable/widget_progress_drawable.xml'))
        items = {x.get(android+'id'): x for x in drawable.findall('item')}
        self.assertEqual(set(items), {'@android:id/background', '@android:id/progress'})
        self.assertIsNotNone(items['@android:id/background'].find('./shape/gradient'))
        gradient = items['@android:id/progress'].find('./clip/shape/gradient')
        self.assertIsNotNone(gradient)
        self.assertNotEqual(gradient.get(android+'startColor'), gradient.get(android+'endColor'))
        for layout in ('res/layout/activity_main.xml', 'res/layout-w600dp/activity_main.xml'):
            root = ET.fromstring(self.get(layout))
            for name in ('nativePlayerProgress', 'nativeMiniProgress'):
                bar = next(x for x in root.iter('ProgressBar') if x.get(android+'id') == '@id/'+name)
                self.assertEqual(bar.get(android+'progressDrawable'), '@drawable/widget_progress_drawable')
                self.assertEqual(bar.get(android+'progressTint'), '@null')
                self.assertEqual(bar.get(android+'progressBackgroundTint'), '@null')
                self.assertEqual(bar.get(android+'max'), '1000')
        # Widget still uses the same clipped drawable (also adopts the gradient).
        widget = ET.fromstring((ROOT/'res/layout/widget_expanded.xml').read_text())
        self.assertTrue(any(x.get(android+'progressDrawable') == '@drawable/widget_progress_drawable' for x in widget.iter('ProgressBar')))

    def test_settings_glass_keeps_actions_and_accessibility(self):
        settings = method(self.get('smali/com/melodix/music/NativeSettingsRowFactory.smali'), '.method public static create(')
        self.assertIn('GradientDrawable;->setColors([I)V', settings)
        self.assertIn('GradientDrawable;->setOrientation(', settings)
        self.assertIn('->dp(Landroid/content/Context;I)I', settings)
        self.assertIn('NativeRowClickListener;', settings)
        self.assertIn('setFocusable(Z)V', settings)
        self.assertIn('attachPreviewAbout(Landroid/view/View;)V', settings)

    def test_playlist_heading_uses_selected_title_without_inventing_a_play_action(self):
        activity = self.get('smali/com/melodix/music/MainActivity.smali')
        heading = method(activity, '.method public final addNativePlaylistHeading(')
        self.assertIn('nativeExpectedId:Ljava/lang/String;', heading)
        self.assertIn('nativeCurrentTitle:Ljava/lang/String;', heading)
        self.assertIn('Titres de la playlist', heading)
        self.assertNotIn('playFromUri', heading)
        self.assertNotIn('setOnClickListener', heading)

    def test_glow_is_cosmetic_and_respects_lifecycle_and_motion_settings(self):
        activity = self.get('smali/com/melodix/music/MainActivity.smali')
        self.assertIn('PreviewPlayerController;->activityResumed()V', method(activity, '.method public final onResume()'))
        self.assertIn('PreviewPlayerController;->activityStopped()V', method(activity, '.method public final onStop()'))
        source = (HERE/'preview-player/PreviewPlayerController.java').read_text()
        for part in ('ValueAnimator.areAnimatorsEnabled()', 'view.isShown()', 'findDrawableByLayerId(android.R.id.progress)',
                     'ObjectAnimator.ofInt(fill, "alpha", 150, 255)', 'glowSampleValid', 'realPlaying && shownPlaying',
                     'glow[index].cancel()', 'glowFill[index].setAlpha(255)'):
            self.assertIn(part, source)

    def test_route_and_about_row_are_native_and_discreet(self):
        a=self.get('smali/com/melodix/music/MainActivity.smali')
        apply=method(a,'.method public final applyNativeUiData(')
        self.assertIn('PreviewPlayerController;->snapshot(Ljava/lang/String;)V',apply)
        self.assertIn('PreviewPlayerController;->command()V',apply)
        settings=self.get('smali/com/melodix/music/NativeSettingsRowFactory.smali')
        self.assertTrue('Melodix • Client Spotify Natif' in settings or r'Melodix \u2022 Client Spotify Natif' in settings)
        self.assertIn('MainActivity;->attachPreviewAbout(Landroid/view/View;)V',settings)
        helper=self.get('smali/com/melodix/music/PreviewPlayerController.smali')
        self.assertIn('setOnLongClickListener',helper)
        self.assertIn('setPositiveButton',helper)
    def test_metrics_are_wired_to_real_native_paths(self):
        a=self.get('smali/com/melodix/music/MainActivity.smali')
        self.assertIn('PreviewPlayerController;->activityCreated()V',method(a,'.method public final onCreate('))
        self.assertIn('PreviewPlayerController;->playlistOpened(Ljava/lang/String;)V',method(a,'.method public final openNativeRow('))
        self.assertIn('PreviewPlayerController;->rowsPainted(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V',method(a,'.method public final renderNativeRows('))
        source=(HERE/'preview-player/PreviewPlayerController.java').read_text()
        report=source[source.index('    private String report()'):source.index('    public void showDiagnostics()')]
        self.assertNotIn('pendingPlaylist',report)
        self.assertIn('préparation de frame',report)
        self.assertIn('firstHomeFrameMs',report); self.assertIn('playlistFrameMs',report)

    def test_webview_debugging_is_confined_to_exact_preview_package(self):
        text=method(self.get('smali/m9.smali'),'.method public static g(Landroid/content/Context;)Landroid/webkit/WebView;')
        package=text.index('com.melodix.music.preview')
        self.assertIn('getPackageName()Ljava/lang/String;',text[:package])
        self.assertIn('Ljava/lang/String;->equals(Ljava/lang/Object;)Z',text[package:])
        self.assertLess(package,text.index('setWebContentsDebuggingEnabled(Z)V'))
        before_debug=text[:text.index('setWebContentsDebuggingEnabled(Z)V')]
        # The historical factory reuses v0=1 for cookies and WebView settings.
        # It must remain initialized on all exceptions and never receive a string.
        self.assertIn('const/4 v0, 0x1', before_debug)
        self.assertNotIn('const-string v0, "com.melodix.music.preview"', before_debug)
        self.assertNotIn('move-result v0', before_debug)
        self.assertLess(before_debug.index('const/4 v0, 0x1'),before_debug.index(':try_start_0'))
        self.assertIn('invoke-static {v2}',before_debug)
        self.assertIn('invoke-virtual {v1, v0}, Landroid/webkit/CookieManager;->setAcceptCookie(Z)V',text)

    def test_controls_have_no_playlist_rate_limit(self):
        a=self.get('smali/com/melodix/music/MainActivity.smali')
        for name in ('onNativePlayPauseClick','onNativePlayerPreviousClick','onNativePlayerNextClick'):
            text=method(a,'.method public final '+name+'(')
            self.assertNotIn('PlaylistTap',text); self.assertNotIn('budget',text)
        source=(HERE/'preview-player/PreviewPlayerController.java').read_text()
        for forbidden in ('spotAuthToken', 'spotCliToken', 'localStorage', 'Authorization', 'Client-Token', 'Cookie', 'fetch(', 'Log.'):
            self.assertNotIn(forbidden, source)
        report=source[source.index('    private String report()'):source.index('    public void showDiagnostics()')]
        self.assertNotIn('trackBefore',report); self.assertNotIn('track)',report)
        self.assertIn('intervals[index]',report)
    def test_sample_fields_and_command_callback_are_passive(self):
        s=self.get('assets/native_ui_shell.js')
        for name in ('previewTrackUri', 'previewPositionMs', 'previewDurationMs', 'previewProgressValid', 'previewAdvancing'):
            self.assertIn(name,s)
        self.assertIn("window.AndBridge.onNativeUiData('preview-command', '')",s)
        toggle=s[s.index('    window.__sfTogglePlayback ='):s.index('    // Single entry point for the native previous/next')]
        self.assertNotIn('refreshPlayerSoon(350)',toggle)
        self.assertNotIn('refreshPlayerSoon(1400)',toggle)
        self.assertIn('window.actPlayPause(target)',toggle)

if __name__=='__main__': unittest.main(verbosity=2)
