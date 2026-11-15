#!/usr/bin/env python3
"""Add derived remaining-time display to the Preview native player only."""
import hashlib
import sys
from pathlib import Path

EXPECTED = {
    'smali/com/melodix/music/MainActivity.smali': '663a68771701b446f3e06217d946f72011f1d3c57015f6f002fd867faa77a4f2',
    'res/layout/activity_main.xml': '8591ea0760239bdeecc88346f96275bbfe7cbc4aa4829b4eb28f1d161b418eeb',
}
HELPER = '''.method private final updateLot1Remaining(JJ)V
    .locals 6
    const v0, 0x7f09023a
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :done
    const-string v1, "nativePlayerRemaining"
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;
    move-result-object v0
    if-eqz v0, :done
    check-cast v0, Landroid/widget/TextView;
    const-wide/16 v1, 0x0
    cmp-long v3, p1, v1
    if-lez v3, :unknown
    cmp-long v3, p3, v1
    if-gez v3, :nonnegative
    const-wide/16 p3, 0x0
    :nonnegative
    cmp-long v3, p3, p1
    if-lez v3, :bounded
    move-wide p3, p1
    :bounded
    sub-long v1, p1, p3
    invoke-static {v1, v2}, Lcom/melodix/music/MainActivity;->formatNativeTime(J)Ljava/lang/String;
    move-result-object v1
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "Temps restant : "
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    goto :set
    :unknown
    const-string v1, "Temps restant : —"
    :set
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :done
    return-void
.end method

'''

def replace(text, old, new):
    if text.count(old) != 1: raise ValueError('unexpected anchor: ' + repr(old[:80]))
    return text.replace(old, new, 1)

def prepare(root):
    files = {}
    for name, digest in EXPECTED.items():
        raw = (root/name).read_bytes()
        if hashlib.sha256(raw).hexdigest() != digest: raise ValueError('unexpected input ' + name)
        files[name] = raw.decode('utf8')
    name = 'smali/com/melodix/music/MainActivity.smali'
    s = replace(files[name], '.method public final updateNativePlayer(Ljava/lang/String;)V',
                HELPER + '.method public final updateNativePlayer(Ljava/lang/String;)V')
    s = replace(s, '''    invoke-static {v2, v3}, Lcom/melodix/music/MainActivity;->formatNativeTime(J)Ljava/lang/String;
    move-result-object v10
    const/4 v8, 0x0''', '''    invoke-static {v2, v3}, Lcom/melodix/music/MainActivity;->formatNativeTime(J)Ljava/lang/String;
    move-result-object v10
    invoke-direct {p0, v2, v3, v4, v5}, Lcom/melodix/music/MainActivity;->updateLot1Remaining(JJ)V
    const/4 v8, 0x0''')
    files[name] = s
    name = 'res/layout/activity_main.xml'
    old = '''                    android:id="@id/nativePlayerDurationText"
                    android:text="0:00"
                    android:textSize="12.0sp"
                    android:textStyle="bold"
                    android:textColor="#ffb3b3b3"
                    android:gravity="right"
                    android:layout_width="wrap_content"
                    android:layout_height="wrap_content" />
            </LinearLayout>'''
    new = old + '''
            <TextView
                android:tag="nativePlayerRemaining"
                android:text="Temps restant : —"
                android:textSize="12.0sp"
                android:textColor="#ffb3b3b3"
                android:gravity="right"
                android:paddingBottom="8.0dip"
                android:layout_width="fill_parent"
                android:layout_height="wrap_content" />'''
    files[name] = replace(files[name], old, new)
    return files

if __name__ == '__main__':
    root = Path(sys.argv[1])
    for name, data in prepare(root).items(): (root/name).write_text(data, encoding='utf8')
