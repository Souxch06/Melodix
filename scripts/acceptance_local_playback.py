#!/usr/bin/env python3
"""Exercise a real picked WAV and foreground playback on a clean emulator."""
import json, math, pathlib, re, struct, subprocess, sys, tempfile, time, wave, xml.etree.ElementTree as ET

out = pathlib.Path(sys.argv[1]); out.mkdir(parents=True, exist_ok=True)
pkg = 'com.melodix.music.preview'
result = {'category':'local-playback', 'status':'failed', 'steps':[]}

def adb(*args):
    return subprocess.run(['adb',*args],check=True,stdout=subprocess.PIPE,stderr=subprocess.PIPE,timeout=45).stdout

def nodes():
    status=adb('shell','uiautomator','dump','/sdcard/melodix-local.xml')
    if b'dumped to' not in status: raise RuntimeError('hierarchy dump failed')
    raw=adb('shell','cat','/sdcard/melodix-local.xml')
    return list(ET.fromstring(raw[raw.index(b'<?xml'):]).iter('node'))

def find(items, text=None, ident=None):
    return next((n for n in items if (text is not None and text in (n.get('text'),n.get('content-desc'))) or
                 (ident is not None and n.get('resource-id','').endswith(':id/'+ident))),None)

def wait(text=None, ident=None, seconds=35):
    deadline=time.monotonic()+seconds
    while time.monotonic()<deadline:
        items=nodes(); n=find(items,text,ident)
        if n is not None: return n
        allow=next((n for n in items if n.get('resource-id','').endswith(':id/permission_allow_button')),None)
        if allow is not None: tap(allow); continue
        time.sleep(1)
    raise RuntimeError('missing control '+str(text or ident))

def tap(n):
    m=re.fullmatch(r'\[(\d+),(\d+)\]\[(\d+),(\d+)\]',n.get('bounds',''))
    if not m: raise RuntimeError('invalid bounds')
    x1,y1,x2,y2=map(int,m.groups())
    if x2<=x1 or y2<=y1: raise RuntimeError('empty bounds')
    adb('shell','input','tap',str((x1+x2)//2),str((y1+y2)//2)); time.sleep(.8)

def capture(stage):
    image=adb('exec-out','screencap','-p')
    if not image.startswith(b'\x89PNG\r\n\x1a\n'): raise RuntimeError('invalid screenshot')
    (out/(stage+'.png')).write_bytes(image); result['steps'].append(stage)
    print('::notice title=Local audio::'+stage,flush=True)

def position():
    n=wait(ident='nativePlayerPositionText'); value=n.get('text','')
    m=re.fullmatch(r'(\d+):(\d\d)',value)
    if not m: raise RuntimeError('invalid elapsed time '+value)
    return int(m.group(1))*60+int(m.group(2))

try:
    # The audio is created only inside this disposable emulator job, not in the APK.
    with tempfile.TemporaryDirectory() as d:
        fixture=pathlib.Path(d)/'Melodix-Local-Test.wav'
        with wave.open(str(fixture),'wb') as w:
            w.setnchannels(1); w.setsampwidth(2); w.setframerate(8000)
            w.writeframes(b''.join(struct.pack('<h',int(1200*math.sin(2*math.pi*440*i/8000))) for i in range(8000*90)))
        adb('push',str(fixture),'/sdcard/Download/Melodix-Local-Test.wav')
    adb('shell','am','broadcast','-a','android.intent.action.MEDIA_SCANNER_SCAN_FILE','-d','file:///sdcard/Download/Melodix-Local-Test.wav')
    adb('shell','am','force-stop',pkg)
    adb('shell','monkey','-p',pkg,'-c','android.intent.category.LAUNCHER','1')
    tap(wait(text='Ma musique')); tap(wait(text='Choisir un fichier audio'))
    # Use the storage provider, not the Downloads provider: files pushed by adb
    # need not appear in DownloadManager. The picker still grants the real URI.
    deadline=time.monotonic()+60
    opened_root=False; opened_folder=False
    while True:
        items=nodes(); audio=find(items,text='Melodix-Local-Test.wav')
        if audio is not None: tap(audio); break
        if time.monotonic()>=deadline:
            visible=[n.get('text') or n.get('content-desc') for n in items if n.get('text') or n.get('content-desc')]
            raise RuntimeError('system picker did not show test file; controls='+repr(visible[:25]))
        allow=next((n for n in items if n.get('resource-id','').endswith(':id/permission_allow_button')),None)
        if allow is not None: tap(allow); continue
        drawer=find(items,text='Open from') or find(items,text='Ouvrir depuis')
        if drawer is not None and not opened_root:
            device=next((n for n in items if n.get('text','').startswith('sdk_gphone')),None)
            if device is None: raise RuntimeError('emulator storage root not visible')
            tap(device); opened_root=True; continue
        folder=find(items,text='Download')
        if opened_root and not opened_folder and folder is not None:
            tap(folder); opened_folder=True; continue
        if not opened_root:
            roots=next((n for n in items if n.get('content-desc') in ('Show roots','Browse','Afficher les racines','Parcourir')),None)
            if roots is not None: tap(roots); continue
        time.sleep(1)
    wait(ident='nativeMiniPlayer',seconds=60); tap(wait(ident='nativeMiniPlayer'))
    wait(ident='nativePlayerLargePlayPauseButton'); wait(text='1:30',seconds=35)
    wait(text='Pause',seconds=35); a=position(); time.sleep(4); b=position()
    if b<=a: raise RuntimeError(f'playback did not advance: {a}, {b}')
    capture('picked-and-playing')
    tap(wait(ident='nativePlayerLargePlayPauseButton')); wait(text='Lecture'); paused=position(); time.sleep(3)
    if position()>paused+1: raise RuntimeError('position advanced while paused')
    tap(wait(ident='nativePlayerLargePlayPauseButton')); wait(text='Pause')
    before=position(); adb('shell','input','keyevent','KEYCODE_HOME'); time.sleep(5)
    # Re-enter via the normal launcher, not an exported test hook.
    adb('shell','monkey','-p',pkg,'-c','android.intent.category.LAUNCHER','1')
    if find(nodes(),text='Ma musique') is not None and find(nodes(),ident='nativePlayerPositionText') is None:
        tap(wait(text='Ma musique')); tap(wait(ident='nativeMiniPlayer'))
    wait(ident='nativePlayerPositionText',seconds=45); after=position()
    if after<=before: raise RuntimeError(f'background playback did not advance: {before}, {after}')
    capture('background-resume')
    # Exercise Android media-session notification transport, not an app-only mock.
    adb('shell','cmd','media_session','dispatch','pause'); wait(text='Lecture',seconds=25)
    adb('shell','cmd','media_session','dispatch','play'); wait(text='Pause',seconds=25)
    capture('media-session-controls')
    log=adb('logcat','-d','-s','AndroidRuntime:E').decode(errors='replace')
    if 'FATAL EXCEPTION' in log: raise RuntimeError('AndroidRuntime fatal exception')
    result['status']='passed'
except Exception as exc:
    result['failure']=str(exc)
    print('::error title=Local audio::'+str(exc),flush=True)
    try: (out/'local-failure.png').write_bytes(adb('exec-out','screencap','-p'))
    except Exception: pass
    raise
finally:
    (out/'local-result.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
    print('::notice title=Local audio result::'+json.dumps(result,ensure_ascii=False),flush=True)
