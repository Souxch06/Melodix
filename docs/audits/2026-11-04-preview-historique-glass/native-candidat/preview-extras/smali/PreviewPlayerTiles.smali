.class public final Lcom/melodix/music/PreviewPlayerTiles;
.super Landroid/widget/LinearLayout;
.source "PreviewPlayerTiles.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 11

    .prologue
    const/4 v3, 0x1

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v10, 0x3

    const/4 v1, 0x0

    .line 15
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    invoke-virtual {p0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->setOrientation(I)V

    .line 16
    const/4 v0, 0x4

    new-array v5, v0, [Ljava/lang/String;

    const-string v0, "\u2630\nFile"

    aput-object v0, v5, v1

    const-string v0, "\u266c\nParoles"

    aput-object v0, v5, v3

    const/4 v0, 0x2

    const-string v2, "\u25a3\nAppareils"

    aput-object v2, v5, v0

    const-string v0, "\u25d6))\nVolume"

    aput-object v0, v5, v10

    move v0, v1

    .line 17
    :goto_0
    array-length v2, v5

    if-lt v0, v2, :cond_0

    .line 30
    return-void

    .line 18
    :cond_0
    new-instance v6, Landroid/widget/Button;

    invoke-direct {v6, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    aget-object v2, v5, v0

    invoke-virtual {v6, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/high16 v2, 0x41200000    # 10.0f

    invoke-virtual {v6, v2}, Landroid/widget/Button;->setTextSize(F)V

    const v2, -0x232a0b

    invoke-virtual {v6, v2}, Landroid/widget/Button;->setTextColor(I)V

    .line 19
    invoke-virtual {v6, v1}, Landroid/widget/Button;->setAllCaps(Z)V

    invoke-virtual {v6, v1, v1, v1, v1}, Landroid/widget/Button;->setPadding(IIII)V

    invoke-virtual {v6, v1}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-virtual {v6, v1}, Landroid/widget/Button;->setMinimumWidth(I)V

    const/high16 v2, 0x42400000    # 48.0f

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    invoke-virtual {v6, v2}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 20
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v7, "native_button_dark"

    const-string v8, "drawable"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v7, v8, v9}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v6, v2}, Landroid/widget/Button;->setBackgroundResource(I)V

    .line 21
    :cond_1
    if-ne v0, v10, :cond_4

    const-string v2, "Volume du t\u00e9l\u00e9phone"

    :goto_1
    invoke-virtual {v6, v2}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 22
    if-ne v0, v10, :cond_5

    move v2, v3

    :goto_2
    invoke-virtual {v6, v2}, Landroid/widget/Button;->setEnabled(Z)V

    if-ne v0, v10, :cond_6

    move v2, v4

    :goto_3
    invoke-virtual {v6, v2}, Landroid/widget/Button;->setAlpha(F)V

    .line 23
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v7, 0x42600000    # 56.0f

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v7

    invoke-direct {v2, v1, v7, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    if-lez v0, :cond_2

    const/high16 v7, 0x41000000    # 8.0f

    invoke-direct {p0, v7}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v7

    iput v7, v2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    :cond_2
    invoke-virtual {p0, v6, v2}, Lcom/melodix/music/PreviewPlayerTiles;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 24
    if-ne v0, v10, :cond_3

    new-instance v2, Lcom/melodix/music/PreviewPlayerTiles$1;

    invoke-direct {v2, p0}, Lcom/melodix/music/PreviewPlayerTiles$1;-><init>(Lcom/melodix/music/PreviewPlayerTiles;)V

    invoke-virtual {v6, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 17
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 21
    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    aget-object v7, v5, v0

    const/16 v8, 0xa

    const/16 v9, 0x20

    invoke-virtual {v7, v8, v9}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v2, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, " indisponible"

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    :cond_5
    move v2, v1

    .line 22
    goto :goto_2

    :cond_6
    const v2, 0x3ec28f5c    # 0.38f

    goto :goto_3
.end method

.method private dp(F)I
    .locals 2

    .prologue
    .line 31
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
