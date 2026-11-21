#!/usr/bin/env python3
"""Inspect the actual signed APK, including its DEX class_def table."""
import hashlib, json, pathlib, re, struct, subprocess, sys, zipfile

apk = pathlib.Path(sys.argv[1]); source = sys.argv[2]; output = pathlib.Path(sys.argv[3])
output.mkdir(parents=True, exist_ok=True)
tools = pathlib.Path(__import__('os').environ['ANDROID_HOME']) / 'build-tools' / '35.0.0'
def run(*args):
    return subprocess.run(args, check=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True).stdout
badging = run(str(tools / 'aapt'), 'dump', 'badging', str(apk))
cert = run(str(tools / 'apksigner'), 'verify', '--print-certs', str(apk))
(output / 'apk-badging.txt').write_text(badging)
(output / 'apk-certificate.txt').write_text(cert)
match = re.search(r"^package: name='([^']+)' versionCode='([0-9]+)' versionName='([^']+)'", badging, re.M)
if not match: raise RuntimeError('APK badging missing or ambiguous')
pkg, code, name = match.groups()
if pkg != 'com.melodix.music.preview' or int(code) <= 1021499 or name != '1.2.2-' + source[:7]:
    raise RuntimeError(f'wrong APK identity: {pkg} {code} {name}')
signers = re.findall(r'^Signer #(\d+) certificate SHA-256 digest: ([a-fA-F0-9]{64})\s*$', cert, re.M)
if len(signers) != 1 or signers[0][0] != '1' or signers[0][1].lower() != 'e3ceb66f4f67ccbd53d92272f5c6422c3b10664aa57a28512bbafdb89657802f':
    raise RuntimeError('APK signer differs from the pinned Preview certificate also checked for test154')

def defined_classes(data):
    if data[:4] != b'dex\n' or len(data) < 112: raise ValueError('invalid DEX')
    u32 = lambda off: struct.unpack_from('<I', data, off)[0]
    ns, so, nt, to, nc, co = (u32(i) for i in (56, 60, 64, 68, 96, 100))
    if so+ns*4 > len(data) or to+nt*4 > len(data) or co+nc*32 > len(data): raise ValueError('DEX tables out of bounds')
    def string(index):
        if index >= ns: raise ValueError('DEX string index out of bounds')
        offset = u32(so+index*4)
        # ULEB128 length prefix, followed by modified UTF-8. Class descriptor is ASCII.
        for _ in range(5):
            b = data[offset]; offset += 1
            if not b & 0x80: break
        else: raise ValueError('bad DEX ULEB128')
        end = data.index(b'\0', offset)
        return data[offset:end]
    for i in range(nc):
        type_index = u32(co+i*32)
        if type_index >= nt: raise ValueError('DEX class type index out of bounds')
        yield string(u32(to+type_index*4))

found = []
with zipfile.ZipFile(apk) as archive:
    for entry in archive.namelist():
        if re.fullmatch(r'classes(?:[2-9]|[1-9][0-9]+)?\.dex', entry):
            if b'Lcom/melodix/demo/DemoEntry;' in defined_classes(archive.read(entry)):
                found.append(entry)
if len(found) != 1: raise RuntimeError('DemoEntry must be defined in exactly one DEX: ' + repr(found))
result = {'sha256': hashlib.sha256(apk.read_bytes()).hexdigest(), 'package': pkg,
          'versionCode': int(code), 'versionName': name, 'source': source,
          'signer_sha256': signers[0][1].lower(), 'DemoEntry_defined_in': found[0]}
(output / 'inspection.json').write_text(json.dumps(result, indent=2) + '\n')
print('::notice title=Exact APK inspection::' + json.dumps(result), flush=True)
