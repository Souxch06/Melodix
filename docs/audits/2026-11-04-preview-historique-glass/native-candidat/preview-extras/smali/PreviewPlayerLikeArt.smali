.class public final Lcom/melodix/music/PreviewPlayerLikeArt;
.super Landroid/graphics/drawable/Drawable;
.source "PreviewPlayerLikeArt.java"


# instance fields
.field private final control:Landroid/view/View;

.field private final paint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 2

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
    .locals 12

    .prologue
    const v10, 0x402ccccd    # 2.7f

    const/high16 v3, 0x40400000    # 3.0f

    const/high16 v6, 0x40000000    # 2.0f

    const/high16 v9, 0x41a80000    # 21.0f

    const/high16 v7, 0x41400000    # 12.0f

    .line 17
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->control:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    .line 18
    if-nez v0, :cond_0

    const-string v0, ""

    .line 19
    :goto_0
    const-string v1, "Retirer des titres lik\u00e9s"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    .line 20
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->control:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    .line 21
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerLikeArt;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v2, v6

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerLikeArt;->getBounds()Landroid/graphics/Rect;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v4, v6

    .line 22
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    mul-float v5, v7, v1

    sub-float/2addr v2, v5

    mul-float v5, v7, v1

    sub-float/2addr v4, v5

    invoke-virtual {p1, v2, v4}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {p1, v1, v1}, Landroid/graphics/Canvas;->scale(FF)V

    .line 23
    if-eqz v0, :cond_1

    .line 24
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    const v1, -0x1fb762

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 25
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    invoke-virtual {v0, v7, v9}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v1, 0x41280000    # 10.5f

    const v2, 0x419d999a    # 19.7f

    const v4, 0x416b3333    # 14.7f

    const v6, 0x41166666    # 9.4f

    move v5, v3

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 26
    const/high16 v4, 0x40900000    # 4.5f

    const v5, 0x4109999a    # 8.6f

    const/high16 v8, 0x40e00000    # 7.0f

    move-object v2, v0

    move v6, v10

    invoke-virtual/range {v2 .. v8}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    const v1, 0x41766666    # 15.4f

    const/high16 v4, 0x40900000    # 4.5f

    const v6, 0x41166666    # 9.4f

    move v2, v10

    move v3, v9

    move v5, v9

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 27
    const v2, 0x416b3333    # 14.7f

    const/high16 v3, 0x41580000    # 13.5f

    const v4, 0x419d999a    # 19.7f

    move v1, v9

    move v5, v7

    move v6, v9

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 32
    :goto_1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 33
    return-void

    .line 18
    :cond_0
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    .line 29
    :cond_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    const v1, -0x26000001

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, v6}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 30
    const/high16 v8, 0x40a00000    # 5.0f

    const/high16 v10, 0x41980000    # 19.0f

    iget-object v11, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    move-object v6, p1

    move v9, v7

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v6, 0x40a00000    # 5.0f

    const/high16 v8, 0x41980000    # 19.0f

    iget-object v10, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    move-object v5, p1

    move v9, v7

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_1
.end method

.method public getOpacity()I
    .locals 1

    .prologue
    .line 36
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .locals 0

    .prologue
    .line 34
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .prologue
    .line 35
    return-void
.end method
