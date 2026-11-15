#!/usr/bin/env python3
"""Preview-only visual fixes applied after the pinned 9016 + time patch."""
import hashlib
import re
import sys
from pathlib import Path

EXPECTED = {
    'smali/com/melodix/music/MainActivity.smali': '4f5a3376298da0d4412704f6096fb5a0660782c4f4db635e22b1aa5bba867905',
    'smali/com/melodix/music/NativeHomeShelfPreview.smali': '4c9f6c71405dd79829bb2f9996c15b09eedc9f8291a5bdcd629aaedd409c065e',
    'smali/com/melodix/music/NativeImageLoader.smali': 'b3b1a5e9508f30922ba3e8272fbebf7abb12bfe656171a9b9b1958ac100cb700',
    'smali/com/melodix/music/NativeSettingsRowFactory.smali': '53f9abd3611f48a660e52966afce871a23167c7f26aed6ac1bb7079990774390',
    'res/layout/activity_main.xml': 'f4fdfa7425bda04566daab4aef726528788ded0669d8ec7c36431c518d707c92',
    'res/drawable/native_cover_placeholder.xml': '051dc30503f8ca704dae5109de38fc1be736387fa68997b880232167d68e1646',
}
FALLBACK = '''<?xml version="1.0" encoding="utf-8"?>
<layer-list xmlns:android="http://schemas.android.com/apk/res/android">
  <item><shape><size android:width="96dp" android:height="96dp" /><gradient android:angle="135" android:startColor="#FF29213E" android:endColor="#FF3A1F38" /></shape></item>
  <item android:gravity="center" android:width="24dp" android:height="24dp"><vector android:width="24dp" android:height="24dp" android:viewportWidth="24" android:viewportHeight="24"><path android:fillColor="#FFA1A1B5" android:pathData="M12,3v10.55c-0.59,-0.34 -1.27,-0.55 -2,-0.55 -2.21,0 -4,1.79 -4,4s1.79,4 4,4 4,-1.79 4,-4V7h4V3h-6z" /></vector></item>
</layer-list>
'''
LOADER = '''.class public final Lcom/melodix/music/NativeImageLoader;
.super Ljava/lang/Object;

.method private static drawableId(Landroid/widget/ImageView;Ljava/lang/String;)I
    .locals 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v0
    const-string v2, "drawable"
    invoke-virtual {v1, p1, v2, v0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    move-result v0
    return v0
.end method

.method public static load(Landroid/widget/ImageView;Ljava/lang/String;I)V
    .locals 5
    if-eqz p0, :done
    const-string v0, "native_cover_placeholder"
    invoke-static {p0, v0}, Lcom/melodix/music/NativeImageLoader;->drawableId(Landroid/widget/ImageView;Ljava/lang/String;)I
    move-result v3
    :try_start
    invoke-static {}, Lcom/squareup/picasso/Picasso;->get()Lcom/squareup/picasso/Picasso;
    move-result-object v0
    invoke-virtual {v0, p0}, Lcom/squareup/picasso/Picasso;->cancelRequest(Landroid/widget/ImageView;)V
    if-eqz p1, :fallback
    const-string v1, "https://"
    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :fallback
    const/4 v1, 0x2
    new-array v2, v1, [I
    const/4 v1, 0x0
    const v4, 0xff29213e
    aput v4, v2, v1
    const/4 v1, 0x1
    const v4, 0xff3a1f38
    aput v4, v2, v1
    new-instance v4, Landroid/graphics/drawable/GradientDrawable;
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->TL_BR:Landroid/graphics/drawable/GradientDrawable$Orientation;
    invoke-direct {v4, v1, v2}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V
    invoke-virtual {v0, p1}, Lcom/squareup/picasso/Picasso;->load(Ljava/lang/String;)Lcom/squareup/picasso/RequestCreator;
    move-result-object v1
    invoke-virtual {v1, v4}, Lcom/squareup/picasso/RequestCreator;->placeholder(Landroid/graphics/drawable/Drawable;)Lcom/squareup/picasso/RequestCreator;
    move-result-object v1
    if-eqz v3, :no_error
    invoke-virtual {v1, v3}, Lcom/squareup/picasso/RequestCreator;->error(I)Lcom/squareup/picasso/RequestCreator;
    move-result-object v1
    :no_error
    invoke-virtual {v1, p2, p2}, Lcom/squareup/picasso/RequestCreator;->resize(II)Lcom/squareup/picasso/RequestCreator;
    move-result-object v1
    invoke-virtual {v1}, Lcom/squareup/picasso/RequestCreator;->centerCrop()Lcom/squareup/picasso/RequestCreator;
    move-result-object v1
    invoke-virtual {v1, p0}, Lcom/squareup/picasso/RequestCreator;->into(Landroid/widget/ImageView;)V
    goto :done
    :fallback
    if-eqz v3, :done
    invoke-virtual {p0, v3}, Landroid/widget/ImageView;->setImageResource(I)V
    :try_end
    .catch Ljava/lang/RuntimeException; {:try_start .. :try_end} :error
    goto :done
    :error
    move-exception v0
    if-eqz v3, :done
    invoke-virtual {p0, v3}, Landroid/widget/ImageView;->setImageResource(I)V
    :done
    return-void
.end method
'''
SPACING = '''.method private final styleLot1Screen(Ljava/lang/String;)V
    .locals 7
    const-string v0, "nativeSettingsGear"
    invoke-virtual {p0, v0}, Lcom/melodix/music/MainActivity;->findNativeByTag(Ljava/lang/String;)Landroid/view/View;
    move-result-object v1
    const-string v0, "settings"
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v1, :no_gear
    if-eqz v0, :show_gear
    const/16 v2, 0x8
    goto :set_gear
    :show_gear
    const/4 v2, 0x0
    :set_gear
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V
    :no_gear
    const-string v1, "nativeContent"
    invoke-virtual {p0, v1}, Lcom/melodix/music/MainActivity;->findNativeByTag(Ljava/lang/String;)Landroid/view/View;
    move-result-object v1
    if-eqz v1, :spacing_done
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v2
    iget v2, v2, Landroid/util/DisplayMetrics;->density:F
    const/4 v3, 0x0
    if-eqz v0, :inset_ready
    const/high16 v3, 0x41800000    # 16 dp
    mul-float/2addr v3, v2
    invoke-static {v3}, Ljava/lang/Math;->round(F)I
    move-result v3
    :inset_ready
    const/high16 v4, 0x41000000    # 8 dp top
    mul-float/2addr v4, v2
    invoke-static {v4}, Ljava/lang/Math;->round(F)I
    move-result v4
    const/high16 v5, 0x42000000    # 32 dp bottom
    mul-float/2addr v5, v2
    invoke-static {v5}, Ljava/lang/Math;->round(F)I
    move-result v5
    invoke-virtual {v1, v3, v4, v3, v5}, Landroid/view/View;->setPadding(IIII)V
    :spacing_done
    return-void
.end method

'''

