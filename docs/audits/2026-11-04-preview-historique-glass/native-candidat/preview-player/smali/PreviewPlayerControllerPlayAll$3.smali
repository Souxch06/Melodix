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

.field final synthetic val$play:Z


# direct methods
.method constructor <init>(Landroid/content/Context;Z)V
    .locals 0

    .line 56
    iput-boolean p2, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$play:Z

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 57
    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 17

    .line 59
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

    div-float/2addr v2, v5

    div-float/2addr v3, v5

    .line 60
    iget-boolean v5, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->val$play:Z

    const v6, -0xa0a09

    if-eqz v5, :cond_0

    .line 62
    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    sget-object v7, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 63
    new-instance v5, Landroid/graphics/Path;

    invoke-direct {v5}, Landroid/graphics/Path;-><init>()V

    const v6, 0x3e851eb8    # 0.26f

    mul-float/2addr v6, v4

    sub-float v6, v2, v6

    const v7, 0x3ec28f5c    # 0.38f

    mul-float/2addr v7, v4

    sub-float v8, v3, v7

    invoke-virtual {v5, v6, v8}, Landroid/graphics/Path;->moveTo(FF)V

    const v8, 0x3ed70a3d    # 0.42f

    mul-float/2addr v4, v8

    add-float/2addr v2, v4

    invoke-virtual {v5, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    add-float/2addr v3, v7

    invoke-virtual {v5, v6, v3}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v5}, Landroid/graphics/Path;->close()V

    .line 64
    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    const v3, -0xeeeeec

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v1, v5, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void

    .line 67
    :cond_0
    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    sget-object v7, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    const v7, 0x26ffffff

    invoke-virtual {v5, v7}, Landroid/graphics/Paint;->setColor(I)V

    const/high16 v5, 0x3f800000    # 1.0f

    sub-float v7, v4, v5

    iget-object v8, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v3, v7, v8}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 68
    iget-object v8, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    sget-object v9, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v8, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    const v9, 0x3d23d70a    # 0.04f

    mul-float/2addr v9, v4

    invoke-static {v5, v9}, Ljava/lang/Math;->max(FF)F

    move-result v5

    invoke-virtual {v8, v5}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    const v8, 0x40ffffff    # 7.9999995f

    invoke-virtual {v5, v8}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v5, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v3, v7, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 69
    const v5, 0x3f1eb852    # 0.62f

    mul-float/2addr v4, v5

    .line 70
    iget-object v7, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    const v8, 0x3e051eb8    # 0.13f

    mul-float/2addr v8, v4

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v7, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    sget-object v8, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    iget-object v7, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    sget-object v8, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    iget-object v7, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v7, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 71
    mul-float/2addr v5, v4

    sub-float v5, v2, v5

    const v6, 0x3f0ccccd    # 0.55f

    mul-float/2addr v6, v4

    add-float/2addr v6, v2

    const v7, 0x3eae147b    # 0.34f

    mul-float/2addr v7, v4

    sub-float v14, v3, v7

    add-float/2addr v3, v7

    const v7, 0x3e4ccccd    # 0.2f

    mul-float v15, v4, v7

    .line 72
    new-instance v13, Landroid/graphics/Path;

    invoke-direct {v13}, Landroid/graphics/Path;-><init>()V

    .line 73
    invoke-virtual {v13, v5, v3}, Landroid/graphics/Path;->moveTo(FF)V

    const v7, 0x3dcccccd    # 0.1f

    mul-float/2addr v7, v4

    sub-float v16, v2, v7

    const v7, 0x3d4ccccd    # 0.05f

    mul-float/2addr v4, v7

    add-float/2addr v2, v4

    move-object v7, v13

    move/from16 v8, v16

    move v9, v3

    move v10, v2

    move v11, v14

    move v12, v6

    move-object v4, v13

    move v13, v14

    invoke-virtual/range {v7 .. v13}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 74
    invoke-virtual {v4, v5, v14}, Landroid/graphics/Path;->moveTo(FF)V

    move-object v7, v4

    move v9, v14

    move v11, v3

    move v13, v3

    invoke-virtual/range {v7 .. v13}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 75
    sub-float v2, v6, v15

    sub-float v5, v14, v15

    invoke-virtual {v4, v2, v5}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v4, v6, v14}, Landroid/graphics/Path;->lineTo(FF)V

    add-float/2addr v14, v15

    invoke-virtual {v4, v2, v14}, Landroid/graphics/Path;->lineTo(FF)V

    .line 76
    sub-float v5, v3, v15

    invoke-virtual {v4, v2, v5}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v4, v6, v3}, Landroid/graphics/Path;->lineTo(FF)V

    add-float/2addr v3, v15

    invoke-virtual {v4, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 77
    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$3;->p:Landroid/graphics/Paint;

    invoke-virtual {v1, v4, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 78
    return-void
.end method
