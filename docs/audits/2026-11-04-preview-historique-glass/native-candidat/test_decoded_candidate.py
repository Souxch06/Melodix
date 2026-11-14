#!/usr/bin/env python3
"""Check specific candidate changes after rebuilding and decoding the APK."""
import re
from pathlib import Path
import sys
import xml.etree.ElementTree as ET

root = Path(sys.argv[1])
loader = (root/'smali/com/melodix/music/NativeImageLoader.smali').read_text()
rows = (root/'smali/com/melodix/music/NativeUiRowFactory.smali').read_text()
assert re.search(r'isEmpty\(\)Z\s+move-result v1\s+if-nez v1, :\w+\s+invoke-virtual \{v0, p1\}, Lcom/squareup/picasso/Picasso;->load', loader)
assert re.search(r'isEmpty\(\)Z\s+move-result v10\s+if-nez v10, :\w+\s+const/16 v10, 0xb0\s+invoke-static \{v1, v9, v10\}', rows)
for name in ('native_shell_background', 'native_nav_item', 'native_mini_player_bg'):
    ET.parse(root/'res/drawable'/f'{name}.xml')
print('Decoded candidate: corrected artwork branches and native drawable XMLs present')
