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
.method constructor <init>(Landroid/content/Context;FZ)V
    .locals 0

    .line 71
    iput p2, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$d:F

    iput-boolean p3, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$play:Z

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 72
    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 17

    .line 74
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->getWidth()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->getHeight()I

    move-result v3

    int-to-float v3, v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v4

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v4, v5

    iget v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$d:F

    sub-float/2addr v4, v6

    div-float/2addr v2, v5

    div-float/2addr v3, v5

    .line 75
    iget-boolean v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$play:Z

    const/4 v7, 0x1

    const/4 v8, 0x0

    if-nez v6, :cond_0

    sget-boolean v6, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->shuffleOn:Z

    if-eqz v6, :cond_0

    move v6, v7

    goto :goto_0

    :cond_0
    move v6, v8

    :goto_0
    iget-boolean v9, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$play:Z

    if-eqz v9, :cond_1

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v9

    sget-wide v11, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->loadingUntil:J

    cmp-long v9, v9, v11

    if-gez v9, :cond_1

    goto :goto_1

    :cond_1
    move v7, v8

    .line 76
    :goto_1
    iget-object v8, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    sget-object v9, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 77
    iget-boolean v8, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$play:Z

    const v9, -0xa0a09

    if-nez v8, :cond_3

    if-eqz v6, :cond_2

    goto :goto_2

    .line 82
    :cond_2
    iget-object v8, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    const v10, 0x26ffffff

    invoke-virtual {v8, v10}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v8, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v3, v4, v8}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 83
    iget-object v8, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    sget-object v10, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v8, v10}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v8, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    iget v10, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$d:F

    invoke-virtual {v8, v10}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v8, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    const v10, 0x40ffffff    # 7.9999995f

    invoke-virtual {v8, v10}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v8, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v3, v4, v8}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_3

    .line 79
    :cond_3
    :goto_2
    iget-object v8, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    const v10, 0x22ffffff

    invoke-virtual {v8, v10}, Landroid/graphics/Paint;->setColor(I)V

    iget v8, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$d:F

    add-float/2addr v8, v4

    iget-object v10, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v3, v8, v10}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 80
    iget-object v8, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setColor(I)V

    iget v8, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$d:F

    mul-float/2addr v8, v5

    sub-float v8, v4, v8

    iget-object v10, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v3, v8, v10}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 85
    :goto_3
    iget-boolean v8, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$play:Z

    if-nez v8, :cond_4

    if-eqz v6, :cond_5

    :cond_4
    const v9, -0xeeeeec

    :cond_5
    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v6, v9}, Landroid/graphics/Paint;->setColor(I)V

    .line 86
    iget-boolean v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$play:Z

    if-eqz v6, :cond_7

    .line 87
    const v5, 0x3eb851ec    # 0.36f

    if-eqz v7, :cond_6

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    sget-object v7, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    const/high16 v7, 0x40200000    # 2.5f

    iget v8, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$d:F

    mul-float/2addr v8, v7

    invoke-virtual {v6, v8}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    sget-object v7, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 88
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v6

    const-wide/16 v8, 0x3e8

    rem-long/2addr v6, v8

    long-to-float v6, v6

    mul-float/2addr v5, v6

    .line 89
    new-instance v6, Landroid/graphics/RectF;

    const v7, 0x3ec28f5c    # 0.38f

    mul-float/2addr v4, v7

    sub-float v7, v2, v4

    sub-float v8, v3, v4

    add-float/2addr v2, v4

    add-float/2addr v3, v4

    invoke-direct {v6, v7, v8, v2, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    const/4 v7, 0x0

    iget-object v8, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    const/high16 v4, 0x43870000    # 270.0f

    move-object/from16 v1, p1

    move-object v2, v6

    move v3, v5

    move v5, v7

    move-object v6, v8

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    invoke-virtual/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->postInvalidateOnAnimation()V

    return-void

    .line 90
    :cond_6
    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    sget-object v7, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    new-instance v6, Landroid/graphics/Path;

    invoke-direct {v6}, Landroid/graphics/Path;-><init>()V

    .line 91
    const v7, 0x3e851eb8    # 0.26f

    mul-float/2addr v7, v4

    sub-float v7, v2, v7

    mul-float/2addr v5, v4

    sub-float v8, v3, v5

    invoke-virtual {v6, v7, v8}, Landroid/graphics/Path;->moveTo(FF)V

    const v8, 0x3ecccccd    # 0.4f

    mul-float/2addr v4, v8

    add-float/2addr v2, v4

    invoke-virtual {v6, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    add-float/2addr v3, v5

    invoke-virtual {v6, v7, v3}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v6}, Landroid/graphics/Path;->close()V

    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v1, v6, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void

    .line 93
    :cond_7
    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    sget-object v7, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    const v7, 0x3fe66666    # 1.8f

    iget v8, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$d:F

    mul-float/2addr v8, v7

    invoke-virtual {v6, v8}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    sget-object v7, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    sget-object v7, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 94
    const v6, 0x3f666666    # 0.9f

    mul-float/2addr v6, v4

    div-float v5, v6, v5

    sub-float v7, v2, v5

    add-float/2addr v2, v5

    const v5, 0x3e8f5c29    # 0.28f

    mul-float/2addr v5, v4

    sub-float v15, v3, v5

    add-float/2addr v3, v5

    const v5, 0x3e23d70a    # 0.16f

    mul-float/2addr v4, v5

    new-instance v5, Landroid/graphics/Path;

    invoke-direct {v5}, Landroid/graphics/Path;-><init>()V

    .line 95
    invoke-virtual {v5, v7, v3}, Landroid/graphics/Path;->moveTo(FF)V

    const v8, 0x3ee66666    # 0.45f

    mul-float/2addr v8, v6

    add-float v16, v7, v8

    const v8, 0x3f0ccccd    # 0.55f

    mul-float/2addr v6, v8

    add-float/2addr v6, v7

    move-object v8, v5

    move/from16 v9, v16

    move v10, v3

    move v11, v6

    move v12, v15

    move v13, v2

    move v14, v15

    invoke-virtual/range {v8 .. v14}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 96
    invoke-virtual {v5, v7, v15}, Landroid/graphics/Path;->moveTo(FF)V

    move v10, v15

    move v12, v3

    move v14, v3

    invoke-virtual/range {v8 .. v14}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 97
    sub-float v6, v2, v4

    sub-float v7, v15, v4

    invoke-virtual {v5, v6, v7}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v5, v2, v15}, Landroid/graphics/Path;->lineTo(FF)V

    add-float/2addr v15, v4

    invoke-virtual {v5, v6, v15}, Landroid/graphics/Path;->lineTo(FF)V

    .line 98
    sub-float v7, v3, v4

    invoke-virtual {v5, v6, v7}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v5, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    add-float/2addr v3, v4

    invoke-virtual {v5, v6, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 99
    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v1, v5, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 100
    return-void
.end method
