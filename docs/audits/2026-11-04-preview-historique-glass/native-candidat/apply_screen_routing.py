#!/usr/bin/env python3
"""Experiment: keep historical Home, Search and Library views separated."""
import hashlib
import importlib.util
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('shelves', HERE/'apply_home_shelves.py')
shelves = importlib.util.module_from_spec(spec)
spec.loader.exec_module(shelves)
BRIDGE_SHA = '9b6e289b4ac907adfd26d574087892cb24d63c8c1f807aa27da881fc3166a73e'
WATCHER_SHA = 'febc216dbdd5584b9ba6ee8319e5057cca15eedc156e38ca742e381bb1374d1d'

def replace(text, old, new):
    if text.count(old) != 1:
        raise ValueError(f'unexpected block: {old[:80]!r}; count={text.count(old)}')
    return text.replace(old, new, 1)

def prepare(root):
    activity_name = 'smali/com/melodix/music/MainActivity.smali'
    bridge_name = 'smali/com/melodix/music/AndBridge.smali'
    watcher_name = 'smali/com/melodix/music/NativeSearchWatcher.smali'
    watcher = (root/watcher_name).read_text(encoding='utf8')
    activity = (root/activity_name).read_text(encoding='utf8')
    bridge = (root/bridge_name).read_text(encoding='utf8')
    normalized = activity.replace(shelves.NEW, shelves.OLD).replace('com.melodix.music.preview.PIP_', 'com.melodix.music.PIP_')
    if activity.count(shelves.NEW) != 1 or shelves.digest(normalized) != shelves.EXPECTED_ACTIVITY:
        raise ValueError('unexpected prepared MainActivity')
    if hashlib.sha256(bridge.encode()).hexdigest() != BRIDGE_SHA:
        raise ValueError('unexpected historical bridge')
    if hashlib.sha256(watcher.encode()).hexdigest() != WATCHER_SHA:
        raise ValueError('unexpected historical search watcher')
    # A live weak activity wins; if absent, use an activity context if available.
    bridge = replace(bridge, '''    :try_ctx
    if-eqz v1, :got_activity''', '''    :try_ctx
    if-nez v1, :got_activity''')
    # Save a Home update, but don't navigate away from an active screen.
    activity = replace(activity, '''    :home_paint
    const-string v2, "home"
    iput-object v2, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;''', '''    :home_paint
    iget-object v2, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    if-eqz v2, :preview_home_visible
    const-string v3, "home"
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :apply_done
    :preview_home_visible
    const-string v2, "home"
    iput-object v2, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;''')
    # Fix inverted type guard that crashes when the tab is a LinearLayout.
    activity = replace(activity, '''    instance-of v3, v1, Landroid/widget/TextView;
    if-nez v3, :native_tab_as_group''', '''    instance-of v3, v1, Landroid/widget/TextView;
    if-eqz v3, :native_tab_as_group''')
    activity = replace(activity, '''    if-nez v3, :chip_next
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;
    move-result-object v4
    if-nez v4, :chip_next''', '''    if-eqz v3, :chip_next
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;
    move-result-object v4
    if-eqz v4, :chip_next''')
    activity = replace(activity, '    const v4, 0xff1ed760\n    invoke-static {v4}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;', '    const v4, 0xffa78bfa\n    invoke-static {v4}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;')
    # Clear obsolete rows before a non-Home empty/error result is presented.
    activity = replace(activity, '''    :native_rows_list
    new-instance v6, Landroid/widget/TextView;''', '''    :native_rows_list
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->removeAllViews()V
    new-instance v6, Landroid/widget/TextView;''')
    # Keep only actual playlist responses in the separate library cache.
    activity = replace(activity, '''    if-eqz v7, :media_detail
    iget-object v8, p0, Lcom/melodix/music/MainActivity;->nativeCurrentTitle:Ljava/lang/String;''', '''    if-eqz v7, :media_detail
    const-string v6, "playlists"
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v7
    if-eqz v7, :preview_library_not_playlists
    iput-object p2, p0, Lcom/melodix/music/MainActivity;->nativeLibraryJson:Ljava/lang/String;
    :preview_library_not_playlists
    iget-object v8, p0, Lcom/melodix/music/MainActivity;->nativeCurrentTitle:Ljava/lang/String;''')
    # Initial Library has no implicit Home JSON fallback.
    activity = replace(activity, '''    invoke-virtual {p0, v1}, Lcom/melodix/music/MainActivity;->styleNativeLibraryChips(Ljava/lang/String;)V
    iget-object v2, p0, Lcom/melodix/music/MainActivity;->nativeLibraryJson:Ljava/lang/String;''', '''    invoke-virtual {p0, v1}, Lcom/melodix/music/MainActivity;->styleNativeLibraryChips(Ljava/lang/String;)V
    const-string v0, "Votre bibliothèque"
    const-string v2, "[]"
    invoke-virtual {p0, v0, v2}, Lcom/melodix/music/MainActivity;->renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V
    iget-object v2, p0, Lcom/melodix/music/MainActivity;->nativeLibraryJson:Ljava/lang/String;''')
    activity = replace(activity, '''    :lib_fallback_json
    iget-object v2, p0, Lcom/melodix/music/MainActivity;->nativeCurrentJson:Ljava/lang/String;''', '''    :lib_fallback_json
    const/4 v2, 0x0''')
    # Selecting a category clears the old category while fetching its own data.
    activity = replace(activity, '''    invoke-virtual {p0, v1}, Lcom/melodix/music/MainActivity;->setNativeScreen(Ljava/lang/String;)V
    const-string v1, "window.__sfOpenLibraryCategory"''', '''    invoke-virtual {p0, v1}, Lcom/melodix/music/MainActivity;->setNativeScreen(Ljava/lang/String;)V
    const-string v1, "Votre bibliothèque"
    const-string v2, "[]"
    invoke-virtual {p0, v1, v2}, Lcom/melodix/music/MainActivity;->renderNativeRows(Ljava/lang/String;Ljava/lang/String;)V
    const-string v1, "window.__sfOpenLibraryCategory"''')
    # The empty search grid occupies the content area by itself.
    activity = replace(activity, '''    :native_search_click_done
    const v0, 0x7f09024f''', '''    :native_search_click_done
    const v0, 0x7f090239
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :preview_search_rows_hidden
    const/16 v1, 0x8
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
    :preview_search_rows_hidden
    const v0, 0x7f09024f''')
    activity = replace(activity, '''    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-eqz v1, :live_search_done''', '''    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z
    move-result v1
    if-nez v1, :live_search_done''')
    activity = replace(activity, '''    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z
    move-result v2
    if-eqz v2, :native_search_submit_done''', '''    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z
    move-result v2
    if-nez v2, :native_search_submit_done''')
    activity = replace(activity, '''    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :native_genre_done''', '''    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :native_genre_done''')
    # Reject replies to an old query as soon as the text changes, rather than
    # only when the next debounced query is sent.
    activity = replace(activity, '.method public final performNativeLiveSearch(Ljava/lang/String;)V', ''' .method public final updateNativeSearchDraft(Ljava/lang/String;)V
    .locals 2
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    const-string v1, "search"
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :preview_draft_done
    iput-object p1, p0, Lcom/melodix/music/MainActivity;->nativeExpectedSearch:Ljava/lang/String;
    :preview_draft_done
    return-void
.end method

.method public final performNativeLiveSearch(Ljava/lang/String;)V'''.lstrip())
    watcher = replace(watcher, '''    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v1}, Ljava/lang/String;->length()I''', '''    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v1
    iget-object v3, p0, Lcom/melodix/music/NativeSearchWatcher;->activity:Lcom/melodix/music/MainActivity;
    if-eqz v3, :preview_search_draft_done
    invoke-virtual {v3, v1}, Lcom/melodix/music/MainActivity;->updateNativeSearchDraft(Ljava/lang/String;)V
    :preview_search_draft_done
    invoke-virtual {v1}, Ljava/lang/String;->length()I''')
    return {activity_name:activity, bridge_name:bridge, watcher_name:watcher}

def main():
    if len(sys.argv) != 2:
        raise SystemExit('usage: apply_screen_routing.py DISPOSABLE_PREVIEW_PROJECT')
    root=Path(sys.argv[1])
    try:
        files=prepare(root)
    except (OSError,ValueError) as exc:
        raise SystemExit(str(exc)) from exc
    for name,text in files.items():
        (root/name).write_text(text, encoding='utf8')
    print('Applied experimental screen routing to',root)

if __name__ == '__main__':
    main()
