.class final Lcom/melodix/music/PreviewSnapshotRenderer;
.super Ljava/lang/Object;
.source "PreviewSnapshotRenderer.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static collect(Landroid/view/View;Ljava/util/ArrayList;I[I)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;I[I)V"
        }
    .end annotation

    .line 18
    if-eqz p0, :cond_4

    const/16 v0, 0x20

    if-gt p2, v0, :cond_4

    const/4 v0, 0x0

    aget v1, p3, v0

    add-int/lit8 v2, v1, 0x1

    aput v2, p3, v0

    const/16 v2, 0x9c4

    if-ge v1, v2, :cond_4

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/16 v3, 0x80

    if-ge v1, v3, :cond_4

    invoke-virtual {p0}, Landroid/view/View;->isShown()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1

    .line 19
    :cond_0
    instance-of v1, p0, Landroid/widget/ImageView;

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result v1

    const/high16 v4, 0x3f800000    # 1.0f

    cmpl-float v1, v1, v4

    if-nez v1, :cond_2

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    if-lez v1, :cond_2

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    if-lez v1, :cond_2

    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getClipToOutline()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    instance-of v1, v1, Landroid/graphics/drawable/GradientDrawable;

    if-nez v1, :cond_1

    invoke-static {p0}, Lcom/melodix/music/PreviewSnapshotRenderer;->outlineRadius(Landroid/view/View;)F

    move-result v1

    const/4 v4, 0x0

    cmpl-float v1, v1, v4

    if-lez v1, :cond_2

    :cond_1
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 21
    :cond_2
    instance-of v1, p0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_3

    .line 22
    check-cast p0, Landroid/view/ViewGroup;

    .line 23
    move v1, v0

    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    if-ge v1, v4, :cond_3

    aget v4, p3, v0

    if-ge v4, v2, :cond_3

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v4, v3, :cond_3

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    add-int/lit8 v5, p2, 0x1

    invoke-static {v4, p1, v5, p3}, Lcom/melodix/music/PreviewSnapshotRenderer;->collect(Landroid/view/View;Ljava/util/ArrayList;I[I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 25
    :cond_3
    return-void

    .line 18
    :cond_4
    :goto_1
    return-void
.end method

.method static draw(Landroid/app/Activity;Landroid/view/View;Landroid/graphics/Canvas;)V
    .locals 26

    .line 33
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 34
    const v4, 0x7f090249

    invoke-virtual {v0, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    const v5, 0x7f090244

    invoke-virtual {v0, v5}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    .line 35
    const/4 v6, 0x2

    new-array v7, v6, [Landroid/view/View;

    const/4 v8, 0x0

    aput-object v4, v7, v8

    const/4 v9, 0x1

    aput-object v5, v7, v9

    move v10, v8

    :goto_0
    const/high16 v11, 0x3f800000    # 1.0f

    if-ge v10, v6, :cond_1

    aget-object v12, v7, v10

    instance-of v13, v12, Landroid/widget/ImageView;

    if-eqz v13, :cond_0

    invoke-virtual {v12}, Landroid/view/View;->isShown()Z

    move-result v13

    if-eqz v13, :cond_0

    invoke-virtual {v12}, Landroid/view/View;->getAlpha()F

    move-result v13

    cmpl-float v11, v13, v11

    if-nez v11, :cond_0

    invoke-virtual {v12}, Landroid/view/View;->getWidth()I

    move-result v11

    if-lez v11, :cond_0

    invoke-virtual {v12}, Landroid/view/View;->getHeight()I

    move-result v11

    if-lez v11, :cond_0

    invoke-virtual {v3, v12}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_0

    invoke-virtual {v3, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 36
    :cond_1
    filled-new-array {v8}, [I

    move-result-object v7

    invoke-static {v1, v3, v8, v7}, Lcom/melodix/music/PreviewSnapshotRenderer;->collect(Landroid/view/View;Ljava/util/ArrayList;I[I)V

    .line 37
    nop

    .line 39
    :try_start_0
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    const/4 v12, 0x0

    if-eqz v10, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/view/View;

    invoke-virtual {v10, v12}, Landroid/view/View;->setAlpha(F)V

    goto :goto_1

    .line 40
    :cond_2
    invoke-virtual/range {p1 .. p2}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_3

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/view/View;

    invoke-virtual {v10, v11}, Landroid/view/View;->setAlpha(F)V

    goto :goto_2

    .line 43
    :cond_3
    nop

    .line 44
    nop

    .line 45
    new-array v7, v6, [I

    new-array v6, v6, [I

    invoke-virtual {v1, v7}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 46
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_9

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 47
    new-instance v10, Landroid/graphics/Rect;

    invoke-direct {v10}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v3, v10}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v11

    if-nez v11, :cond_4

    goto :goto_3

    .line 48
    :cond_4
    invoke-virtual {v3, v6}, Landroid/view/View;->getLocationOnScreen([I)V

    aget v11, v6, v8

    aget v13, v7, v8

    sub-int/2addr v11, v13

    aget v13, v6, v9

    aget v14, v7, v9

    sub-int/2addr v13, v14

    .line 50
    const/high16 v14, 0x40000000    # 2.0f

    if-ne v3, v4, :cond_5

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v15

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v9

    invoke-static {v15, v9}, Ljava/lang/Math;->min(II)I

    move-result v9

    int-to-float v9, v9

    div-float/2addr v9, v14

    move/from16 v24, v9

    goto :goto_4

    .line 51
    :cond_5
    if-ne v3, v5, :cond_6

    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v9

    iget v9, v9, Landroid/util/DisplayMetrics;->density:F

    const/high16 v15, 0x41200000    # 10.0f

    mul-float/2addr v9, v15

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v15

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v8

    invoke-static {v15, v8}, Ljava/lang/Math;->min(II)I

    move-result v8

    int-to-float v8, v8

    div-float/2addr v8, v14

    invoke-static {v9, v8}, Ljava/lang/Math;->min(FF)F

    move-result v9

    move/from16 v24, v9

    goto :goto_4

    .line 52
    :cond_6
    invoke-static {v3}, Lcom/melodix/music/PreviewSnapshotRenderer;->outlineRadius(Landroid/view/View;)F

    move-result v8

    cmpl-float v8, v8, v12

    if-lez v8, :cond_7

    invoke-static {v3}, Lcom/melodix/music/PreviewSnapshotRenderer;->outlineRadius(Landroid/view/View;)F

    move-result v9

    move/from16 v24, v9

    goto :goto_4

    .line 53
    :cond_7
    invoke-virtual {v3}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    instance-of v8, v8, Landroid/graphics/drawable/GradientDrawable;

    if-eqz v8, :cond_8

    invoke-virtual {v3}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    check-cast v8, Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v8}, Landroid/graphics/drawable/GradientDrawable;->getCornerRadius()F

    move-result v9

    move/from16 v24, v9

    goto :goto_4

    .line 54
    :cond_8
    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v8, v8, Landroid/util/DisplayMetrics;->density:F

    const/high16 v9, 0x41400000    # 12.0f

    mul-float/2addr v9, v8

    move/from16 v24, v9

    .line 55
    :goto_4
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/Canvas;->save()I

    move-result v8

    .line 56
    iget v9, v10, Landroid/graphics/Rect;->left:I

    const/4 v14, 0x0

    aget v15, v7, v14

    sub-int/2addr v9, v15

    iget v15, v10, Landroid/graphics/Rect;->top:I

    const/16 v16, 0x1

    aget v17, v7, v16

    sub-int v15, v15, v17

    iget v12, v10, Landroid/graphics/Rect;->right:I

    aget v18, v7, v14

    sub-int v12, v12, v18

    iget v10, v10, Landroid/graphics/Rect;->bottom:I

    aget v18, v7, v16

    sub-int v10, v10, v18

    invoke-virtual {v2, v9, v15, v12, v10}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 57
    int-to-float v9, v11

    int-to-float v10, v13

    invoke-virtual {v2, v9, v10}, Landroid/graphics/Canvas;->translate(FF)V

    new-instance v9, Landroid/graphics/Path;

    invoke-direct {v9}, Landroid/graphics/Path;-><init>()V

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v10

    int-to-float v10, v10

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v11

    int-to-float v11, v11

    sget-object v25, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    const/16 v19, 0x0

    const/16 v20, 0x0

    move-object/from16 v18, v9

    move/from16 v21, v10

    move/from16 v22, v11

    move/from16 v23, v24

    invoke-virtual/range {v18 .. v25}, Landroid/graphics/Path;->addRoundRect(FFFFFFLandroid/graphics/Path$Direction;)V

    .line 58
    invoke-virtual {v2, v9}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    invoke-virtual {v3, v2}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {v2, v8}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 59
    move v8, v14

    move/from16 v9, v16

    const/4 v12, 0x0

    goto/16 :goto_3

    .line 60
    :cond_9
    return-void

    .line 42
    :catchall_0
    move-exception v0

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-virtual {v2, v11}, Landroid/view/View;->setAlpha(F)V

    goto :goto_5

    .line 43
    :cond_a
    throw v0
.end method

.method private static outlineRadius(Landroid/view/View;)F
    .locals 3

    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getOutlineProvider()Landroid/view/ViewOutlineProvider;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Landroid/graphics/drawable/GradientDrawable;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 29
    :cond_0
    :try_start_0
    new-instance v0, Landroid/graphics/Outline;

    invoke-direct {v0}, Landroid/graphics/Outline;-><init>()V

    invoke-virtual {p0}, Landroid/view/View;->getOutlineProvider()Landroid/view/ViewOutlineProvider;

    move-result-object v2

    invoke-virtual {v2, p0, v0}, Landroid/view/ViewOutlineProvider;->getOutline(Landroid/view/View;Landroid/graphics/Outline;)V

    invoke-virtual {v0}, Landroid/graphics/Outline;->getRadius()F

    move-result p0

    invoke-static {v1, p0}, Ljava/lang/Math;->max(FF)F

    move-result p0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    .line 30
    :catch_0
    move-exception p0

    return v1

    .line 28
    :cond_1
    :goto_0
    return v1
.end method
