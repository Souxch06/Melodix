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
    if name == 'accueil':
        badges=[n for n in root.iter('node') if n.get('text') == 'MODE DÉMO · HORS LIGNE']
        if len(badges) != 1: raise RuntimeError('home must have exactly one demo badge: '+str(len(badges)))
    if name == 'lecteur':
        if not any(n.get('text') == 'Lecture en cours' for n in root.iter('node')): raise RuntimeError('player title is missing')
        if not any(n.get('text') == 'MODE DÉMO · HORS LIGNE' for n in root.iter('node')): raise RuntimeError('player demo badge is missing')
    if name != 'lecteur':
        by_id={n.get('resource-id','').split('/')[-1]:n for n in root.iter('node') if n.get('resource-id')}
        mini=by_id.get('nativeMiniPlayerContainer'); bar=by_id.get('nativeTabBar')
        if mini is None or bar is None: raise RuntimeError('mini-player or tab bar bounds unavailable for spacing check')
        box=lambda node: tuple(map(int,re.fullmatch(r'\[(\d+),(\d+)\]\[(\d+),(\d+)\]',node.get('bounds','')).groups()))
        gap=box(bar)[1]-box(mini)[3]; expected=21 if profile=='phone' else 8
        if gap < expected: raise RuntimeError('mini-player gap too small: '+str(gap)+'px, expected at least '+str(expected)+'px')
        print('mini-player-gap='+profile+'/'+name+' '+str(gap)+'px',flush=True)
    png=adb('exec-out','screencap','-p',binary=True)
    if not png.startswith(b'\x89PNG\r\n\x1a\n'): raise RuntimeError('bad PNG')
    width,height=struct.unpack('>II',png[16:24])
    if profile=='small' and (width,height)!=(360,640): raise RuntimeError('wrong small viewport: '+str((width,height)))
    if (profile in ('phone','small') and width>=height) or (profile=='tablet' and width<=height):
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
elif profile=='small':
    adb('shell','wm','size','360x640');adb('shell','wm','density','160');rotation='0'
else:
    adb('shell','wm','size','1200x1920');adb('shell','wm','density','160');rotation='1'
adb('shell','settings','put','system','accelerometer_rotation','0')
adb('shell','settings','put','system','user_rotation',rotation)
adb('shell','svc','wifi','disable');adb('shell','svc','data','disable')
adb('shell','am','force-stop','com.melodix.music.preview')
adb('shell','am','start','-W','-n','com.melodix.music.preview/com.melodix.demo.DemoSettingsActivity');settle()
# Exercise the visible test-settings entry before the historical long press.
find(text='Essayer le mode démo')
settings_png=adb('exec-out','screencap','-p',binary=True)
if not settings_png.startswith(b'\x89PNG\r\n\x1a\n'): raise RuntimeError('bad settings PNG')
open(os.path.join(out,'reglages-test-entree.png'),'wb').write(settings_png)
tap(text='Essayer le mode démo')
snap('entree-reglages','MODE DÉMO')
tap(**{'content-desc':'Quitter la démo'})
deadline=time.monotonic()+45
while True:
    returned=any(n.get('resource-id','').endswith(':id/sessionTitle') for n in tree().iter('node'))
    if returned: break
    if time.monotonic()>=deadline: raise RuntimeError('demo exit did not return to the real session surface')
    time.sleep(2)
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
# The screenshot must show all player actions above the navigation without a swipe.
r=tree(); nodes=list(r.iter('node'))
byid=lambda name: next(n for n in nodes if n.get('resource-id','').endswith(':id/'+name))
bytext=lambda name: next(n for n in nodes if n.get('text')==name)
box=lambda n: tuple(map(int,re.fullmatch(r'\[(\d+),(\d+)\]\[(\d+),(\d+)\]',n.get('bounds','')).groups()))
panel=box(byid('nativePlayerPanel'));bar=box(byid('nativeTabBar'));art=box(byid('nativePlayerLargeArtwork'))
badge=box(bytext('MODE DÉMO · HORS LIGNE'))
if art[1]<panel[1] or art[3]>panel[3] or art[3]<=art[1]: raise RuntimeError('artwork clipped: '+str((art,panel)))
for name in ('Paroles','File d’attente','Minuterie'):
    pill=box(bytext(name))
    if pill[1]<panel[1] or pill[3]>panel[3] or pill[3]>bar[1] or pill[3]<=pill[1]: raise RuntimeError('pill clipped: '+name+' '+str((pill,panel,bar)))
if badge[3]>panel[1]: raise RuntimeError('badge is not fixed above content: '+str((badge,panel)))
# On the phone profiles a swipe must not move content at default font scale.
if profile in ('phone','small'):
    x=(panel[0]+panel[2])//2; y1=panel[1]+(panel[3]-panel[1])*3//4; y2=panel[1]+(panel[3]-panel[1])//4
    adb('shell','input','swipe',str(x),str(y1),str(x),str(y2),'400');settle()
    after=list(tree().iter('node'))
    art2=next(n for n in after if n.get('resource-id','').endswith(':id/nativePlayerLargeArtwork'))
    badge2=next(n for n in after if n.get('text')=='MODE DÉMO · HORS LIGNE')
    if box(art2)!=art: raise RuntimeError('player unexpectedly scrolls on '+profile)
    if box(badge2)!=badge: raise RuntimeError('demo badge moved during scroll')
print('player geometry verified: '+profile,flush=True)
print('demo capture complete: network disabled; fictional UI; profile='+profile,flush=True)
