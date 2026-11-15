#!/usr/bin/env python3
"""Use the observed personal Home rows for Library and stabilize transient Home gaps."""
from pathlib import Path
import hashlib,sys
NAME='assets/native_ui_shell.js';SHA='016cb2ec905940c869b630586ce5b7ff92fd764574456763c28b1271526af2bd'
BRIDGE='assets/spotify_bridge.js';BRIDGE_SHA='58c5871a9f678b5c3a55bf36a0141d030ccb4fef8f4bf39c1f0538d8f25ee4d0'
def change(s,a,b):
 if s.count(a)!=1:raise ValueError('unexpected block: '+repr(a[:100]))
 return s.replace(a,b,1)
def prepare(root):
 b=(root/NAME).read_bytes()
 if hashlib.sha256(b).hexdigest()!=SHA:raise ValueError('unexpected base: '+NAME)
 bridge_data=(root/BRIDGE).read_bytes()
 if hashlib.sha256(bridge_data).hexdigest()!=BRIDGE_SHA:raise ValueError('unexpected base: '+BRIDGE)
 bridge=bridge_data.decode('utf8')
 s=b.decode('utf8')
 s=change(s,'''    var mediaLibWarmupRequested = false;
    var lastMediaActiveAt = 0;''','''    var mediaLibWarmupRequested = false;
    // Short-lived memory only; never persist personalized Home data.
    var homeRowsToken = null;
    var homeRowsCache = new Map();
    var latestObservedHomeRows = [];
    var latestObservedHomeAt = 0;
    var latestObservedHomeToken = null;
    var homeStabilityTimer = null;
    var HOME_ROW_GRACE_MS = 15000;
    var lastMediaActiveAt = 0;''')
 s=change(s,'''            bridge.onNativeUiData(screen, payload);
            if (screen === 'home' && typeof bridge.onNativeHomeRows === 'function') {
                bridge.onNativeHomeRows(payload);
            }
            if (lines.length) {''','''            // The dedicated callback forwards the same payload to the same
            // native renderer; sending both causes duplicate Home rebuilds and
            // a delayed older payload can overtake a newer one.
            bridge.onNativeUiData(screen, payload);
            if (lines.length) {''')
 s=change(s,'''        var parts = url.pathname.split('/').filter(Boolean);
        var typeIndex = parts.findIndex''','''        if (/^\\/(?:intl-[a-z]{2}(?:-[a-z]{2})?\\/)?collection\\/tracks\\/?$/i.test(url.pathname)) {
            return 'spotify:collection:tracks';
        }
        var parts = url.pathname.split('/').filter(Boolean);
        var typeIndex = parts.findIndex''')
 s=change(s,'''        var library = window.mediaLib;
        var groups = [''', '''        var library = window.mediaLib;
        if (typeof window.__sfNativeMediaTokenMatches === 'function' && !window.__sfNativeMediaTokenMatches()) library = null;
        var groups = [''')
 s=change(s,'''    function clearHomeRetry() {''','''    function currentHomeToken() {
        var token = window.spotAuthToken;
        return typeof token === 'string' && token.indexOf('Bearer ') === 0 ? token : null;
    }

    function clearHomeMemory() {
        homeRowsCache.clear();
        homeRowsToken = null;
        if (homeStabilityTimer) window.clearTimeout(homeStabilityTimer);
        homeStabilityTimer = null;
    }

    function stabilizeHomeRows(rows) {
        var token = currentHomeToken();
        var now = Date.now();
        var current = new Set();
        var missingUntil = 0;
        var groups = new Map();
        if (!token) { clearHomeMemory(); return rows; }
        if (token !== homeRowsToken) { clearHomeMemory(); homeRowsToken = token; }
        rows.forEach(function(row) {
            if (!row || !row.uri || !row.title) return;
            current.add(row.uri);
            homeRowsCache.set(row.uri, {row: row, seen: now});
        });
        while (homeRowsCache.size > 96) homeRowsCache.delete(homeRowsCache.keys().next().value);
        homeRowsCache.forEach(function(entry, uri) {
            if (!current.has(uri) && now - entry.seen >= HOME_ROW_GRACE_MS) {
                homeRowsCache.delete(uri);
                return;
            }
            if (!current.has(uri)) {
                var expires = entry.seen + HOME_ROW_GRACE_MS;
                if (!missingUntil || expires < missingUntil) missingUntil = expires;
            }
            var section = entry.row.section || '';
            if (!groups.has(section)) groups.set(section, []);
            groups.get(section).push(entry.row);
        });
        if (homeStabilityTimer) window.clearTimeout(homeStabilityTimer);
        homeStabilityTimer = null;
        if (missingUntil) {
            homeStabilityTimer = window.setTimeout(function() {
                homeStabilityTimer = null;
                if (isSpotifyHome()) runUpdate();
            }, Math.max(1, missingUntil - now));
        }
        var merged = [];
        groups.forEach(function(group) { merged = merged.concat(group); });
        return merged;
    }

    function clearHomeRetry() {''')
 s=change(s,'''        rows = supplementHomeRowsWithLibrary(collectHomeRows(mainView || homeScrapeRoot(), null, true, true));
        signature''','''        rows = supplementHomeRowsWithLibrary(collectHomeRows(mainView || homeScrapeRoot(), null, true, true));
        latestObservedHomeRows = rows;
        latestObservedHomeAt = Date.now();
        latestObservedHomeToken = currentHomeToken();
        rows = stabilizeHomeRows(rows);
        signature''')
 s=change(s,'''                updateLibraryRows(mainView);
            }
        } catch (_) {''','''                updateLibraryRows(mainView);
                if (requestedLibraryCategory) {
                    var loaded = window.mediaLib && window.mediaLib[requestedLibraryCategory];
                    if (!Array.isArray(loaded) || !loaded.length ||
                        (typeof window.__sfNativeMediaTokenMatches === 'function' && !window.__sfNativeMediaTokenMatches())) {
                        showAvailableLibraryCategory(requestedLibraryCategory);
                    }
                }
            }
        } catch (_) {''')
 s=change(s,'''    window.__sfNativeRequestHome = function() {
        if (window.location.hostname''','''    window.__sfNativeRequestHome = function() {
        requestedLibraryCategory = '';
        libraryRequestEpoch += 1;
        if (window.location.hostname''')
 s=change(s,"        } else if (key === 'clear_cache') {", "        } else if (key === 'clear_cache') {\n            clearHomeMemory();")
 s=change(s,"        } else if (key === 'resync') {", "        } else if (key === 'resync') {\n            clearHomeMemory();")
 s=change(s,'''        return !!type && uri.indexOf('spotify:' + type + ':') === 0;''','''        return (category === 'playlists' && uri === 'spotify:collection:tracks') ||
            (!!type && uri.indexOf('spotify:' + type + ':') === 0);''')
 start=s.index('    function showSidebarCategory(category) {');end=s.index('    // ---- Bundled bridge loader',start)
 s=s[:start]+'''    var LIBRARY_CATEGORY_PATHS = {
        playlists: '/collection/playlists',
        albums: '/collection/albums',
        artists: '/collection/artists',
        podcasts: '/collection/podcasts'
    };
    var LIBRARY_HOME_SECTIONS = {
        playlists: 'Vos playlists', albums: 'Albums enregistrés',
        artists: 'Artistes suivis', podcasts: 'Podcasts'
    };
    var requestedLibraryCategory = '';
    var libraryRequestEpoch = 0;
    var lastLibraryFallbackSignature = null;

    function showAvailableLibraryCategory(category) {
        var sidebar = document && document.querySelector && document.querySelector('#Desktop_LeftSidebar_Id');
        var rows = [];
        var seen = new Set();
        var token = currentHomeToken();
        function add(row) {
            var uri = nativeSpotifyUri(row && (row.uri || row.id || row.href));
            var title = String(row && (row.title || row.name || row.label) || '').trim();
            if (!title || !libraryRowMatchesCategory({uri: uri}, category) || seen.has(uri)) return;
            seen.add(uri);
            rows.push({title: title, uri: uri, subtitle: row.subtitle || row.owner || '', image: row.image || row.cover || row.artwork || ''});
        }
        // Exact same rows that have already appeared in Home, scoped to the
        // current in-memory bearer session. Never copy recommendation shelves.
        if (isSpotifyHome() && token === latestObservedHomeToken && Date.now() - latestObservedHomeAt < 2000) {
            latestObservedHomeRows.forEach(function(row) {
                if (row.section === LIBRARY_HOME_SECTIONS[category]) add(row);
            });
        }
        if (token && token === homeRowsToken) {
            homeRowsCache.forEach(function(entry) {
                if (entry.row.section === LIBRARY_HOME_SECTIONS[category]) add(entry.row);
            });
        }
        if (sidebar) collectHomeRows(sidebar, function(uri) {
            return libraryRowMatchesCategory({uri: uri}, category);
        }, true).forEach(add);
        if (!rows.length) return false;
        var signature = category + ':' + JSON.stringify(rows);
        if (signature === lastLibraryFallbackSignature) return true;
        if (!sendNativeUiData('media:' + category, rows)) return false;
        lastLibraryFallbackSignature = signature;
        return true;
    }

    function openLibraryCategory(category) {
        var key = Object.prototype.hasOwnProperty.call(LIBRARY_CATEGORY_PATHS, category) ? category : 'playlists';
        var target = LIBRARY_CATEGORY_PATHS[key];
        var shown;
        requestedLibraryCategory = key;
        // Re-read current Home once: this remains usable even if the bridge is
        // unavailable or the token has not yet been intercepted.
        if (isSpotifyHome()) updateHomeRows(homeScrapeRoot());
        var requestEpoch = ++libraryRequestEpoch;
        lastLibraryFallbackSignature = null;
        shown = showAvailableLibraryCategory(key);
        if (window.__sfMelodixBridgeStarted === true && typeof window.fetchMediaItems === 'function') {
            try {
                // A genuinely empty/failed bridge result must not erase real
                // entries already visible in Home or in Spotify's sidebar.
                Promise.resolve(window.fetchMediaItems(key)).then(function() {
                    var list = window.mediaLib && window.mediaLib[key];
                    if (requestEpoch === libraryRequestEpoch && requestedLibraryCategory === key && (!Array.isArray(list) || !list.length ||
                        (typeof window.__sfNativeMediaTokenMatches === 'function' && !window.__sfNativeMediaTokenMatches()))) {
                        // The bridge may have emitted an empty array after our initial fallback.
                        lastLibraryFallbackSignature = null;
                        showAvailableLibraryCategory(key);
                    }
                }).catch(function() {
                    if (requestEpoch === libraryRequestEpoch && requestedLibraryCategory === key) {
                        lastLibraryFallbackSignature = null;
                        showAvailableLibraryCategory(key);
                    }
                });
                return true;
            } catch (_) {}
        }
        var path = spotifyRoutePath();
        if (shown || path === target || path.indexOf(target + '/') === 0) return true;
        window.location.assign('https://open.spotify.com' + target);
        return true;
    }

    window.__sfOpenLibrary = function() { return openLibraryCategory('playlists'); };
    window.__sfOpenLibraryCategory = function(tag) {
        return openLibraryCategory(String(tag || '').trim().toLowerCase());
    };

''' + s[end:]
 bridge=change(bridge, '    window.checkMediaLib = checkMediaLib;', '''    window.__sfNativeMediaTokenMatches = function() {
        return !!publishedLibraryToken && publishedLibraryToken === window.spotAuthToken;
    };
    window.checkMediaLib = checkMediaLib;''')
 return {NAME:s,BRIDGE:bridge}

def main():
 if len(sys.argv)!=2:raise SystemExit('usage: apply_stable_home_library.py DISPOSABLE_PROJECT')
 root=Path(sys.argv[1])
 try:files=prepare(root)
 except (OSError,ValueError) as e:raise SystemExit(str(e)) from e
 for name,text in files.items():(root/name).write_text(text,encoding='utf8')
 print('Applied stable Home and Library candidate:',root)
if __name__=='__main__':main()
