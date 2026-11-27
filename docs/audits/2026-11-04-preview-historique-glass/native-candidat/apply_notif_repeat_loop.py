#!/usr/bin/env python3
"""Notification Repeat toggles the app-side repeat-one loop (Spotify's own repeat is greyed).

aj1.onCustomAction sent actRepeat(), which clicks Spotify's greyed repeat button: nothing happens.
Now it toggles the same window.__melodixLoop flags that mode-job appLoop uses.
JS uses no double quote and no backslash, so the smali string needs no escaping.
"""
import sys
from pathlib import Path
SOURCE = 'smali/aj1.smali'
OLD = 'const-string p1, "actRepeat();"'
LOOP_JS = (
    "(function(){var W=window;var on=!W.__melodixLoop;W.__melodixLoop=on;"
    "if(W.__melodixLoopTimer){W.clearInterval(W.__melodixLoopTimer);W.__melodixLoopTimer=0;}"
    "if(on){W.__melodixLoopTimer=W.setInterval(function(){"
    "var c=function(s){var e=document.querySelector(s);var t=e?String(e.textContent||'').trim():'';"
    "if(!/^[0-9]+(:[0-9]{2}){1,2}$/.test(t))return -1;"
    "return t.split(':').reduce(function(a,x){return a*60+Number(x)},0)*1000;};"
    "var p=c('[data-testid=playback-position]'),d=c('[data-testid=playback-duration]');"
    "if(p<0||d<10000||p<d-2000)return;"
    "try{if(typeof W.actSeek==='function')W.actSeek(0);}catch(_){}},500);}})();"
)
assert '"' not in LOOP_JS and '\\' not in LOOP_JS
NEW = 'const-string p1, "' + LOOP_JS + '"'
def prepare(root):
    text = (root/SOURCE).read_text(encoding='utf8')
    if text.count(OLD) != 1: raise ValueError('unexpected actRepeat call in aj1')
    return text.replace(OLD, NEW, 1)
if __name__ == '__main__':
    root = Path(sys.argv[1]); (root/SOURCE).write_text(prepare(root), encoding='utf8')
