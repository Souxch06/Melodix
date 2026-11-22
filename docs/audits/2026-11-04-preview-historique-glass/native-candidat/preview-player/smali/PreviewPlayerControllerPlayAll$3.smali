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

    .line 59
    iput-boolean p2, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$play:Z

    iput p3, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$d:F

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 60
    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 21

    .line 62
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

    .line 63
    new-instance v6, Landroid/graphics/RectF;

    const/high16 v7, 0x3f800000    # 1.0f

    sub-float v8, v2, v7

    sub-float/2addr v3, v7

    invoke-direct {v6, v7, v7, v8, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 64
    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    sget-object v7, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    iget-boolean v7, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$play:Z

    const v8, -0xa0a09

    if-eqz v7, :cond_0

    move v7, v8

    goto :goto_0

    :cond_0
    const v7, 0x26ffffff

    :goto_0
    invoke-virtual {v3, v7}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v1, v6, v5, v5, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 65
    iget-boolean v3, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$play:Z

    if-nez v3, :cond_1

    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    sget-object v7, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    iget v7, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$d:F

    invoke-virtual {v3, v7}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    const v7, 0x40ffffff    # 7.9999995f

    invoke-virtual {v3, v7}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v1, v6, v5, v5, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 66
    :cond_1
    iget-boolean v3, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$play:Z

    if-eqz v3, :cond_2

    const v8, -0xeeeeec

    .line 67
    :cond_2
    iget-boolean v3, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$play:Z

    if-eqz v3, :cond_3

    const-string v3, "Lecture"

    goto :goto_1

    :cond_3
    const-string v3, "Al\u00e9atoire"

    .line 68
    :goto_1
    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    sget-object v7, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    const/high16 v7, 0x41700000    # 15.0f

    iget v9, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$d:F

    mul-float/2addr v9, v7

    invoke-virtual {v6, v9}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    sget-object v7, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 69
    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v6, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v6

    const/high16 v7, 0x41600000    # 14.0f

    iget v9, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$d:F

    mul-float/2addr v9, v7

    const/high16 v7, 0x41000000    # 8.0f

    iget v10, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$d:F

    mul-float/2addr v10, v7

    sub-float/2addr v2, v9

    sub-float/2addr v2, v10

    sub-float/2addr v2, v6

    div-float/2addr v2, v4

    .line 70
    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v6, v8}, Landroid/graphics/Paint;->setColor(I)V

    .line 71
    iget-boolean v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$play:Z

    if-eqz v6, :cond_4

    new-instance v6, Landroid/graphics/Path;

    invoke-direct {v6}, Landroid/graphics/Path;-><init>()V

    iget v7, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$d:F

    const/high16 v8, 0x40e00000    # 7.0f

    mul-float/2addr v7, v8

    sub-float v7, v5, v7

    invoke-virtual {v6, v2, v7}, Landroid/graphics/Path;->moveTo(FF)V

    add-float v7, v2, v9

    invoke-virtual {v6, v7, v5}, Landroid/graphics/Path;->lineTo(FF)V

    iget v7, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$d:F

    mul-float/2addr v7, v8

    add-float/2addr v7, v5

    invoke-virtual {v6, v2, v7}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v6}, Landroid/graphics/Path;->close()V

    iget-object v7, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v1, v6, v7}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto/16 :goto_2

    .line 73
    :cond_4
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

    .line 74
    add-float v6, v2, v9

    iget v7, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$d:F

    const/high16 v8, 0x40a00000    # 5.0f

    mul-float/2addr v7, v8

    sub-float v7, v5, v7

    iget v11, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$d:F

    mul-float/2addr v11, v8

    add-float v8, v5, v11

    const/high16 v11, 0x40400000    # 3.0f

    iget v12, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$d:F

    mul-float v18, v12, v11

    new-instance v15, Landroid/graphics/Path;

    invoke-direct {v15}, Landroid/graphics/Path;-><init>()V

    .line 75
    invoke-virtual {v15, v2, v8}, Landroid/graphics/Path;->moveTo(FF)V

    const v11, 0x3ee66666    # 0.45f

    mul-float/2addr v11, v9

    add-float v19, v2, v11

    const v11, 0x3f0ccccd    # 0.55f

    mul-float/2addr v11, v9

    add-float v20, v2, v11

    move-object v11, v15

    move/from16 v12, v19

    move v13, v8

    move/from16 v14, v20

    move-object v4, v15

    move v15, v7

    move/from16 v16, v6

    move/from16 v17, v7

    invoke-virtual/range {v11 .. v17}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 76
    invoke-virtual {v4, v2, v7}, Landroid/graphics/Path;->moveTo(FF)V

    move-object v11, v4

    move v13, v7

    move v15, v8

    move/from16 v17, v8

    invoke-virtual/range {v11 .. v17}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 77
    sub-float v11, v6, v18

    sub-float v12, v7, v18

    invoke-virtual {v4, v11, v12}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v4, v6, v7}, Landroid/graphics/Path;->lineTo(FF)V

    add-float v7, v7, v18

    invoke-virtual {v4, v11, v7}, Landroid/graphics/Path;->lineTo(FF)V

    .line 78
    sub-float v7, v8, v18

    invoke-virtual {v4, v11, v7}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v4, v6, v8}, Landroid/graphics/Path;->lineTo(FF)V

    add-float v8, v8, v18

    invoke-virtual {v4, v11, v8}, Landroid/graphics/Path;->lineTo(FF)V

    .line 79
    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v1, v4, v6}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    sget-object v6, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 81
    :goto_2
    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v4}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    move-result-object v4

    .line 82
    add-float/2addr v2, v9

    add-float/2addr v2, v10

    iget v6, v4, Landroid/graphics/Paint$FontMetrics;->ascent:F

    iget v4, v4, Landroid/graphics/Paint$FontMetrics;->descent:F

    add-float/2addr v6, v4

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v6, v4

    sub-float/2addr v5, v6

    iget-object v4, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v1, v3, v2, v5, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 83
    return-void
.end method
