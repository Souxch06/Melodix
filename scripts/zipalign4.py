#!/usr/bin/env python3
"""zipalign minimal : aligne à 4 octets les données des entrées STOCKED d'un APK (zip).
Usage: zipalign4.py <in.apk> <out.apk>"""
import struct, sys, zipfile

def main(src, dst):
    z = zipfile.ZipFile(src)
    infos = z.infolist()
    out = open(dst, 'wb')
    central = []
    with open(src, 'rb') as f:
        for zi in infos:
            f.seek(zi.header_offset)
            hdr = f.read(30)
            nlen, elen = struct.unpack('<IHHHHHIIIHH', hdr)[9:11]
            name = f.read(nlen); f.read(elen)
            raw = f.read(zi.compress_size)
            assert len(raw) == zi.compress_size
            header_off = out.tell()
            pad = (4 - (header_off + 30 + nlen) % 4) % 4
            extra = b'' if pad == 0 else struct.pack('<HH', 0xd935, pad) + b'\x00' * pad
            if zi.compress_type == 0:
                assert (header_off + 30 + nlen + len(extra)) % 4 == 0
            out.write(struct.pack('<IHHHHHIIIHH', 0x04034b50, zi.extract_version, zi.flag_bits & ~8,
                                  zi.compress_type, 0, 0x21, zi.CRC, zi.compress_size, zi.file_size, nlen, len(extra)))
            out.write(name); out.write(extra); out.write(raw)
            central.append((zi, header_off, name, len(extra)))
    cd_start = out.tell()
    for zi, header_off, name, elen in central:
        extra = b'' if elen == 0 else struct.pack('<HH', 0xd935, elen - 4) + b'\x00' * (elen - 4)
        comment = zi.comment or b''
        out.write(struct.pack('<IHHHHHHIIIHHHHHII', 0x02014b50, zi.create_version, zi.extract_version,
                              zi.flag_bits & ~8, zi.compress_type, 0, 0x21, zi.CRC, zi.compress_size, zi.file_size,
                              len(name), len(extra), len(comment), 0, zi.internal_attr, zi.external_attr, header_off))
        out.write(name); out.write(extra); out.write(comment)
    cd_size = out.tell() - cd_start
    out.write(struct.pack('<IHHHHIIH', 0x06054b50, 0, 0, len(central), len(central), cd_size, cd_start, 0))
    out.close()
    z2 = zipfile.ZipFile(dst)
    assert z2.testzip() is None

if __name__ == '__main__':
    main(sys.argv[1], sys.argv[2])
