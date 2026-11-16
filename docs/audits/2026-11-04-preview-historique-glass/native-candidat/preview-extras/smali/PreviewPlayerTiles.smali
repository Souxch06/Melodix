.class public final Lcom/melodix/music/PreviewPlayerTiles;
.super Landroid/widget/LinearLayout;
.source "PreviewPlayerTiles.java"


# static fields
.field private static final SCRIPT:Ljava/lang/String; = "(function(action, kind) {\n    \'use strict\';\n    // Probe only existing controls. A click is issued only on an explicit tap.\n    var specs={\n        queue:{ids:/^(control-button-queue|queue-button)$/i, label:/^(queue|play queue|file d\'attente|file de lecture|warteschlange|cola de reproducci\u00f3n|fila de reprodu\u00e7\u00e3o)$/i},\n        lyrics:{ids:/^(lyrics-button|control-button-lyrics)$/i, label:/^(lyrics|show lyrics|paroles|afficher les paroles|songtext|letras|letra)$/i},\n        connect:{ids:/^(connect-button|control-button-connect|connect-device-picker|device-picker)$/i, label:/^(connect to a device|connect to a device\\.\\.\\.|connecter \u00e0 un appareil|se connecter \u00e0 un appareil|mit einem ger\u00e4t verbinden|conectar a un dispositivo|conectar a um dispositivo)$/i}\n    };\n    function status(k) {\n        var spec=specs[k], result={state:\'unavailable\',reason:\'control\'};\n        if(!spec)return result;\n        var nodes=Array.from(document.querySelectorAll(\'button[data-testid], button[aria-label]\')).filter(function(b){\n            return b.isConnected && (spec.ids.test(String(b.getAttribute(\'data-testid\')||\'\')) || spec.label.test(String(b.getAttribute(\'aria-label\')||\'\').trim()));\n        });\n        if(!nodes.length){result.reason=document.readyState===\'loading\'?\'page\':document.querySelector(\'[data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-widget\"], [data-testid=\"player-controls\"]\')?\'control\':\'bar\';return result;}\n        if(nodes.length!==1){result.reason=\'ambiguous\';return result;}\n        var b=nodes[0];\n        if(b.disabled || b.getAttribute(\'aria-disabled\')===\'true\'){result.reason=\'disabled\';return result;}\n        result.state=\'available\';result.reason=\'\';result.button=b;return result;\n    }\n    if(action===\'query\'){\n        var all={};Object.keys(specs).forEach(function(k){var x=status(k);all[k]=x.state;all[k+\'Reason\']=x.reason;});return JSON.stringify(all);\n    }\n    if(action!==\'invoke\')return JSON.stringify({sent:false});\n    var found=status(kind);\n    if(found.state!==\'available\')return JSON.stringify({sent:false,reason:found.reason});\n    try {\n        var b=found.button;\n        // An already-open panel is shown, not toggled closed again.\n        if(b.getAttribute(\'aria-expanded\')!==\'true\' && b.getAttribute(\'aria-pressed\')!==\'true\')b.click();\n        return JSON.stringify({sent:true});\n    } catch (_) {return JSON.stringify({sent:false,reason:\'command\'});}\n})\n"


