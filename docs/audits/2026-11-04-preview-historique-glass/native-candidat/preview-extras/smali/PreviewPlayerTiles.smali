.class public final Lcom/melodix/music/PreviewPlayerTiles;
.super Landroid/widget/LinearLayout;
.source "PreviewPlayerTiles.java"


# instance fields
.field private lastVolumeTap:J

.field private volumeButton:Landroid/widget/Button;

.field private volumeRunning:Z

.field private final volumeTick:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 12
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 54
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 23
    const-wide/16 v8, -0x3e8

    iput-wide v8, p0, Lcom/melodix/music/PreviewPlayerTiles;->lastVolumeTap:J

    .line 24
    new-instance v8, Lcom/melodix/music/PreviewPlayerTiles$1;

    invoke-direct {v8, p0}, Lcom/melodix/music/PreviewPlayerTiles$1;-><init>(Lcom/melodix/music/PreviewPlayerTiles;)V

    iput-object v8, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeTick:Ljava/lang/Runnable;

    .line 54
    const/4 v8, 0x0

    invoke-virtual {p0, v8}, Lcom/melodix/music/PreviewPlayerTiles;->setOrientation(I)V

    const/16 v8, 0x11

    invoke-virtual {p0, v8}, Lcom/melodix/music/PreviewPlayerTiles;->setGravity(I)V

    .line 55
    const/4 v8, 0x4

    new-array v3, v8, [Ljava/lang/String;

    const/4 v8, 0x0

    const-string v9, "\u2630\nFile"

    aput-object v9, v3, v8

    const/4 v8, 0x1

    const-string v9, "\u266c\nParoles"

    aput-object v9, v3, v8

    const/4 v8, 0x2

    const-string v9, "\u25a3\nAppareils"

    aput-object v9, v3, v8

    const/4 v8, 0x3

    const-string v9, "\u25d6))\nVolume"

    aput-object v9, v3, v8

    .line 56
    .local v3, "labels":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v8, v3

    if-lt v1, v8, :cond_0

    .line 81
    return-void

    .line 57
    :cond_0
    move v5, v1

    .local v5, "n":I
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 58
    .local v0, "b":Landroid/widget/Button;
    new-instance v2, Landroid/text/SpannableString;

    aget-object v8, v3, v1

    invoke-direct {v2, v8}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 59
    .local v2, "label":Landroid/text/SpannableString;
    new-instance v8, Landroid/text/style/RelativeSizeSpan;

    const v9, 0x400ccccd    # 2.2f

    invoke-direct {v8, v9}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    const/4 v9, 0x0

    aget-object v10, v3, v1

    const/16 v11, 0xa

    invoke-virtual {v10, v11}, Ljava/lang/String;->indexOf(I)I

    move-result v10

    const/16 v11, 0x21

    invoke-virtual {v2, v8, v9, v10, v11}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 60
    invoke-virtual {v0, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/high16 v8, 0x41200000    # 10.0f

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setTextSize(F)V

    const v8, -0x4b513b

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setTextColor(I)V

    .line 61
    const/4 v8, 0x0

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setAllCaps(Z)V

    const/4 v8, 0x0

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setSingleLine(Z)V

    const/4 v8, 0x4

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setMaxLines(I)V

    const/high16 v8, 0x40000000    # 2.0f

    invoke-direct {p0, v8}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v8

    const/high16 v9, 0x40800000    # 4.0f

    invoke-direct {p0, v9}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v9

    const/high16 v10, 0x40000000    # 2.0f

    invoke-direct {p0, v10}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v10

    const/high16 v11, 0x40800000    # 4.0f

    invoke-direct {p0, v11}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v11

    invoke-virtual {v0, v8, v9, v10, v11}, Landroid/widget/Button;->setPadding(IIII)V

    const/4 v8, 0x0

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setMinWidth(I)V

    const/4 v8, 0x0

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setMinimumWidth(I)V

    const/high16 v8, 0x42600000    # 56.0f

    invoke-direct {p0, v8}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v8

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 62
    new-instance v6, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v6}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .local v6, "tile":Landroid/graphics/drawable/GradientDrawable;
    const v8, 0x14ffffff

    invoke-virtual {v6, v8}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v8, 0x41900000    # 18.0f

    invoke-direct {p0, v8}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v8

    int-to-float v8, v8

    invoke-virtual {v6, v8}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {p0, v8}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v8

    const v9, 0x1fffffff

    invoke-virtual {v6, v8, v9}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 63
    const/4 v8, 0x0

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    const/4 v8, 0x0

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    const/4 v8, 0x0

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setElevation(F)V

    const/4 v8, 0x0

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setTranslationZ(F)V

    const/4 v8, 0x0

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 64
    new-instance v8, Landroid/graphics/drawable/RippleDrawable;

    const v9, 0x447b3fe4

    invoke-static {v9}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v9

    const/4 v10, 0x0

    invoke-direct {v8, v9, v6, v10}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 65
    const/4 v8, 0x3

    new-array v7, v8, [Ljava/lang/String;

    const/4 v8, 0x0

    const-string v9, "Indisponible : file Spotify non int\u00e9gr\u00e9e \u00e0 cet \u00e9cran"

    aput-object v9, v7, v8

    const/4 v8, 0x1

    const-string v9, "Indisponible : paroles non int\u00e9gr\u00e9es \u00e0 cet \u00e9cran"

    aput-object v9, v7, v8

    const/4 v8, 0x2

    const-string v9, "Indisponible : appareils Spotify non int\u00e9gr\u00e9s \u00e0 cet \u00e9cran"

    aput-object v9, v7, v8

    .line 66
    .local v7, "unavailable":[Ljava/lang/String;
    const/4 v8, 0x3

    if-ne v1, v8, :cond_3

    const-string v8, "Volume du t\u00e9l\u00e9phone"

    :goto_1
    invoke-virtual {v0, v8}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 67
    const/4 v8, 0x3

    if-ne v1, v8, :cond_4

    const/4 v8, 0x1

    :goto_2
    invoke-virtual {v0, v8}, Landroid/widget/Button;->setEnabled(Z)V

    const/4 v8, 0x3

    if-ne v1, v8, :cond_5

    const/high16 v8, 0x3f800000    # 1.0f

    :goto_3
    invoke-virtual {v0, v8}, Landroid/widget/Button;->setAlpha(F)V

    const/4 v8, 0x0

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setSelected(Z)V

    const/4 v8, 0x0

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setActivated(Z)V

    .line 68
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v9, 0x0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v8

    iget v8, v8, Landroid/content/res/Configuration;->fontScale:F

    const v10, 0x3fa66666    # 1.3f

    cmpl-float v8, v8, v10

    if-lez v8, :cond_6

    const/4 v8, -0x2

    :goto_4
    const/high16 v10, 0x3f800000    # 1.0f

    invoke-direct {v4, v9, v8, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .local v4, "lp":Landroid/widget/LinearLayout$LayoutParams;
    if-lez v1, :cond_1

    const/high16 v8, 0x41000000    # 8.0f

    invoke-direct {p0, v8}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v8

    iput v8, v4, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    :cond_1
    invoke-virtual {p0, v0, v4}, Lcom/melodix/music/PreviewPlayerTiles;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 69
    const/4 v8, 0x3

    if-ne v5, v8, :cond_2

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeButton:Landroid/widget/Button;

    new-instance v8, Lcom/melodix/music/PreviewPlayerTiles$4;

    invoke-direct {v8, p0}, Lcom/melodix/music/PreviewPlayerTiles$4;-><init>(Lcom/melodix/music/PreviewPlayerTiles;)V

    invoke-virtual {v0, v8}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 56
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 66
    .end local v4    # "lp":Landroid/widget/LinearLayout$LayoutParams;
    :cond_3
    aget-object v8, v7, v1

    goto :goto_1

    .line 67
    :cond_4
    const/4 v8, 0x0

    goto :goto_2

    :cond_5
    const v8, 0x3ee66666    # 0.45f

    goto :goto_3

    .line 68
    :cond_6
    const/high16 v8, 0x42600000    # 56.0f

    invoke-direct {p0, v8}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v8

    goto :goto_4
.end method

.method static synthetic access$0(Lcom/melodix/music/PreviewPlayerTiles;)Z
    .locals 1

    .prologue
    .line 22
    iget-boolean v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    return v0
.end method

.method static synthetic access$1(Lcom/melodix/music/PreviewPlayerTiles;Z)V
    .locals 0

    .prologue
    .line 22
    iput-boolean p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    return-void
.end method

.method static synthetic access$2(Lcom/melodix/music/PreviewPlayerTiles;)V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->updateVolume()V

    return-void
.end method

.method static synthetic access$3(Lcom/melodix/music/PreviewPlayerTiles;)V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->syncVolume()V

    return-void
.end method

.method static synthetic access$4(Lcom/melodix/music/PreviewPlayerTiles;)J
    .locals 2

    .prologue
    .line 23
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->lastVolumeTap:J

    return-wide v0
.end method

.method static synthetic access$5(Lcom/melodix/music/PreviewPlayerTiles;J)V
    .locals 1

    .prologue
    .line 23
    iput-wide p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->lastVolumeTap:J

    return-void
.end method

.method private dp(F)I
    .locals 2
    .param p1, "x"    # F

    .prologue
    .line 82
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

.method private syncVolume()V
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 45
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->isAttachedToWindow()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->isShown()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getWindowVisibility()I

    move-result v3

    if-nez v3, :cond_1

    move v0, v1

    .line 46
    .local v0, "show":Z
    :goto_0
    if-eqz v0, :cond_2

    iget-boolean v3, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    if-nez v3, :cond_2

    iput-boolean v1, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->updateVolume()V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeTick:Ljava/lang/Runnable;

    const-wide/16 v2, 0x3e8

    invoke-virtual {p0, v1, v2, v3}, Lcom/melodix/music/PreviewPlayerTiles;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 48
    :cond_0
    :goto_1
    return-void

    .end local v0    # "show":Z
    :cond_1
    move v0, v2

    .line 45
    goto :goto_0

    .line 47
    .restart local v0    # "show":Z
    :cond_2
    if-nez v0, :cond_0

    iget-boolean v1, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    if-eqz v1, :cond_0

    iput-boolean v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeTick:Ljava/lang/Runnable;

    invoke-virtual {p0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->removeCallbacks(Ljava/lang/Runnable;)Z

    goto :goto_1
.end method

.method private updateVolume()V
    .locals 14

    .prologue
    const v13, 0x3ee66666    # 0.45f

    const/4 v12, 0x0

    .line 29
    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeButton:Landroid/widget/Button;

    if-nez v8, :cond_0

    .line 43
    :goto_0
    return-void

    .line 31
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getContext()Landroid/content/Context;

    move-result-object v8

    const-string v9, "audio"

    invoke-virtual {v8, v9}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 32
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

    .line 42
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

    .line 33
    .restart local v5    # "svc":Ljava/lang/Object;
    :cond_1
    :try_start_1
    move-object v0, v5

    check-cast v0, Landroid/media/AudioManager;

    move-object v1, v0

    .line 34
    .local v1, "audio":Landroid/media/AudioManager;
    const/4 v8, 0x3

    invoke-virtual {v1, v8}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v3

    .local v3, "max":I
    const/4 v8, 0x3

    invoke-virtual {v1, v8}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v7

    .line 35
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

    .line 36
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

    .line 37
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

    .line 38
    .local v6, "text":Ljava/lang/String;
    new-instance v2, Landroid/text/SpannableString;

    invoke-direct {v2, v6}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 39
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

    .line 40
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

    .line 41
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


# virtual methods
.method protected onAttachedToWindow()V
    .locals 0

    .prologue
    .line 49
    invoke-super {p0}, Landroid/widget/LinearLayout;->onAttachedToWindow()V

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->syncVolume()V

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 50
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeRunning:Z

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeTick:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->removeCallbacks(Ljava/lang/Runnable;)Z

    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    return-void
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;
    .param p2, "visibility"    # I

    .prologue
    .line 51
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onVisibilityChanged(Landroid/view/View;I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeTick:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/melodix/music/PreviewPlayerTiles$2;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerTiles$2;-><init>(Lcom/melodix/music/PreviewPlayerTiles;)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method protected onWindowVisibilityChanged(I)V
    .locals 1
    .param p1, "visibility"    # I

    .prologue
    .line 52
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onWindowVisibilityChanged(I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->volumeTick:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/melodix/music/PreviewPlayerTiles$3;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerTiles$3;-><init>(Lcom/melodix/music/PreviewPlayerTiles;)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method
