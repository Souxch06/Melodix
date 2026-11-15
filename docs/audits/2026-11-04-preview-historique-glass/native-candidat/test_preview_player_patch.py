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
