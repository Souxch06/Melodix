#!/usr/bin/env python3
"""Speed up observation of real Spotify Home, building on Preview 9008."""
from pathlib import Path
import hashlib,sys
EXPECTED={
 'assets/native_ui_shell.js':'f7d59db00363652e3fb032eafdef4196dec0cbae64544968cbabf57c09adca08',
 'assets/spotify_bridge.js':'3af1cb86e40f17562590d4c808083824dc9acaef54f9ed2bf9274299bb56ca2f',
}
def replace(s,a,b):
 if s.count(a)!=1:raise ValueError('unexpected block: '+repr(a[:90]))
 return s.replace(a,b,1)
def prepare(root):
 files={}
 for name,sha in EXPECTED.items():
  data=(root/name).read_bytes()
  if hashlib.sha256(data).hexdigest()!=sha:raise ValueError('unexpected base: '+name)
  files[name]=data.decode('utf8')
 name='assets/native_ui_shell.js';s=files[name]
 s=replace(s,'''    var observer = null;
    var lastHomeSignature''','''    var observer = null;
    var homeContentObserver = null;
    var observedHomeRoot = null;
    var lastHomeSignature''')
 s=replace(s,'function collectHomeRows(mainView, acceptUri, strictRoot) {','function collectHomeRows(mainView, acceptUri, strictRoot, excludeSidebar) {')
 s=replace(s,'''            if (!sourceAnchor || !uri || seen.has(uri) || (acceptUri && !acceptUri(uri))) return;
            lines = textLines(card);''','''            if (!sourceAnchor || !uri || seen.has(uri) || (acceptUri && !acceptUri(uri))) return;
            if (excludeSidebar && closest(sourceAnchor, '#Desktop_LeftSidebar_Id')) return;
            lines = textLines(card);''')
 s=replace(s, 'collectHomeRows(sidebar).forEach(function(row) {', 'collectHomeRows(sidebar, null, true).forEach(function(row) {')
 s=replace(s,'''    function updateHomeRows(mainView) {
        var rows;
        var signature;''','''    function observeHomeContent(root) {
        if (!window.MutationObserver || !root || observedHomeRoot === root) return;
        if (homeContentObserver) homeContentObserver.disconnect();
        observedHomeRoot = root;
        homeContentObserver = new window.MutationObserver(scheduleUpdate);
        homeContentObserver.observe(root, {
            subtree: true,
            attributes: true,
            characterData: true,
            attributeFilter: ['href', 'src', 'srcset', 'data-src', 'aria-label', 'alt']
        });
    }

    function disconnectHomeContent() {
        if (homeContentObserver) homeContentObserver.disconnect();
        homeContentObserver = null;
        observedHomeRoot = null;
    }

    function updateHomeRows(mainView) {
        var rows;
        var hasPublicRows;
        var signature;''')
 s=replace(s,'''        if (!homeRoute) {
            clearHomeRetry();
            return;
        }

        rows = supplementHomeRowsWithLibrary(collectHomeRows(mainView || homeScrapeRoot()));''','''        if (!homeRoute) {
            clearHomeRetry();
            disconnectHomeContent();
            return;
        }

        // Keep the real Home root separate from Spotify's library sidebar.
        // A personal playlist with artwork must not terminate public-feed retries.
        observeHomeContent(mainView);
        rows = supplementHomeRowsWithLibrary(collectHomeRows(mainView || homeScrapeRoot(), null, true, true));''')
 s=replace(s,'''        if (rows.length > 0 && rows.some(function(row) { return Boolean(row && row.image); })) clearHomeRetry();
        else scheduleHomeRetry();''','''        hasPublicRows = rows.some(function(row) {
            return !!(row && row.image && row.section !== 'Vos playlists' &&
                row.section !== 'Albums enregistrés' && row.section !== 'Artistes suivis' && row.section !== 'Podcasts');
        });
        if (hasPublicRows) clearHomeRetry();
        else scheduleHomeRetry();''')
 files[name]=s
 name='assets/spotify_bridge.js';s=files[name]
 s=replace(s,'''    function updateMelodixHome() {
        if (!document.body) return;''','''    function updateMelodixHome() {
        // The native UI already renders Home. The legacy WebView copy hides
        // #main-view via CSS and can prevent Spotify's own lazy content from
        // appearing; keep the real source mounted behind the opaque native UI.
        if (window.__sfNativeUiShellReady) {
            deactivateMelodixHome(true);
            return;
        }
        if (!document.body) return;''')
 s=replace(s,'''    function initializeMelodixHome() {
        if (window._sfMelodixHomeListenersAttached) return;''','''    function initializeMelodixHome() {
        if (window.__sfNativeUiShellReady) {
            if (document.body) deactivateMelodixHome(true);
            return;
        }
        if (window._sfMelodixHomeListenersAttached) return;''')
 files[name]=s
 return files
def main():
 if len(sys.argv)!=2:raise SystemExit('usage: apply_public_home.py DISPOSABLE_PROJECT')
 root=Path(sys.argv[1])
 try:files=prepare(root)
 except (OSError,ValueError) as e:raise SystemExit(str(e)) from e
 for name,text in files.items():(root/name).write_text(text,encoding='utf8')
 print('Applied public Home observation candidate:',root)
if __name__=='__main__':main()
