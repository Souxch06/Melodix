'use strict';
const test = require('node:test'), assert = require('node:assert/strict');
const cp = require('node:child_process');
test('real login requires visible controls within the app WebView, not demo or another window', () => {
 const py = String.raw`
import sys, xml.etree.ElementTree as ET
sys.path.insert(0,'scripts')
from launcher_surface import login_surface
pkg='com.melodix.music.preview'
def node(cls='android.view.View',text='',package=pkg,bounds='[0,0][100,40]'):
 return ET.Element('node',{'class':cls,'text':text,'package':package,'bounds':bounds})
def setup():
 web=node('android.webkit.WebView',bounds='[0,0][400,800]')
 for text in ('Welcome back','Email','Continue'): web.append(node(text=text))
 return web
web=setup(); assert login_surface(list(web.iter('node'))) is web
assert login_surface([]) is None
assert login_surface([node(text='Essayer le mode démo')]) is None
for i in range(3):
 web=setup(); web.remove(web[i]); assert login_surface(list(web.iter('node'))) is None
web=setup(); web.set('package','external.browser'); assert login_surface(list(web.iter('node'))) is None
web=setup(); web[1].set('package','external.browser'); assert login_surface(list(web.iter('node'))) is None
web=setup(); web[1].set('bounds','[0,0][0,0]'); assert login_surface(list(web.iter('node'))) is None
web=setup(); web.set('bounds','bad'); assert login_surface(list(web.iter('node'))) is None
web=setup(); children=list(web); web.clear(); web.set('class','android.webkit.WebView'); web.set('package',pkg); web.set('bounds','[0,0][400,800]'); assert login_surface([web,*children]) is None
`;
 const r=cp.spawnSync('python3',['-c',py],{encoding:'utf8'}); assert.equal(r.status,0,r.stderr || r.stdout);
});
test('watchdog requires demo entry on return to real login and rejects disappearing login', () => {
 const py = String.raw`
import sys, xml.etree.ElementTree as ET
sys.path.insert(0,'scripts')
from session_watchdog_observation import observe_watchdog
p='com.melodix.music.preview'
def n(text='',cls='android.view.View'):
 return ET.Element('node',{'class':cls,'text':text,'package':p,'bounds':'[0,0][200,100]'})
w=n(cls='android.webkit.WebView')
for t in ('Welcome back','Email','Continue'): w.append(n(t))
items=list(w.iter('node'))+[n('Essayer le mode démo')]
observe_watchdog(lambda:items,'after-exit',0,lambda:0,lambda _:None)
for broken in (items[:-1], [n('Essayer le mode démo')]):
 try: observe_watchdog(lambda:broken,'after-exit',0,lambda:0,lambda _:None)
 except RuntimeError: pass
 else: raise AssertionError('incomplete return accepted')
`;
 const r=cp.spawnSync('python3',['-c',py],{encoding:'utf8'}); assert.equal(r.status,0,r.stderr || r.stdout);
});
