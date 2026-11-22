.class Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;
.super Landroid/view/View;
.source "PreviewPlayerControllerPlayAll.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerControllerPlayAll;->icon(Landroid/app/Activity;Z)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final p:Landroid/graphics/Paint;

.field final synthetic val$d:F

.field final synthetic val$play:Z


# direct methods
.method constructor <init>(Landroid/content/Context;ZF)V
    .locals 0

    .line 67
    iput-boolean p2, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$play:Z

    iput p3, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$d:F

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 68
    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 21

    .line 70
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->getWidth()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->getHeight()I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float v5, v3, v4

    .line 71
    new-instance v6, Landroid/graphics/RectF;

    const/high16 v7, 0x3f800000    # 1.0f

    sub-float v8, v2, v7

    sub-float v9, v3, v7

    invoke-direct {v6, v7, v7, v8, v9}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 72
    iget-boolean v7, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$play:Z

    const/4 v8, 0x1

    const/4 v9, 0x0

    if-nez v7, :cond_0

    sget-boolean v7, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->shuffleOn:Z

    if-eqz v7, :cond_0

    move v7, v8

    goto :goto_0

    :cond_0
    move v7, v9

    .line 73
    :goto_0
    iget-object v10, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    sget-object v11, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v10, v11}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v10, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    iget-boolean v11, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$play:Z

    const v12, -0xa0a09

    if-eqz v11, :cond_1

    move v11, v12

    goto :goto_1

    :cond_1
    if-eqz v7, :cond_2

    const v11, 0x331ed760

    goto :goto_1

    :cond_2
    const v11, 0x26ffffff

    :goto_1
    invoke-virtual {v10, v11}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v10, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v1, v6, v5, v5, v10}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 74
    iget-boolean v10, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$play:Z

    const v11, -0xe128a0

    if-nez v10, :cond_4

    iget-object v10, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    sget-object v13, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v10, v13}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v10, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    iget v13, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$d:F

    invoke-virtual {v10, v13}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v10, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    if-eqz v7, :cond_3

    move v13, v11

    goto :goto_2

    :cond_3
    const v13, 0x40ffffff    # 7.9999995f

    :goto_2
    invoke-virtual {v10, v13}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v10, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v1, v6, v5, v5, v10}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 75
    :cond_4
    iget-boolean v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$play:Z

    if-eqz v6, :cond_5

    const v12, -0xeeeeec

    goto :goto_3

    :cond_5
    if-eqz v7, :cond_6

    move v12, v11

    .line 76
    :cond_6
    :goto_3
    if-eqz v7, :cond_7

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    sget-object v7, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v6, v11}, Landroid/graphics/Paint;->setColor(I)V

    div-float v6, v2, v4

    const/high16 v7, 0x40c00000    # 6.0f

    iget v10, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$d:F

    mul-float/2addr v10, v7

    sub-float/2addr v3, v10

    iget v7, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$d:F

    mul-float/2addr v7, v4

    iget-object v10, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v1, v6, v3, v7, v10}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 77
    :cond_7
    iget-boolean v3, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$play:Z

    if-eqz v3, :cond_8

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v6

    sget-wide v10, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->loadingUntil:J

    cmp-long v3, v6, v10

    if-gez v3, :cond_8

    goto :goto_4

    :cond_8
    move v8, v9

    .line 78
    :goto_4
    iget-boolean v3, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$play:Z

    if-eqz v3, :cond_a

    if-eqz v8, :cond_9

    const-string v3, "Chargement\u2026"

    goto :goto_5

    :cond_9
    const-string v3, "Lecture"

    goto :goto_5

    :cond_a
    const-string v3, "Al\u00e9atoire"

    .line 79
    :goto_5
    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    sget-object v7, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    const/high16 v7, 0x41700000    # 15.0f

    iget v8, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$d:F

    mul-float/2addr v8, v7

    invoke-virtual {v6, v8}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    sget-object v7, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 80
    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v6, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v6

    const/high16 v7, 0x41600000    # 14.0f

    iget v8, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$d:F

    mul-float/2addr v8, v7

    const/high16 v7, 0x41000000    # 8.0f

    iget v9, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$d:F

    mul-float/2addr v9, v7

    sub-float/2addr v2, v8

    sub-float/2addr v2, v9

    sub-float/2addr v2, v6

    div-float/2addr v2, v4

    .line 81
    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v6, v12}, Landroid/graphics/Paint;->setColor(I)V

    .line 82
    iget-boolean v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$play:Z

    if-eqz v6, :cond_b

    new-instance v6, Landroid/graphics/Path;

    invoke-direct {v6}, Landroid/graphics/Path;-><init>()V

    iget v7, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$d:F

    const/high16 v10, 0x40e00000    # 7.0f

    mul-float/2addr v7, v10

    sub-float v7, v5, v7

    invoke-virtual {v6, v2, v7}, Landroid/graphics/Path;->moveTo(FF)V

    add-float v7, v2, v8

    invoke-virtual {v6, v7, v5}, Landroid/graphics/Path;->lineTo(FF)V

    iget v7, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$d:F

    mul-float/2addr v7, v10

    add-float/2addr v7, v5

    invoke-virtual {v6, v2, v7}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v6}, Landroid/graphics/Path;->close()V

    iget-object v7, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v1, v6, v7}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto/16 :goto_6

    .line 84
    :cond_b
    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    sget-object v7, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    const v7, 0x3fe66666    # 1.8f

    iget v10, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$d:F

    mul-float/2addr v10, v7

    invoke-virtual {v6, v10}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    sget-object v7, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    sget-object v7, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 85
    add-float v6, v2, v8

    iget v7, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$d:F

    const/high16 v10, 0x40a00000    # 5.0f

    mul-float/2addr v7, v10

    sub-float v7, v5, v7

    iget v11, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$d:F

    mul-float/2addr v11, v10

    add-float v15, v5, v11

    const/high16 v10, 0x40400000    # 3.0f

    iget v11, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$d:F

    mul-float v17, v11, v10

    new-instance v14, Landroid/graphics/Path;

    invoke-direct {v14}, Landroid/graphics/Path;-><init>()V

    .line 86
    invoke-virtual {v14, v2, v15}, Landroid/graphics/Path;->moveTo(FF)V

    const v10, 0x3ee66666    # 0.45f

    mul-float/2addr v10, v8

    add-float v18, v2, v10

    const v10, 0x3f0ccccd    # 0.55f

    mul-float/2addr v10, v8

    add-float v19, v2, v10

    move-object v10, v14

    move/from16 v11, v18

    move v12, v15

    move/from16 v13, v19

    move-object v4, v14

    move v14, v7

    move/from16 v20, v15

    move v15, v6

    move/from16 v16, v7

    invoke-virtual/range {v10 .. v16}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 87
    invoke-virtual {v4, v2, v7}, Landroid/graphics/Path;->moveTo(FF)V

    move-object v10, v4

    move v12, v7

    move/from16 v14, v20

    move/from16 v16, v20

    invoke-virtual/range {v10 .. v16}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 88
    sub-float v10, v6, v17

    sub-float v11, v7, v17

    invoke-virtual {v4, v10, v11}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v4, v6, v7}, Landroid/graphics/Path;->lineTo(FF)V

    add-float v7, v7, v17

    invoke-virtual {v4, v10, v7}, Landroid/graphics/Path;->lineTo(FF)V

    .line 89
    move/from16 v11, v20

    sub-float v15, v11, v17

    invoke-virtual {v4, v10, v15}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v4, v6, v11}, Landroid/graphics/Path;->lineTo(FF)V

    add-float v15, v11, v17

    invoke-virtual {v4, v10, v15}, Landroid/graphics/Path;->lineTo(FF)V

    .line 90
    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v1, v4, v6}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    sget-object v6, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 92
    :goto_6
    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v4}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    move-result-object v4

    .line 93
    add-float/2addr v2, v8

    add-float/2addr v2, v9

    iget v6, v4, Landroid/graphics/Paint$FontMetrics;->ascent:F

    iget v4, v4, Landroid/graphics/Paint$FontMetrics;->descent:F

    add-float/2addr v6, v4

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v6, v4

    sub-float/2addr v5, v6

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v1, v3, v2, v5, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 94
    return-void
.end method
