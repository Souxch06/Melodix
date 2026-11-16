.class public final Lcom/melodix/music/PreviewPlayerTiles;
.super Landroid/widget/LinearLayout;
.source "PreviewPlayerTiles.java"


# static fields
.field private static final PANEL_PROBE:Ljava/lang/String; = "(function(kind) {\n    \'use strict\';\n    // Observation only. Never open a panel, navigate, click, or read its text.\n    // Fixed categories and bounded counts only; no arbitrary testids or labels.\n    var selectors={\n        queue:\'[data-testid=\"queue-page\"], [data-testid=\"queue-view\"]\',\n        lyrics:\'[data-testid=\"lyrics-page\"], [data-testid=\"lyrics-lyricsContent\"], [data-testid=\"lyrics-container\"]\',\n        devices:\'[data-testid=\"device-picker\"], [data-testid=\"connect-device-list\"]\'\n    };\n    if(!Object.prototype.hasOwnProperty.call(selectors,kind))return JSON.stringify({reason:\'kind\',roots:0,rows:0,buttons:0,roles:0,testids:0});\n    var roots=Array.from(document.querySelectorAll(selectors[kind])).filter(function(n){return n.isConnected;});\n    var nodes=[];roots.forEach(function(r){Array.from(r.querySelectorAll(\'[role], [data-testid], button\')).forEach(function(n){if(nodes.indexOf(n)<0)nodes.push(n);});});\n    function count(test){return Math.min(99,nodes.filter(test).length);}\n    return JSON.stringify({reason:roots.length?\'observed\':\'absent\',roots:Math.min(roots.length,99),\n        rows:count(function(n){return n.getAttribute(\'role\')===\'listitem\'||/^(queue-tracklist-row|device-list-item|lyrics-line)$/.test(n.getAttribute(\'data-testid\')||\'\');}),\n        buttons:count(function(n){return n.tagName===\'BUTTON\'||n.getAttribute(\'role\')===\'button\';}),\n        roles:count(function(n){return n.hasAttribute(\'role\');}),testids:count(function(n){return n.hasAttribute(\'data-testid\');})});\n})\n"

.field private static final PANEL_READ:Ljava/lang/String; = "(function(kind) {\n    \'use strict\';\n    // Read only a uniquely recognised panel already present in the page.\n    // Never open a panel, issue a command, access session data or navigate.\n    var selectors={\n        queue:\'[data-testid=\"queue-page\"], [data-testid=\"queue-view\"]\',\n        lyrics:\'[data-testid=\"lyrics-lyricsContent\"]\',\n        devices:\'[data-testid=\"device-picker\"], [data-testid=\"connect-device-list\"]\'\n    };\n    if(!Object.prototype.hasOwnProperty.call(selectors,kind))return JSON.stringify({ok:false,reason:\'unsupported\'});\n    var roots=Array.from(document.querySelectorAll(selectors[kind])).filter(function(n){return n.isConnected;});\n    if(roots.length!==1)return JSON.stringify({ok:false,reason:roots.length?\'ambiguous\':\'absent\'});\n    var root=roots[0], lines=[];\n    function text(n){return String(n&&n.textContent||\'\').replace(/\\s+/g,\' \').trim().slice(0,300);}\n    if(kind===\'lyrics\'){\n        Array.from(root.querySelectorAll(\'p, [data-testid=\"lyrics-line\"]\')).slice(0,100).forEach(function(n){var t=text(n);if(t)lines.push(t);});\n    }else if(kind===\'queue\'){\n        Array.from(root.querySelectorAll(\'[data-testid=\"queue-tracklist-row\"]\')).slice(0,60).forEach(function(n){\n            var title=text(n.querySelector(\'[data-testid=\"track-title\"], [data-testid=\"context-item-info-title\"]\'));\n            var artist=text(n.querySelector(\'[data-testid=\"track-artist\"], [data-testid=\"context-item-info-artist\"]\'));\n            if(title)lines.push(title+(artist?\' \u2014 \'+artist:\'\'));\n        });\n    }else{\n        Array.from(root.querySelectorAll(\'[data-testid=\"device-list-item\"]\')).slice(0,30).forEach(function(n){\n            var name=text(n.querySelector(\'[data-testid=\"device-name\"]\'));if(name)lines.push(name+(n.getAttribute(\'aria-selected\')===\'true\'?\' \u00b7 Actif\':\'\'));\n        });\n    }\n    if(!lines.length)return JSON.stringify({ok:false,reason:\'unreadable\'});\n    return JSON.stringify({ok:true,body:lines.join(\'\\n\').slice(0,8000)});\n})\n"

