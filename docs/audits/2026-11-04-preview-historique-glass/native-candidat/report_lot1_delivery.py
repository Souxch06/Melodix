#!/usr/bin/env python3
"""Report exact protected hashes and APK-entry differences vs signed 9016."""
import hashlib
import io
import json
import sys
import zipfile
from pathlib import Path
from compare_9016_artifact import APK_NAME, ZIP_SHA256, one
from verify_9016_protected_assets import ASSET_SHA256

def digest(data): return hashlib.sha256(data).hexdigest()
def annotate(title, text):
    safe = text.replace('%','%25').replace('\r','%0D').replace('\n','%0A')
    print(f'::notice title={title}::{safe}')

def entries(z):
    names = z.namelist()
    if len(names) != len(set(names)): raise ValueError('duplicate APK ZIP entry')
    return {n:digest(z.read(n)) for n in names if not n.endswith('/')}

def main(bundle_path, candidate_path, out_dir, ref_path):
    bundle = Path(bundle_path).read_bytes(); apk = Path(candidate_path).read_bytes()
    if digest(bundle) != ZIP_SHA256: raise ValueError('9016 artifact digest mismatch')
    with zipfile.ZipFile(io.BytesIO(bundle)) as outer:
        names = [n for n in outer.namelist() if Path(n).name == APK_NAME and not n.endswith('/')]
        if len(names)!=1: raise ValueError('expected one reference APK')
        reference = one(outer,names[0])
    Path(ref_path).write_bytes(reference)
    lines=['file\tsha256_9016\tsha256_candidate\tidentical']
    with zipfile.ZipFile(io.BytesIO(reference)) as old, zipfile.ZipFile(io.BytesIO(apk)) as new:
        left,right=entries(old),entries(new)
        for name, pinned in ASSET_SHA256.items():
            a,b=one(old,name),one(new,name)
            if a!=b or digest(a)!=pinned: raise ValueError(name+' differs from 9016')
            lines.append(f'{name}\t{digest(a)}\t{digest(b)}\tyes')
        changes=[{'path':n,'status':('added' if n not in left else 'removed' if n not in right else 'modified'),
                  'sha256_9016':left.get(n),'sha256_candidate':right.get(n)}
                 for n in sorted(left.keys()|right.keys()) if left.get(n)!=right.get(n)]
    out=Path(out_dir);out.mkdir(parents=True,exist_ok=True)
    text='\n'.join(lines)+'\n'
    (out/'protected-assets-vs-9016.tsv').write_text(text)
    (out/'apk-entries-vs-9016.json').write_text(json.dumps(changes,indent=2)+'\n')
    (out/'apk-entries-vs-9016.txt').write_text('\n'.join(x['status']+' '+x['path'] for x in changes)+'\n')
    annotate('Candidate APK SHA256',digest(apk))
    annotate('Protected assets 9016 vs candidate',text)
    annotate('APK entry differences vs 9016','\n'.join(x['status']+' '+x['path'] for x in changes))
    print('Compared',len(ASSET_SHA256),'protected files and',len(changes),'changed APK entries.')

if __name__=='__main__':
    main(*sys.argv[1:])
