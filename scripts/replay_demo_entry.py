#!/usr/bin/env python3
"""Replay only the already-built Preview APK on a fresh offline CI emulator."""
import re, subprocess, time, xml.etree.ElementTree as ET
PKG = 'com.melodix.music.preview'
def adb(*args):
    return subprocess.run(['adb',*args],check=True,stdout=subprocess.PIPE,stderr=subprocess.PIPE).stdout.decode('utf-8','replace')
def nodes():
    adb('shell','uiautomator','dump','/sdcard/demo-replay.xml')
    xml=adb('shell','cat','/sdcard/demo-replay.xml')
    return list(ET.fromstring(xml[xml.index('<?xml'):]).iter('node'))
def until(predicate, label, limit=60):
    deadline=time.monotonic()+limit; last=[]
    while time.monotonic()<deadline:
        last=nodes()
        found=next((n for n in last if predicate(n)),None)
        if found is not None:
            print('::notice title=Demo replay::'+label+'=observed',flush=True); return found
        time.sleep(2)
    ids=sorted({n.get('resource-id','').split('/')[-1] for n in last if n.get('resource-id')})
    print('::error title=Demo replay::'+label+'=not observed; ids='+','.join(ids),flush=True)
    print('::notice title=Demo replay::focus='+adb('shell','dumpsys','window','windows').split('mCurrentFocus=')[-1].splitlines()[0][:200],flush=True)
    crash=adb('logcat','-d','-s','AndroidRuntime:E')
    for line in crash.splitlines():
        if re.search(r'FATAL EXCEPTION|VerifyError|NoClassDefFoundError|ClassNotFoundException',line):
            print('::error title=Demo runtime::'+line[:300],flush=True)
    raise RuntimeError(label+' was not observed')
def tap(n):
    match=re.fullmatch(r'\[(\d+),(\d+)\]\[(\d+),(\d+)\]',n.get('bounds',''))
    if not match: raise RuntimeError('invalid bounds')
    x1,y1,x2,y2=map(int,match.groups())
    adb('shell','input','tap',str((x1+x2)//2),str((y1+y2)//2))
adb('shell','svc','wifi','disable');adb('shell','svc','data','disable')
adb('shell','am','force-stop',PKG)
adb('shell','am','start','-W','-n',PKG+'/com.melodix.demo.DemoSettingsActivity')
tap(until(lambda n:n.get('text')=='Essayer le mode démo','test-settings-button'))
until(lambda n:n.get('text')=='MODE DÉMO · HORS LIGNE','demo')
tap(until(lambda n:n.get('content-desc')=='Quitter la démo','exit-button'))
until(lambda n:n.get('resource-id','').endswith(':id/sessionTitle'),'real-session-after-exit')
entry=until(lambda n:n.get('text')=='Essayer le mode démo','session-button')
tap(entry)
until(lambda n:n.get('text')=='MODE DÉMO · HORS LIGNE','demo-from-session')
tap(until(lambda n:n.get('content-desc')=='Quitter la démo','session-demo-exit'))
until(lambda n:n.get('resource-id','').endswith(':id/sessionTitle'),'session-after-return')