.field private static final observations:[Ljava/lang/String;

.field private static final probeSerial:[J


# instance fields
.field private final controls:[Landroid/widget/Button;

.field private final icons:[Ljava/lang/String;

.field private lastAction:J

.field private final names:[Ljava/lang/String;

.field private readSerial:J

.field private volumeRunning:Z

.field private webDialog:Landroid/app/Dialog;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x3

    .line 35
    new-array v0, v3, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "non observ\u00e9e"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "non observ\u00e9e"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "non observ\u00e9e"

    aput-object v2, v0, v1

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->observations:[Ljava/lang/String;

    .line 36
    new-array v0, v3, [J

    sput-object v0, Lcom/melodix/music/PreviewPlayerTiles;->probeSerial:[J

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 12

    .prologue
    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v11, 0x0

    const/4 v10, 0x1

    const/4 v9, 0x3

    const/4 v1, 0x0

    .line 133
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 82
    new-array v0, v9, [Ljava/lang/String;

    const-string v2, "File"

    aput-object v2, v0, v1

    const-string v2, "Paroles"

    aput-object v2, v0, v10

    const/4 v2, 0x2

    const-string v3, "Appareils"

    aput-object v3, v0, v2

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    .line 83
    new-array v0, v9, [Ljava/lang/String;

    const-string v2, "\u2630"

    aput-object v2, v0, v1

    const-string v2, "\u266c"

    aput-object v2, v0, v10

    const/4 v2, 0x2

    const-string v3, "\u25a3"

    aput-object v3, v0, v2

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->icons:[Ljava/lang/String;

    .line 84
    new-array v0, v9, [Landroid/widget/Button;

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    .line 86
    const-wide/16 v2, -0x3e8

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->lastAction:J

    .line 133
    invoke-virtual {p0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->setOrientation(I)V

    const/16 v0, 0x11

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->setGravity(I)V

    .line 134
    const/4 v0, 0x4

    new-array v5, v0, [Ljava/lang/String;

    const-string v0, "\u2630\nFile"

    aput-object v0, v5, v1

    const-string v0, "\u266c\nParoles"

    aput-object v0, v5, v10

    const/4 v0, 0x2

    const-string v2, "\u25a3\nAppareils"

    aput-object v2, v5, v0

    const-string v0, "\u25d6))\nVolume"

    aput-object v0, v5, v9

    move v0, v1

    .line 135
    :goto_0
    array-length v2, v5

    if-lt v0, v2, :cond_0

    .line 150
    return-void

    .line 136
    :cond_0
    if-ne v0, v9, :cond_4

    new-instance v2, Lcom/melodix/music/PreviewPlayerVolume;

    invoke-direct {v2, p1}, Lcom/melodix/music/PreviewPlayerVolume;-><init>(Landroid/content/Context;)V

    .line 137
    :goto_1
    new-instance v3, Landroid/text/SpannableString;

    aget-object v6, v5, v0

    invoke-direct {v3, v6}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 138
    new-instance v6, Landroid/text/style/RelativeSizeSpan;

    const v7, 0x400ccccd    # 2.2f

    invoke-direct {v6, v7}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    aget-object v7, v5, v0

    const/16 v8, 0xa

    invoke-virtual {v7, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    const/16 v8, 0x21

    invoke-virtual {v3, v6, v1, v7, v8}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 139
    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/high16 v3, 0x41200000    # 10.0f

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setTextSize(F)V

    const v3, -0x4b513b

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setTextColor(I)V

    .line 140
    invoke-virtual {v2, v1}, Landroid/widget/Button;->setAllCaps(Z)V

    invoke-virtual {v2, v1}, Landroid/widget/Button;->setSingleLine(Z)V

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setMaxLines(I)V

    const/high16 v3, 0x40000000    # 2.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v3

    const/high16 v6, 0x40800000    # 4.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v6

    const/high16 v7, 0x40000000    # 2.0f

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v7

    const/high16 v8, 0x40800000    # 4.0f

    invoke-direct {p0, v8}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v8

    invoke-virtual {v2, v3, v6, v7, v8}, Landroid/widget/Button;->setPadding(IIII)V

    invoke-virtual {v2, v1}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-virtual {v2, v1}, Landroid/widget/Button;->setMinimumWidth(I)V

    const/high16 v3, 0x42600000    # 56.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 141
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v6, 0x14ffffff

    invoke-virtual {v3, v6}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v6, 0x41900000    # 18.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v3, v6}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v6

    const v7, 0x1fffffff

    invoke-virtual {v3, v6, v7}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 142
    invoke-virtual {v2, v11}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v2, v11}, Landroid/widget/Button;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    const/4 v6, 0x0

    invoke-virtual {v2, v6}, Landroid/widget/Button;->setElevation(F)V

    const/4 v6, 0x0

    invoke-virtual {v2, v6}, Landroid/widget/Button;->setTranslationZ(F)V

    invoke-virtual {v2, v11}, Landroid/widget/Button;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 143
    new-instance v6, Landroid/graphics/drawable/RippleDrawable;

    const v7, 0x447b3fe4

    invoke-static {v7}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v7

    invoke-direct {v6, v7, v3, v11}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v2, v6}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 144
    if-ne v0, v9, :cond_5

    const-string v3, "Volume du lecteur indisponible"

    :goto_2
    invoke-virtual {v2, v3}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 145
    if-ge v0, v9, :cond_1

    invoke-virtual {v2, v10}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_1
    if-ne v0, v9, :cond_6

    move v3, v4

    :goto_3
    invoke-virtual {v2, v3}, Landroid/widget/Button;->setAlpha(F)V

    invoke-virtual {v2, v1}, Landroid/widget/Button;->setSelected(Z)V

    invoke-virtual {v2, v1}, Landroid/widget/Button;->setActivated(Z)V

    .line 146
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    iget v3, v3, Landroid/content/res/Configuration;->fontScale:F

    const v7, 0x3fa66666    # 1.3f

    cmpl-float v3, v3, v7

    if-lez v3, :cond_7

    const/4 v3, -0x2

    :goto_4
    invoke-direct {v6, v1, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    if-lez v0, :cond_2

    const/high16 v3, 0x41000000    # 8.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v3

    iput v3, v6, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    :cond_2
    invoke-virtual {p0, v2, v6}, Lcom/melodix/music/PreviewPlayerTiles;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 147
    if-ge v0, v9, :cond_3

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    aput-object v2, v3, v0

    new-instance v3, Lcom/melodix/music/PreviewPlayerTiles$9;

    invoke-direct {v3, p0, v0}, Lcom/melodix/music/PreviewPlayerTiles$9;-><init>(Lcom/melodix/music/PreviewPlayerTiles;I)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 135
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    .line 136
    :cond_4
    new-instance v2, Landroid/widget/Button;

    invoke-direct {v2, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    goto/16 :goto_1

    .line 144
    :cond_5
    new-instance v3, Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v6, v6, v0

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, " : indisponible, page Spotify non accessible"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_2

    .line 145
    :cond_6
    const v3, 0x3f4ccccd    # 0.8f

    goto :goto_3

    .line 146
    :cond_7
    const/high16 v3, 0x42600000    # 56.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v3

    goto :goto_4
.end method

.method static synthetic access$0()[J
    .locals 1

    .prologue
    .line 36
    sget-object v0, Lcom/melodix/music/PreviewPlayerTiles;->probeSerial:[J

    return-object v0
.end method

.method static synthetic access$1()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    sget-object v0, Lcom/melodix/music/PreviewPlayerTiles;->observations:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$10(Lcom/melodix/music/PreviewPlayerTiles;I)V
    .locals 0

    .prologue
    .line 104
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->activate(I)V

    return-void
.end method

.method static synthetic access$2(Lorg/json/JSONObject;Ljava/lang/String;)I
    .locals 1

    .prologue
    .line 38
    invoke-static {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->count(Lorg/json/JSONObject;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method static synthetic access$3(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 2

    .prologue
    .line 59
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->readSerial:J

    return-wide v0
.end method

.method static synthetic access$4(Lcom/melodix/music/PreviewPlayerTiles;)Landroid/app/Dialog;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    return-object v0
.end method

.method static synthetic access$5(Lcom/melodix/music/PreviewPlayerTiles;J)V
    .locals 1

    .prologue
    .line 59
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->readSerial:J

    return-void
.end method

.method static synthetic access$6(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;)V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0, p1, p2}, Lcom/melodix/music/PreviewPlayerTiles;->probe(ILandroid/app/Activity;)V

    return-void
.end method

.method static synthetic access$7(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/TextView;)V
    .locals 0

    .prologue
    .line 60
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/melodix/music/PreviewPlayerTiles;->readPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/TextView;)V

    return-void
.end method

.method static synthetic access$8(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;)V
    .locals 0

    .prologue
    .line 85
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    return-void
.end method

.method static synthetic access$9(Lcom/melodix/music/PreviewPlayerTiles;)V
    .locals 0

    .prologue
    .line 124
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->syncVolume()V

    return-void
.end method

.method private activate(I)V
    .locals 8

    .prologue
    .line 105
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->activity()Landroid/app/Activity;

    move-result-object v3

    .line 106
    iget-boolean v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->isShown()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getWindowVisibility()I

    move-result v2

    if-nez v2, :cond_0

    if-eqz v3, :cond_0

    invoke-virtual {v3}, Landroid/app/Activity;->isFinishing()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v3}, Landroid/app/Activity;->isDestroyed()Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    if-nez v2, :cond_0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerTiles;->lastAction:J

    sub-long v4, v0, v4

    const-wide/16 v6, 0x190

    cmp-long v2, v4, v6

    if-gez v2, :cond_1

    .line 123
    :cond_0
    :goto_0
    return-void

    .line 107
    :cond_1
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->lastAction:J

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    aget-object v0, v0, p1

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/widget/Button;->performHapticFeedback(I)Z

    invoke-direct {p0, p1, v3}, Lcom/melodix/music/PreviewPlayerTiles;->probe(ILandroid/app/Activity;)V

    .line 109
    :try_start_0
    new-instance v4, Landroid/app/Dialog;

    invoke-direct {v4, v3}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 110
    new-instance v6, Landroid/widget/LinearLayout;

    invoke-direct {v6, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    invoke-virtual {v6, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v0, 0x41a00000    # 20.0f

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v0

    const/high16 v1, 0x41400000    # 12.0f

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v1

    const/high16 v2, 0x41a00000    # 20.0f

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    const/high16 v5, 0x41c00000    # 24.0f

    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    invoke-virtual {v6, v0, v1, v2, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 111
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v1, -0x14e8f4cd

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v1

    const v2, 0x1fffffff

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    const/high16 v1, 0x41e00000    # 28.0f

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {v6, v0}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 112
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v1, "\u2501\u2501\u2501\u2501"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v1, -0x66000001

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/high16 v5, 0x41c00000    # 24.0f

    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    invoke-direct {v1, v2, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 113
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v1, v1, p1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v1, 0x41a00000    # 20.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/high16 v5, 0x42400000    # 48.0f

    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    invoke-direct {v1, v2, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 114
    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, v3}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v1, "Chargement\u2026"

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v1, -0x272f18

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v1, 0x41800000    # 16.0f

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v0, v5}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/high16 v7, 0x43480000    # 200.0f

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v7

    invoke-direct {v1, v2, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 115
    new-instance v7, Landroid/widget/Button;

    invoke-direct {v7, v3}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v0, "R\u00e9essayer"

    invoke-virtual {v7, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/high16 v0, 0x42400000    # 48.0f

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v0

    invoke-virtual {v7, v0}, Landroid/widget/Button;->setMinimumHeight(I)V

    new-instance v0, Lcom/melodix/music/PreviewPlayerTiles$4;

    move-object v1, p0

    move v2, p1

    invoke-direct/range {v0 .. v5}, Lcom/melodix/music/PreviewPlayerTiles$4;-><init>(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/TextView;)V

    invoke-virtual {v7, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/high16 v2, 0x42400000    # 48.0f

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v7, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 116
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, v3}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v1, "Fermer"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Fermer "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v2, v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    const/high16 v1, 0x42400000    # 48.0f

    invoke-direct {p0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 117
    new-instance v1, Lcom/melodix/music/PreviewPlayerTiles$5;

    invoke-direct {v1, p0, v4}, Lcom/melodix/music/PreviewPlayerTiles$5;-><init>(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/high16 v7, 0x42400000    # 48.0f

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v7

    invoke-direct {v1, v2, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v6, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 118
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v0, v0, p1

    invoke-virtual {v4, v0}, Landroid/app/Dialog;->setTitle(Ljava/lang/CharSequence;)V

    invoke-virtual {v4, v6}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    const/4 v0, 0x1

    invoke-virtual {v4, v0}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 119
    new-instance v0, Lcom/melodix/music/PreviewPlayerTiles$6;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerTiles$6;-><init>(Lcom/melodix/music/PreviewPlayerTiles;)V

    invoke-virtual {v4, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 120
    iput-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    invoke-virtual {v4}, Landroid/app/Dialog;->show()V

    invoke-virtual {v4}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_3

    invoke-virtual {v4}, Landroid/app/Dialog;->dismiss()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 122
    :catch_0
    move-exception v0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    :cond_2
    const-string v0, "Indisponible dans cette version"

    invoke-direct {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->message(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 121
    :cond_3
    :try_start_1
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const/16 v1, 0x50

    invoke-virtual {v0, v1}, Landroid/view/Window;->setGravity(I)V

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-virtual {v0, v1, v2}, Landroid/view/Window;->setLayout(II)V

    invoke-direct {p0, p1, v3, v4, v5}, Lcom/melodix/music/PreviewPlayerTiles;->readPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/TextView;)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method private activity()Landroid/app/Activity;
    .locals 4

    .prologue
    .line 89
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    const/16 v1, 0x8

    if-ge v2, v1, :cond_0

    instance-of v1, v0, Landroid/content/ContextWrapper;

    if-nez v1, :cond_1

    .line 92
    :cond_0
    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_3

    check-cast v0, Landroid/app/Activity;

    :goto_1
    return-object v0

    .line 90
    :cond_1
    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_2

    check-cast v0, Landroid/app/Activity;

    goto :goto_1

    :cond_2
    move-object v1, v0

    .line 91
    check-cast v1, Landroid/content/ContextWrapper;

    invoke-virtual {v1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    if-eq v3, v0, :cond_0

    .line 89
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    move-object v0, v3

    goto :goto_0

    .line 92
    :cond_3
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private static count(Lorg/json/JSONObject;Ljava/lang/String;)I
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 38
    const/16 v0, 0x63

    invoke-virtual {p0, p1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method public static diagnosticReport()Ljava/lang/String;
    .locals 3

    .prologue
    .line 37
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\nStructure File : "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/melodix/music/PreviewPlayerTiles;->observations:[Ljava/lang/String;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nStructure Paroles : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerTiles;->observations:[Ljava/lang/String;

    const/4 v2, 0x1

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nStructure Appareils : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/melodix/music/PreviewPlayerTiles;->observations:[Ljava/lang/String;

    const/4 v2, 0x2

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private dp(F)I
    .locals 2

    .prologue
    .line 151
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

    .prologue
    .line 103
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
    .locals 7

    .prologue
    const/4 v1, 0x0

    .line 95
    move v0, v1

    :goto_0
    const/4 v2, 0x3

    if-lt v0, v2, :cond_0

    .line 102
    return-void

    .line 96
    :cond_0
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    aget-object v2, v2, v0

    if-nez v2, :cond_1

    .line 95
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 97
    :cond_1
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setEnabled(Z)V

    const v3, 0x3f4ccccd    # 0.8f

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setAlpha(F)V

    .line 98
    new-instance v3, Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles;->icons:[Ljava/lang/String;

    aget-object v4, v4, v0

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v4, v4, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 99
    new-instance v4, Landroid/text/SpannableString;

    invoke-direct {v4, v3}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    new-instance v5, Landroid/text/style/RelativeSizeSpan;

    const v6, 0x400ccccd    # 2.2f

    invoke-direct {v5, v6}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    const/16 v6, 0xa

    invoke-virtual {v3, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    const/16 v6, 0x21

    invoke-virtual {v4, v5, v1, v3, v6}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 100
    new-instance v3, Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v4, v4, v0

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " : consulter si disponible"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_1
.end method

.method private probe(ILandroid/app/Activity;)V
    .locals 6

    .prologue
    .line 40
    if-nez p1, :cond_0

    const-string v0, "queue"

    move-object v1, v0

    :goto_0
    sget-object v0, Lcom/melodix/music/PreviewPlayerTiles;->probeSerial:[J

    aget-wide v2, v0, p1

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    aput-wide v2, v0, p1

    .line 42
    :try_start_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v4, "G"

    invoke-virtual {v0, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 43
    instance-of v4, v0, Landroid/webkit/WebView;

    if-nez v4, :cond_2

    sget-object v0, Lcom/melodix/music/PreviewPlayerTiles;->observations:[Ljava/lang/String;

    const-string v1, "page inaccessible"

    aput-object v1, v0, p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    :goto_1
    return-void

    .line 40
    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    const-string v0, "lyrics"

    move-object v1, v0

    goto :goto_0

    :cond_1
    const-string v0, "devices"

    move-object v1, v0

    goto :goto_0

    .line 44
    :cond_2
    :try_start_1
    check-cast v0, Landroid/webkit/WebView;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "((function(kind) {\n    \'use strict\';\n    // Observation only. Never open a panel, navigate, click, or read its text.\n    // Fixed categories and bounded counts only; no arbitrary testids or labels.\n    var selectors={\n        queue:\'[data-testid=\"queue-page\"], [data-testid=\"queue-view\"]\',\n        lyrics:\'[data-testid=\"lyrics-page\"], [data-testid=\"lyrics-lyricsContent\"], [data-testid=\"lyrics-container\"]\',\n        devices:\'[data-testid=\"device-picker\"], [data-testid=\"connect-device-list\"]\'\n    };\n    if(!Object.prototype.hasOwnProperty.call(selectors,kind))return JSON.stringify({reason:\'kind\',roots:0,rows:0,buttons:0,roles:0,testids:0});\n    var roots=Array.from(document.querySelectorAll(selectors[kind])).filter(function(n){return n.isConnected;});\n    var nodes=[];roots.forEach(function(r){Array.from(r.querySelectorAll(\'[role], [data-testid], button\')).forEach(function(n){if(nodes.indexOf(n)<0)nodes.push(n);});});\n    function count(test){return Math.min(99,nodes.filter(test).length);}\n    return JSON.stringify({reason:roots.length?\'observed\':\'absent\',roots:Math.min(roots.length,99),\n        rows:count(function(n){return n.getAttribute(\'role\')===\'listitem\'||/^(queue-tracklist-row|device-list-item|lyrics-line)$/.test(n.getAttribute(\'data-testid\')||\'\');}),\n        buttons:count(function(n){return n.tagName===\'BUTTON\'||n.getAttribute(\'role\')===\'button\';}),\n        roles:count(function(n){return n.hasAttribute(\'role\');}),testids:count(function(n){return n.hasAttribute(\'data-testid\');})});\n})\n)("

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, ");"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v4, Lcom/melodix/music/PreviewPlayerTiles$1;

    invoke-direct {v4, p0, v2, v3, p1}, Lcom/melodix/music/PreviewPlayerTiles$1;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JI)V

    invoke-virtual {v0, v1, v4}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 57
    :catch_0
    move-exception v0

    sget-object v0, Lcom/melodix/music/PreviewPlayerTiles;->observations:[Ljava/lang/String;

    const-string v1, "page inaccessible"

    aput-object v1, v0, p1

    goto :goto_1
.end method

.method private readPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/TextView;)V
    .locals 10

    .prologue
    .line 61
    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->readSerial:J

    const-wide/16 v4, 0x1

    add-long/2addr v4, v2

    iput-wide v4, p0, Lcom/melodix/music/PreviewPlayerTiles;->readSerial:J

    if-nez p1, :cond_0

    const-string v2, "queue"

    move-object v3, v2

    .line 62
    :goto_0
    const-string v2, "Chargement\u2026"

    invoke-virtual {p4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    :try_start_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v6, "G"

    invoke-virtual {v2, v6}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 65
    instance-of v6, v2, Landroid/webkit/WebView;

    if-nez v6, :cond_2

    const-string v2, "Indisponible dans cette version"

    invoke-virtual {p4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    :goto_1
    return-void

    .line 61
    :cond_0
    const/4 v2, 0x1

    if-ne p1, v2, :cond_1

    const-string v2, "lyrics"

    move-object v3, v2

    goto :goto_0

    :cond_1
    const-string v2, "devices"

    move-object v3, v2

    goto :goto_0

    .line 66
    :cond_2
    :try_start_1
    move-object v0, v2

    check-cast v0, Landroid/webkit/WebView;

    move-object v8, v0

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v6, "((function(kind) {\n    \'use strict\';\n    // Read only a uniquely recognised panel already present in the page.\n    // Never open a panel, issue a command, access session data or navigate.\n    var selectors={\n        queue:\'[data-testid=\"queue-page\"], [data-testid=\"queue-view\"]\',\n        lyrics:\'[data-testid=\"lyrics-lyricsContent\"]\',\n        devices:\'[data-testid=\"device-picker\"], [data-testid=\"connect-device-list\"]\'\n    };\n    if(!Object.prototype.hasOwnProperty.call(selectors,kind))return JSON.stringify({ok:false,reason:\'unsupported\'});\n    var roots=Array.from(document.querySelectorAll(selectors[kind])).filter(function(n){return n.isConnected;});\n    if(roots.length!==1)return JSON.stringify({ok:false,reason:roots.length?\'ambiguous\':\'absent\'});\n    var root=roots[0], lines=[];\n    function text(n){return String(n&&n.textContent||\'\').replace(/\\s+/g,\' \').trim().slice(0,300);}\n    if(kind===\'lyrics\'){\n        Array.from(root.querySelectorAll(\'p, [data-testid=\"lyrics-line\"]\')).slice(0,100).forEach(function(n){var t=text(n);if(t)lines.push(t);});\n    }else if(kind===\'queue\'){\n        Array.from(root.querySelectorAll(\'[data-testid=\"queue-tracklist-row\"]\')).slice(0,60).forEach(function(n){\n            var title=text(n.querySelector(\'[data-testid=\"track-title\"], [data-testid=\"context-item-info-title\"]\'));\n            var artist=text(n.querySelector(\'[data-testid=\"track-artist\"], [data-testid=\"context-item-info-artist\"]\'));\n            if(title)lines.push(title+(artist?\' \u2014 \'+artist:\'\'));\n        });\n    }else{\n        Array.from(root.querySelectorAll(\'[data-testid=\"device-list-item\"]\')).slice(0,30).forEach(function(n){\n            var name=text(n.querySelector(\'[data-testid=\"device-name\"]\'));if(name)lines.push(name+(n.getAttribute(\'aria-selected\')===\'true\'?\' \u00b7 Actif\':\'\'));\n        });\n    }\n    if(!lines.length)return JSON.stringify({ok:false,reason:\'unreadable\'});\n    return JSON.stringify({ok:true,body:lines.join(\'\\n\').slice(0,8000)});\n})\n)("

    invoke-direct {v2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v3}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ");"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    new-instance v2, Lcom/melodix/music/PreviewPlayerTiles$2;

    move-object v3, p0

    move-object v6, p3

    move-object v7, p4

    invoke-direct/range {v2 .. v7}, Lcom/melodix/music/PreviewPlayerTiles$2;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/widget/TextView;)V

    invoke-virtual {v8, v9, v2}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 79
    new-instance v2, Lcom/melodix/music/PreviewPlayerTiles$3;

    move-object v3, p0

    move-object v6, p3

    move-object v7, p4

    invoke-direct/range {v2 .. v7}, Lcom/melodix/music/PreviewPlayerTiles$3;-><init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;Landroid/widget/TextView;)V

    const-wide/16 v4, 0xdac

    invoke-virtual {p0, v2, v4, v5}, Lcom/melodix/music/PreviewPlayerTiles;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 80
    :catch_0
    move-exception v2

    const-string v2, "Indisponible dans cette version"

    invoke-virtual {p4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1
.end method

.method private syncVolume()V
    .locals 1

    .prologue
    .line 125
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->isShown()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getWindowVisibility()I

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    .line 126
    :goto_0
    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->webDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    :cond_0
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->paintControls()V

    .line 127
    return-void

    .line 125
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 0

    .prologue
    .line 128
    invoke-super {p0}, Landroid/widget/LinearLayout;->onAttachedToWindow()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->syncVolume()V

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 129
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

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

    .prologue
    .line 130
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onVisibilityChanged(Landroid/view/View;I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/melodix/music/PreviewPlayerTiles$7;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerTiles$7;-><init>(Lcom/melodix/music/PreviewPlayerTiles;)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method protected onWindowVisibilityChanged(I)V
    .locals 1

    .prologue
    .line 131
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onWindowVisibilityChanged(I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->controls:[Landroid/widget/Button;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/melodix/music/PreviewPlayerTiles$8;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerTiles$8;-><init>(Lcom/melodix/music/PreviewPlayerTiles;)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method
