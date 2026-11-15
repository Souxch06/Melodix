#!/usr/bin/env python3
"""Fix detail DOM extraction and provide library-specific Glass spacing.
Apply only to the exact 9013 disposable project, never to the normal app.
"""
from pathlib import Path
import hashlib,sys
EXPECTED={
 'assets/native_ui_shell.js':'e6c4c06a11df09875789d2aeb60c4e4893339c97238a683b4b00af3a06da246d',
 'assets/spotify_bridge.js':'0a960d98bcb68c804b80b2041e416e016c925e2a9d79058246ba09f009d29757',
 'smali/com/melodix/music/MainActivity.smali':'95ed7ce138aca6f2f31d17a197b653df3e380e68b147bd4439cba9ba09e2d52c',
 'smali/com/melodix/music/NativeUiRowFactory.smali':'cfdba826689d08e9a18df68d0fb8c4ab538a1308fa2c9af270070d810420c3df',
 'smali/com/melodix/music/NativeHomeFeed.smali':'57193fb96d675c890e12c7f0e84e8a2cd5804751b659bcbeecb4bef5e1237d4e',
}
def replace(s,a,b):
 if s.count(a)!=1:raise ValueError('unexpected block: '+repr(a[:120]))
 return s.replace(a,b,1)
def prepare(root):
 data={}
 for name,sha in EXPECTED.items():
  raw=(root/name).read_bytes()
  if hashlib.sha256(raw).hexdigest()!=sha:raise ValueError('unexpected input: '+name)
  data[name]=raw.decode('utf8')
 a='assets/native_ui_shell.js';s=data[a]
 s=replace(s,'''    function updateDetailRows(mainView) {''','''    // A track row can contain links to its title, album and several artists.
    // Parsing each link as a card produced several fake rows for one track.
    // Prefer real row containers, preserving legitimate repeated playlist
    // entries; when no row structure exists, deduplicate only track links.
    function collectDetailRows(mainView) {
        if (!mainView || !mainView.querySelectorAll) return [];
        var selector = '[data-testid="tracklist-row"], [data-testid="track-list-row"], [role="row"][aria-rowindex]';
        var containers = Array.prototype.slice.call(mainView.querySelectorAll(selector));
        containers = containers.filter(function(node) {
            var ancestor = node.parentElement && closest(node.parentElement, selector);
            return !ancestor || !mainView.contains(ancestor);
        });
        var structured = containers.length > 0;
        var seen = new Set();
        var rows = [];
        if (!structured) {
            var bestLinks = new Map();
            Array.prototype.slice.call(mainView.querySelectorAll('a[href]')).forEach(function(link) {
                var id = spotifyResourceUri(link.href || link.getAttribute('href'));
                if (!/^spotify:(track|episode):/i.test(id)) return;
                var old = bestLinks.get(id);
                if (!old || (!String(old.textContent || '').trim() && String(link.textContent || '').trim())) bestLinks.set(id, link);
            });
            containers = Array.from(bestLinks.values());
        }
        containers.forEach(function(container) {
            var links = container.matches && container.matches('a[href]')
                ? [container] : Array.prototype.slice.call(container.querySelectorAll('a[href]'));
            var trackLinks = links.filter(function(link) {
                return /^spotify:(track|episode):/i.test(spotifyResourceUri(link.href || link.getAttribute('href')));
            });
            if (!trackLinks.length) return;
            // Prefer the visible title link over a separate empty cover link.
            var link = trackLinks.find(function(a) { return String(a.textContent || '').trim(); }) || trackLinks[0];
            var uri = spotifyResourceUri(link.href || link.getAttribute('href'));
            if (!structured && seen.has(uri)) return;
            var title = firstCardText(container, '[data-testid="tracklist-row-title"], [data-testid="track-name"], [data-testid="internal-track-link"]') ||
                String(link.textContent || '').replace(/\\s+/g, ' ').trim();
            if (!title) {
                var img = link.querySelector && link.querySelector('img[alt]');
                title = String(img && img.getAttribute('alt') || '').replace(/\\s+/g, ' ').trim();
            }
            if (!title) return;
            var card = structured ? container : findCardContainer(link, container, mainView);
            var artistSeen = new Set();
            var artists = [];
            if (card && card.querySelectorAll) {
                Array.prototype.slice.call(card.querySelectorAll('a[href]')).forEach(function(a) {
                    var artistUri = spotifyResourceUri(a.href || a.getAttribute('href'));
                    var name = String(a.textContent || '').replace(/\\s+/g, ' ').trim();
                    if (/^spotify:artist:/i.test(artistUri) && name && !artistSeen.has(artistUri)) {
                        artistSeen.add(artistUri); artists.push(name);
                    }
                });
            }
            seen.add(uri);
            rows.push({title:title.slice(0,100), subtitle:artists.join(', ').slice(0,120),
                image:findImageUrl(card, link, mainView), uri:uri});
        });
        return rows.slice(0,100);
    }

    function updateDetailRows(mainView) {''')
 s=replace(s,'''        if (window.__sfNativeCollectionUri &&
            nativeSpotifyUri(window.location.href) !== window.__sfNativeCollectionUri) return;''','''        if (window.__sfNativeCollectionUri &&
            nativeSpotifyUri(window.location.href) !== window.__sfNativeCollectionUri) return;
        // Once the current bridge request supplies actual items, a scrape of
        // an older/partial WebView page must not replace those rows.
        if (window.__sfNativeCollectionHasData) return;''')
 s=replace(s,'''        rows = collectHomeRows(mainView);
        signature = JSON.stringify(rows);
        window.__sfNativeUiDetailRowsCount''','''        // Artist pages also contain browsable albums and collections; keep
        // their existing discovery path rather than silently dropping them.
        rows = /^\/(playlist|album|show)\//i.test(path)
            ? collectDetailRows(mainView) : collectHomeRows(mainView);
        signature = JSON.stringify(rows);
        window.__sfNativeUiDetailRowsCount''')
 s=replace(s,'''            if (typeof cancelPendingCollectionNavigation === 'function') cancelPendingCollectionNavigation();
        }
    }

    function scheduleReadinessRetry()''','''            // Preserve ownership of the bridge request: a later nonempty
            // response may replace this partial DOM view with actual items.
            window.__sfNativeCollectionDomReady = true;
            if (typeof stopCollectionFallback === 'function') stopCollectionFallback();
        }
    }

    function scheduleReadinessRetry()''')
 s=replace(s,'''        window.__sfNativeCollectionRequest = null;
        window.__sfNativeCollectionUri = null;''','''        window.__sfNativeCollectionRequest = null;
        window.__sfNativeCollectionUri = null;
        window.__sfNativeCollectionHasData = false;
        window.__sfNativeCollectionDomReady = false;''')
 s=replace(s,'''        if (requestId && requestId === window.__sfNativeCollectionRequest && uri === pendingCollectionUri) {
            stopCollectionFallback();''','''        if (requestId && requestId === window.__sfNativeCollectionRequest && uri === window.__sfNativeCollectionUri) {
            window.__sfNativeCollectionHasData = true;
            stopCollectionFallback();''')
 data[a]=s
 b='assets/spotify_bridge.js';s=data[b]
 s=replace(s,'''            if (!isCurrentNativeRequest()) return false;
            if (nativeRequestId && Array.isArray(items) && items.length &&''','''            if (!isCurrentNativeRequest()) return false;
            if (nativeRequestId && !items.length && window.__sfNativeCollectionDomReady) return false;
            if (nativeRequestId && Array.isArray(items) && items.length &&''')
 s=replace(s,'''            if (isCurrentNativeRequest()) AndBridge.onMediaItemsLoaded(parentId, "[]");
        } catch (e) {
            console.error("Error loading media items for " + parentId, e);
            if (isCurrentNativeRequest()) AndBridge.onMediaItemsLoaded(parentId, "[]");''','''            if (isCurrentNativeRequest() && !(nativeRequestId && window.__sfNativeCollectionDomReady)) AndBridge.onMediaItemsLoaded(nativeCallbackId || parentId, "[]");
        } catch (e) {
            console.error("Error loading media items for " + parentId, e);
            if (isCurrentNativeRequest() && !(nativeRequestId && window.__sfNativeCollectionDomReady)) AndBridge.onMediaItemsLoaded(nativeCallbackId || parentId, "[]");''')
 data[b]=s
 a='smali/com/melodix/music/NativeUiRowFactory.smali';s=data[a]
 s=replace(s,'''    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-eqz v0, :native_row_section_done
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-nez v0, :native_row_section_done
    move-object v7, v10''','''    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-nez v0, :native_row_section_done
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-eqz v0, :native_row_section_done
    move-object v7, v10''')
 s=replace(s,'''    :native_row_uri_done
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-nez v0, :native_row_read_image''','''    :native_row_uri_done
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-eqz v0, :native_row_read_image''')
 s=replace(s,'''    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z
    move-result v10
    if-eqz v10, :native_row_accessibility_ready''','''    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z
    move-result v10
    if-nez v10, :native_row_accessibility_ready''')
 data[a]=s
 a='smali/com/melodix/music/MainActivity.smali';s=data[a]
 s=replace(s,'''    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-eqz v1, :apply_done
    iput-object p2, p0, Lcom/melodix/music/MainActivity;->nativeCurrentTitle:Ljava/lang/String;''','''    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-nez v1, :apply_done
    iget-object v1, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    const-string v0, "detail"
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :apply_done
    iput-object p2, p0, Lcom/melodix/music/MainActivity;->nativeCurrentTitle:Ljava/lang/String;''')
 s=replace(s,'''    invoke-static {p0, v2, p2}, Lcom/melodix/music/NativeHomeFeed;->paint(Lcom/melodix/music/MainActivity;Landroid/view/ViewGroup;Ljava/lang/String;)I
    move-result v3
    if-lez v3, :native_rows_keep
    return-void''','''    invoke-static {p0, v2, p2}, Lcom/melodix/music/NativeHomeFeed;->paint(Lcom/melodix/music/MainActivity;Landroid/view/ViewGroup;Ljava/lang/String;)I
    move-result v3
    if-lez v3, :native_rows_keep
    const-string v0, "library"
    iget-object v1, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :native_rows_rendered
    invoke-virtual {p0, v2}, Lcom/melodix/music/MainActivity;->spaceNativeLibraryRows(Landroid/view/ViewGroup;)V
    :native_rows_rendered
    return-void''')
 marker='.method public final renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V'
 helper='''.method public final spaceNativeLibraryRows(Landroid/view/ViewGroup;)V
    .locals 8
    # paint creates one vertical row container as the only child.
    const/4 v0, 0x0
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v1
    instance-of v2, v1, Landroid/view/ViewGroup;
    if-eqz v2, :native_space_done
    check-cast v1, Landroid/view/ViewGroup;
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v2
    iget v2, v2, Landroid/util/DisplayMetrics;->density:F
    const/high16 v3, 0x41400000    # 12dp horizontal inset
    mul-float/2addr v3, v2
    invoke-static {v3}, Ljava/lang/Math;->round(F)I
    move-result v3
    invoke-virtual {v1, v3, v0, v3, v0}, Landroid/view/View;->setPadding(IIII)V
    const/high16 v3, 0x41000000    # 8dp between cards
    mul-float/2addr v3, v2
    invoke-static {v3}, Ljava/lang/Math;->round(F)I
    move-result v3
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I
    move-result v4
    :native_space_loop
    if-ge v0, v4, :native_space_done
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v5
    # Section headers are TextViews; only cards get a bottom margin.
    instance-of v6, v5, Landroid/widget/LinearLayout;
    if-eqz v6, :native_space_next
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v6
    instance-of v7, v6, Landroid/view/ViewGroup$MarginLayoutParams;
    if-eqz v7, :native_space_next
    check-cast v6, Landroid/view/ViewGroup$MarginLayoutParams;
    iput v3, v6, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I
    invoke-virtual {v5, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
    :native_space_next
    add-int/lit8 v0, v0, 0x1
    goto :native_space_loop
    :native_space_done
    return-void
.end method

'''
 s=replace(s,marker,helper+marker);data[a]=s
 return data
if __name__=='__main__':
 root=Path(sys.argv[1]);data=prepare(root)
 for name,text in data.items():(root/name).write_text(text,encoding='utf8')
 print('Applied detail and library presentation:',root)
