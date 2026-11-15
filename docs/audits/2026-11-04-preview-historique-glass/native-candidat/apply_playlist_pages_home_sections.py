#!/usr/bin/env python3
"""Paged native playlists, distinct Home provenance and detail presentation."""
from pathlib import Path
import hashlib,sys
EXPECTED={
 'assets/native_ui_shell.js':'060e31e7a6549dfa5126325b3233c0ce695e22299017401258a56145622e35ea',
 'assets/spotify_bridge.js':'3f137423330c7df7d3d90bb364a90b89f427e4c02aa2b6399672e201d3a22152',
 'smali/com/melodix/music/MainActivity.smali':'6073cd91d63e5a4b69dccdbb08358d7a5f1a4a7dc1a6f8a7acb62dbae68c27ce',
 'smali/com/melodix/music/NativeHomeShelfPreview.smali':'12ee9a8fd76e28468d96aaa4956c39c5b96b363a0196e5837f235b2a701f53ad',
}
def replace(s,a,b):
 if s.count(a)!=1:raise ValueError('unexpected block '+repr(a[:120]))
 return s.replace(a,b,1)
def prepare(root):
 data={}
 for name,sha in EXPECTED.items():
  raw=(root/name).read_bytes()
  if hashlib.sha256(raw).hexdigest()!=sha:raise ValueError('unexpected input '+name)
  data[name]=raw.decode('utf8')
 a='assets/spotify_bridge.js';s=data[a]
 s=replace(s,'''    window.__sfMediaItemsCache = window.__sfMediaItemsCache || new Map();''','''    window.__sfMediaItemsCache = window.__sfMediaItemsCache || new Map();
    // Only completely paginated native playlist results qualify for reuse.
    window.__sfCompleteNativePlaylistTokens = window.__sfCompleteNativePlaylistTokens || new Map();''')
 s=replace(s,'''            if (window.__sfMediaItemsCache && window.__sfMediaItemsCache.has(parentId)) {''','''            const isNativePlaylist = !!nativeRequestId && (parentId.startsWith('spotify:playlist:') || (parentId.includes(':user:') && parentId.includes(':playlist:')));
            if (window.__sfMediaItemsCache && window.__sfMediaItemsCache.has(parentId) &&
                (!isNativePlaylist || (!!window.spotAuthToken && window.__sfCompleteNativePlaylistTokens.get(parentId) === window.spotAuthToken))) {''')
 start='''            // 3. Specific Playlist tracks (using GQL fetchPlaylist)
            if (parentId.startsWith('spotify:playlist:') || (parentId.includes(':user:') && parentId.includes(':playlist:'))) {'''
 s=replace(s,start,'''            // Native detail loads actual playlist pages without modifying the
            // Android Auto / external browser contract below.
            if (isNativePlaylist) {
                const all = [];
                const pageLimit = 80;
                const maxPages = 125; // service playlist limit; safety for broken pagination
                let offset = 0, complete = false, failed = false, skipped = false;
                let previousSignature = null, previousUids = null, publishedLength = 0;
                const token = window.spotAuthToken;
                function current() { return isCurrentNativeRequest() && token === window.spotAuthToken; }
                function update(rows) {
                    if (!current()) return;
                    rememberCurrentTracks(parentId, all);
                    publishNativeCollection(rows);
                    publishedLength = all.length;
                }
                function showStatus(title, subtitle) {
                    if (!current() || !window.AndBridge || typeof window.AndBridge.onNativeUiData !== 'function') return;
                    const nativeRows = all.map(item => ({...item, title:item.name, uri:item.id}));
                    if (title) nativeRows.push({title, subtitle, settingValue:'Info', uri:''});
                    try { window.AndBridge.onNativeUiData('media:' + (nativeCallbackId || parentId), JSON.stringify(nativeRows)); } catch (_) {}
                }
                for (let page = 0; page < maxPages; page++) {
                    let response, json, content, items;
                    try {
                        response = await oriFetch('https://api-partner.spotify.com/pathfinder/v2/query', {
                            method:'POST', mode:'cors', credentials:'include',
                            headers:{'Authorization':token, 'Client-Token':window.spotCliToken,
                                'Content-Type':'application/json;charset=UTF-8', 'app-platform':'WebPlayer',
                                'spotify-app-version':'1.2.40.0'},
                            body:JSON.stringify({variables:{uri:parentId,offset:offset,limit:pageLimit,enableWatchFeedEntrypoint:false},
                                operationName:'fetchPlaylist',extensions:{persistedQuery:{version:1,
                                    sha256Hash:getGqlHash('fetchPlaylist','346811f856fb0b7e4f6c59f8ebea78dd081c6e2fb01b77c954b26259d5fc6763')}}})
                        });
                        if (!current()) return;
                        if (!response.ok) throw new Error('playlist page refused');
                        json = await response.json();
                        if (!current()) return;
                        const obj = json?.data?.playlistV2 || json?.data?.playlist || json?.data?.playlistUnion || json?.data?.me?.library || json?.data?.me;
                        content = obj?.content || obj?.tracks || obj;
                        items = content?.items || obj?.items;
                        if (!Array.isArray(items)) throw new Error('missing playlist items');
                    } catch (_) { failed = true; break; }
                    if (!current()) return;
                    const returnedOffset = content?.offset ?? content?.pagingInfo?.offset;
                    if (typeof returnedOffset === 'number' && returnedOffset !== offset) { failed = true; break; }
                    const rawTotal = content?.totalCount ?? content?.total ?? content?.pagingInfo?.totalCount;
                    const total = typeof rawTotal === 'number' && Number.isFinite(rawTotal) && rawTotal >= 0 ? rawTotal : null;
                    const signature = JSON.stringify(items);
                    const uids = items.map(item => item?.uid || item?.itemV2?.uid || item?.item?.uid || null);
                    const uidSignature = uids.length && uids.every(Boolean) ? JSON.stringify(uids) : null;
                    if (offset && uidSignature && uidSignature === previousUids) { failed = true; break; }
                    previousUids = uidSignature;
                    // Some backends ignore offset. With no reliable total, stop
                    // an identical replay rather than duplicate forever. When
                    // total is present, repeated tracks remain legitimate.
                    if (offset && total === null && items.length && signature === previousSignature) { failed = true; break; }
                    previousSignature = signature;
                    const mapped = items.map(elem => {
                        const wrapper = elem?.itemV2 || elem?.item;
                        const track = wrapper?.data || elem?.track || wrapper || elem;
                        if (!track) return null;
                        const uri = track.uri || track._uri || elem?.uri || (track.id ? 'spotify:track:' + track.id : '') || '';
                        if (!uri || !uri.includes(':track:')) return null;
                        const artists = track.artists?.items?.map(a => a.profile?.name || a.name).filter(Boolean) || track.artists?.map(a => a.name).filter(Boolean) || [];
                        const album = track.albumOfTrack || track.album || {};
                        return {id:uri, name:track.name || track.title || 'Unknown Track',
                            image:pickOptimalArtwork(album.coverArt?.sources, album.images), artists:artists, browsable:false};
                    }).filter(Boolean);
                    if (mapped.length !== items.length) skipped = true;
                    all.push(...mapped);
                    offset += items.length; // advance by service items, not mapped tracks
                    complete = total !== null ? offset >= total : items.length === 0;
                    if (!items.length && !complete) { failed = true; break; }
                    // First page is visible immediately. Coalesce later pages to
                    // avoid rebuilding the native view tree for every request.
                    if (all.length && (page === 0 || (page + 1) % 4 === 0 || complete)) {
                        if (complete && publishedLength === all.length) showStatus('', '');
                        else update(all);
                        if (!complete) showStatus('Chargement de la playlist', 'Les titres suivants arrivent…');
                    }
                    if (complete) break;
                }
                if (!current()) return;
                if (complete && !failed && !skipped) {
                    if (all.length) {
                        window.__sfMediaItemsCache.set(parentId, all);
                        window.__sfCompleteNativePlaylistTokens.set(parentId, token);
                    }
                    if (!all.length) publishNativeCollection([]);
                    else if (publishedLength !== all.length) update(all);
                } else if (all.length) {
                    // Keep MediaBrowser callbacks free of synthetic entries;
                    // the informational footer is sent to the native UI only.
                    update(all);
                    showStatus('Playlist partiellement chargée',
                        'Certains éléments sont indisponibles. Rouvrez la playlist pour réessayer.');
                } else if (!window.__sfNativeCollectionDomReady) publishNativeCollection([]);
                return;
            }

'''+start)
 # A legacy external first-page write must invalidate any completed native marker.
 s=replace(s,'''                if (tracks.length > 0) window.__sfMediaItemsCache.set(parentId, tracks);
                rememberCurrentTracks(parentId, tracks);
                console.log(`[Spotifuck] fetchPlaylist parsed''','''                if (tracks.length > 0) {
                    window.__sfMediaItemsCache.set(parentId, tracks);
                    window.__sfCompleteNativePlaylistTokens.delete(parentId);
                }
                rememberCurrentTracks(parentId, tracks);
                console.log(`[Spotifuck] fetchPlaylist parsed''')
 data[a]=s
 a='assets/native_ui_shell.js';s=data[a]
 s=replace(s,'''            if (item && typeof item.settingValue === 'string' && item.settingValue) {''','''            if (screen === 'home' && item && (item.homeOrigin === 'library' || item.homeOrigin === 'spotify')) row.homeOrigin = item.homeOrigin;
            if (item && typeof item.settingValue === 'string' && item.settingValue) {''')
 s=replace(s,'''                        section: group[1],
                        image: img,''','''                        section: group[1],
                        homeOrigin: 'library',
                        image: img,''')
 s=replace(s,'''                        section: 'Vos playlists',
                        image: img,''','''                        section: 'Vos playlists',
                        homeOrigin: 'library',
                        image: img,''')
 s=replace(s,'''                section: row.section || (userRows.length > 0 ? 'Sélections Spotify' : ''),
                image: row.image,''','''                section: row.section || (userRows.length > 0 ? 'Sélections Spotify' : ''),
                homeOrigin: 'spotify',
                image: row.image,''')
 s=replace(s,'''        return rows.slice(0,100);
    }

    function updateDetailRows(mainView) {''','''        return rows;
    }

    function updateDetailRows(mainView) {''')
 s=replace(s,'''        if (rows.length > 0 && signature !== lastInitialDetailSignature && sendNativeUiData('detail', rows)) {''','''        var displayedRows = rows;
        if (rows.length && /^\/(playlist|album|show)\//i.test(path)) {
            displayedRows = rows.concat([{title:'Aperçu Spotify',
                subtitle:'La liste affichée peut être incomplète.', settingValue:'Info', uri:''}]);
        }
        if (rows.length > 0 && signature !== lastInitialDetailSignature && sendNativeUiData('detail', displayedRows)) {''')
 s=replace(s,'''            var section = entry.row.section || '';
            if (!groups.has(section)) groups.set(section, []);
            groups.get(section).push(entry.row);''','''            var section = (entry.row.homeOrigin || '') + '\\u0000' + (entry.row.section || '');
            if (!groups.has(section)) groups.set(section, []);
            groups.get(section).push(entry.row);''')
 s=replace(s,'''        var merged = [];
        groups.forEach(function(group) { merged = merged.concat(group); });
        return merged;''','''        var personal = [], discovered = [];
        groups.forEach(function(group) {
            if (group[0] && group[0].homeOrigin === 'library') personal = personal.concat(group);
            else discovered = discovered.concat(group);
        });
        return personal.concat(discovered);''')
 data[a]=s
 a='smali/com/melodix/music/NativeHomeShelfPreview.smali';s=data[a]
 s=replace(s,'''    .locals 11

    if-eqz p0, :empty''','''    .locals 13

    if-eqz p0, :empty''')
 s=replace(s,'''    const-string v3, ""

    :loop''','''    const-string v3, ""
    const-string v11, ""

    :loop''')
 s=replace(s,'''    # Keep the original factory's name, URI, image, subtitles and listeners.
    const-string v6, "section"''','''    # Origin comes from the JS data source, not guessed from section titles.
    const-string v6, "homeOrigin"
    const-string v7, ""
    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v12
    invoke-virtual {v12}, Ljava/lang/String;->isEmpty()Z
    move-result v7
    if-nez v7, :home_origin_done
    invoke-virtual {v12, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v7
    if-nez v7, :home_origin_done
    move-object v11, v12
    const/4 v4, 0x0
    invoke-static {p0, v12}, Lcom/melodix/music/NativeHomeShelfPreview;->groupLabel(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;
    move-result-object v7
    if-eqz v7, :home_origin_done
    invoke-virtual {v8, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V
    :home_origin_done
    # Keep the original factory's name, URI, image, subtitles and listeners.
    const-string v6, "section"''')
 marker='''# The factory's two children are the artwork and the text column.'''
 helper='''.method private static groupLabel(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;
    .locals 6
    const-string v0, "library"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :home_group_spotify
    const-string v0, "Votre bibliothèque"
    goto :home_group_text
    :home_group_spotify
    const-string v0, "À découvrir sur Spotify"
    :home_group_text
    new-instance v1, Landroid/widget/TextView;
    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    const/high16 v0, 0x41600000
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextSize(F)V
    const v0, 0xfff5f2ff
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V
    const/4 v0, 0x0
    const/4 v2, 0x1
    invoke-virtual {v1, v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V
    const/16 v2, 0x10
    invoke-static {p0, v2}, Lcom/melodix/music/NativeHomeShelfPreview;->dp(Landroid/content/Context;I)I
    move-result v2
    const/16 v3, 0xa
    invoke-static {p0, v3}, Lcom/melodix/music/NativeHomeShelfPreview;->dp(Landroid/content/Context;I)I
    move-result v3
    invoke-virtual {v1, v2, v3, v2, v3}, Landroid/view/View;->setPadding(IIII)V
    const-string v4, "native_category_chip"
    invoke-static {p0, v1, v4}, Lcom/melodix/music/NativeUiRowFactory;->applyDrawableBackground(Landroid/content/Context;Landroid/view/View;Ljava/lang/String;)V
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;
    const/4 v5, -0x1
    const/4 v0, -0x2
    invoke-direct {v4, v5, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V
    iput v2, v4, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
    iput v2, v4, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
    iput v2, v4, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    invoke-virtual {v1, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
    return-object v1
.end method

'''
 s=replace(s,marker,helper+marker);data[a]=s
 a='smali/com/melodix/music/MainActivity.smali';s=data[a]
 old='''    if-eqz v0, :native_rows_rendered
    invoke-virtual {p0, v2}, Lcom/melodix/music/MainActivity;->spaceNativeLibraryRows(Landroid/view/ViewGroup;)V
    :native_rows_rendered'''
 new='''    if-eqz v0, :native_detail_style
    invoke-virtual {p0, v2}, Lcom/melodix/music/MainActivity;->spaceNativeLibraryRows(Landroid/view/ViewGroup;)V
    goto :native_rows_rendered
    :native_detail_style
    const-string v0, "detail"
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :native_rows_rendered
    invoke-virtual {p0, v2}, Lcom/melodix/music/MainActivity;->styleNativeDetailRows(Landroid/view/ViewGroup;)V
    :native_rows_rendered'''
 s=replace(s,old,new)
 start=s.index('.method public final spaceNativeLibraryRows(');end=s.index('.end method',start)+len('.end method');helper=s[start:end]
 helper=helper.replace('spaceNativeLibraryRows','styleNativeDetailRows').replace('native_space_', 'native_detail_space_').replace('0x41000000    # 8dp between cards','0x40800000    # 4dp between tracks')
 helper=replace(helper,'''    check-cast v6, Landroid/view/ViewGroup$MarginLayoutParams;
    iput v3, v6''','''    # Subtle transparent ripple instead of bulky opaque track cards.
    const-string v7, "native_mini_row_ripple"
    invoke-static {p0, v5, v7}, Lcom/melodix/music/NativeUiRowFactory;->applyDrawableBackground(Landroid/content/Context;Landroid/view/View;Ljava/lang/String;)V
    check-cast v6, Landroid/view/ViewGroup$MarginLayoutParams;
    iput v3, v6''')
 s=replace(s,'.method public final renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V',helper+'\n\n.method public final renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V');data[a]=s
 return data
if __name__=='__main__':
 root=Path(sys.argv[1]);data=prepare(root)
 for name,text in data.items():(root/name).write_text(text,encoding='utf8')
 print('Applied playlist paging and Home sections:',root)
