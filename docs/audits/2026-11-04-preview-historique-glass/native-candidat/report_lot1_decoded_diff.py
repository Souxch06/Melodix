#!/usr/bin/env python3
"""Compare decoded reference/candidate contents (including generated metadata)."""
import hashlib
import sys
from pathlib import Path

left,right,out=map(Path,sys.argv[1:])
def scan(root):
    result={}
    for section in ('AndroidManifest.xml','apktool.yml','assets','res','smali','lib','kotlin','unknown'):
        p=root/section
        files=[p] if p.is_file() else p.rglob('*') if p.exists() else []
        for f in files:
            if f.is_file():result[f.relative_to(root).as_posix()]=hashlib.sha256(f.read_bytes()).hexdigest()
    return result
a,b=scan(left),scan(right)
changes=[('added' if n not in a else 'removed' if n not in b else 'modified')+' '+n for n in sorted(a.keys()|b.keys()) if a.get(n)!=b.get(n)]
text='\n'.join(changes)+'\n'
out.write_text(text)
safe=text.replace('%','%25').replace('\r','%0D').replace('\n','%0A')
print('::notice title=Decoded file differences vs 9016::'+safe)
print('Compared decoded APK contents:',len(changes),'changed files')
