#!/usr/bin/env python3
"""Patch 9007 disposable build to publish library pages progressively."""
from pathlib import Path
import hashlib,sys
EXPECTED={
'assets/native_ui_shell.js':'06ec99e97b759241354d8a9099df5bacd07972eed8f97c0d5be1d034ea723eca',
'assets/spotify_bridge.js':'0681f77be1cfe480b87a859b54e3865c3975577478d45469a72265878bdb4395'}
def change(s,a,b):
 if s.count(a)!=1:raise ValueError('unexpected block: '+repr(a[:90]))
 return s.replace(a,b,1)
def prepare(root):
 files={}
 for name,expected in EXPECTED.items():
  b=(root/name).read_bytes()
  if hashlib.sha256(b).hexdigest()!=expected:raise ValueError('unexpected base: '+name)
  files[name]=b.decode('utf8')
 name='assets/native_ui_shell.js';s=files[name]
 s=change(s,'function collectHomeRows(mainView) {','function collectHomeRows(mainView, acceptUri, strictRoot) {')
 s=change(s,"if (!cardNodes.length && document && typeof document.querySelectorAll === 'function') {", "if (!strictRoot && !cardNodes.length && document && typeof document.querySelectorAll === 'function') {")
 s=change(s,"if (!anchors.length && document && typeof document.querySelectorAll === 'function') {", "if (!strictRoot && !anchors.length && document && typeof document.querySelectorAll === 'function') {")
 s=change(s,'if (!sourceAnchor || !uri || seen.has(uri)) return;', 'if (!sourceAnchor || !uri || seen.has(uri) || (acceptUri && !acceptUri(uri))) return;')
 s=change(s,'''        rows = collectHomeRows(mainView).filter(function(row) {
            return libraryRowMatchesCategory(row, category);
        });''','''        // A successful bridge page is authoritative. Do not replace it with
        // an incomplete DOM scrape emitted later from the WebView.
        if (window.__sfNativeMediaHasLibraryData) return;
        rows = collectHomeRows(mainView, function(uri) {
            return libraryRowMatchesCategory({uri: uri}, category);
        }, true);''')
 anchor='''    // The library tab used to call the bridge's fetchMediaItems directly. Open'''
 s=change(s,anchor,'''    // Updates are emitted per successful Spotify page, rather than only after
    // every library page has completed. Existing native screen guards still apply.
    window.__sfNativeLibraryUpdated = function() {
        if (isSpotifyHome()) scheduleUpdate();
    };

    function showSidebarCategory(category) {
        if (!document || typeof document.querySelector !== 'function') return false;
        var sidebar = document.querySelector('#Desktop_LeftSidebar_Id');
        if (!sidebar) return false;
        var rows = collectHomeRows(sidebar, function(uri) {
            return libraryRowMatchesCategory({uri: uri}, category);
        }, true);
        return rows.length > 0 && sendNativeUiData('media:' + category, rows);
    }

'''+anchor)
 s=change(s,'''    window.__sfOpenLibrary = function() {
        if (window.__sfMelodixBridgeStarted''','''    window.__sfOpenLibrary = function() {
        var shown = showSidebarCategory('playlists');
        if (window.__sfMelodixBridgeStarted''')
 s=change(s,'''        if (spotifyRoutePath() === '/collection/playlists') return true;
        window.location.assign''','''        if (shown || spotifyRoutePath() === '/collection/playlists') return true;
        window.location.assign''')
 s=change(s,'''        var target = LIBRARY_CATEGORY_PATHS[key] || '/collection/playlists';
        if (window.__sfMelodixBridgeStarted''','''        var target = LIBRARY_CATEGORY_PATHS[key] || '/collection/playlists';
        var shown = showSidebarCategory(key || 'playlists');
        if (window.__sfMelodixBridgeStarted''')
 s=change(s,'''        if (path === target || path.indexOf(target + '/') === 0) return true;''','''        if (shown || path === target || path.indexOf(target + '/') === 0) return true;''')
 files[name]=s
 name='assets/spotify_bridge.js';s=files[name]
 start=s.index('    let isFetchingLib = false;');end=s.index('    window.checkMediaLib = checkMediaLib;',start)
 s=s[:start]+'''    let activeLibraryFetch = null;
    let activeLibraryToken = null;
    let publishedLibraryToken = null;
    let libraryGeneration = 0;
    function checkMediaLib(force = false) {
        const currentToken = window.spotAuthToken;
        if (activeLibraryFetch && !force && (!currentToken || currentToken === activeLibraryToken)) return activeLibraryFetch;
        const generation = ++libraryGeneration;
        activeLibraryToken = currentToken;
        if (publishedLibraryToken && currentToken !== publishedLibraryToken) {
            window.mediaLib = null;
            window.__sfNativeMediaHasLibraryData = false;
            publishedLibraryToken = null;
        }
        const job = (async () => {
            await ensureAuthToken();
            if (generation !== libraryGeneration || !window.spotAuthToken) return;
            const token = window.spotAuthToken;
            activeLibraryToken = token;
            if (publishedLibraryToken && publishedLibraryToken !== token) {
                window.mediaLib = null;
                window.__sfNativeMediaHasLibraryData = false;
                publishedLibraryToken = null;
            }
            try {
                await fetchAllLibrary((allItems, complete) => {
                    if (generation !== libraryGeneration || window.spotAuthToken !== token) return false;
                    window.mediaLib = parseLibrary(allItems);
                    publishedLibraryToken = token;
                    window.__sfNativeMediaHasLibraryData = true;
                    if (typeof window.__sfNativeLibraryUpdated === 'function') window.__sfNativeLibraryUpdated();
                    for (const reqId of window.pendingMediaRequests) {
                        const items = window.mediaLib[reqId] || [];
                        // Do not replace useful sidebar rows with an incomplete empty page.
                        if (items.length || complete) AndBridge.onMediaItemsLoaded(reqId, JSON.stringify(items));
                    }
                    if (complete) window.pendingMediaRequests.clear();
                    return true;
                }, token);
            } catch (e) {
                console.error("Error fetching/parsing media library: ", e);
            }
        })();
        activeLibraryFetch = job;
        job.finally(() => { if (generation === libraryGeneration) { activeLibraryFetch = null; activeLibraryToken = null; } });
        return job;
    }
''' +s[end:]
 s=change(s,'    async function fetchAllLibrary() {','    async function fetchAllLibrary(onPage, expectedToken) {')
 s=change(s,'''        while (hasMore && offset < 1000) {
            const headers = {
                'Authorization': window.spotAuthToken,''','''        while (hasMore && offset < 1000) {
            if (expectedToken && window.spotAuthToken !== expectedToken) break;
            const headers = {
                'Authorization': expectedToken || window.spotAuthToken,''')
 s=change(s,'''            const items = data?.data?.me?.libraryV3?.items || [];
            allItems = allItems.concat(items);''','''            const items = data?.data?.me?.libraryV3?.items;
            if (!Array.isArray(items)) {
                console.error("Pathfinder library response has no item array");
                break;
            }
            allItems = allItems.concat(items);''')
 s=change(s,'''            allItems = allItems.concat(items);

            if (items.length < limit)''','''            allItems = allItems.concat(items);
            const complete = items.length < limit || offset + limit >= 1000;
            if (typeof onPage === 'function' && onPage(allItems, complete) === false) break;

            if (items.length < limit)''')
 old='''                if (!window.mediaLib || !window.mediaLib[parentId]?.length) {
                    window.pendingMediaRequests.add(parentId);
                    await checkMediaLib();
                }
                if (window.mediaLib && window.mediaLib[parentId]) {
                    window.pendingMediaRequests.delete(parentId);
                    const items = window.mediaLib[parentId].map(item => {
                        let img = item.image;
                        if (item.name === 'Liked Songs' || (item.id && (item.id.includes('collection') || item.id === 'spotify:playlist:liked'))) {
                            img = 'https://misc.scdn.co/liked-songs/liked-songs-640.png';
                        }
                        return { ...item, image: img, isGrid: true };
                    });
                    AndBridge.onMediaItemsLoaded(parentId, JSON.stringify(items));
                    return;
                }
                console.log("[Spotifuck] fetchMediaItems: mediaLib not ready yet for " + parentId + ". Queued in pendingMediaRequests.");
                return;'''
 new='''                // Deliver already loaded pages immediately and subscribe for
                // subsequent pages while a shared fetch is in progress.
                if (window.mediaLib && publishedLibraryToken === window.spotAuthToken && window.mediaLib[parentId]?.length) {
                    AndBridge.onMediaItemsLoaded(parentId, JSON.stringify(window.mediaLib[parentId]));
                    if (!activeLibraryFetch) return;
                }
                window.pendingMediaRequests.add(parentId);
                await checkMediaLib();
                return;'''
 s=change(s,old,new);files[name]=s
 return files
def main():
 if len(sys.argv)!=2:raise SystemExit('usage: apply_incremental_library.py DISPOSABLE_PROJECT')
 root=Path(sys.argv[1])
 try:files=prepare(root)
 except (OSError,ValueError) as e:raise SystemExit(str(e)) from e
 for name,text in files.items():(root/name).write_text(text,encoding='utf8')
 print('Applied incremental library candidate:',root)
if __name__=='__main__':main()
