#!/usr/bin/env python3
"""Exercise the actual test-only launcher, then capture real native demo views."""
import json, os, re, struct, subprocess, sys, time, xml.etree.ElementTree as ET
profile, out = sys.argv[1:]
os.makedirs(out, exist_ok=True)
def adb(*args, binary=False):
    p=subprocess.run(['adb',*args],stdout=subprocess.PIPE,stderr=subprocess.PIPE,check=True)
    return p.stdout if binary else p.stdout.decode('utf-8','replace')
def settle(): time.sleep(1.5)
def tree():
    adb('shell','uiautomator','dump','/sdcard/demo-window.xml')
    xml=adb('shell','cat','/sdcard/demo-window.xml'); return ET.fromstring(xml[xml.index('<?xml'):])
def find(**attrs):
    for n in tree().iter('node'):
        if all(n.get(k)==v for k,v in attrs.items()) and n.get('bounds'):
            return n
    raise RuntimeError('UI element not found: '+repr(attrs))
def point(node):
    m=re.fullmatch(r'\[(\d+),(\d+)\]\[(\d+),(\d+)\]',node.get('bounds',''))
    if not m: raise RuntimeError('Invalid bounds')
    a,b,c,d=map(int,m.groups()); return str((a+c)//2),str((b+d)//2)
def tap(**attrs):
    x,y=point(find(**attrs));adb('shell','input','tap',x,y);settle()
def snap(name,required):
    root=tree(); values=' '.join((n.get('text','')+' '+n.get('content-desc','')) for n in root.iter('node'))
    if required not in values:
        summary=' | '.join((n.get('resource-id','').split('/')[-1] + '=' + n.get('text','')[:45]) for n in root.iter('node') if n.get('text'))
        raise RuntimeError(name+' missing '+required+'; visible='+summary[:420])
    png=adb('exec-out','screencap','-p',binary=True)
    if not png.startswith(b'\x89PNG\r\n\x1a\n'): raise RuntimeError('bad PNG')
    width,height=struct.unpack('>II',png[16:24])
    if (profile=='phone' and width>=height) or (profile=='tablet' and width<=height):
        raise RuntimeError('wrong orientation: '+profile+' '+str(width)+'x'+str(height))
    open(os.path.join(out,name+'.png'),'wb').write(png)
    nodes={}
    for node in root.iter('node'):
        k=node.get('resource-id','').split('/')[-1]
        if k in ('nativeMiniPlayerContainer','nativeTabBar','nativeSettingsButton','nativePlayerPanel'):
            nodes[k]={'bounds':node.get('bounds'),'selected':node.get('selected')}
    open(os.path.join(out,name+'.json'),'w').write(json.dumps(nodes,indent=2)+'\n')
    print('capture='+profile+'/'+name+' ok',flush=True)
if profile=='phone':
    adb('shell','wm','size','1080x1920');adb('shell','wm','density','420');rotation='0'
else:
    adb('shell','wm','size','1200x1920');adb('shell','wm','density','160');rotation='1'
adb('shell','settings','put','system','accelerometer_rotation','0')
adb('shell','settings','put','system','user_rotation',rotation)
adb('shell','svc','wifi','disable');adb('shell','svc','data','disable')
adb('shell','am','force-stop','com.melodix.music.preview')
adb('shell','am','start','-W','-n','com.melodix.music.preview/com.melodix.demo.DemoSettingsActivity');settle()
version=next((n for n in tree().iter('node') if n.get('text','').startswith('Version de Melodix')),None)
if version is None: raise RuntimeError('version entry unavailable')
x,y=point(version);adb('shell','input','swipe',x,y,x,y,'1200');settle()
snap('accueil','MODE DÉMO')
snap('mini-lecteur','Lueurs du soir')
tap(**{'resource-id':'com.melodix.music.preview:id/nativeSearchTab'});snap('recherche','Découvrir')
tap(**{'resource-id':'com.melodix.music.preview:id/nativeLibraryTab'});snap('bibliotheque','Escale imaginaire')
tap(**{'content-desc':'Escale imaginaire'});snap('playlist','Playlist fictive')
tap(**{'resource-id':'com.melodix.music.preview:id/nativeSettingsButton'});snap('reglages','Lecture automatique après un titre')
tap(**{'resource-id':'com.melodix.music.preview:id/nativeMiniPlayer'});snap('lecteur','Lueurs du soir')
print('demo capture complete: network disabled; fictional UI; profile='+profile,flush=True)
