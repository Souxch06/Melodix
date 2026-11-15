#!/usr/bin/env python3
"""Synthetic structural and JVM checks; not an Android or Spotify benchmark."""
import importlib.util, json, os, re, subprocess, tempfile
from pathlib import Path
here=Path(__file__).resolve().parent
root=Path(os.environ['MELODIX_PREVIEW_ROOT'])
a=(root/'smali/com/melodix/music/MainActivity.smali').read_text()
method=a.split('.method public final openNativeRow(',1)[1].split('.end method',1)[0]
line=next(line for line in method.splitlines() if 'Chargement' in line)
string_literal=line.split('const-string v2, ',1)[1]
rows=json.loads(json.loads(string_literal))
assert len(rows)==3 and rows[0]['title']=='Chargement…'
assert all(row.get('settingValue')=='Info' and not row.get('uri') for row in rows)
assert method.index('playlistOpened') < method.index(line) < method.index('renderNativeRows') < method.index('window.__sfOpenCollection')
assert 'const-string v3, ":playlist:"' in method and 'const-string v3, "/playlist/"' in method
spec=importlib.util.spec_from_file_location('controller_fixture',here/'test_preview_player_jvm.py')
m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
old='''  View about=new View();metrics.attachAbout(about);'''
new='''  metrics.playlistOpened("spotify:playlist:OtherSecret");report=(String)reportMethod.invoke(metrics);
  yes(report.contains("mesure précédente appui → frame avec titres : 3920 ms"));
  yes(report.contains("peut concerner une autre playlist"));yes(!report.contains("OtherSecret"));
  View about=new View();metrics.attachAbout(about);'''
stubs=dict(m.STUBS); key='com/melodix/music/ControllerTest.java'
assert stubs[key].count(old)==1
stubs[key]=stubs[key].replace(old,new)
with tempfile.TemporaryDirectory(prefix='preview-playlist-previous-') as temp:
    base=Path(temp); files=[]
    for name,content in stubs.items():
        p=base/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(content,encoding='utf8');files.append(str(p))
    files.append(str(m.SOURCE));out=base/'classes';out.mkdir()
    java=os.environ.get('PREVIEW_TEST_JAVA','java'); ecj=os.environ.get('PREVIEW_TEST_ECJ')
    compile_command=([java,'-cp',ecj,'org.eclipse.jdt.internal.compiler.batch.Main'] if ecj else ['javac'])
    subprocess.run(compile_command+['-encoding','UTF-8','-source','8','-target','8','-d',str(out)]+files,check=True)
    subprocess.run([java,'-cp',str(out),'com.melodix.music.ControllerTest'],check=True)
print('Playlist loading placeholders and previous measurement checked')
