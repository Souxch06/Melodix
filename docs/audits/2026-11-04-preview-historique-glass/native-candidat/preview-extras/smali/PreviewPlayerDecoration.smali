.class public final Lcom/melodix/music/PreviewPlayerDecoration;
.super Landroid/graphics/drawable/Drawable;
.source "PreviewPlayerDecoration.java"


# instance fields
.field private final control:Landroid/view/View;

.field private final paint:Landroid/graphics/Paint;

.field private final repeat:Z


# direct methods
.method public constructor <init>(Landroid/view/View;Z)V
    .locals 2

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 15
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerDecoration;->paint:Landroid/graphics/Paint;

    .line 16
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerDecoration;->control:Landroid/view/View;

    iput-boolean p2, p0, Lcom/melodix/music/PreviewPlayerDecoration;->repeat:Z

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 14

    .prologue
    const/high16 v5, 0x41100000    # 9.0f

    const/high16 v11, 0x41700000    # 15.0f

    const/high16 v8, 0x40000000    # 2.0f

    const/high16 v7, 0x41a00000    # 20.0f

    const/high16 v1, 0x40800000    # 4.0f

    .line 18
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerDecoration;->control:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v0

    .line 19
    if-nez v0, :cond_1

    const-string v0, ""

    .line 20
    :goto_0
    const-string v2, "R\u00e9p\u00e9ter le titre"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    .line 21
    if-nez v13, :cond_2

    const-string v2, "R\u00e9p\u00e9ter la liste"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "Lecture al\u00e9atoire activ\u00e9e"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const/4 v0, 0x0

    .line 22
    :goto_1
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerDecoration;->paint:Landroid/graphics/Paint;

    if-eqz v0, :cond_3

    const v2, -0x1fb762

    :goto_2
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 23
    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerDecoration;->control:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    .line 24
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerDecoration;->getBounds()Landroid/graphics/Rect;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v3, v8

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerDecoration;->getBounds()Landroid/graphics/Rect;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v4, v8

    .line 25
    iget-boolean v6, p0, Lcom/melodix/music/PreviewPlayerDecoration;->repeat:Z

    if-nez v6, :cond_4

    .line 26
    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerDecoration;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    mul-float v0, v11, v2

    add-float/2addr v0, v4

    mul-float v1, v8, v2

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerDecoration;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v0, v1, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 38
    :cond_0
    :goto_3
    return-void

    .line 19
    :cond_1
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 21
    :cond_2
    const/4 v0, 0x1

    goto :goto_1

    .line 22
    :cond_3
    const v2, -0x4c363f16

    goto :goto_2

    .line 29
    :cond_4
    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerDecoration;->paint:Landroid/graphics/Paint;

    sget-object v6, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    mul-float v0, v11, v2

    add-float/2addr v0, v4

    mul-float v6, v8, v2

    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerDecoration;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v0, v6, v8}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 30
    :cond_5
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    const/high16 v0, 0x41400000    # 12.0f

    mul-float/2addr v0, v2

    sub-float v0, v3, v0

    const/high16 v3, 0x41400000    # 12.0f

    mul-float/2addr v3, v2

    sub-float v3, v4, v3

    invoke-virtual {p1, v0, v3}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {p1, v2, v2}, Landroid/graphics/Canvas;->scale(FF)V

    .line 31
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerDecoration;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerDecoration;->paint:Landroid/graphics/Paint;

    const v2, 0x3fe66666    # 1.8f

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerDecoration;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerDecoration;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 32
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 33
    invoke-virtual {v0, v1, v5}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v2, 0x40b00000    # 5.5f

    const/high16 v3, 0x40c00000    # 6.0f

    move v4, v1

    move v6, v1

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    const/high16 v2, 0x41980000    # 19.0f

    invoke-virtual {v0, v2, v1}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v2, 0x41800000    # 16.0f

    const/high16 v3, 0x3fc00000    # 1.5f

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v2, 0x41980000    # 19.0f

    invoke-virtual {v0, v2, v1}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v1, 0x41800000    # 16.0f

    const/high16 v2, 0x40d00000    # 6.5f

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 34
    invoke-virtual {v0, v7, v11}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v8, 0x41940000    # 18.5f

    const/high16 v9, 0x41900000    # 18.0f

    move-object v6, v0

    move v10, v7

    move v12, v7

    invoke-virtual/range {v6 .. v12}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    const/high16 v1, 0x40a00000    # 5.0f

    invoke-virtual {v0, v1, v7}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v1, 0x41000000    # 8.0f

    const/high16 v2, 0x418c0000    # 17.5f

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v1, 0x40a00000    # 5.0f

    invoke-virtual {v0, v1, v7}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v1, 0x41000000    # 8.0f

    const/high16 v2, 0x41b40000    # 22.5f

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 35
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerDecoration;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 36
    if-eqz v13, :cond_6

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerDecoration;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerDecoration;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerDecoration;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerDecoration;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->setTextSize(F)V

    const-string v0, "1"

    const/high16 v1, 0x41400000    # 12.0f

    const v2, 0x41733333    # 15.2f

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerDecoration;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 37
    :cond_6
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    goto/16 :goto_3
.end method

.method public getOpacity()I
    .locals 1

    .prologue
    .line 41
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .locals 0

    .prologue
    .line 39
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .prologue
    .line 40
    return-void
.end method
