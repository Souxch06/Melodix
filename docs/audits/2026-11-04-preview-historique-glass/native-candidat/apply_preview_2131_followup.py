#!/usr/bin/env python3
"""Pinned Preview-only fixes: live slider value and non-reloading search submit."""
import hashlib
import sys
from pathlib import Path

EXPECTED = '7f6d91309de2ee9f89150a4f25c1897ed9f07314db0c0a0b0a0cac06d68632e0'

def replace(s, old, new):
    if s.count(old) != 1:
        raise ValueError('unexpected anchor: ' + old[:100])
    return s.replace(old, new, 1)

def patch(root):
    p = root / 'assets/native_ui_shell.js'
    data = p.read_bytes()
    if hashlib.sha256(data).hexdigest() != EXPECTED:
        raise ValueError('unexpected Preview native shell; no files changed')
    watcher = root / 'smali/com/melodix/music/NativeSearchWatcher.smali'
    watcher_data = watcher.read_bytes()
    if hashlib.sha256(watcher_data).hexdigest() != '04388ca920449b3180e49beabeaa5383e23544a93d31722e1f1dc689fc3e70aa':
        raise ValueError('unexpected search watcher; no files changed')
    w = watcher_data.decode('utf-8')
    w = replace(w, '.method public final onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z\n    .locals 1\n',
'''.method public final onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 1

    # An IME submit replaces, rather than races, the queued live search.
    iget-object v0, p0, Lcom/melodix/music/NativeSearchWatcher;->input:Landroid/widget/EditText;
    if-eqz v0, :preview_submit_no_pending
    invoke-virtual {v0, p0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z
    :preview_submit_no_pending
    const/4 v0, 0x0
    iput-object v0, p0, Lcom/melodix/music/NativeSearchWatcher;->pendingQuery:Ljava/lang/String;
''')
    s = data.decode('utf-8')
    s = replace(s, '''        var max = Number(rawMax), min = Number(rawMin), value = Number(rawValue);
        if (!isFinite(max) || max < 1000 || !isFinite(value) || min !== 0 || value < 0 || value > max) return null;''', '''        var max = Number(rawMax), min = Number(rawMin), initial = Number(rawValue);
        // The attribute is the default value. Spotify/React can change the
        // current DOM property without rewriting that attribute.
        var current = String(input.value);
        if (!/^\\d+$/.test(current)) return null;
        var value = Number(current);
        if (!isFinite(max) || max < 1000 || min !== 0 || initial < 0 || initial > max ||
            !isFinite(value) || value < 0 || value > max) return null;''')
    s = replace(s, '            cachedSearch._sfCached = true;\n            window.searchMediaItems = cachedSearch;',
                '            cachedSearch._sfCached = true;\n            if (origSearch._sfFallback === true) cachedSearch._sfFallback = true;\n            window.searchMediaItems = cachedSearch;')
    s = replace(s, '''        window.__sfSubmitSearch = function(query) {
            return navigateToSearch(query);
        };''', '''        window.__sfSubmitSearch = function(query) {
            var q = String(query || '').trim().slice(0, 100);
            if (!q) return false;
            if (searchNavigateTimer) {
                window.clearTimeout(searchNavigateTimer);
                searchNavigateTimer = 0;
            }
            // The fallback can be installed before the real bridge. Dispatch
            // to the current bridge if it later becomes available; navigating
            // the page here destroys the active player and is much slower.
            var current = window.searchMediaItems;
            if (window.__sfMelodixBridgeStarted === true && typeof current === 'function' && current._sfFallback !== true) {
                current(q);
                return true;
            }
            return navigateToSearch(q);
        };''')
    p.write_text(s, encoding='utf-8')
    watcher.write_text(w, encoding='utf-8')

if __name__ == '__main__':
    if len(sys.argv) != 2: raise SystemExit('usage: apply_preview_2131_followup.py PROJECT')
    patch(Path(sys.argv[1]))
