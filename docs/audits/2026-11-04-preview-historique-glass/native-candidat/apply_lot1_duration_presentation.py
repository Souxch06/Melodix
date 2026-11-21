#!/usr/bin/env python3
"""Display-only clock normalization, never touching protected Spotify assets.

Native playlist durations are available only when Spotify's current DOM has a
recognized duration on an already scraped row. The paged bridge still wins and
is untouched. No duration is synthesized for missing/virtualized rows.
"""
import hashlib
import sys
from pathlib import Path

SOURCE = 'assets/native_ui_shell.js'
EXPECTED_SHA256 = 'f462a7ae83ca6f02339106ab6f239502bffd9fabc37982f8fe12a1133a904550'

HELPERS = r'''    // Presentation only: recognize complete clocks, never interpret arbitrary
    // row numbers as durations. Incomplete/unknown values stay absent.
    function lot1VisibleClock(value) {
        var text = String(value || '').trim();
        var match = /^(\d{1,4}):([0-5]\d)(?::([0-5]\d))?$/.exec(text);
        if (!match) return '';
        var total = match[3] === undefined
            ? Number(match[1]) * 60 + Number(match[2])
            : Number(match[1]) * 3600 + Number(match[2]) * 60 + Number(match[3]);
        var hours = Math.floor(total / 3600);
        var minutes = Math.floor(total / 60) % 60;
        var seconds = total % 60;
        function two(n) { return n < 10 ? '0' + n : String(n); }
        return hours ? hours + ':' + two(minutes) + ':' + two(seconds)
                     : minutes + ':' + two(seconds);
    }

    function lot1DomTrackDuration(container, structured) {
        if (!structured || !container || !container.querySelector) return '';
        var node = container.querySelector('[data-testid="tracklist-row-duration"], [data-testid="track-duration"]');
        return node ? lot1VisibleClock(node.textContent) : '';
    }

    // The legacy bridge owns the fullscreen player. This observer only changes
    // the text of its two known clock labels, not playback state or callbacks.
    function installLot1VisibleClockDisplay() {
        if (!window.MutationObserver || !document.documentElement) return;
        var selector = '#sf-fs-pos, #sf-fs-dur';
        function refresh() {
            Array.prototype.forEach.call(document.querySelectorAll(selector), function(node) {
                var old = node.textContent;
                var formatted = lot1VisibleClock(old);
                if (formatted && formatted !== old) node.textContent = formatted;
            });
        }
        function relevant(node) {
            if (!node) return false;
            if (node.nodeType === 3) node = node.parentElement;
            if (!node || node.nodeType !== 1) return false;
            return node.id === 'sf-fs-pos' || node.id === 'sf-fs-dur' ||
                !!(node.querySelector && node.querySelector(selector));
        }
        try {
            var clockObserver = new window.MutationObserver(function(records) {
                var changed = records.some(function(record) {
                    if (relevant(record.target) && (record.target.id === 'sf-fs-pos' || record.target.id === 'sf-fs-dur' || record.type === 'characterData')) return true;
                    return Array.prototype.some.call(record.addedNodes || [], relevant);
                });
                if (changed) refresh();
            });
            clockObserver.observe(document.documentElement, {childList:true, characterData:true, subtree:true});
            refresh();
        } catch (_) { /* preserve the original player if observation is unavailable */ }
    }

'''

def replace(s, old, new):
    if s.count(old) != 1: raise ValueError('unexpected anchor: '+repr(old[:100]))
    return s.replace(old, new, 1)

def prepare(root):
    raw = (root/SOURCE).read_bytes()
    if hashlib.sha256(raw).hexdigest() != EXPECTED_SHA256: raise ValueError('unexpected 9016 shell input')
    s = raw.decode('utf8')
    s = replace(s, '    function collectDetailRows(mainView) {', HELPERS + '    function collectDetailRows(mainView) {')
    s = replace(s, '''            seen.add(uri);
            rows.push({title:title.slice(0,100), subtitle:artists.join(', ').slice(0,120),
                image:findImageUrl(card, link, mainView), uri:uri});''', '''            seen.add(uri);
            var subtitle = artists.join(', ').slice(0,120);
            var visibleDuration = lot1DomTrackDuration(container, structured);
            if (visibleDuration) subtitle = subtitle ? subtitle + ' • ' + visibleDuration : visibleDuration;
            rows.push({title:title.slice(0,100), subtitle:subtitle,
                image:findImageUrl(card, link, mainView), uri:uri});''')
    s = replace(s, '''        installPlayerFeed();
        installBridgeRecovery();''', '''        installPlayerFeed();
        installLot1VisibleClockDisplay();
        installBridgeRecovery();''')
    return s

if __name__ == '__main__':
    root = Path(sys.argv[1])
    (root/SOURCE).write_text(prepare(root), encoding='utf8')
