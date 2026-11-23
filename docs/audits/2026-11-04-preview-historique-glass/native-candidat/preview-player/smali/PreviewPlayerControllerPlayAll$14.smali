.class Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;
.super Landroid/view/View;
.source "PreviewPlayerControllerPlayAll.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerControllerPlayAll;->glyph(Landroid/app/Activity;I)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final p:Landroid/graphics/Paint;

.field final synthetic val$d:F

.field final synthetic val$kind:I


# direct methods
.method constructor <init>(Landroid/content/Context;FI)V
    .locals 0

    .line 231
    iput p2, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->val$d:F

    iput p3, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->val$kind:I

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 232
    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->p:Landroid/graphics/Paint;

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 17

    .line 234
    move-object/from16 v0, p0

    move-object/from16 v7, p1

    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->p:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->p:Landroid/graphics/Paint;

    iget v2, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->val$d:F

    const v3, 0x3fe66666    # 1.8f

    mul-float/2addr v2, v3

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->p:Landroid/graphics/Paint;

    const v2, -0xa0a09

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->p:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->p:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 235
    invoke-virtual/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->getWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual/range {p0 .. p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->getHeight()I

    move-result v2

    int-to-float v2, v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v4

    const/high16 v5, 0x41c00000    # 24.0f

    div-float/2addr v4, v5

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    mul-float/2addr v5, v4

    sub-float/2addr v1, v5

    const/high16 v6, 0x40000000    # 2.0f

    div-float/2addr v1, v6

    sub-float/2addr v2, v5

    div-float/2addr v2, v6

    invoke-virtual {v7, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {v7, v4, v4}, Landroid/graphics/Canvas;->scale(FF)V

    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->p:Landroid/graphics/Paint;

    iget v2, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->val$d:F

    mul-float/2addr v2, v3

    div-float/2addr v2, v4

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 236
    iget v1, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->val$kind:I

    const/high16 v2, 0x41980000    # 19.0f

    const/high16 v3, 0x41400000    # 12.0f

    const/high16 v4, 0x41900000    # 18.0f

    const/high16 v5, 0x40400000    # 3.0f

    if-nez v1, :cond_0

    const/high16 v1, 0x40a00000    # 5.0f

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->p:Landroid/graphics/Paint;

    invoke-virtual {v7, v4, v1, v5, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/high16 v1, 0x40c00000    # 6.0f

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->p:Landroid/graphics/Paint;

    invoke-virtual {v7, v1, v3, v5, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->p:Landroid/graphics/Paint;

    invoke-virtual {v7, v4, v2, v5, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/high16 v5, 0x40d00000    # 6.5f

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->p:Landroid/graphics/Paint;

    const v2, 0x4109999a    # 8.6f

    const/high16 v3, 0x41280000    # 10.5f

    const v4, 0x41766666    # 15.4f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v5, 0x418c0000    # 17.5f

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->p:Landroid/graphics/Paint;

    const/high16 v3, 0x41580000    # 13.5f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_0

    .line 237
    :cond_0
    iget v1, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->val$kind:I

    const/4 v8, 0x2

    if-ne v1, v8, :cond_1

    const/high16 v5, 0x40c00000    # 6.0f

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x40400000    # 3.0f

    const/high16 v3, 0x40c00000    # 6.0f

    const/high16 v4, 0x41100000    # 9.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v5, 0x41100000    # 9.0f

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x40c00000    # 6.0f

    const/high16 v3, 0x40400000    # 3.0f

    const/high16 v4, 0x40c00000    # 6.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v5, 0x40c00000    # 6.0f

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x41400000    # 12.0f

    const/high16 v3, 0x40c00000    # 6.0f

    const/high16 v4, 0x41a80000    # 21.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v5, 0x41400000    # 12.0f

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x40400000    # 3.0f

    const/high16 v3, 0x41400000    # 12.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v5, 0x41900000    # 18.0f

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->p:Landroid/graphics/Paint;

    const/high16 v3, 0x41900000    # 18.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_0

    .line 238
    :cond_1
    iget v1, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->val$kind:I

    const/4 v8, 0x3

    if-ne v1, v8, :cond_2

    const/high16 v1, 0x41100000    # 9.0f

    iget-object v2, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->p:Landroid/graphics/Paint;

    invoke-virtual {v7, v3, v3, v1, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/high16 v5, 0x41400000    # 12.0f

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x41000000    # 8.0f

    const/high16 v3, 0x41400000    # 12.0f

    const/high16 v4, 0x41800000    # 16.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_0

    .line 239
    :cond_2
    const/high16 v1, 0x40800000    # 4.0f

    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->p:Landroid/graphics/Paint;

    const/high16 v8, 0x41200000    # 10.0f

    const/high16 v9, 0x40e00000    # 7.0f

    invoke-virtual {v7, v8, v9, v1, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    const/high16 v3, 0x41a80000    # 21.0f

    invoke-virtual {v1, v5, v3}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v15, 0x41200000    # 10.0f

    const/high16 v16, 0x41500000    # 13.0f

    const/high16 v11, 0x40400000    # 3.0f

    const/high16 v12, 0x41780000    # 15.5f

    const/high16 v13, 0x40d00000    # 6.5f

    const/high16 v14, 0x41500000    # 13.0f

    move-object v10, v1

    invoke-virtual/range {v10 .. v16}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    const v15, 0x4159999a    # 13.6f

    const/high16 v16, 0x41600000    # 14.0f

    const/high16 v11, 0x41380000    # 11.5f

    const/high16 v12, 0x41500000    # 13.0f

    const v13, 0x414b3333    # 12.7f

    const v14, 0x41566666    # 13.4f

    invoke-virtual/range {v10 .. v16}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    iget-object v3, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->p:Landroid/graphics/Paint;

    invoke-virtual {v7, v1, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 240
    iget-object v1, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->p:Landroid/graphics/Paint;

    invoke-virtual {v7, v4, v2, v6, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/high16 v5, 0x41400000    # 12.0f

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->p:Landroid/graphics/Paint;

    const/high16 v2, 0x41a00000    # 20.0f

    const/high16 v3, 0x41980000    # 19.0f

    const/high16 v4, 0x41a00000    # 20.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v5, 0x41500000    # 13.0f

    iget-object v6, v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$14;->p:Landroid/graphics/Paint;

    const/high16 v3, 0x41400000    # 12.0f

    const/high16 v4, 0x41b40000    # 22.5f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 241
    :goto_0
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    .line 242
    return-void
.end method
