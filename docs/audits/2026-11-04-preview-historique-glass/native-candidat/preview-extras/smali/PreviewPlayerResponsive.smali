.class public final Lcom/melodix/music/PreviewPlayerResponsive;
.super Ljava/lang/Object;
.source "PreviewPlayerResponsive.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static apply(Landroid/view/View;)V
    .locals 15

    .prologue
    const/4 v3, 0x1

    const/4 v7, -0x1

    const/4 v6, 0x0

    const/high16 v8, 0x3f000000    # 0.5f

    const/4 v4, 0x0

    .line 11
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-nez v0, :cond_1

    .line 42
    :cond_0
    :goto_0
    return-void

    :cond_1
    move-object v0, p0

    .line 12
    check-cast v0, Landroid/view/ViewGroup;

    const-string v1, "previewPlayerLandscapeRow"

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    move-object v0, p0

    .line 13
    check-cast v0, Landroid/view/ViewGroup;

    const-string v2, "previewPlayerArtFrame"

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v10

    move-object v0, p0

    .line 14
    check-cast v0, Landroid/view/ViewGroup;

    const-string v2, "previewPlayerArtCard"

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v11

    move-object v0, p0

    .line 15
    check-cast v0, Landroid/view/ViewGroup;

    const-string v2, "previewPlayerLandscapeDetails"

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v12

    .line 16
    instance-of v0, v1, Landroid/widget/LinearLayout;

    if-eqz v0, :cond_0

    if-eqz v10, :cond_0

    if-eqz v11, :cond_0

    if-eqz v12, :cond_0

    .line 17
    invoke-virtual {v10}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-ne v0, v1, :cond_0

    invoke-virtual {v12}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-ne v0, v1, :cond_0

    invoke-virtual {v11}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-ne v0, v10, :cond_0

    .line 18
    invoke-virtual {v10}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v0, :cond_0

    .line 19
    invoke-virtual {v12}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v0, :cond_0

    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v2

    sub-int/2addr v0, v2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    sub-int v13, v0, v2

    .line 21
    if-lez v13, :cond_0

    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 23
    const/high16 v2, 0x44160000    # 600.0f

    mul-float/2addr v2, v0

    add-float/2addr v2, v8

    float-to-int v2, v2

    const/high16 v5, 0x439f0000    # 318.0f

    mul-float/2addr v5, v0

    add-float/2addr v5, v8

    float-to-int v14, v5

    const/high16 v5, 0x41900000    # 18.0f

    mul-float/2addr v0, v5

    add-float/2addr v0, v8

    float-to-int v5, v0

    .line 26
    if-ge v13, v2, :cond_9

    move v2, v3

    :goto_1
    move-object v0, v1

    .line 27
    check-cast v0, Landroid/widget/LinearLayout;

    .line 28
    if-eqz v2, :cond_a

    .line 29
    :goto_2
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v1

    if-eq v1, v3, :cond_2

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 30
    :cond_2
    invoke-virtual {v10}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 31
    if-eqz v2, :cond_b

    move v9, v7

    :goto_3
    if-eqz v2, :cond_c

    invoke-static {v14, v13}, Ljava/lang/Math;->min(II)I

    move-result v1

    move v8, v1

    .line 32
    :goto_4
    if-eqz v2, :cond_d

    move v3, v6

    :goto_5
    if-eqz v2, :cond_e

    move v1, v4

    .line 33
    :goto_6
    iget v5, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    if-ne v5, v9, :cond_3

    iget v5, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    if-ne v5, v8, :cond_3

    iget v5, v0, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    cmpl-float v5, v5, v3

    if-nez v5, :cond_3

    iget v5, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    if-eq v5, v1, :cond_4

    .line 34
    :cond_3
    iput v9, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    iput v8, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    iput v3, v0, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    invoke-virtual {v10, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 36
    :cond_4
    invoke-virtual {v12}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 37
    if-eqz v2, :cond_f

    move v3, v7

    :goto_7
    if-eqz v2, :cond_10

    move v1, v6

    .line 38
    :goto_8
    iget v5, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    if-ne v5, v3, :cond_5

    iget v5, v0, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    cmpl-float v5, v5, v1

    if-eqz v5, :cond_6

    :cond_5
    iput v3, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    invoke-virtual {v12, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 39
    :cond_6
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 40
    if-eqz v2, :cond_7

    invoke-static {v14, v13}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 41
    :cond_7
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ne v1, v4, :cond_8

    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v1, v4, :cond_0

    :cond_8
    iput v4, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v4, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v11, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_0

    :cond_9
    move v2, v4

    .line 26
    goto :goto_1

    :cond_a
    move v3, v4

    .line 28
    goto :goto_2

    :cond_b
    move v9, v4

    .line 31
    goto :goto_3

    :cond_c
    const/4 v1, -0x2

    move v8, v1

    goto :goto_4

    .line 32
    :cond_d
    const v1, 0x3ee147ae    # 0.44f

    move v3, v1

    goto :goto_5

    :cond_e
    move v1, v5

    goto :goto_6

    :cond_f
    move v3, v4

    .line 37
    goto :goto_7

    :cond_10
    const v1, 0x3f0f5c29    # 0.56f

    goto :goto_8
.end method
