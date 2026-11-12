#!/usr/bin/env python3
"""Fail a test Preview build if its DEX definitions collide or tracer is absent."""
import re
import struct
import sys
import zipfile


def defined_classes(data):
    if len(data) < 112 or data[:4] != b'dex\n':
        raise ValueError('invalid DEX header')
    def u32(offset):
        return struct.unpack_from('<I', data, offset)[0]
    ns, so, nt, to, nc, co = (u32(i) for i in (56, 60, 64, 68, 96, 100))
    if so + ns * 4 > len(data) or to + nt * 4 > len(data) or co + nc * 32 > len(data):
        raise ValueError('DEX tables out of bounds')
    def string(index):
        if index >= ns:
            raise ValueError('DEX string index out of bounds')
        offset = u32(so + index * 4)
        for _ in range(5):
            if offset >= len(data):
                raise ValueError('DEX string offset out of bounds')
            b = data[offset]
            offset += 1
            if not b & 0x80:
                break
        else:
            raise ValueError('bad DEX ULEB128')
        end = data.index(b'\0', offset)
        return data[offset:end]  # Compare raw MUTF-8 descriptors, including non-ASCII class names.
    for i in range(nc):
        type_index = u32(co + i * 32)
        if type_index >= nt:
            raise ValueError('DEX type index out of bounds')
        yield string(u32(to + type_index * 4))


def check(apk):
    seen = {}
    with zipfile.ZipFile(apk) as archive:
        names = [n for n in archive.namelist() if re.fullmatch(r'classes(?:[2-9]|[1-9][0-9]+)?\.dex', n)]
        if 'classes.dex' not in names or len(set(names)) != len(names):
            raise ValueError('missing DEX or duplicate DEX zip entry')
        for name in names:
            for cls in defined_classes(archive.read(name)):
                if cls in seen:
                    raise ValueError(f'duplicate DEX class {cls}: {seen[cls]} and {name}')
                seen[cls] = name
    for cls in (b'Lcom/melodix/demo/DemoEntry;', b'Lcom/melodix/local/LocalMusicActivity;'):
        if seen.get(cls) != 'classes2.dex':
            raise ValueError(f'{cls} must be defined exactly once in classes2.dex; found {seen.get(cls)}')
    print(f'DEX check: {len(seen)} unique definitions in {len(names)} DEX files; demo and local tracer in classes2.dex')


if __name__ == '__main__':
    if len(sys.argv) != 2:
        raise SystemExit('usage: check_preview_dex.py APK')
    check(sys.argv[1])
