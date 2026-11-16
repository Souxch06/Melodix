.class public final Lcom/melodix/music/PreviewPlayerTiles;
.super Landroid/widget/LinearLayout;
.source "PreviewPlayerTiles.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 12

    .prologue
    const/high16 v11, 0x40800000    # 4.0f

    const/high16 v10, 0x40000000    # 2.0f

    const/high16 v9, 0x3f800000    # 1.0f

    const/4 v8, 0x3

    const/4 v1, 0x0

    .line 21
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    invoke-virtual {p0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->setOrientation(I)V

    const/16 v0, 0x11

    invoke-virtual {p0, v0}, Lcom/melodix/music/PreviewPlayerTiles;->setGravity(I)V

    .line 22
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

    const-string v0, "\u25d6))\nVolume"

    aput-object v0, v3, v8

    move v0, v1

    .line 23
    :goto_0
    array-length v2, v3

    if-lt v0, v2, :cond_0

    .line 40
    return-void

    .line 24
    :cond_0
    new-instance v4, Landroid/widget/Button;

    invoke-direct {v4, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 25
    new-instance v2, Landroid/text/SpannableString;

    aget-object v5, v3, v0

    invoke-direct {v2, v5}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 26
    new-instance v5, Landroid/text/style/RelativeSizeSpan;

    const v6, 0x400ccccd    # 2.2f

    invoke-direct {v5, v6}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    aget-object v6, v3, v0

    const/16 v7, 0xa

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    const/16 v7, 0x21

    invoke-virtual {v2, v5, v1, v6, v7}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 27
    invoke-virtual {v4, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/high16 v2, 0x41200000    # 10.0f

    invoke-virtual {v4, v2}, Landroid/widget/Button;->setTextSize(F)V

    if-ne v0, v8, :cond_3

    const v2, -0x232a0b

    :goto_1
    invoke-virtual {v4, v2}, Landroid/widget/Button;->setTextColor(I)V

    .line 28
    invoke-virtual {v4, v1}, Landroid/widget/Button;->setAllCaps(Z)V

    invoke-virtual {v4, v1}, Landroid/widget/Button;->setSingleLine(Z)V

    const/4 v2, 0x4

    invoke-virtual {v4, v2}, Landroid/widget/Button;->setMaxLines(I)V

    invoke-direct {p0, v10}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    invoke-direct {p0, v11}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    invoke-direct {p0, v10}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v6

    invoke-direct {p0, v11}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v7

    invoke-virtual {v4, v2, v5, v6, v7}, Landroid/widget/Button;->setPadding(IIII)V

    invoke-virtual {v4, v1}, Landroid/widget/Button;->setMinWidth(I)V

    invoke-virtual {v4, v1}, Landroid/widget/Button;->setMinimumWidth(I)V

    const/high16 v2, 0x42600000    # 56.0f

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    invoke-virtual {v4, v2}, Landroid/widget/Button;->setMinimumHeight(I)V

    .line 29
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v5, 0x14ffffff

    invoke-virtual {v2, v5}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v5, 0x41900000    # 18.0f

    invoke-direct {p0, v5}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v2, v5}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-direct {p0, v9}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v5

    const v6, 0x1fffffff

    invoke-virtual {v2, v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 30
    new-instance v5, Landroid/graphics/drawable/RippleDrawable;

    const v6, 0x447b3fe4

    invoke-static {v6}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v6

    const/4 v7, 0x0

    invoke-direct {v5, v6, v2, v7}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 31
    if-ne v0, v8, :cond_4

    const-string v2, "Volume du t\u00e9l\u00e9phone"

    :goto_2
    invoke-virtual {v4, v2}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 32
    if-ne v0, v8, :cond_5

    const/4 v2, 0x1

    :goto_3
    invoke-virtual {v4, v2}, Landroid/widget/Button;->setEnabled(Z)V

    invoke-virtual {v4, v9}, Landroid/widget/Button;->setAlpha(F)V

    invoke-virtual {v4, v1}, Landroid/widget/Button;->setSelected(Z)V

    invoke-virtual {v4, v1}, Landroid/widget/Button;->setActivated(Z)V

    .line 33
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget v2, v2, Landroid/content/res/Configuration;->fontScale:F

    const v6, 0x3fa66666    # 1.3f

    cmpl-float v2, v2, v6

    if-lez v2, :cond_6

    const/4 v2, -0x2

    :goto_4
    invoke-direct {v5, v1, v2, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    if-lez v0, :cond_1

    const/high16 v2, 0x41000000    # 8.0f

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    iput v2, v5, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    :cond_1
    invoke-virtual {p0, v4, v5}, Lcom/melodix/music/PreviewPlayerTiles;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 34
    if-ne v0, v8, :cond_2

    new-instance v2, Lcom/melodix/music/PreviewPlayerTiles$1;

    invoke-direct {v2, p0}, Lcom/melodix/music/PreviewPlayerTiles$1;-><init>(Lcom/melodix/music/PreviewPlayerTiles;)V

    invoke-virtual {v4, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 23
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    .line 27
    :cond_3
    const v2, -0x707561

    goto/16 :goto_1

    .line 31
    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    aget-object v5, v3, v0

    const/16 v6, 0xa

    const/16 v7, 0x20

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, " indisponible"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_2

    :cond_5
    move v2, v1

    .line 32
    goto :goto_3

    .line 33
    :cond_6
    const/high16 v2, 0x42600000    # 56.0f

    invoke-direct {p0, v2}, Lcom/melodix/music/PreviewPlayerTiles;->dp(F)I

    move-result v2

    goto :goto_4
.end method

.method private dp(F)I
    .locals 2

    .prologue
    .line 41
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
