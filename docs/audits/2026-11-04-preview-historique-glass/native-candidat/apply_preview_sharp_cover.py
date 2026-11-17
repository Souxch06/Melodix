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
ANCHORS = [
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


def apply(root):
    p = Path(root) / 'assets' / 'native_ui_shell.js'
    p.write_text(patch(p.read_text(encoding='utf-8')), encoding='utf-8')
    print('preview sharp cover applied')


if __name__ == '__main__':
    if len(sys.argv) != 2:
        raise SystemExit('usage: apply_preview_sharp_cover.py <work-dir>')
    apply(sys.argv[1])
