.class public final Lcom/melodix/music/PreviewPlayerLikeArt;
.super Landroid/graphics/drawable/Drawable;
.source "PreviewPlayerLikeArt.java"


# instance fields
.field private final control:Landroid/view/View;

.field private final paint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 2

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
    .locals 14

    .line 17
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->control:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    .line 18
    if-nez v0, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 19
    :goto_0
    const-string v1, "Titre aim\u00e9"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    .line 20
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->control:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    .line 21
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerLikeArt;->getBounds()Landroid/graphics/Rect;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerLikeArt;->getBounds()Landroid/graphics/Rect;

    move-result-object v5

    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v5, v4

    .line 22
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    const/high16 v6, 0x41400000    # 12.0f

    mul-float v7, v2, v6

    sub-float/2addr v3, v7

    sub-float/2addr v5, v7

    invoke-virtual {p1, v3, v5}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {p1, v2, v2}, Landroid/graphics/Canvas;->scale(FF)V

    .line 23
    const-string v2, "Chargement :"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const v2, -0x26000001

    if-eqz v0, :cond_1

    .line 24
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 25
    const/high16 v0, 0x40e00000    # 7.0f

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v6, v6, v0, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/high16 v11, 0x41400000    # 12.0f

    iget-object v12, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    const/high16 v8, 0x41400000    # 12.0f

    const/high16 v9, 0x41000000    # 8.0f

    const/high16 v10, 0x41400000    # 12.0f

    move-object v7, p1

    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v4, 0x41600000    # 14.0f

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x41400000    # 12.0f

    const/high16 v2, 0x41400000    # 12.0f

    const/high16 v3, 0x41700000    # 15.0f

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_1

    .line 26
    :cond_1
    if-eqz v1, :cond_2

    .line 27
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    const v1, -0xa0a09

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 28
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    const/high16 v1, 0x41a80000    # 21.0f

    invoke-virtual {v0, v6, v1}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v12, 0x40400000    # 3.0f

    const v13, 0x41166666    # 9.4f

    const/high16 v8, 0x41280000    # 10.5f

    const v9, 0x419d999a    # 19.7f

    const/high16 v10, 0x40400000    # 3.0f

    const v11, 0x416b3333    # 14.7f

    move-object v7, v0

    invoke-virtual/range {v7 .. v13}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 29
    const/high16 v12, 0x41400000    # 12.0f

    const/high16 v13, 0x40e00000    # 7.0f

    const/high16 v8, 0x40400000    # 3.0f

    const/high16 v9, 0x40900000    # 4.5f

    const v10, 0x4109999a    # 8.6f

    const v11, 0x402ccccd    # 2.7f

    invoke-virtual/range {v7 .. v13}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    const/high16 v12, 0x41a80000    # 21.0f

    const v13, 0x41166666    # 9.4f

    const v8, 0x41766666    # 15.4f

    const v9, 0x402ccccd    # 2.7f

    const/high16 v10, 0x41a80000    # 21.0f

    const/high16 v11, 0x40900000    # 4.5f

    invoke-virtual/range {v7 .. v13}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 30
    const/high16 v12, 0x41400000    # 12.0f

    const/high16 v13, 0x41a80000    # 21.0f

    const/high16 v8, 0x41a80000    # 21.0f

    const v9, 0x416b3333    # 14.7f

    const/high16 v10, 0x41580000    # 13.5f

    const v11, 0x419d999a    # 19.7f

    invoke-virtual/range {v7 .. v13}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 31
    goto :goto_1

    .line 32
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 33
    const/high16 v6, 0x41980000    # 19.0f

    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    const/high16 v3, 0x41400000    # 12.0f

    const/high16 v4, 0x40a00000    # 5.0f

    const/high16 v5, 0x41400000    # 12.0f

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v12, 0x41400000    # 12.0f

    iget-object v13, p0, Lcom/melodix/music/PreviewPlayerLikeArt;->paint:Landroid/graphics/Paint;

    const/high16 v9, 0x40a00000    # 5.0f

    const/high16 v10, 0x41400000    # 12.0f

    const/high16 v11, 0x41980000    # 19.0f

    move-object v8, p1

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 35
    :goto_1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 36
    return-void
.end method

.method public getOpacity()I
    .locals 1

    .line 39
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .locals 0

    .line 37
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 38
    return-void
.end method
