#!/usr/bin/env python3
"""Experimental latency and library-source fixes for a disposable Preview."""
import hashlib
from pathlib import Path
import sys
EXPECTED = {
 'assets/native_ui_shell.js':'a6bea27c1b715b02f50e9a5b68e58a751f4d896a65e6c32057798aed47930906',
 'assets/native_home_scrape.js':'c46972c04686cf6b33ccb6857861cc6555a355d836fa1dea061191c4f4bff93d',
 'smali/com/melodix/music/NativeHomeJsonCallback.smali':'c02a23adc116c2d9518e2cdfcf2673b42a4618f9b1221f3dc7c3b25853ab98e1',
}
def change(text,old,new):
 if text.count(old)!=1:raise ValueError(f'unexpected block ({text.count(old)}): {old[:90]!r}')
 return text.replace(old,new,1)
def prepare(root):
 files={}
 for name,expected in EXPECTED.items():
  data=(root/name).read_bytes()
  if hashlib.sha256(data).hexdigest()!=expected:raise ValueError(f'unexpected base: {name}')
  files[name]=data.decode('utf8')
 shell=files['assets/native_ui_shell.js']
 # Once actual library data resolves, immediately schedule a Home update;
 # do not block the initial DOM render or modify authentication/network calls.
 shell=change(shell,'''                window.checkMediaLib();
            } catch (_) {}
        }

        if (library)''','''                Promise.resolve(window.checkMediaLib()).then(function() {
                    if (window.mediaLib && isSpotifyHome()) scheduleUpdate();
                }).catch(function() {});
            } catch (_) {}
        }

        if (library)''')
 shell=change(shell,'''    function libraryCategoryForPath(path) {
        var match = /^\\/collection\\/([a-z]+)/.exec(String(path || ''));
        var key = match && match[1];
        if (key === 'albums' || key === 'artists' || key === 'podcasts' || key === 'playlists') return key;
        return 'playlists';
    }''','''    function libraryCategoryForPath(path) {
        var route = String(path || '');
        var match = /^\\/collection\\/(playlists|albums|artists|podcasts)(?:\\/|$)/.exec(route);
        if (match) return match[1];
        if (route === '/collection' || route === '/your-library') return 'playlists';
        // /collection/tracks is Liked Songs, not the playlists category.
        return '';
    }

    function libraryRowMatchesCategory(row, category) {
        var uri = nativeSpotifyUri(row && row.uri || '');
        var type = category === 'playlists' ? 'playlist' :
            category === 'albums' ? 'album' : category === 'artists' ? 'artist' :
            category === 'podcasts' ? 'show' : '';
        return !!type && uri.indexOf('spotify:' + type + ':') === 0;
    }''')
 shell=change(shell,'''        var path = spotifyRoutePath();
        var rows;
        var signature;
        if (nativeScreenForPath() !== 'library' || !mainView)''','''        var path = spotifyRoutePath();
        var rows;
        var signature;
        var category = libraryCategoryForPath(path);
        if (nativeScreenForPath() !== 'library' || !mainView)''')
 shell=change(shell,'''        if (path.indexOf('/collection') !== 0 && path.indexOf('/your-library') !== 0) return;
        if (path !== lastLibraryPath)''','''        if (!category) return;
        if (path !== lastLibraryPath)''')
 shell=change(shell,'''        rows = collectHomeRows(mainView);
        signature = JSON.stringify(rows);
        window.__sfNativeUiLibraryRowsCount = rows.length;''','''        rows = collectHomeRows(mainView).filter(function(row) {
            return libraryRowMatchesCategory(row, category);
        });
        signature = JSON.stringify(rows);
        window.__sfNativeUiLibraryRowsCount = rows.length;''')
 shell=change(shell,"sendNativeUiData('media:' + libraryCategoryForPath(path), rows)","sendNativeUiData('media:' + category, rows)")
 files['assets/native_ui_shell.js']=shell
 # Never interpret another WebView route as the native Home fallback.
 scrape=files['assets/native_home_scrape.js']
 scrape=change(scrape,'''  try {
    var cached = window.__sfNativeHomeRowsJson;''','''  try {
    var path = String(window.location.pathname || '/').replace(/\\/+$/, '') || '/';
    path = path.replace(/^\\/intl-[a-z]{2}(?:-[a-z]{2})?(?=\\/|$)/i, '') || '/';
    if (window.location.hostname !== 'open.spotify.com' || (path !== '/' && path !== '/home' && path !== '/intl')) return [];
    var cached = window.__sfNativeHomeRowsJson;''')
 files['assets/native_home_scrape.js']=scrape
 name='smali/com/melodix/music/NativeHomeJsonCallback.smali'
 files[name]=change(files[name],'''    const-string v1, "null"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :done''','''    const-string v1, "null"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :done''')
 return files

def main():
 if len(sys.argv)!=2:raise SystemExit('usage: apply_home_library.py DISPOSABLE_PREVIEW_PROJECT')
 root=Path(sys.argv[1])
 try:files=prepare(root)
 except (OSError,ValueError) as e:raise SystemExit(str(e)) from e
 for name,text in files.items():(root/name).write_text(text,encoding='utf8')
 print('Applied Home and Library candidate:',root)
if __name__=='__main__':main()