def replace(text, old, new):
    if text.count(old) != 1:
        raise ValueError('expected exactly one occurrence: ' + repr(old[:100]))
    return text.replace(old, new, 1)


def prepare(root):
    files = {}
    for name, expected in EXPECTED.items():
        raw = (root / name).read_bytes()
        if hashlib.sha256(raw).hexdigest() != expected:
            raise ValueError('unexpected input ' + name)
        files[name] = raw.decode('utf8')
    name = 'res/layout/activity_main.xml'; s = files[name]
    s = replace(s, '<ImageView\n                android:src="@drawable/native_nav_settings"', '<ImageView\n                android:tag="nativeSettingsGear"\n                android:src="@drawable/native_nav_settings"')
    s = replace(s, 'android:id="@id/nativeContent"\n                android:tag="nativeContent"\n                android:orientation="vertical"\n                android:paddingTop="8.0dip"\n                android:paddingBottom="24.0dip"', 'android:id="@id/nativeContent"\n                android:tag="nativeContent"\n                android:orientation="vertical"\n                android:paddingTop="8.0dip"\n                android:paddingBottom="32.0dip"')
    s = replace(s, 'android:paddingTop="4.0dip"\n                android:paddingBottom="24.0dip"', 'android:paddingTop="4.0dip"\n                android:paddingBottom="32.0dip"')
    files[name] = s
    name = 'smali/com/melodix/music/MainActivity.smali'; s = files[name]
    s = replace(s, '    :player_panel\n    const-string v0, "player"', '    :player_panel\n    invoke-direct {p0, p1}, Lcom/melodix/music/MainActivity;->styleLot1Screen(Ljava/lang/String;)V\n    const-string v0, "player"')
    s = replace(s, '.method public final styleNativeTab(', SPACING + '.method public final styleNativeTab(')
    files[name] = s
    name = 'smali/com/melodix/music/NativeHomeShelfPreview.smali'; s = files[name]
    s = replace(s, '    const-string v4, "native_category_chip"\n    invoke-static {p0, v1, v4}, Lcom/melodix/music/NativeUiRowFactory;->applyDrawableBackground(Landroid/content/Context;Landroid/view/View;Ljava/lang/String;)V\n', '')
    files[name] = s
    name = 'smali/com/melodix/music/NativeSettingsRowFactory.smali'; s = files[name]
    s = replace(s, '    move-result-object v5\n\n    const-string v0, "settingValue"', '''    move-result-object v5
    # Presentation-only replacement of the legacy unsupported-setting label.
    const-string v0, "Réglage Spotify non disponible dans cette Preview"
    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :lot1_settings_label_done
    const-string v5, "Géré par Spotify"
    :lot1_settings_label_done

    const-string v0, "settingValue"''')
    files[name] = s
    files['smali/com/melodix/music/NativeImageLoader.smali'] = LOADER
    files['res/drawable/native_cover_placeholder.xml'] = FALLBACK
    return files


if __name__ == '__main__':
    root = Path(sys.argv[1]); files = prepare(root)
    for name, text in files.items():
        f = root / name; f.parent.mkdir(parents=True, exist_ok=True); f.write_text(text, encoding='utf8')
