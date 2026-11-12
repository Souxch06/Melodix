#!/usr/bin/env python3
"""Inject test-only entry points into an isolated temporary Apktool project."""
import pathlib, sys, xml.etree.ElementTree as ET
work = pathlib.Path(sys.argv[1]); manifest=work/'AndroidManifest.xml'
a='{http://schemas.android.com/apk/res/android}'; ET.register_namespace('android',a[1:-1])
tree=ET.parse(manifest); root=tree.getroot(); app=root.find('application')
main=next(x for x in app.findall('activity') if x.get(a+'name')=='com.melodix.music.MainActivity')
launch=[]
for f in main.findall('intent-filter'):
    if any(x.get(a+'name')=='android.intent.action.MAIN' for x in f.findall('action')) and any(x.get(a+'name')=='android.intent.category.LAUNCHER' for x in f.findall('category')): launch.append(f)
assert len(launch)==1
main.remove(launch[0]); entry=ET.SubElement(app,'activity',{a+'name':'com.melodix.demo.DemoSettingsActivity',a+'process':':demo',a+'exported':'true',a+'label':'Melodix Preview'})
entry.append(launch[0]); ET.SubElement(app,'activity',{a+'name':'com.melodix.demo.DemoActivity',a+'process':':demo',a+'exported':'false'})
ET.SubElement(app,'activity',{a+'name':'com.melodix.local.LocalMusicActivity',a+'process':':demo',a+'exported':'false'})
ET.SubElement(app,'service',{a+'name':'com.melodix.local.LocalPlaybackService',a+'process':':demo',a+'exported':'false',a+'foregroundServiceType':'mediaPlayback'})
tree.write(manifest,encoding='utf-8',xml_declaration=True)
# Only the separate demo process skips the real updater; the main process is
# unchanged. No proof/session flags are touched. Demo UI creates no WebView.
p=work/'smali/com/melodix/music/AppSingleton.smali';s=p.read_text();needle='''    :try_start_updater\n    invoke-static {p0}, Lcom/melodix/music/SelfUpdater;->check(Landroid/content/Context;)V''';replace='''    invoke-static {}, Lcom/melodix/demo/DemoRuntime;->isDemoProcess()Z\n    move-result v0\n    if-nez v0, :updater_done\n    :try_start_updater\n    invoke-static {p0}, Lcom/melodix/music/SelfUpdater;->check(Landroid/content/Context;)V''';assert s.count(needle)==1;s=s.replace(needle,replace);p.write_text(s)
# Reuse the exact native settings row renderer in demo but strip its real
# dispatch; only demo-supplied JSON reaches this copy. No fake proof is set.
p=work/'smali/com/melodix/music/NativeSettingsRowFactory.smali'; s=p.read_text().replace('Lcom/melodix/music/NativeSettingsRowFactory;','Lcom/melodix/music/DemoSettingsRowFactory;').replace('Lcom/melodix/music/MainActivity;','Landroid/app/Activity;')
a1=s.index('    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z',s.index('    :native_settings_row_tail'))
a2=s.index('    return-object v2',a1);s=s[:a1]+s[a2:]
(work/'smali/com/melodix/music/DemoSettingsRowFactory.smali').write_text(s)

