#!/usr/bin/env python3
"""Back from the Library returns to Home; only Home leaves the app (last patch, no pinned hash).

tryLot1NativeBack treated the Library as a root and called moveTaskToBack, so Back looked like an
exit. Spotify goes Library -> Home first. Verified on the Android 16 emulator, logged in.
"""
import re, sys
from pathlib import Path
SOURCE = 'smali/com/melodix/music/MainActivity.smali'
RX = re.compile(r'(const-string v0, "library"\s*\n\s*invoke-virtual \{v0, v1\}, Ljava/lang/String;->equals\(Ljava/lang/Object;\)Z\s*\n\s*move-result v2\s*\n\s*)if-eqz v2, :cond_2(\s*\n)')
def prepare(root):
    text = (root/SOURCE).read_text(encoding='utf8')
    i = text.index('.method public final tryLot1NativeBack'); j = text.index('.end method', i)
    body = text[i:j]
    if len(RX.findall(body)) != 1: raise ValueError('unexpected Library branch in tryLot1NativeBack')
    new = RX.sub(lambda m: m.group(1) + 'if-nez v2, :cond_lib\n    goto :cond_2\n    :cond_lib\n'
                 '    const/4 v0, 0x0\n    invoke-virtual {p0, v0}, Lcom/melodix/music/MainActivity;->onNativeBackClick(Landroid/view/View;)V\n'
                 '    const/4 v0, 0x1\n    return v0' + m.group(2), body, count=1)
    return text[:i] + new + text[j:]
if __name__ == '__main__':
    root = Path(sys.argv[1]); (root/SOURCE).write_text(prepare(root), encoding='utf8')
