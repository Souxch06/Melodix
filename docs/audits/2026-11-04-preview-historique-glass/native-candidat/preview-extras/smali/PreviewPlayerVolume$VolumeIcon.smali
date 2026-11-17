.class final Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;
.super Landroid/graphics/drawable/Drawable;
.source "PreviewPlayerVolume.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/melodix/music/PreviewPlayerVolume;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "VolumeIcon"
.end annotation


# instance fields
.field private final color:I

.field private final kind:I

.field private final paint:Landroid/graphics/Paint;

.field private final size:I


# direct methods
.method constructor <init>(III)V
    .locals 2

    .prologue
    .line 95
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 94
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;->paint:Landroid/graphics/Paint;

    .line 95
    iput p1, p0, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;->size:I

    iput p2, p0, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;->kind:I

    iput p3, p0, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;->color:I

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 13

    .prologue
    const/high16 v6, 0x40e00000    # 7.0f

    const/high16 v1, 0x40800000    # 4.0f

    const/high16 v4, 0x41700000    # 15.0f

    const/high16 v2, 0x41100000    # 9.0f

    const/high16 v3, 0x41a00000    # 20.0f

    .line 99
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    iget v0, v0, Landroid/graphics/Rect;->left:I

    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;->getBounds()Landroid/graphics/Rect;

    move-result-object v5

    iget v5, v5, Landroid/graphics/Rect;->top:I

    int-to-float v5, v5

    invoke-virtual {p1, v0, v5}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v0, v0

    const/high16 v5, 0x41c00000    # 24.0f

    div-float/2addr v0, v5

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;->getBounds()Landroid/graphics/Rect;

    move-result-object v5

    invoke-virtual {v5}, Landroid/graphics/Rect;->height()I

    move-result v5

    int-to-float v5, v5

    const/high16 v7, 0x41c00000    # 24.0f

    div-float/2addr v5, v7

    invoke-virtual {p1, v0, v5}, Landroid/graphics/Canvas;->scale(FF)V

    .line 100
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;->paint:Landroid/graphics/Paint;

    iget v5, p0, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;->color:I

    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;->paint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;->paint:Landroid/graphics/Paint;

    const v5, 0x3fe66666    # 1.8f

    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;->paint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;->paint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 101
    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;->kind:I

    const/4 v5, 0x2

    if-ne v0, v5, :cond_0

    .line 102
    const/high16 v5, -0x3d7e0000    # -65.0f

    const/high16 v6, 0x43870000    # 270.0f

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    move v2, v1

    move v4, v3

    invoke-virtual/range {v0 .. v8}, Landroid/graphics/Canvas;->drawArc(FFFFFFZLandroid/graphics/Paint;)V

    const/high16 v1, 0x418c0000    # 17.5f

    const v2, 0x40733333    # 3.8f

    const v4, 0x40866666    # 4.2f

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const v4, 0x40866666    # 4.2f

    const v5, 0x419ccccd    # 19.6f

    const v6, 0x40d9999a    # 6.8f

    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;->paint:Landroid/graphics/Paint;

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 108
    :goto_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 109
    return-void

    .line 104
    :cond_0
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    const/high16 v5, 0x40400000    # 3.0f

    invoke-virtual {v0, v5, v2}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v0, v6, v2}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v5, 0x41400000    # 12.0f

    const/high16 v7, 0x40a00000    # 5.0f

    invoke-virtual {v0, v5, v7}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v5, 0x41400000    # 12.0f

    const/high16 v7, 0x41980000    # 19.0f

    invoke-virtual {v0, v5, v7}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v0, v6, v4}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v5, 0x40400000    # 3.0f

    invoke-virtual {v0, v5, v4}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 105
    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;->kind:I

    if-nez v0, :cond_1

    const/high16 v1, 0x41800000    # 16.0f

    const/high16 v3, 0x41a80000    # 21.0f

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v1, 0x41a80000    # 21.0f

    const/high16 v3, 0x41800000    # 16.0f

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_0

    .line 106
    :cond_1
    const/high16 v5, 0x41300000    # 11.0f

    const/high16 v8, 0x41880000    # 17.0f

    const/high16 v9, -0x3da40000    # -55.0f

    const/high16 v10, 0x42dc0000    # 110.0f

    const/4 v11, 0x0

    iget-object v12, p0, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;->paint:Landroid/graphics/Paint;

    move-object v4, p1

    move v7, v3

    invoke-virtual/range {v4 .. v12}, Landroid/graphics/Canvas;->drawArc(FFFFFFZLandroid/graphics/Paint;)V

    const/high16 v5, 0x41300000    # 11.0f

    const/high16 v7, 0x41c00000    # 24.0f

    const/high16 v9, -0x3db80000    # -50.0f

    const/high16 v10, 0x42c80000    # 100.0f

    const/4 v11, 0x0

    iget-object v12, p0, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;->paint:Landroid/graphics/Paint;

    move-object v4, p1

    move v6, v1

    move v8, v3

    invoke-virtual/range {v4 .. v12}, Landroid/graphics/Canvas;->drawArc(FFFFFFZLandroid/graphics/Paint;)V

    goto :goto_0
.end method

.method public getIntrinsicHeight()I
    .locals 1

    .prologue
    .line 97
    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;->size:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .locals 1

    .prologue
    .line 96
    iget v0, p0, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;->size:I

    return v0
.end method

.method public getOpacity()I
    .locals 1

    .prologue
    .line 112
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;->invalidateSelf()V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1

    .prologue
    .line 111
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerVolume$VolumeIcon;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    return-void
.end method
