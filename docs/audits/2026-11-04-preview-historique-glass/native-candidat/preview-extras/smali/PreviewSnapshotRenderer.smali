.class final Lcom/melodix/music/PreviewSnapshotRenderer;
.super Ljava/lang/Object;
.source "PreviewSnapshotRenderer.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static collect(Landroid/view/View;Ljava/util/ArrayList;I[I)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;I[I)V"
        }
    .end annotation

    .prologue
    const/16 v5, 0x9c4

    const/16 v4, 0x80

    const/4 v1, 0x0

    .line 17
    if-eqz p0, :cond_0

    const/16 v0, 0x20

    if-gt p2, v0, :cond_0

    aget v0, p3, v1

    add-int/lit8 v2, v0, 0x1

    aput v2, p3, v1

    if-ge v0, v5, :cond_0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v0, v4, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->isShown()Z

    move-result v0

    if-nez v0, :cond_1

    .line 24
    :cond_0
    return-void

    .line 18
    :cond_1
    instance-of v0, p0, Landroid/widget/ImageView;

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result v0

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v2

    if-nez v0, :cond_2

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    if-lez v0, :cond_2

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    if-lez v0, :cond_2

    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getClipToOutline()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Landroid/graphics/drawable/GradientDrawable;

    if-eqz v0, :cond_2

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 20
    :cond_2
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    .line 21
    check-cast p0, Landroid/view/ViewGroup;

    move v0, v1

    .line 22
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_0

    aget v2, p3, v1

    if-ge v2, v5, :cond_0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v2, v4, :cond_0

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    add-int/lit8 v3, p2, 0x1

    invoke-static {v2, p1, v3, p3}, Lcom/melodix/music/PreviewSnapshotRenderer;->collect(Landroid/view/View;Ljava/util/ArrayList;I[I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method static draw(Landroid/app/Activity;Landroid/view/View;Landroid/graphics/Canvas;)V
    .locals 16

    .prologue
    .line 26
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 27
    const v1, 0x7f090249

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v10

    const v1, 0x7f090244

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v11

    .line 28
    const/4 v1, 0x2

    new-array v2, v1, [Landroid/view/View;

    const/4 v1, 0x0

    aput-object v10, v2, v1

    const/4 v1, 0x1

    aput-object v11, v2, v1

    array-length v4, v2

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v4, :cond_1

    .line 29
    const/4 v1, 0x0

    const/4 v2, 0x1

    new-array v2, v2, [I

    move-object/from16 v0, p1

    invoke-static {v0, v3, v1, v2}, Lcom/melodix/music/PreviewSnapshotRenderer;->collect(Landroid/view/View;Ljava/util/ArrayList;I[I)V

    .line 32
    :try_start_0
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_3

    .line 33
    invoke-virtual/range {p1 .. p2}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_5

    .line 38
    const/4 v1, 0x2

    new-array v12, v1, [I

    const/4 v1, 0x2

    new-array v13, v1, [I

    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 39
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :cond_0
    :goto_3
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_6

    .line 52
    return-void

    .line 28
    :cond_1
    aget-object v5, v2, v1

    instance-of v6, v5, Landroid/widget/ImageView;

    if-eqz v6, :cond_2

    invoke-virtual {v5}, Landroid/view/View;->isShown()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-virtual {v5}, Landroid/view/View;->getAlpha()F

    move-result v6

    const/high16 v7, 0x3f800000    # 1.0f

    cmpl-float v6, v6, v7

    if-nez v6, :cond_2

    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    move-result v6

    if-lez v6, :cond_2

    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v6

    if-lez v6, :cond_2

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 32
    :cond_3
    :try_start_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Landroid/view/View;->setAlpha(F)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 34
    :catchall_0
    move-exception v1

    move-object v2, v1

    .line 35
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_4
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_4

    .line 36
    throw v2

    .line 35
    :cond_4
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {v1, v4}, Landroid/view/View;->setAlpha(F)V

    goto :goto_4

    :cond_5
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {v1, v4}, Landroid/view/View;->setAlpha(F)V

    goto :goto_2

    .line 39
    :cond_6
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Landroid/view/View;

    .line 40
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v9, v2}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 41
    invoke-virtual {v9, v13}, Landroid/view/View;->getLocationOnScreen([I)V

    const/4 v1, 0x0

    aget v1, v13, v1

    const/4 v3, 0x0

    aget v3, v12, v3

    sub-int v3, v1, v3

    const/4 v1, 0x1

    aget v1, v13, v1

    const/4 v4, 0x1

    aget v4, v12, v4

    sub-int v4, v1, v4

    .line 43
    if-ne v9, v10, :cond_7

    invoke-virtual {v9}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {v9}, Landroid/view/View;->getHeight()I

    move-result v5

    invoke-static {v1, v5}, Ljava/lang/Math;->min(II)I

    move-result v1

    int-to-float v1, v1

    const/high16 v5, 0x40000000    # 2.0f

    div-float v6, v1, v5

    .line 47
    :goto_5
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Canvas;->save()I

    move-result v15

    .line 48
    iget v1, v2, Landroid/graphics/Rect;->left:I

    const/4 v5, 0x0

    aget v5, v12, v5

    sub-int/2addr v1, v5

    iget v5, v2, Landroid/graphics/Rect;->top:I

    const/4 v7, 0x1

    aget v7, v12, v7

    sub-int/2addr v5, v7

    iget v7, v2, Landroid/graphics/Rect;->right:I

    const/4 v8, 0x0

    aget v8, v12, v8

    sub-int/2addr v7, v8

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    const/4 v8, 0x1

    aget v8, v12, v8

    sub-int/2addr v2, v8

    move-object/from16 v0, p2

    invoke-virtual {v0, v1, v5, v7, v2}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 49
    int-to-float v1, v3

    int-to-float v2, v4

    move-object/from16 v0, p2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v9}, Landroid/view/View;->getWidth()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v9}, Landroid/view/View;->getHeight()I

    move-result v5

    int-to-float v5, v5

    sget-object v8, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    move v7, v6

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Path;->addRoundRect(FFFFFFLandroid/graphics/Path$Direction;)V

    .line 50
    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    move-object/from16 v0, p2

    invoke-virtual {v9, v0}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    move-object/from16 v0, p2

    invoke-virtual {v0, v15}, Landroid/graphics/Canvas;->restoreToCount(I)V

    goto/16 :goto_3

    .line 44
    :cond_7
    if-ne v9, v11, :cond_8

    const/high16 v1, 0x41200000    # 10.0f

    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v5, v5, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v1, v5

    invoke-virtual {v9}, Landroid/view/View;->getWidth()I

    move-result v5

    invoke-virtual {v9}, Landroid/view/View;->getHeight()I

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v5

    int-to-float v5, v5

    const/high16 v6, 0x40000000    # 2.0f

    div-float/2addr v5, v6

    invoke-static {v1, v5}, Ljava/lang/Math;->min(FF)F

    move-result v6

    goto :goto_5

    .line 45
    :cond_8
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x18

    if-lt v1, v5, :cond_9

    invoke-virtual {v9}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/GradientDrawable;->getCornerRadius()F

    move-result v6

    goto/16 :goto_5

    .line 46
    :cond_9
    const/high16 v1, 0x41400000    # 12.0f

    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v5, v5, Landroid/util/DisplayMetrics;->density:F

    mul-float v6, v1, v5

    goto/16 :goto_5
.end method
