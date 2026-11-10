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
