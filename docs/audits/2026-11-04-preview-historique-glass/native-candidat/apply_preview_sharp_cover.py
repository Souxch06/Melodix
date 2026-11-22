#!/usr/bin/env python3
"""Preview only: player cover from the largest image the page itself lists.

The now-playing cover used the bar thumbnail (about 64 px). The page's own
<img srcset> lists larger versions of the same picture; take the largest
(up to 640 w), and for album covers the 640 px size code of the same
picture. Same host allowlist (safeSpotifyImage); one image per cover,
replacing the thumbnail. Fails closed unless each anchor is found once.
"""
import sys
from pathlib import Path

HELPER = '''    // Largest picture listed by the page itself for this <img> (<= 640w).
    function previewLargestImage(img) {
        var best = '', bestW = 0;
        try {
            String(img.getAttribute('srcset') || '').split(',').forEach(function(part) {
                var bits = part.trim().split(/\\s+/), w = parseInt((bits[1] || '').replace(/w$/i, ''), 10);
                if (bits[0] && w > bestW && w <= 640) { best = bits[0]; bestW = w; }
            });
        } catch (_) { best = ''; }
        var url = safeSpotifyImage(best) || safeSpotifyImage(img.currentSrc || img.src || '');
        // Album covers: same picture, 640 px size code instead of 64/300 px.
        return url.replace(/\\/image\\/ab67616d0000(4851|1e02)/, '/image/ab67616d0000b273');
    }
    function imageOf(selectors) {'''
ROW_SOURCE = r"""        // Use only an image candidate actually advertised by this element.
        // currentSrc can be a 64px phone thumbnail even on a tablet.
        var selected = '', largest = 0;
        try {
            String(image.getAttribute('srcset') || '').split(',').forEach(function(part) {
                var bits = part.trim().split(/\s+/), desc = bits[1] || '', size = 0;
                if (/^\d+w$/i.test(desc)) size = parseInt(desc, 10);
                else if (/^\d+(?:\.\d+)?x$/i.test(desc)) size = Math.round(parseFloat(desc) * 64);
                var candidate = safeSpotifyImage(bits[0]);
                if (candidate && size > largest && size <= 640) { selected = candidate; largest = size; }
            });
        } catch (_) { selected = ''; }
        return selected || (raw ? safeSpotifyImage(raw) : '');"""
ANCHORS = [
    ("        return raw ? safeSpotifyImage(raw) : '';", ROW_SOURCE),
    ('    function imageOf(selectors) {', HELPER),
    ("                var url = safeSpotifyImage(img.currentSrc || img.src || '');",
     "                var url = previewLargestImage(img);"),
    ("            url = safeSpotifyImage(img.currentSrc || img.src || '');\n            if (url) return url;",
     "            url = previewLargestImage(img);\n            if (url) return url;"),
]


def patch(text):
    for old, _ in ANCHORS:
        if text.count(old) != 1:
            raise ValueError('cover anchor not found once; no changes made: ' + old.strip()[:60])
    for old, new in ANCHORS:
        text = text.replace(old, new, 1)
    return text


LIBRARY_OLD = """        if (window.__sfMelodixBridgeStarted === true && typeof window.fetchMediaItems === 'function') {
            try {
                // A genuinely empty/failed bridge result"""
LIBRARY_NEW = LIBRARY_OLD.replace('__sfMelodixBridgeStarted', '__sfMelodixBridgeCompleted', 1)


def library(text):
    # User report 1022399: Library stayed "momentanément indisponible". The
    # running bridge never sets Started (setting it autoplays); playlists already wait for Completed.
    if text.count(LIBRARY_OLD) != 1:
        raise ValueError('library bridge anchor not found once; no changes made')
    return text.replace(LIBRARY_OLD, LIBRARY_NEW, 1)


def apply(root):
    p = Path(root) / 'assets' / 'native_ui_shell.js'
    p.write_text(library(patch(p.read_text(encoding='utf-8'))), encoding='utf-8')
    print('preview sharp cover applied')


if __name__ == '__main__':
    if len(sys.argv) != 2:
        raise SystemExit('usage: apply_preview_sharp_cover.py <work-dir>')
    apply(sys.argv[1])
    # Last pass for 9027: neutral (Liner-like) glass, no violet/pink tint.
    sys.path.insert(0, str(Path(__file__).resolve().parent))
    import apply_neutral_palette
    apply_neutral_palette.main(sys.argv[1])