# Real application entry points exist only in the temporary opt-in preview.
# Tiny fixture projects used by the existing isolation tests lack resources;
# a complete project must contain both native hooks or preparation fails.
if (work/'res').exists():
    p=work/'smali/com/melodix/music/NativeSessionSurface.smali'
    text=p.read_text()
    marker='    :attach\n    const/4 v3, -0x1'
    assert text.count(marker)==1
    text=text.replace(marker, '    :attach\n    invoke-static {p0, v0, v1, v2}, Lcom/melodix/demo/DemoEntry;->bindSession(Landroid/app/Activity;Landroid/view/View;IZ)V\n    invoke-static {p0, v0, v1, v2}, Lcom/melodix/demo/DemoEntry;->bindSessionOtherStates(Landroid/app/Activity;Landroid/view/View;IZ)V\n    const/4 v3, -0x1')
    # A repaint may reuse an existing overlay; bind idempotently on both paths.
    marker='    invoke-static {}, Lcom/melodix/music/NativeSessionSurfaceExtras;->retryState()V\n    invoke-virtual {v0}, Landroid/view/View;->bringToFront()V\n    return-void'
    assert text.count(marker)==1
    text=text.replace(marker, '    invoke-static {}, Lcom/melodix/music/NativeSessionSurfaceExtras;->retryState()V\n    invoke-static {p0, v0, v1, v2}, Lcom/melodix/demo/DemoEntry;->bindSession(Landroid/app/Activity;Landroid/view/View;IZ)V\n    invoke-static {p0, v0, v1, v2}, Lcom/melodix/demo/DemoEntry;->bindSessionOtherStates(Landroid/app/Activity;Landroid/view/View;IZ)V\n    invoke-virtual {v0}, Landroid/view/View;->bringToFront()V\n    return-void')
    p.write_text(text)
    # Limited Glass intentionally bypasses untrusted WebView settings rows.
    # Add the existing demo entry only in this opt-in, isolated build, after
    # its native settings content is created. Never alter session/proof state.
    p=work/'smali/com/melodix/music/NativeLimitedGlass.smali'
    text=p.read_text()
    # The production renderer resolves splash by ID because the field can be
    # uninitialized at bind. Match its stable label rather than the old code.
    marker='    :show_root\n    # bind() can run before MainActivity.H is assigned.'
    assert text.count(marker)==1
    text=text.replace(marker, '    :show_root\n    invoke-static {p0, v3, v0}, Lcom/melodix/demo/DemoEntry;->bindSettings(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;)V\n    # bind() can run before MainActivity.H is assigned.')
    p.write_text(text)

    p=work/'smali/com/melodix/music/MainActivity.smali'
    text=p.read_text()
    marker='    invoke-virtual {v2}, Landroid/widget/LinearLayout;->removeAllViews()V\n\n    # Home is a set of horizontal cover shelves'
    assert text.count(marker)==1
    text=text.replace(marker,'    invoke-virtual {v2}, Landroid/widget/LinearLayout;->removeAllViews()V\n    iget-object v0, p0, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;\n    invoke-static {p0, v2, v0}, Lcom/melodix/demo/DemoEntry;->bindSettings(Landroid/app/Activity;Landroid/widget/LinearLayout;Ljava/lang/String;)V\n\n    # Home is a set of horizontal cover shelves')
    # The session button is an actual inflated layout element. Its click calls
    # this preview-only Activity method; it does not rely on a later repaint.
    assert 'onPreviewDemoClick(Landroid/view/View;)V' not in text
    text += '''\n.method public final onPreviewDemoClick(Landroid/view/View;)V\n    .locals 0\n    invoke-static {p0}, Lcom/melodix/demo/DemoEntry;->open(Landroid/app/Activity;)V\n    return-void\n.end method\n'''
    text += '''\n.method public final onPreviewLocalMusicClick(Landroid/view/View;)V\n    .locals 2\n    new-instance v0, Landroid/content/Intent;\n    const-class v1, Lcom/melodix/local/LocalMusicActivity;\n    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V\n    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V\n    return-void\n.end method\n'''
    p.write_text(text)
    p=work/'res/layout/native_session_surface.xml'
    text=p.read_text()
    for old,new in [('@drawable/session_glass_background','@drawable/native_shell_background'),('@drawable/session_glass_card','@drawable/native_glass_surface')]:
        assert text.count(old)==1
        text=text.replace(old,new)
    p.write_text(text)

    # Place the preview button directly after the primary session action and
    # before the details panel. The same tag prevents the legacy dynamic hooks
    # from adding a duplicate. Login uses a compact measured bottom control,
    # outside the WebView. Fixture projects may omit that layout.
    for name in ('native_session_surface.xml', 'native_session_login_header.xml'):
        layout = work / 'res/layout' / name
        if not layout.exists():
            if name == 'native_session_surface.xml': raise FileNotFoundError(layout)
            continue
        layout_tree = ET.parse(layout)
        layout_root = layout_tree.getroot()
        matches = [(parent, list(parent).index(child)) for parent in layout_root.iter()
                   for child in parent if child.get(a+'id') == '@+id/sessionAction']
        assert len(matches) == 1, (name, 'sessionAction missing or ambiguous')
        parent, index = matches[0]
        demo = ET.Element('TextView', {
            a+'tag': 'preview-demo-entry',
            a+'layout_width': 'match_parent', a+'layout_height': 'wrap_content',
            a+'minHeight': '48dp', a+'padding': '12dp', a+'layout_marginTop': '12dp',
            a+'background': '@drawable/native_glass_surface', a+'gravity': 'center',
            a+'text': 'Essayer le mode démo', a+'contentDescription': 'Essayer le mode démo',
            a+'textColor': '#FFFFFF', a+'textSize': '15sp', a+'textStyle': 'bold',
            a+'clickable': 'true', a+'focusable': 'true', a+'onClick': 'onPreviewDemoClick',
        })
        if name == 'native_session_login_header.xml':
            # Keep the demo reachable without the large top banner. Its 48dp
            # measured height is reserved below, not over, the login WebView.
            demo.set(a+'layout_marginTop', '0dp')
            demo.set(a+'textSize', '14sp')
        parent.insert(index + 1, demo)
        local_music = ET.Element('TextView', {
            a+'tag': 'preview-local-music-entry',
            a+'layout_width': 'match_parent', a+'layout_height': 'wrap_content',
            a+'minHeight': '48dp', a+'padding': '12dp', a+'layout_marginTop': '8dp',
            a+'background': '@drawable/native_glass_surface', a+'gravity': 'center',
            a+'text': 'Ma musique', a+'contentDescription': 'Ma musique',
            a+'textColor': '#FFFFFF', a+'textSize': '15sp', a+'textStyle': 'bold',
            a+'clickable': 'true', a+'focusable': 'true', a+'onClick': 'onPreviewLocalMusicClick',
        })
        if name == 'native_session_login_header.xml':
            local_music.set(a+'layout_marginTop', '0dp')
            local_music.set(a+'textSize', '14sp')
        parent.insert(index + 2, local_music)
        layout_tree.write(layout, encoding='utf-8', xml_declaration=True)
