.class public final Lcom/melodix/music/PreviewPlayerLikeArt;
.super Landroid/graphics/drawable/Drawable;
.source "PreviewPlayerLikeArt.java"


# instance fields
.field private final control:Landroid/view/View;

.field private final paint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 2
    .param p1, "control"    # Landroid/view/View;

    .prologue
    .line 15
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 14
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    .line 15
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->control:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 13
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 17
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->control:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v12

    .line 18
    .local v12, "value":Ljava/lang/CharSequence;
    if-nez v12, :cond_0

    const-string v11, ""

    .line 19
    .local v11, "label":Ljava/lang/String;
    :goto_0
    const-string v1, "Retirer des titres lik\u00e9s"

    invoke-virtual {v11, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    .line 20
    .local v7, "active":Z
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->control:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v10, v1, Landroid/util/DisplayMetrics;->density:F

    .line 21
    .local v10, "d":F
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerLikeArt;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float v8, v1, v2

    .local v8, "cx":F
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerLikeArt;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float v9, v1, v2

    .line 22
    .local v9, "cy":F
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    const/high16 v1, 0x41400000    # 12.0f

    mul-float/2addr v1, v10

    sub-float v1, v8, v1

    const/high16 v2, 0x41400000    # 12.0f

    mul-float/2addr v2, v10

    sub-float v2, v9, v2

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {p1, v10, v10}, Landroid/graphics/Canvas;->scale(FF)V

    .line 23
    const-string v1, "Chargement :"

    invoke-virtual {v11, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 24
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    const v2, -0x26000001

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x40000000    # 2.0f

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 25
    const/high16 v1, 0x41400000    # 12.0f

    const/high16 v2, 0x41400000    # 12.0f

    const/high16 v3, 0x40e00000    # 7.0f

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/high16 v1, 0x41400000    # 12.0f

    const/high16 v2, 0x41000000    # 8.0f

    const/high16 v3, 0x41400000    # 12.0f

    const/high16 v4, 0x41400000    # 12.0f

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v1, 0x41400000    # 12.0f

    const/high16 v2, 0x41400000    # 12.0f

    const/high16 v3, 0x41700000    # 15.0f

    const/high16 v4, 0x41600000    # 14.0f

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 35
    :goto_1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 36
    return-void

    .line 18
    .end local v7    # "active":Z
    .end local v8    # "cx":F
    .end local v9    # "cy":F
    .end local v10    # "d":F
    .end local v11    # "label":Ljava/lang/String;
    :cond_0
    invoke-interface {v12}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v11

    goto/16 :goto_0

    .line 26
    .restart local v7    # "active":Z
    .restart local v8    # "cx":F
    .restart local v9    # "cy":F
    .restart local v10    # "d":F
    .restart local v11    # "label":Ljava/lang/String;
    :cond_1
    if-eqz v7, :cond_2

    .line 27
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    const v2, -0x1fb762

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 28
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .local v0, "heart":Landroid/graphics/Path;
    const/high16 v1, 0x41400000    # 12.0f

    const/high16 v2, 0x41a80000    # 21.0f

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v1, 0x41280000    # 10.5f

    const v2, 0x419d999a    # 19.7f

    const/high16 v3, 0x40400000    # 3.0f

    const v4, 0x416b3333    # 14.7f

    const/high16 v5, 0x40400000    # 3.0f

    const v6, 0x41166666    # 9.4f

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 29
    const/high16 v1, 0x40400000    # 3.0f

    const/high16 v2, 0x40900000    # 4.5f

    const v3, 0x4109999a    # 8.6f

    const v4, 0x402ccccd    # 2.7f

    const/high16 v5, 0x41400000    # 12.0f

    const/high16 v6, 0x40e00000    # 7.0f

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    const v1, 0x41766666    # 15.4f

    const v2, 0x402ccccd    # 2.7f

    const/high16 v3, 0x41a80000    # 21.0f

    const/high16 v4, 0x40900000    # 4.5f

    const/high16 v5, 0x41a80000    # 21.0f

    const v6, 0x41166666    # 9.4f

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 30
    const/high16 v1, 0x41a80000    # 21.0f

    const v2, 0x416b3333    # 14.7f

    const/high16 v3, 0x41580000    # 13.5f

    const v4, 0x419d999a    # 19.7f

    const/high16 v5, 0x41400000    # 12.0f

    const/high16 v6, 0x41a80000    # 21.0f

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto :goto_1

    .line 32
    .end local v0    # "heart":Landroid/graphics/Path;
    :cond_2
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    const v2, -0x26000001

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x40000000    # 2.0f

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 33
    const/high16 v2, 0x41400000    # 12.0f

    const/high16 v3, 0x40a00000    # 5.0f

    const/high16 v4, 0x41400000    # 12.0f

    const/high16 v5, 0x41980000    # 19.0f

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v2, 0x40a00000    # 5.0f

    const/high16 v3, 0x41400000    # 12.0f

    const/high16 v4, 0x41980000    # 19.0f

    const/high16 v5, 0x41400000    # 12.0f

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_1
.end method

.method public getOpacity()I
    .locals 1

    .prologue
    .line 39
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .locals 0
    .param p1, "alpha"    # I

    .prologue
    .line 37
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0
    .param p1, "filter"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 38
    return-void
.end method
