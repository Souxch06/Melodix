.class public final Lcom/melodix/music/PreviewPlayerTiles;
.super Landroid/widget/LinearLayout;
.source "PreviewPlayerTiles.java"


# instance fields
.field private lastTap:J

.field private final names:[Ljava/lang/String;

.field private panel:Landroid/app/Dialog;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 12

    .prologue
    const/high16 v11, 0x3f800000    # 1.0f

    const/4 v10, 0x0

    const/4 v9, 0x3

    const/4 v8, 0x0

    const/4 v1, 0x0

    .line 40
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 29
    new-array v0, v9, [Ljava/lang/String;

    const-string v2, "File"

    aput-object v2, v0, v1

    const/4 v2, 0x1

    const-string v3, "Paroles"

    aput-object v3, v0, v2

    const/4 v2, 0x2

    const-string v3, "Appareils"

    aput-object v3, v0, v2

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    .line 31
    const-wide/16 v2, -0x3e8

    iput-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles;->lastTap:J

    .line 40
    invoke-virtual {p0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->setOrientation(I)V

    const/16 v0, 0x11

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->setGravity(I)V

    .line 41
    const/4 v0, 0x4

    new-array v3, v0, [Ljava/lang/String;

    const-string v0, "\u2630\nFile"

    aput-object v0, v3, v1

    const/4 v0, 0x1

    const-string v2, "\u266c\nParoles"

    aput-object v2, v3, v0

    const/4 v0, 0x2

    const-string v2, "\u25a3\nAppareils"

    aput-object v2, v3, v0

    const-string v0, "\u25d6))\nVolume \u2014"

    aput-object v0, v3, v9

    move v0, v1

    .line 42
    :goto_0
    array-length v2, v3

    if-lt v0, v2, :cond_0

    .line 57
    return-void

    .line 43
    :cond_0
    new-instance v4, Landroid/widget/Button;

    invoke-direct {v4, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 44
    new-instance v2, Landroid/text/SpannableString;

    aget-object v5, v3, v0

    invoke-direct {v2, v5}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 45
    new-instance v5, Landroid/text/style/RelativeSizeSpan;

    const v6, 0x400ccccd    # 2.2f

    invoke-direct {v5, v6}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    aget-object v6, v3, v0

    const/16 v7, 0xa

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    const/16 v7, 0x21

    invoke-virtual {v2, v5, v1, v6, v7}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 46
    invoke-virtual {v4, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/high16 v2, 0x41200000    # 10.0f

    invoke-virtual {v4, v2}, Landroid/widget/Button;->setTextSize(F)V

    const v2, -0x4b513b

    invoke-virtual {v4, v2}, Landroid/widget/Button;->setTextColor(I)V

    invoke-virtual {v4, v1}, Landroid/widget/Button;->setAllCaps(Z)V

    invoke-virtual {v4, v1}, Landroid/widget/Button;->setSingleLine(Z)V

    const/4 v2, 0x4

    invoke-virtual {v4, v2}, Landroid/widget/Button;->setMaxLines(I)V

    .line 47
    const/high16 v2, 0x40000000    # 2.0f

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    const/high16 v5, 0x40800000    # 4.0f

    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    const/high16 v6, 0x40000000    # 2.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v6

    const/high16 v7, 0x40800000    # 4.0f

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v7

    invoke-virtual {v4, v2, v5, v6, v7}, Landroid/widget/Button;->setPadding(IIII)V

    invoke-virtual {v4, v1}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-virtual {v4, v1}, Landroid/widget/Button;->setMinimumWidth(I)V

    const/high16 v2, 0x42600000    # 56.0f

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    invoke-virtual {v4, v2}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 48
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v5, 0x14ffffff

    invoke-virtual {v2, v5}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v5, 0x41900000    # 18.0f

    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v2, v5}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-direct {p0, v11}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    const v6, 0x1fffffff

    invoke-virtual {v2, v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 49
    invoke-virtual {v4, v8}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v4, v8}, Landroid/widget/Button;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    invoke-virtual {v4, v10}, Landroid/widget/Button;->setElevation(F)V

    invoke-virtual {v4, v10}, Landroid/widget/Button;->setTranslationZ(F)V

    invoke-virtual {v4, v8}, Landroid/widget/Button;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 50
    new-instance v5, Landroid/graphics/drawable/RippleDrawable;

    const v6, 0x447b3fe4

    invoke-static {v6}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v6

    invoke-direct {v5, v6, v2, v8}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 51
    invoke-virtual {v4, v1}, Landroid/widget/Button;->setSelected(Z)V

    invoke-virtual {v4, v1}, Landroid/widget/Button;->setActivated(Z)V

    const v2, 0x3ee66666    # 0.45f

    invoke-virtual {v4, v2}, Landroid/widget/Button;->setAlpha(F)V

    .line 52
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget v2, v2, Landroid/content/res/Configuration;->fontScale:F

    const v6, 0x3fa66666    # 1.3f

    cmpl-float v2, v2, v6

    if-lez v2, :cond_2

    const/4 v2, -0x2

    :goto_1
    invoke-direct {v5, v1, v2, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 53
    if-lez v0, :cond_1

    const/high16 v2, 0x41000000    # 8.0f

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    iput v2, v5, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    :cond_1
    invoke-virtual {p0, v4, v5}, Lcom/melodix/music/PreviewPlayerTiles;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 54
    if-ge v0, v9, :cond_3

    new-instance v2, Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v5, v5, v0

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, " : indisponible dans cette version"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v2, Lcom/melodix/music/PreviewPlayerTiles$1;

    invoke-direct {v2, p0, v0}, Lcom/melodix/music/PreviewPlayerTiles$1;-><init>(Lcom/melodix/music/PreviewPlayerTiles;I)V

    invoke-virtual {v4, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 42
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    .line 52
    :cond_2
    const/high16 v2, 0x42600000    # 56.0f

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    goto :goto_1

    .line 55
    :cond_3
    const-string v2, "Volume du lecteur indisponible ; volume du t\u00e9l\u00e9phone non modifi\u00e9"

    invoke-virtual {v4, v2}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-virtual {v4, v1}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_2
.end method

.method static synthetic access$0(Lcom/melodix/music/PreviewPlayerTiles;I)V
    .locals 0

    .prologue
    .line 58
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->showPanel(I)V

    return-void
.end method

.method static synthetic access$1(Lcom/melodix/music/PreviewPlayerTiles;F)I
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v0

    return v0
.end method

.method static synthetic access$2(Lcom/melodix/music/PreviewPlayerTiles;)Landroid/app/Dialog;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panel:Landroid/app/Dialog;

    return-object v0
.end method

.method static synthetic access$3(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;)V
    .locals 0

    .prologue
    .line 30
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles;->panel:Landroid/app/Dialog;

    return-void
.end method

.method static synthetic access$4(Lcom/melodix/music/PreviewPlayerTiles;)V
    .locals 0

    .prologue
    .line 86
    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->closeIfHidden()V

    return-void
.end method

.method private activity()Landroid/app/Activity;
    .locals 4

    .prologue
    .line 34
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    const/16 v1, 0x8

    if-ge v2, v1, :cond_0

    instance-of v1, v0, Landroid/content/ContextWrapper;

    if-nez v1, :cond_1

    .line 37
    :cond_0
    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_3

    check-cast v0, Landroid/app/Activity;

    :goto_1
    return-object v0

    .line 35
    :cond_1
    instance-of v1, v0, Landroid/app/Activity;

    if-eqz v1, :cond_2

    check-cast v0, Landroid/app/Activity;

    goto :goto_1

    :cond_2
    move-object v1, v0

    .line 36
    check-cast v1, Landroid/content/ContextWrapper;

    invoke-virtual {v1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    if-eq v3, v0, :cond_0

    .line 34
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    move-object v0, v3

    goto :goto_0

    .line 37
    :cond_3
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private closeIfHidden()V
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panel:Landroid/app/Dialog;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->isShown()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getWindowVisibility()I

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panel:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    :cond_1
    return-void
.end method

.method private dp(F)I
    .locals 2

    .prologue
    .line 32
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

.method private showPanel(I)V
    .locals 9

    .prologue
    .line 59
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    invoke-direct {p0}, Lcom/melodix/music/PreviewPlayerTiles;->activity()Landroid/app/Activity;

    move-result-object v2

    .line 60
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->isShown()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getWindowVisibility()I

    move-result v3

    if-nez v3, :cond_0

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Landroid/app/Activity;->isFinishing()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {v2}, Landroid/app/Activity;->isDestroyed()Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles;->panel:Landroid/app/Dialog;

    if-nez v3, :cond_0

    iget-wide v4, p0, Lcom/melodix/music/PreviewPlayerTiles;->lastTap:J

    sub-long v4, v0, v4

    const-wide/16 v6, 0x190

    cmp-long v3, v4, v6

    if-gez v3, :cond_1

    .line 85
    :cond_0
    :goto_0
    return-void

    .line 61
    :cond_1
    iput-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->lastTap:J

    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->performHapticFeedback(I)Z

    .line 62
    new-instance v0, Landroid/app/Dialog;

    invoke-direct {v0, v2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panel:Landroid/app/Dialog;

    .line 64
    :try_start_0
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v3, 0x41a00000    # 20.0f

    invoke-direct {p0, v3}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v3

    const/high16 v4, 0x40c00000    # 6.0f

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v4

    const/high16 v5, 0x41a00000    # 20.0f

    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    const/high16 v6, 0x41c00000    # 24.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v6

    invoke-virtual {v1, v3, v4, v5, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 65
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v4, -0x14e8f4cd

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v4

    const v5, 0x1fffffff

    invoke-virtual {v3, v4, v5}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 66
    const/high16 v4, 0x41e00000    # 28.0f

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v4

    int-to-float v4, v4

    const/16 v5, 0x8

    new-array v5, v5, [F

    const/4 v6, 0x0

    aput v4, v5, v6

    const/4 v6, 0x1

    aput v4, v5, v6

    const/4 v6, 0x2

    aput v4, v5, v6

    const/4 v6, 0x3

    aput v4, v5, v6

    const/4 v4, 0x4

    const/4 v6, 0x0

    aput v6, v5, v4

    const/4 v4, 0x5

    const/4 v6, 0x0

    aput v6, v5, v4

    const/4 v4, 0x6

    const/4 v6, 0x0

    aput v6, v5, v4

    const/4 v4, 0x7

    const/4 v6, 0x0

    aput v6, v5, v4

    invoke-virtual {v3, v5}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 67
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v4, "\u2501"

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v4, -0x363f16

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    const/16 v4, 0x11

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setGravity(I)V

    const/high16 v4, 0x42300000    # 44.0f

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setMinimumHeight(I)V

    const-string v4, "Glisser vers le bas pour fermer"

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 68
    new-instance v4, Lcom/melodix/music/PreviewPlayerTiles$2;

    invoke-direct {v4, p0, v0}, Lcom/melodix/music/PreviewPlayerTiles$2;-><init>(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;)V

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 72
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    const/high16 v6, 0x42300000    # 44.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v6

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 73
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v4, 0x10

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 74
    new-instance v4, Landroid/widget/TextView;

    invoke-direct {v4, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v5, v5, p1

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v5, 0x41a00000    # 20.0f

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 v5, -0x1

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 75
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, 0x0

    const/high16 v7, 0x42400000    # 48.0f

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v7

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v5, v6, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 76
    new-instance v4, Landroid/widget/Button;

    invoke-direct {v4, v2}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v5, "Fermer"

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setAllCaps(Z)V

    const/high16 v5, 0x42400000    # 48.0f

    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setMinWidth(I)V

    const/high16 v5, 0x42400000    # 48.0f

    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setMinimumHeight(I)V

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Fermer "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerTiles;->names:[Ljava/lang/String;

    aget-object v6, v6, p1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 77
    new-instance v5, Lcom/melodix/music/PreviewPlayerTiles$3;

    invoke-direct {v5, p0, v0}, Lcom/melodix/music/PreviewPlayerTiles$3;-><init>(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;)V

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x2

    const/high16 v7, 0x42400000    # 48.0f

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v7

    invoke-direct {v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 78
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    const/high16 v6, 0x42400000    # 48.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v6

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 79
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v2, "Indisponible dans cette version"

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v2, -0x1

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v2, 0x41800000    # 16.0f

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 v2, 0x0

    const/high16 v4, 0x41c00000    # 24.0f

    invoke-direct {p0, v4}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v4

    const/4 v5, 0x0

    const/high16 v6, 0x41c00000    # 24.0f

    invoke-direct {p0, v6}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v6

    invoke-virtual {v3, v2, v4, v5, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 80
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x2

    invoke-direct {v2, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 81
    new-instance v1, Lcom/melodix/music/PreviewPlayerTiles$4;

    invoke-direct {v1, p0, v0}, Lcom/melodix/music/PreviewPlayerTiles$4;-><init>(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;)V

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 82
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    if-nez v1, :cond_2

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 84
    :catch_0
    move-exception v1

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles;->panel:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    goto/16 :goto_0

    .line 83
    :cond_2
    :try_start_1
    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v1, v2}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const/16 v2, 0x50

    invoke-virtual {v1, v2}, Landroid/view/Window;->setGravity(I)V

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-virtual {v1, v2, v3}, Landroid/view/Window;->setLayout(II)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method


# virtual methods
.method protected onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panel:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles;->panel:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    :cond_0
    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    return-void
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .locals 1

    .prologue
    .line 88
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onVisibilityChanged(Landroid/view/View;I)V

    new-instance v0, Lcom/melodix/music/PreviewPlayerTiles$5;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerTiles$5;-><init>(Lcom/melodix/music/PreviewPlayerTiles;)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method protected onWindowVisibilityChanged(I)V
    .locals 1

    .prologue
    .line 89
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onWindowVisibilityChanged(I)V

    new-instance v0, Lcom/melodix/music/PreviewPlayerTiles$6;

    invoke-direct {v0, p0}, Lcom/melodix/music/PreviewPlayerTiles$6;-><init>(Lcom/melodix/music/PreviewPlayerTiles;)V

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
