#!/usr/bin/env python3
"""Fail-closed, per-file diagnostics for the signed 9016/candidate comparison.

This supplements, and never replaces, the original byte comparison and gate.
"""
import hashlib
import io
import json
import os
import re
import sys
import zipfile
from pathlib import Path
from compare_9016_artifact import APK_NAME, ZIP_SHA256
from verify_9016_protected_assets import ASSET_SHA256

SOURCE = 'GitHub Actions artifact 14156257401 (signed Preview 9016)'

def sha(data):
    return hashlib.sha256(data).hexdigest()

def entry(z, name):
    matches = [x for x in z.infolist() if x.filename == name]
    if len(matches) != 1:
        raise ValueError('expected one entry, found ' + str(len(matches)))
    return z.read(matches[0])

def archive_hashes(apk, label, errors):
    values = {name: None for name in ASSET_SHA256}
    try:
        with zipfile.ZipFile(io.BytesIO(apk)) as z:
            for name in values:
                try:
                    values[name] = sha(entry(z, name))
                except (KeyError, ValueError, OSError, zipfile.BadZipFile, RuntimeError, NotImplementedError) as exc:
                    errors.append(f'{label}: extraction impossible: {name}: {type(exc).__name__}: {exc}')
    except (OSError, ValueError, zipfile.BadZipFile) as exc:
        errors.append(f'{label}: extraction impossible: {type(exc).__name__}: {exc}')
    return values

def diagnose(ref_file, candidate_file, error_file=None, metadata_file=None):
    errors=[]; found=False; ref={name:None for name in ASSET_SHA256}; cand=ref.copy(); candidate_sha='indisponible'
    try:
        data=Path(candidate_file).read_bytes(); candidate_sha=sha(data)
        cand=archive_hashes(data,'APK candidate signée',errors)
    except OSError as exc:
        errors.append('APK candidate signée absente ou illisible: '+type(exc).__name__)
    try:
        bundle=Path(ref_file).read_bytes()
        if sha(bundle)!=ZIP_SHA256:
            errors.append('référence: intégrité ZIP invalide: SHA-256 '+sha(bundle)+' attendu '+ZIP_SHA256)
        try:
            with zipfile.ZipFile(io.BytesIO(bundle)) as outer:
                names=[x for x in outer.infolist() if Path(x.filename).name==APK_NAME and not x.is_dir()]
                if len(names)!=1: raise ValueError('expected one reference APK, found '+str(len(names)))
                apk=outer.read(names[0]); found=True
                ref=archive_hashes(apk,'APK 9016 signée',errors)
        except (OSError, ValueError, KeyError, zipfile.BadZipFile, RuntimeError, NotImplementedError) as exc:
            errors.append('référence: extraction impossible: '+type(exc).__name__+': '+str(exc))
    except OSError as exc:
        detail=''
        try:
            metadata=json.loads(Path(metadata_file).read_text()) if metadata_file else {}
            if 'expired' in metadata: detail+='; expirée='+str(metadata['expired']).lower()
        except (OSError, ValueError, TypeError): pass
        try:
            text=Path(error_file).read_text(errors='replace') if error_file else ''
            match=re.search(r'HTTP\s+(\d{3})',text)
            if match: detail+='; HTTP '+match.group(1)
            elif 'EOF' in text: detail+='; téléchargement EOF'
            elif text: detail+='; échec du téléchargement (détail non sûr masqué)'
        except OSError: pass
        errors.append('référence APK 9016 introuvable ou illisible: '+type(exc).__name__+detail)
    rows=[]
    for name, pinned in ASSET_SHA256.items():
        a,b=ref[name],cand[name]
        status='identique' if a is not None and b is not None and a==b and a==pinned else 'inconnu' if a is None or b is None else 'différent'
        rows.append((name,a or 'indisponible',b or 'indisponible',status))
        if a is not None and a!=pinned: errors.append(f'{name}: référence ne correspond pas à la valeur 9016 épinglée (référence {a}, attendu {pinned})')
        if a is not None and b is not None and a!=b: errors.append(f'{name}: fichier différent (9016 {a}, candidate {b})')
    if len(ASSET_SHA256)!=7: errors.append('jeu de fichiers protégés invalide')
    return found,candidate_sha,rows,errors

def emit(found,candidate_sha,rows,errors,summary):
    ref='oui' if found else 'non'
    text='Référence APK trouvée: '+ref+' ; source: '+SOURCE+'\n'
    text+='SHA-256 APK candidate signée: '+candidate_sha+'\n'
    text+='fichier\tSHA-256 9016\tSHA-256 candidate\trésultat\n'
    text+='\n'.join('\t'.join(row) for row in rows)+'\n'
    text+='Raison: '+(' ; '.join(errors) if errors else 'aucune — comparaison des sept empreintes réussie ; comparaison des octets et garde finale encore requises')
    safe=text.replace('%','%25').replace('\r','%0D').replace('\n','%0A')
    print('::'+('error' if errors else 'notice')+' title=Diagnostic garde 9016 signée::'+safe)
    if summary:
        with open(summary,'a',encoding='utf-8') as f: f.write('### Diagnostic garde APK 9016 signée\n```\n'+text+'\n```\n')
    return 1 if errors else 0

if __name__=='__main__':
    result=diagnose(*sys.argv[1:5])
    sys.exit(emit(*result,os.environ.get('GITHUB_STEP_SUMMARY')))