# instance fields
.field private final controls:[Landroid/widget/Button;

.field private generation:J

.field private final icons:[Ljava/lang/String;

.field private final kinds:[Ljava/lang/String;

.field private lastAction:J

.field private lastVolumeTap:J

.field private final names:[Ljava/lang/String;

.field private opening:Z

.field private queryInFlight:Z

.field private queryStarted:J

.field private final reasons:[Ljava/lang/String;

.field private serial:J

.field private final status:[Ljava/lang/String;

.field private visibleSince:J

.field private volumeButton:Landroid/widget/Button;

.field private volumeRunning:Z

.field private final volumeTick:Ljava/lang/Runnable;

.field private webDialog:Landroid/app/Dialog;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 11
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 154
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 34
    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    const-string v9, "queue"

    aput-object v9, v7, v8

    const/4 v8, 0x1

    const-string v9, "lyrics"

    aput-object v9, v7, v8

    const/4 v8, 0x2

    const-string v9, "connect"

    aput-object v9, v7, v8

    iput-object v7, p0, Lcom/melodix/music/PreviewPlayerTiles;->kinds:[Ljava/lang/String;

    .line 35
    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    const-string v9, "File"

    aput-object v9, v7, v8

    const/4 v8, 0x1

    const-string v9, "Paroles"

    aput-object v9, v7, v8

    const/4 v8, 0x2

    const-string v9, "Appareils"

    aput-object v9, v7, v8

    iput-object v7, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    .line 36
    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    const-string v9, "\u2630"

    aput-object v9, v7, v8

    const/4 v8, 0x1

    const-string v9, "\u266c"

    aput-object v9, v7, v8

    const/4 v8, 0x2

    const-string v9, "\u25a3"

    aput-object v9, v7, v8

    iput-object v7, p0, Lcom/melodix/music/PreviewPlayerTiles;->icons:[Ljava/lang/String;

    .line 37
    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    const-string v9, "unknown"

    aput-object v9, v7, v8

    const/4 v8, 0x1

    const-string v9, "unknown"

    aput-object v9, v7, v8

    const/4 v8, 0x2

    const-string v9, "unknown"

    aput-object v9, v7, v8

    iput-object v7, p0, Lcom/melodix/music/PreviewPlayerTiles;->status:[Ljava/lang/String;

    .line 38
    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    const-string v9, "web"

    aput-object v9, v7, v8

    const/4 v8, 0x1

    const-string v9, "web"

    aput-object v9, v7, v8

    const/4 v8, 0x2

    const-string v9, "web"

    aput-object v9, v7, v8

    iput-object v7, p0, Lcom/melodix/music/PreviewPlayerTiles;->reasons:[Ljava/lang/String;

    .line 39
    const/4 v7, 0x3

    new-array v7, v7, [Landroid/widget/Button;

    iput-object v7, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    .line 42
    const-wide/16 v8, -0x3e8

    iput-wide v8, p0, Lcom/melodix/music/PreviewPlayerTiles;->lastAction:J

    .line 45
    const-wide/16 v8, -0x3e8

    iput-wide v8, p0, Lcom/melodix/music/PreviewPlayerTiles;->lastVolumeTap:J

    .line 46
    new-instance v7, Lcom/melodix/music/PreviewPlayerTiles$1;

    invoke-direct {v7, p0}, Lcom/melodix/music/PreviewPlayerTiles$1;-><init>(Lcom/melodix/music/PreviewPlayerTiles;)V

    iput-object v7, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeTick:Ljava/lang/Runnable;

    .line 154
    const/4 v7, 0x0

    invoke-virtual {p0, v7}, Lcom/melodix/music/PreviewPlayerTiles;->setOrientation(I)V

    const/16 v7, 0x11

    invoke-virtual {p0, v7}, Lcom/melodix/music/PreviewPlayerTiles;->setGravity(I)V

    .line 155
    const/4 v7, 0x4

    new-array v3, v7, [Ljava/lang/String;

    const/4 v7, 0x0

    const-string v8, "\u2630\nFile"

    aput-object v8, v3, v7

    const/4 v7, 0x1

    const-string v8, "\u266c\nParoles"

    aput-object v8, v3, v7

    const/4 v7, 0x2

    const-string v8, "\u25a3\nAppareils"

    aput-object v8, v3, v7

    const/4 v7, 0x3

    const-string v8, "\u25d6))\nVolume"

    aput-object v8, v3, v7

    .line 156
    .local v3, "labels":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v7, v3

    if-lt v1, v7, :cond_0

    .line 181
    return-void

    .line 157
    :cond_0
    move v5, v1

    .local v5, "n":I
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 158
    .local v0, "b":Landroid/widget/Button;
    new-instance v2, Landroid/text/SpannableString;

    aget-object v7, v3, v1

    invoke-direct {v2, v7}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 159
    .local v2, "label":Landroid/text/SpannableString;
    new-instance v7, Landroid/text/style/RelativeSizeSpan;

    const v8, 0x400ccccd    # 2.2f

    invoke-direct {v7, v8}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    const/4 v8, 0x0

    aget-object v9, v3, v1

    const/16 v10, 0xa

    invoke-virtual {v9, v10}, Ljava/lang/String;->indexOf(I)I

    move-result v9

    const/16 v10, 0x21

    invoke-virtual {v2, v7, v8, v9, v10}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 160
    invoke-virtual {v0, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/high16 v7, 0x41200000    # 10.0f

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setTextSize(F)V

    const v7, -0x4b513b

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setTextColor(I)V

    .line 161
    const/4 v7, 0x0

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setAllCaps(Z)V

    const/4 v7, 0x0

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setSingleLine(Z)V

    const/4 v7, 0x4

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setMaxLines(I)V

    const/high16 v7, 0x40000000    # 2.0f

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v7

    const/high16 v8, 0x40800000    # 4.0f

    invoke-direct {p0, v8}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v8

    const/high16 v9, 0x40000000    # 2.0f

    invoke-direct {p0, v9}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v9

    const/high16 v10, 0x40800000    # 4.0f

    invoke-direct {p0, v10}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v10

    invoke-virtual {v0, v7, v8, v9, v10}, Landroid/widget/Button;->setPadding(IIII)V

    const/4 v7, 0x0

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setMinWidth(I)V

    const/4 v7, 0x0

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setMinimumWidth(I)V

    const/high16 v7, 0x42600000    # 56.0f

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v7

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 162
    new-instance v6, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v6}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .local v6, "tile":Landroid/graphics/drawable/GradientDrawable;
    const v7, 0x14ffffff

    invoke-virtual {v6, v7}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v7, 0x41900000    # 18.0f

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {v6, v7}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v7

    const v8, 0x1fffffff

    invoke-virtual {v6, v7, v8}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 163
    const/4 v7, 0x0

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    const/4 v7, 0x0

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    const/4 v7, 0x0

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setElevation(F)V

    const/4 v7, 0x0

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setTranslationZ(F)V

    const/4 v7, 0x0

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 164
    new-instance v7, Landroid/graphics/drawable/RippleDrawable;

    const v8, 0x447b3fe4

    invoke-static {v8}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v8

    const/4 v9, 0x0

    invoke-direct {v7, v8, v6, v9}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 165
    const/4 v7, 0x3

    if-ne v1, v7, :cond_4

    const-string v7, "Volume du t\u00e9l\u00e9phone"

    :goto_1
    invoke-virtual {v0, v7}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 166
    const/4 v7, 0x1

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setEnabled(Z)V

    const/4 v7, 0x3

    if-ne v1, v7, :cond_5

    const/high16 v7, 0x3f800000    # 1.0f

    :goto_2
    invoke-virtual {v0, v7}, Landroid/widget/Button;->setAlpha(F)V

    const/4 v7, 0x0

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setSelected(Z)V

    const/4 v7, 0x0

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setActivated(Z)V

    .line 167
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, 0x0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v7

    iget v7, v7, Landroid/content/res/Configuration;->fontScale:F

    const v9, 0x3fa66666    # 1.3f

    cmpl-float v7, v7, v9

    if-lez v7, :cond_6

    const/4 v7, -0x2

    :goto_3
    const/high16 v9, 0x3f800000    # 1.0f

    invoke-direct {v4, v8, v7, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .local v4, "lp":Landroid/widget/LinearLayout$LayoutParams;
    if-lez v1, :cond_1

    const/high16 v7, 0x41000000    # 8.0f

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v7

    iput v7, v4, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    :cond_1
    invoke-virtual {p0, v0, v4}, Lcom/melodix/music/PreviewPlayerTiles;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 168
    const/4 v7, 0x3

    if-ge v5, v7, :cond_2

    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    aput-object v0, v7, v5

    new-instance v7, Lcom/melodix/music/PreviewPlayerTiles$9;

    invoke-direct {v7, p0, v5}, Lcom/melodix/music/PreviewPlayerTiles$9;-><init>(Lcom/melodix/music/PreviewPlayerTiles;I)V

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 169
    :cond_2
    const/4 v7, 0x3

    if-ne v5, v7, :cond_3

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeButton:Landroid/widget/Button;

    new-instance v7, Lcom/melodix/music/PreviewPlayerTiles$10;

    invoke-direct {v7, p0}, Lcom/melodix/music/PreviewPlayerTiles$10;-><init>(Lcom/melodix/music/PreviewPlayerTiles;)V

    invoke-virtual {v0, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 156
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 165
    .end local v4    # "lp":Landroid/widget/LinearLayout$LayoutParams;
    :cond_4
    new-instance v7, Ljava/lang/StringBuilder;

    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v8, v8, v1

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, " : indisponible, page Spotify non accessible"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_1

    .line 166
    :cond_5
    const v7, 0x3ee66666    # 0.45f

    goto :goto_2

    .line 167
    :cond_6
    const/high16 v7, 0x42600000    # 56.0f

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v7

    goto :goto_3
.end method

.method static synthetic access$0(Lcom/melodix/music/PreviewPlayerTiles;)Z
    .locals 1

    .prologue
    .line 44
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    return v0
.end method

.method static synthetic access$1(Lcom/melodix/music/PreviewPlayerTiles;Z)V
    .locals 0

    .prologue
    .line 44
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    return-void
.end method

.method static synthetic access$10(Lcom/melodix/music/PreviewPlayerTiles;)[Ljava/lang/String;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->kinds:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$11(Lcom/melodix/music/PreviewPlayerTiles;)[Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->reasons:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$12(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;)V
    .locals 0

    .prologue
    .line 41
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    return-void
.end method

.method static synthetic access$13(Lcom/melodix/music/PreviewPlayerTiles;)Z
    .locals 1

    .prologue
    .line 43
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->opening:Z

    return v0
.end method

.method static synthetic access$14(Lcom/melodix/music/PreviewPlayerTiles;Z)V
    .locals 0

    .prologue
    .line 43
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->opening:Z

    return-void
.end method

.method static synthetic access$15(Lcom/melodix/music/PreviewPlayerTiles;J)V
    .locals 1

    .prologue
    .line 42
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->generation:J

    return-void
.end method

.method static synthetic access$16(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 96
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->message(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$17(Lcom/melodix/music/PreviewPlayerTiles;)V
    .locals 0

    .prologue
    .line 97
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->showWebPanel()V

    return-void
.end method

.method static synthetic access$18(Lcom/melodix/music/PreviewPlayerTiles;)V
    .locals 0

    .prologue
    .line 144
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->syncVolume()V

    return-void
.end method

.method static synthetic access$19(Lcom/melodix/music/PreviewPlayerTiles;I)V
    .locals 0

    .prologue
    .line 112
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->activate(I)V

    return-void
.end method

.method static synthetic access$2(Lcom/melodix/music/PreviewPlayerTiles;)V
    .locals 0

    .prologue
    .line 128
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->updateVolume()V

    return-void
.end method

.method static synthetic access$20(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 2

    .prologue
    .line 45
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->lastVolumeTap:J

    return-wide v0
.end method

.method static synthetic access$21(Lcom/melodix/music/PreviewPlayerTiles;J)V
    .locals 1

    .prologue
    .line 45
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->lastVolumeTap:J

    return-void
.end method

.method static synthetic access$3(Lcom/melodix/music/PreviewPlayerTiles;)V
    .locals 0

    .prologue
    .line 74
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->paintControls()V

    return-void
.end method

.method static synthetic access$4(Lcom/melodix/music/PreviewPlayerTiles;)V
    .locals 0

    .prologue
    .line 85
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->probe()V

    return-void
.end method

.method static synthetic access$5(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 2

    .prologue
    .line 42
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->generation:J

    return-wide v0
.end method

.method static synthetic access$6(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 2

    .prologue
    .line 42
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->serial:J

    return-wide v0
.end method

.method static synthetic access$7(Lcom/melodix/music/PreviewPlayerTiles;Z)V
    .locals 0

    .prologue
    .line 43
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->queryInFlight:Z

    return-void
.end method

.method static synthetic access$8(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 61
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->parse(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$9(Lcom/melodix/music/PreviewPlayerTiles;)[Ljava/lang/String;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->status:[Ljava/lang/String;

    return-object v0
.end method

.method private activate(I)V
    .locals 13
    .param p1, "i"    # I

    .prologue
    const/4 v12, 0x0

    const-wide/16 v10, 0x1

    .line 113
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    .local v2, "now":J
    iget-boolean v5, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    if-eqz v5, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->isShown()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getWindowVisibility()I

    move-result v5

    if-nez v5, :cond_0

    iget-boolean v5, p0, Lcom/melodix/music/PreviewPlayerTiles;->opening:Z

    if-nez v5, :cond_0

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerTiles;->lastAction:J

    sub-long v6, v2, v6

    const-wide/16 v8, 0x190

    cmp-long v5, v6, v8

    if-gez v5, :cond_1

    .line 127
    :cond_0
    :goto_0
    return-void

    .line 114
    :cond_1
    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->lastAction:J

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    aget-object v5, v5, p1

    const/4 v6, 0x3

    invoke-virtual {v5, v6}, Landroid/widget/Button;->performHapticFeedback(I)Z

    .line 115
    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerTiles;->status:[Ljava/lang/String;

    aget-object v5, v5, p1

    const-string v6, "available"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4

    .line 116
    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerTiles;->reasons:[Ljava/lang/String;

    aget-object v5, v5, p1

    const-string v6, "bar"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerTiles;->reasons:[Ljava/lang/String;

    aget-object v5, v5, p1

    const-string v6, "control"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    :cond_2
    const-string v5, "Disponible pendant la lecture"

    :goto_1
    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerTiles;->message(Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Indisponible : "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerTiles;->reasons:[Ljava/lang/String;

    aget-object v6, v6, p1

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerTiles;->reasonText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    .line 118
    :cond_4
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->web()Landroid/webkit/WebView;

    move-result-object v4

    .local v4, "w":Landroid/webkit/WebView;
    if-nez v4, :cond_5

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerTiles;->status:[Ljava/lang/String;

    const-string v6, "unknown"

    aput-object v6, v5, p1

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerTiles;->reasons:[Ljava/lang/String;

    const-string v6, "web"

    aput-object v6, v5, p1

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->paintControls()V

    const-string v5, "Page Spotify indisponible. R\u00e9essayer"

    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerTiles;->message(Ljava/lang/String;)V

    goto :goto_0

    .line 119
    :cond_5
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/melodix/music/PreviewPlayerTiles;->opening:Z

    iput-boolean v12, p0, Lcom/melodix/music/PreviewPlayerTiles;->queryInFlight:Z

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerTiles;->serial:J

    add-long/2addr v6, v10

    iput-wide v6, p0, Lcom/melodix/music/PreviewPlayerTiles;->serial:J

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerTiles;->generation:J

    add-long v0, v6, v10

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->generation:J

    .line 120
    .local v0, "g":J
    new-instance v5, Lcom/melodix/music/PreviewPlayerTiles$5;

    invoke-direct {v5, p0, v0, v1, p1}, Lcom/melodix/music/PreviewPlayerTiles$5;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JI)V

    const-wide/16 v6, 0xbb8

    invoke-virtual {p0, v5, v6, v7}, Lcom/melodix/music/PreviewPlayerTiles;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 121
    :try_start_0
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "(function(action, kind) {\n    \'use strict\';\n    // Probe only existing controls. A click is issued only on an explicit tap.\n    var specs={\n        queue:{ids:/^(control-button-queue|queue-button)$/i, label:/^(queue|play queue|file d\'attente|file de lecture|warteschlange|cola de reproducci\u00f3n|fila de reprodu\u00e7\u00e3o)$/i},\n        lyrics:{ids:/^(lyrics-button|control-button-lyrics)$/i, label:/^(lyrics|show lyrics|paroles|afficher les paroles|songtext|letras|letra)$/i},\n        connect:{ids:/^(connect-button|control-button-connect|connect-device-picker|device-picker)$/i, label:/^(connect to a device|connect to a device\\.\\.\\.|connecter \u00e0 un appareil|se connecter \u00e0 un appareil|mit einem ger\u00e4t verbinden|conectar a un dispositivo|conectar a um dispositivo)$/i}\n    };\n    function status(k) {\n        var spec=specs[k], result={state:\'unavailable\',reason:\'control\'};\n        if(!spec)return result;\n        var nodes=Array.from(document.querySelectorAll(\'button[data-testid], button[aria-label]\')).filter(function(b){\n            return b.isConnected && (spec.ids.test(String(b.getAttribute(\'data-testid\')||\'\')) || spec.label.test(String(b.getAttribute(\'aria-label\')||\'\').trim()));\n        });\n        if(!nodes.length){result.reason=document.readyState===\'loading\'?\'page\':document.querySelector(\'[data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-widget\"], [data-testid=\"player-controls\"]\')?\'control\':\'bar\';return result;}\n        if(nodes.length!==1){result.reason=\'ambiguous\';return result;}\n        var b=nodes[0];\n        if(b.disabled || b.getAttribute(\'aria-disabled\')===\'true\'){result.reason=\'disabled\';return result;}\n        result.state=\'available\';result.reason=\'\';result.button=b;return result;\n    }\n    if(action===\'query\'){\n        var all={};Object.keys(specs).forEach(function(k){var x=status(k);all[k]=x.state;all[k+\'Reason\']=x.reason;});return JSON.stringify(all);\n    }\n    if(action!==\'invoke\')return JSON.stringify({sent:false});\n    var found=status(kind);\n    if(found.state!==\'available\')return JSON.stringify({sent:false,reason:found.reason});\n    try {\n        var b=found.button;\n        // An already-open panel is shown, not toggled closed again.\n        if(b.getAttribute(\'aria-expanded\')!==\'true\' && b.getAttribute(\'aria-pressed\')!==\'true\')b.click();\n        return JSON.stringify({sent:true});\n    } catch (_) {return JSON.stringify({sent:false,reason:\'command\'});}\n})\n(\"invoke\","

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerTiles;->kinds:[Ljava/lang/String;

    aget-object v6, v6, p1

    invoke-static {v6}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ");"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lcom/melodix/music/PreviewPlayerTiles$6;

    invoke-direct {v6, p0, v0, v1, p1}, Lcom/melodix/music/PreviewPlayerTiles$6;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JI)V

    invoke-virtual {v4, v5, v6}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 126
    :catch_0
    move-exception v5

    iput-boolean v12, p0, Lcom/melodix/music/PreviewPlayerTiles;->opening:Z

    iget-wide v6, p0, Lcom/melodix/music/PreviewPlayerTiles;->generation:J

    add-long/2addr v6, v10

    iput-wide v6, p0, Lcom/melodix/music/PreviewPlayerTiles;->generation:J

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerTiles;->status:[Ljava/lang/String;

    const-string v6, "unknown"

    aput-object v6, v5, p1

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerTiles;->reasons:[Ljava/lang/String;

    const-string v6, "command"

    aput-object v6, v5, p1

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->paintControls()V

    const-string v5, "Ouverture indisponible. R\u00e9essayer"

    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerTiles;->message(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method private activity()Landroid/app/Activity;
    .locals 4

    .prologue
    .line 51
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getContext()Landroid/content/Context;

    move-result-object v0

    .local v0, "c":Landroid/content/Context;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/16 v3, 0x8

    if-ge v1, v3, :cond_0

    instance-of v3, v0, Landroid/content/ContextWrapper;

    if-nez v3, :cond_1

    .line 54
    :cond_0
    instance-of v3, v0, Landroid/app/Activity;

    if-eqz v3, :cond_3

    check-cast v0, Landroid/app/Activity;

    .end local v0    # "c":Landroid/content/Context;
    :goto_1
    return-object v0

    .line 52
    .restart local v0    # "c":Landroid/content/Context;
    :cond_1
    instance-of v3, v0, Landroid/app/Activity;

    if-eqz v3, :cond_2

    check-cast v0, Landroid/app/Activity;

    goto :goto_1

    :cond_2
    move-object v3, v0

    .line 53
    check-cast v3, Landroid/content/ContextWrapper;

    invoke-virtual {v3}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    .local v2, "n":Landroid/content/Context;
    if-eq v2, v0, :cond_0

    move-object v0, v2

    .line 51
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 54
    .end local v2    # "n":Landroid/content/Context;
    :cond_3
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private dp(F)I
    .locals 2
    .param p1, "x"    # F

    .prologue
    .line 182
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v0, p1

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method private message(Ljava/lang/String;)V
    .locals 2
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 96
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->isShown()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :cond_0
    return-void
.end method

.method private paintControls()V
    .locals 12

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 75
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    const/4 v8, 0x3

    if-lt v2, v8, :cond_0

    .line 84
    return-void

    .line 76
    :cond_0
    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    aget-object v1, v8, v2

    .local v1, "b":Landroid/widget/Button;
    if-nez v1, :cond_1

    .line 75
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 77
    :cond_1
    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerTiles;->status:[Ljava/lang/String;

    aget-object v8, v8, v2

    const-string v9, "available"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 78
    .local v0, "available":Z
    iget-boolean v8, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    if-eqz v8, :cond_2

    if-nez v0, :cond_2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    iget-wide v10, p0, Lcom/melodix/music/PreviewPlayerTiles;->visibleSince:J

    sub-long/2addr v8, v10

    const-wide/16 v10, 0x640

    cmp-long v8, v8, v10

    if-gez v8, :cond_2

    move v5, v6

    .line 79
    .local v5, "loading":Z
    :goto_2
    invoke-virtual {v1, v6}, Landroid/widget/Button;->setEnabled(Z)V

    if-eqz v0, :cond_3

    const/high16 v8, 0x3f800000    # 1.0f

    :goto_3
    invoke-virtual {v1, v8}, Landroid/widget/Button;->setAlpha(F)V

    .line 80
    new-instance v8, Ljava/lang/StringBuilder;

    iget-object v9, p0, Lcom/melodix/music/PreviewPlayerTiles;->icons:[Ljava/lang/String;

    aget-object v9, v9, v2

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v9, "\n"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v9, v9, v2

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    if-eqz v5, :cond_5

    const-string v8, "\u2026"

    :goto_4
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 81
    .local v4, "labelText":Ljava/lang/String;
    new-instance v3, Landroid/text/SpannableString;

    invoke-direct {v3, v4}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .local v3, "label":Landroid/text/SpannableString;
    new-instance v8, Landroid/text/style/RelativeSizeSpan;

    const v9, 0x400ccccd    # 2.2f

    invoke-direct {v8, v9}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    const/16 v9, 0xa

    invoke-virtual {v4, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v9

    const/16 v10, 0x21

    invoke-virtual {v3, v8, v7, v9, v10}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 82
    new-instance v9, Ljava/lang/StringBuilder;

    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v8, v8, v2

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v9, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz v0, :cond_6

    const-string v8, " : disponible"

    :goto_5
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .end local v3    # "label":Landroid/text/SpannableString;
    .end local v4    # "labelText":Ljava/lang/String;
    .end local v5    # "loading":Z
    :cond_2
    move v5, v7

    .line 78
    goto :goto_2

    .line 79
    .restart local v5    # "loading":Z
    :cond_3
    if-eqz v5, :cond_4

    const v8, 0x3f333333    # 0.7f

    goto :goto_3

    :cond_4
    const v8, 0x3ee66666    # 0.45f

    goto :goto_3

    .line 80
    :cond_5
    const-string v8, ""

    goto :goto_4

    .line 82
    .restart local v3    # "label":Landroid/text/SpannableString;
    .restart local v4    # "labelText":Ljava/lang/String;
    :cond_6
    if-eqz v5, :cond_7

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v10, " : chargement, "

    invoke-direct {v8, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v10, p0, Lcom/melodix/music/PreviewPlayerTiles;->reasons:[Ljava/lang/String;

    aget-object v10, v10, v2

    invoke-direct {p0, v10}, Lcom/melodix/music/PreviewPlayerTiles;->reasonText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_5

    :cond_7
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v10, " : indisponible, "

    invoke-direct {v8, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v10, p0, Lcom/melodix/music/PreviewPlayerTiles;->reasons:[Ljava/lang/String;

    aget-object v10, v10, v2

    invoke-direct {p0, v10}, Lcom/melodix/music/PreviewPlayerTiles;->reasonText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v10, " ; disponible quand le contr\u00f4le Spotify est pr\u00e9sent"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_5
.end method

.method private parse(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 3
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 62
    :try_start_0
    new-instance v1, Lorg/json/JSONTokener;

    invoke-direct {v1, p1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v0

    .local v0, "x":Ljava/lang/Object;
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_0

    new-instance v1, Lorg/json/JSONObject;

    check-cast v0, Ljava/lang/String;

    .end local v0    # "x":Ljava/lang/Object;
    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    :goto_0
    return-object v1

    .restart local v0    # "x":Ljava/lang/Object;
    :cond_0
    move-object v1, v2

    .line 62
    goto :goto_0

    .line 63
    .end local v0    # "x":Ljava/lang/Object;
    :catch_0
    move-exception v1

    move-object v1, v2

    goto :goto_0
.end method

.method private probe()V
    .locals 13

    .prologue
    const/4 v12, 0x3

    .line 86
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->web()Landroid/webkit/WebView;

    move-result-object v7

    .local v7, "w":Landroid/webkit/WebView;
    if-nez v7, :cond_2

    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    if-lt v6, v12, :cond_1

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->paintControls()V

    .line 95
    .end local v6    # "i":I
    :cond_0
    :goto_1
    return-void

    .line 86
    .restart local v6    # "i":I
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->status:[Ljava/lang/String;

    const-string v1, "unknown"

    aput-object v1, v0, v6

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->reasons:[Ljava/lang/String;

    const-string v1, "web"

    aput-object v1, v0, v6

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 87
    .end local v6    # "i":I
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    .local v8, "now":J
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->opening:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queryInFlight:Z

    if-eqz v0, :cond_3

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queryStarted:J

    sub-long v0, v8, v0

    const-wide/16 v10, 0x640

    cmp-long v0, v0, v10

    if-ltz v0, :cond_0

    .line 88
    :cond_3
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queryInFlight:Z

    iput-wide v8, p0, Lcom/melodix/music/PreviewPlayerTiles;->queryStarted:J

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->generation:J

    .local v2, "g":J
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->serial:J

    const-wide/16 v10, 0x1

    add-long v4, v0, v10

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerTiles;->serial:J

    .line 89
    .local v4, "seq":J
    :try_start_0
    const-string v10, "(function(action, kind) {\n    \'use strict\';\n    // Probe only existing controls. A click is issued only on an explicit tap.\n    var specs={\n        queue:{ids:/^(control-button-queue|queue-button)$/i, label:/^(queue|play queue|file d\'attente|file de lecture|warteschlange|cola de reproducci\u00f3n|fila de reprodu\u00e7\u00e3o)$/i},\n        lyrics:{ids:/^(lyrics-button|control-button-lyrics)$/i, label:/^(lyrics|show lyrics|paroles|afficher les paroles|songtext|letras|letra)$/i},\n        connect:{ids:/^(connect-button|control-button-connect|connect-device-picker|device-picker)$/i, label:/^(connect to a device|connect to a device\\.\\.\\.|connecter \u00e0 un appareil|se connecter \u00e0 un appareil|mit einem ger\u00e4t verbinden|conectar a un dispositivo|conectar a um dispositivo)$/i}\n    };\n    function status(k) {\n        var spec=specs[k], result={state:\'unavailable\',reason:\'control\'};\n        if(!spec)return result;\n        var nodes=Array.from(document.querySelectorAll(\'button[data-testid], button[aria-label]\')).filter(function(b){\n            return b.isConnected && (spec.ids.test(String(b.getAttribute(\'data-testid\')||\'\')) || spec.label.test(String(b.getAttribute(\'aria-label\')||\'\').trim()));\n        });\n        if(!nodes.length){result.reason=document.readyState===\'loading\'?\'page\':document.querySelector(\'[data-testid=\"now-playing-bar\"], [data-testid=\"now-playing-widget\"], [data-testid=\"player-controls\"]\')?\'control\':\'bar\';return result;}\n        if(nodes.length!==1){result.reason=\'ambiguous\';return result;}\n        var b=nodes[0];\n        if(b.disabled || b.getAttribute(\'aria-disabled\')===\'true\'){result.reason=\'disabled\';return result;}\n        result.state=\'available\';result.reason=\'\';result.button=b;return result;\n    }\n    if(action===\'query\'){\n        var all={};Object.keys(specs).forEach(function(k){var x=status(k);all[k]=x.state;all[k+\'Reason\']=x.reason;});return JSON.stringify(all);\n    }\n    if(action!==\'invoke\')return JSON.stringify({sent:false});\n    var found=status(kind);\n    if(found.state!==\'available\')return JSON.stringify({sent:false,reason:found.reason});\n    try {\n        var b=found.button;\n        // An already-open panel is shown, not toggled closed again.\n        if(b.getAttribute(\'aria-expanded\')!==\'true\' && b.getAttribute(\'aria-pressed\')!==\'true\')b.click();\n        return JSON.stringify({sent:true});\n    } catch (_) {return JSON.stringify({sent:false,reason:\'command\'});}\n})\n(\"query\",\"\");"

    new-instance v0, Lcom/melodix/music/PreviewPlayerTiles$2;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/melodix/music/PreviewPlayerTiles$2;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JJ)V

    invoke-virtual {v7, v10, v0}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 94
    :catch_0
    move-exception v0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->queryInFlight:Z

    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_2
    if-lt v6, v12, :cond_4

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->paintControls()V

    goto :goto_1

    :cond_4
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->status:[Ljava/lang/String;

    const-string v1, "unknown"

    aput-object v1, v0, v6

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->reasons:[Ljava/lang/String;

    const-string v1, "web"

    aput-object v1, v0, v6

    add-int/lit8 v6, v6, 0x1

    goto :goto_2
.end method

.method private reasonText(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "why"    # Ljava/lang/String;

    .prologue
    .line 66
    const-string v0, "page"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "page Spotify en chargement"

    .line 72
    :goto_0
    return-object v0

    .line 67
    :cond_0
    const-string v0, "bar"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "barre du lecteur Spotify absente ; lancer un titre"

    goto :goto_0

    .line 68
    :cond_1
    const-string v0, "control"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "contr\u00f4le Spotify absent ou libell\u00e9 non reconnu"

    goto :goto_0

    .line 69
    :cond_2
    const-string v0, "ambiguous"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "plusieurs contr\u00f4les Spotify possibles"

    goto :goto_0

    .line 70
    :cond_3
    const-string v0, "disabled"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "contr\u00f4le Spotify d\u00e9sactiv\u00e9"

    goto :goto_0

    .line 71
    :cond_4
    const-string v0, "command"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "ouverture non confirm\u00e9e"

    goto :goto_0

    .line 72
    :cond_5
    const-string v0, "page Spotify ou r\u00e9ponse non accessible"

    goto :goto_0
.end method

.method private showWebPanel()V
    .locals 8

    .prologue
    .line 98
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->activity()Landroid/app/Activity;

    move-result-object v0

    .local v0, "a":Landroid/app/Activity;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v6

    if-nez v6, :cond_0

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v6

    if-nez v6, :cond_0

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    if-nez v6, :cond_0

    iget-boolean v6, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    if-eqz v6, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->isShown()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getWindowVisibility()I

    move-result v6

    if-eqz v6, :cond_1

    .line 111
    :cond_0
    :goto_0
    return-void

    .line 99
    :cond_1
    const v6, 0x7f09022f

    invoke-virtual {v0, v6}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .local v4, "root":Landroid/view/View;
    if-eqz v4, :cond_2

    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v6

    if-eqz v6, :cond_3

    :cond_2
    const-string v6, "Ouverture indisponible. R\u00e9essayer"

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerTiles;->message(Ljava/lang/String;)V

    goto :goto_0

    .line 100
    :cond_3
    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v3

    .line 102
    .local v3, "previous":I
    :try_start_0
    new-instance v2, Landroid/app/Dialog;

    invoke-direct {v2, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .local v2, "dialog":Landroid/app/Dialog;
    new-instance v1, Landroid/widget/Button;

    invoke-direct {v1, v0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .local v1, "back":Landroid/widget/Button;
    const-string v6, "Retour au lecteur"

    invoke-virtual {v1, v6}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const-string v6, "Retour au lecteur"

    invoke-virtual {v1, v6}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 103
    new-instance v6, Lcom/melodix/music/PreviewPlayerTiles$3;

    invoke-direct {v6, p0, v2}, Lcom/melodix/music/PreviewPlayerTiles$3;-><init>(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;)V

    invoke-virtual {v1, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 104
    invoke-virtual {v2, v1}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    const/4 v6, 0x0

    invoke-virtual {v2, v6}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 105
    new-instance v6, Lcom/melodix/music/PreviewPlayerTiles$4;

    invoke-direct {v6, p0, v4, v3}, Lcom/melodix/music/PreviewPlayerTiles$4;-><init>(Lcom/melodix/music/PreviewPlayerTiles;Landroid/view/View;I)V

    invoke-virtual {v2, v6}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 106
    iput-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    invoke-virtual {v2}, Landroid/app/Dialog;->show()V

    invoke-virtual {v2}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v5

    .local v5, "window":Landroid/view/Window;
    if-nez v5, :cond_5

    invoke-virtual {v2}, Landroid/app/Dialog;->dismiss()V

    const-string v6, "Ouverture indisponible. R\u00e9essayer"

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerTiles;->message(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 110
    .end local v1    # "back":Landroid/widget/Button;
    .end local v2    # "dialog":Landroid/app/Dialog;
    .end local v5    # "window":Landroid/view/Window;
    :catch_0
    move-exception v6

    invoke-virtual {v4, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    if-eqz v6, :cond_4

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    invoke-virtual {v6}, Landroid/app/Dialog;->dismiss()V

    const/4 v6, 0x0

    iput-object v6, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    :cond_4
    const-string v6, "Ouverture indisponible. R\u00e9essayer"

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerTiles;->message(Ljava/lang/String;)V

    goto :goto_0

    .line 107
    .restart local v1    # "back":Landroid/widget/Button;
    .restart local v2    # "dialog":Landroid/app/Dialog;
    .restart local v5    # "window":Landroid/view/Window;
    :cond_5
    :try_start_1
    new-instance v6, Landroid/graphics/drawable/ColorDrawable;

    const/4 v7, 0x0

    invoke-direct {v6, v7}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v5, v6}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const/4 v6, 0x2

    invoke-virtual {v5, v6}, Landroid/view/Window;->clearFlags(I)V

    .line 108
    const/16 v6, 0x20

    invoke-virtual {v5, v6}, Landroid/view/Window;->addFlags(I)V

    const/4 v6, -0x2

    const/4 v7, -0x2

    invoke-virtual {v5, v6, v7}, Landroid/view/Window;->setLayout(II)V

    const/16 v6, 0x35

    invoke-virtual {v5, v6}, Landroid/view/Window;->setGravity(I)V

    .line 109
    const/16 v6, 0x8

    invoke-virtual {v4, v6}, Landroid/view/View;->setVisibility(I)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method private syncVolume()V
    .locals 8

    .prologue
    const-wide/16 v6, 0x1

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 145
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->isAttachedToWindow()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->isShown()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getWindowVisibility()I

    move-result v4

    if-nez v4, :cond_1

    move v1, v2

    .line 146
    .local v1, "show":Z
    :goto_0
    if-eqz v1, :cond_2

    iget-boolean v4, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    if-nez v4, :cond_2

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->visibleSince:J

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->updateVolume()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->paintControls()V

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeTick:Ljava/lang/Runnable;

    invoke-virtual {p0, v2}, Lcom/melodix/music/PreviewPlayerTiles;->post(Ljava/lang/Runnable;)Z

    .line 148
    :cond_0
    :goto_1
    return-void

    .end local v1    # "show":Z
    :cond_1
    move v1, v3

    .line 145
    goto :goto_0

    .line 147
    .restart local v1    # "show":Z
    :cond_2
    if-nez v1, :cond_0

    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    if-eqz v2, :cond_0

    iput-boolean v3, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeTick:Ljava/lang/Runnable;

    invoke-virtual {p0, v2}, Lcom/melodix/music/PreviewPlayerTiles;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerTiles;->generation:J

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerTiles;->generation:J

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerTiles;->serial:J

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerTiles;->serial:J

    iput-boolean v3, p0, Lcom/melodix/music/PreviewPlayerTiles;->queryInFlight:Z

    iput-boolean v3, p0, Lcom/melodix/music/PreviewPlayerTiles;->opening:Z

    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    const/4 v2, 0x3

    if-lt v0, v2, :cond_3

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->paintControls()V

    goto :goto_1

    :cond_3
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->status:[Ljava/lang/String;

    const-string v3, "unknown"

    aput-object v3, v2, v0

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->reasons:[Ljava/lang/String;

    const-string v3, "web"

    aput-object v3, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method

.method private updateVolume()V
    .locals 14

    .prologue
    const v13, 0x3ee66666    # 0.45f

    const/4 v12, 0x0

    .line 129
    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeButton:Landroid/widget/Button;

    if-nez v8, :cond_0

    .line 143
    :goto_0
    return-void

    .line 131
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getContext()Landroid/content/Context;

    move-result-object v8

    const-string v9, "audio"

    invoke-virtual {v8, v9}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 132
    .local v5, "svc":Ljava/lang/Object;
    instance-of v8, v5, Landroid/media/AudioManager;

    if-nez v8, :cond_1

    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeButton:Landroid/widget/Button;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeButton:Landroid/widget/Button;

    const v9, 0x3ee66666    # 0.45f

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setAlpha(F)V

    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeButton:Landroid/widget/Button;

    const-string v9, "Volume du t\u00e9l\u00e9phone indisponible"

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 142
    .end local v5    # "svc":Ljava/lang/Object;
    :catch_0
    move-exception v8

    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeButton:Landroid/widget/Button;

    invoke-virtual {v8, v12}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeButton:Landroid/widget/Button;

    invoke-virtual {v8, v13}, Landroid/widget/Button;->setAlpha(F)V

    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeButton:Landroid/widget/Button;

    const-string v9, "Volume du t\u00e9l\u00e9phone indisponible"

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 133
    .restart local v5    # "svc":Ljava/lang/Object;
    :cond_1
    :try_start_1
    move-object v0, v5

    check-cast v0, Landroid/media/AudioManager;

    move-object v1, v0

    .line 134
    .local v1, "audio":Landroid/media/AudioManager;
    const/4 v8, 0x3

    invoke-virtual {v1, v8}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v3

    .local v3, "max":I
    const/4 v8, 0x3

    invoke-virtual {v1, v8}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v7

    .line 135
    .local v7, "value":I
    if-gtz v3, :cond_2

    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeButton:Landroid/widget/Button;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeButton:Landroid/widget/Button;

    const v9, 0x3ee66666    # 0.45f

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setAlpha(F)V

    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeButton:Landroid/widget/Button;

    const-string v9, "Volume du t\u00e9l\u00e9phone indisponible"

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 136
    :cond_2
    const/4 v8, 0x0

    const/16 v9, 0x64

    int-to-float v10, v7

    const/high16 v11, 0x42c80000    # 100.0f

    mul-float/2addr v10, v11

    int-to-float v11, v3

    div-float/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v10

    invoke-static {v9, v10}, Ljava/lang/Math;->min(II)I

    move-result v9

    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 137
    .local v4, "percent":I
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "\u25d6))\nVolume "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " %"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 138
    .local v6, "text":Ljava/lang/String;
    new-instance v2, Landroid/text/SpannableString;

    invoke-direct {v2, v6}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 139
    .local v2, "label":Landroid/text/SpannableString;
    new-instance v8, Landroid/text/style/RelativeSizeSpan;

    const v9, 0x400ccccd    # 2.2f

    invoke-direct {v8, v9}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    const/4 v9, 0x0

    const/16 v10, 0xa

    invoke-virtual {v6, v10}, Ljava/lang/String;->indexOf(I)I

    move-result v10

    const/16 v11, 0x21

    invoke-virtual {v2, v8, v9, v10, v11}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 140
    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeButton:Landroid/widget/Button;

    invoke-virtual {v8, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeButton:Landroid/widget/Button;

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "Volume du t\u00e9l\u00e9phone : "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " pour cent"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 141
    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeButton:Landroid/widget/Button;

    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeButton:Landroid/widget/Button;

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setAlpha(F)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method private web()Landroid/webkit/WebView;
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 57
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->activity()Landroid/app/Activity;

    move-result-object v0

    .local v0, "a":Landroid/app/Activity;
    if-nez v0, :cond_0

    .line 59
    :goto_0
    return-object v2

    .line 58
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "G"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .local v1, "w":Ljava/lang/Object;
    instance-of v3, v1, Landroid/webkit/WebView;

    if-eqz v3, :cond_1

    check-cast v1, Landroid/webkit/WebView;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v1    # "w":Ljava/lang/Object;
    :goto_1
    move-object v2, v1

    goto :goto_0

    .restart local v1    # "w":Ljava/lang/Object;
    :cond_1
    move-object v1, v2

    goto :goto_1

    .line 59
    .end local v1    # "w":Ljava/lang/Object;
    :catch_0
    move-exception v3

    goto :goto_0
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 0

    .prologue
    .line 149
    invoke-super {p0}, Landroid/widget/LinearLayout;->onAttachedToWindow()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->syncVolume()V

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x1

    const/4 v2, 0x0

    .line 150
    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeTick:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->generation:J

    add-long/2addr v0, v4

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->generation:J

    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->serial:J

    add-long/2addr v0, v4

    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->serial:J

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->queryInFlight:Z

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->opening:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    :cond_0
    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    return-void
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;
    .param p2, "visibility"    # I

    .prologue
    .line 151
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onVisibilityChanged(Landroid/view/View;I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeTick:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/melodix/music/PreviewPlayerTiles$7;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerTiles$7;-><init>(Lcom/melodix/music/PreviewPlayerTiles;)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method protected onWindowVisibilityChanged(I)V
    .locals 1
    .param p1, "visibility"    # I

    .prologue
    .line 152
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onWindowVisibilityChanged(I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeTick:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/melodix/music/PreviewPlayerTiles$8;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerTiles$8;-><init>(Lcom/melodix/music/PreviewPlayerTiles;)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method
