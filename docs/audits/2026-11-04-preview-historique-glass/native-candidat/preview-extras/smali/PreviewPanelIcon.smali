.class public final Lcom/melodix/music/PreviewPanelIcon;
.super Landroid/graphics/drawable/Drawable;
.source "PreviewPanelIcon.java"


# static fields
.field public static final CLOSE:I = 0x3

.field public static final DEVICES:I = 0x6

.field public static final LYRICS:I = 0x5

.field public static final MUTED:I = 0x0

.field public static final QUEUE:I = 0x4

.field public static final REFRESH:I = 0x2

.field public static final SPEAKER:I = 0x1


# instance fields
.field private alpha:I

.field private final color:I

.field private final kind:I

.field private final paint:Landroid/graphics/Paint;

.field private final size:I


# direct methods
.method private constructor <init>(III)V
    .locals 2

    .prologue
    .line 21
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 19
    const/16 v0, 0xff

    iput v0, p0, Lcom/melodix/music/PreviewPanelIcon;->alpha:I

    .line 20
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/melodix/music/PreviewPanelIcon;->paint:Landroid/graphics/Paint;

    .line 21
    iput p1, p0, Lcom/melodix/music/PreviewPanelIcon;->size:I

    iput p2, p0, Lcom/melodix/music/PreviewPanelIcon;->kind:I

    iput p3, p0, Lcom/melodix/music/PreviewPanelIcon;->color:I

    return-void
.end method

.method public static label(Landroid/content/Context;Ljava/lang/String;II)Ljava/lang/CharSequence;
    .locals 6

    .prologue
    .line 49
    const/16 v4, 0x13

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    invoke-static/range {v0 .. v5}, Lcom/melodix/music/PreviewPanelIcon;->text(Landroid/content/Context;Ljava/lang/String;IIIZ)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method private static text(Landroid/content/Context;Ljava/lang/String;IIIZ)Ljava/lang/CharSequence;
    .locals 7

    .prologue
    const/4 v1, 0x1

    const/4 v6, 0x0

    .line 44
    int-to-float v0, p4

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v0, v2

    const/high16 v2, 0x3f000000    # 0.5f

    add-float/2addr v0, v2

    float-to-int v0, v0

    .line 45
    new-instance v2, Lcom/melodix/music/PreviewPanelIcon;

    invoke-direct {v2, v0, p2, p3}, Lcom/melodix/music/PreviewPanelIcon;-><init>(III)V

    invoke-virtual {v2, v6, v6, v0, v0}, Lcom/melodix/music/PreviewPanelIcon;->setBounds(IIII)V

    .line 46
    new-instance v3, Landroid/text/SpannableString;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v0, "\ufffc"

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz p5, :cond_0

    const-string v0, "\n"

    :goto_0
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 47
    new-instance v4, Landroid/text/style/ImageSpan;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1d

    if-lt v0, v5, :cond_1

    const/4 v0, 0x2

    :goto_1
    invoke-direct {v4, v2, v0}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;I)V

    const/16 v0, 0x21

    invoke-virtual {v3, v4, v6, v1, v0}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    return-object v3

    .line 46
    :cond_0
    const-string v0, "  "

    goto :goto_0

    :cond_1
    move v0, v1

    .line 47
    goto :goto_1
.end method

.method public static tile(Landroid/content/Context;Ljava/lang/String;II)Ljava/lang/CharSequence;
    .locals 6

    .prologue
    .line 50
    const/16 v4, 0x19

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    invoke-static/range {v0 .. v5}, Lcom/melodix/music/PreviewPanelIcon;->text(Landroid/content/Context;Ljava/lang/String;IIIZ)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 9

    .prologue
    .line 25
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPanelIcon;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    iget v0, v0, Landroid/graphics/Rect;->left:I

    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPanelIcon;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    iget v1, v1, Landroid/graphics/Rect;->top:I

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPanelIcon;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x41c00000    # 24.0f

    div-float/2addr v0, v1

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPanelIcon;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x41c00000    # 24.0f

    div-float/2addr v1, v2

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->scale(FF)V

    .line 26
    iget-object v0, p0, Lcom/melodix/music/PreviewPanelIcon;->paint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/melodix/music/PreviewPanelIcon;->color:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPanelIcon;->paint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/melodix/music/PreviewPanelIcon;->alpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPanelIcon;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPanelIcon;->paint:Landroid/graphics/Paint;

    const v1, 0x3fe66666    # 1.8f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPanelIcon;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPanelIcon;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 27
    new-instance v6, Landroid/graphics/Path;

    invoke-direct {v6}, Landroid/graphics/Path;-><init>()V

    .line 28
    iget v0, p0, Lcom/melodix/music/PreviewPanelIcon;->kind:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/melodix/music/PreviewPanelIcon;->kind:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_3

    .line 29
    :cond_0
    const/high16 v0, 0x40600000    # 3.5f

    const/high16 v1, 0x41100000    # 9.0f

    invoke-virtual {v6, v0, v1}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v0, 0x40f00000    # 7.5f

    const/high16 v1, 0x41100000    # 9.0f

    invoke-virtual {v6, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v0, 0x41480000    # 12.5f

    const/high16 v1, 0x40b00000    # 5.5f

    invoke-virtual {v6, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v0, 0x41480000    # 12.5f

    const/high16 v1, 0x41940000    # 18.5f

    invoke-virtual {v6, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v0, 0x40f00000    # 7.5f

    const/high16 v1, 0x41700000    # 15.0f

    invoke-virtual {v6, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v0, 0x40600000    # 3.5f

    const/high16 v1, 0x41700000    # 15.0f

    invoke-virtual {v6, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v6}, Landroid/graphics/Path;->close()V

    iget-object v0, p0, Lcom/melodix/music/PreviewPanelIcon;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v6, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 30
    iget v0, p0, Lcom/melodix/music/PreviewPanelIcon;->kind:I

    if-nez v0, :cond_2

    const/high16 v1, 0x41800000    # 16.0f

    const/high16 v2, 0x41200000    # 10.0f

    const/high16 v3, 0x41a00000    # 20.0f

    const/high16 v4, 0x41600000    # 14.0f

    iget-object v5, p0, Lcom/melodix/music/PreviewPanelIcon;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v1, 0x41a00000    # 20.0f

    const/high16 v2, 0x41200000    # 10.0f

    const/high16 v3, 0x41800000    # 16.0f

    const/high16 v4, 0x41600000    # 14.0f

    iget-object v5, p0, Lcom/melodix/music/PreviewPanelIcon;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 38
    :cond_1
    :goto_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 39
    return-void

    .line 31
    :cond_2
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    const/high16 v1, 0x41780000    # 15.5f

    const/high16 v2, 0x41100000    # 9.0f

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v1, 0x41880000    # 17.0f

    const/high16 v2, 0x41280000    # 10.5f

    const/high16 v3, 0x41880000    # 17.0f

    const/high16 v4, 0x41580000    # 13.5f

    const/high16 v5, 0x41780000    # 15.5f

    const/high16 v6, 0x41700000    # 15.0f

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    const/high16 v1, 0x41900000    # 18.0f

    const/high16 v2, 0x40d00000    # 6.5f

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v1, 0x41a80000    # 21.0f

    const/high16 v2, 0x41180000    # 9.5f

    const/high16 v3, 0x41a80000    # 21.0f

    const/high16 v4, 0x41680000    # 14.5f

    const/high16 v5, 0x41900000    # 18.0f

    const/high16 v6, 0x418c0000    # 17.5f

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPanelIcon;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto :goto_0

    .line 32
    :cond_3
    iget v0, p0, Lcom/melodix/music/PreviewPanelIcon;->kind:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_4

    .line 33
    const/high16 v1, 0x40800000    # 4.0f

    const/high16 v2, 0x40800000    # 4.0f

    const/high16 v3, 0x41a00000    # 20.0f

    const/high16 v4, 0x41a00000    # 20.0f

    const/high16 v5, -0x3dcc0000    # -45.0f

    const/high16 v6, 0x43910000    # 290.0f

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/melodix/music/PreviewPanelIcon;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v8}, Landroid/graphics/Canvas;->drawArc(FFFFFFZLandroid/graphics/Paint;)V

    const/high16 v1, 0x419c0000    # 19.5f

    const/high16 v2, 0x40900000    # 4.5f

    const/high16 v3, 0x419c0000    # 19.5f

    const/high16 v4, 0x41080000    # 8.5f

    iget-object v5, p0, Lcom/melodix/music/PreviewPanelIcon;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v1, 0x419c0000    # 19.5f

    const/high16 v2, 0x41080000    # 8.5f

    const/high16 v3, 0x41780000    # 15.5f

    const/high16 v4, 0x41080000    # 8.5f

    iget-object v5, p0, Lcom/melodix/music/PreviewPanelIcon;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_0

    .line 34
    :cond_4
    iget v0, p0, Lcom/melodix/music/PreviewPanelIcon;->kind:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_5

    const/high16 v1, 0x40e00000    # 7.0f

    const/high16 v2, 0x40e00000    # 7.0f

    const/high16 v3, 0x41880000    # 17.0f

    const/high16 v4, 0x41880000    # 17.0f

    iget-object v5, p0, Lcom/melodix/music/PreviewPanelIcon;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v1, 0x41880000    # 17.0f

    const/high16 v2, 0x40e00000    # 7.0f

    const/high16 v3, 0x40e00000    # 7.0f

    const/high16 v4, 0x41880000    # 17.0f

    iget-object v5, p0, Lcom/melodix/music/PreviewPanelIcon;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_0

    .line 35
    :cond_5
    iget v0, p0, Lcom/melodix/music/PreviewPanelIcon;->kind:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_6

    const/high16 v1, 0x40800000    # 4.0f

    const/high16 v2, 0x40c00000    # 6.0f

    const/high16 v3, 0x41a00000    # 20.0f

    const/high16 v4, 0x40c00000    # 6.0f

    iget-object v5, p0, Lcom/melodix/music/PreviewPanelIcon;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v1, 0x40800000    # 4.0f

    const/high16 v2, 0x41300000    # 11.0f

    const/high16 v3, 0x41880000    # 17.0f

    const/high16 v4, 0x41300000    # 11.0f

    iget-object v5, p0, Lcom/melodix/music/PreviewPanelIcon;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v1, 0x40800000    # 4.0f

    const/high16 v2, 0x41800000    # 16.0f

    const/high16 v3, 0x41500000    # 13.0f

    const/high16 v4, 0x41800000    # 16.0f

    iget-object v5, p0, Lcom/melodix/music/PreviewPanelIcon;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v0, 0x41800000    # 16.0f

    const/high16 v1, 0x41700000    # 15.0f

    invoke-virtual {v6, v0, v1}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v0, 0x41a00000    # 20.0f

    const/high16 v1, 0x418c0000    # 17.5f

    invoke-virtual {v6, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v0, 0x41800000    # 16.0f

    const/high16 v1, 0x41a00000    # 20.0f

    invoke-virtual {v6, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v6}, Landroid/graphics/Path;->close()V

    iget-object v0, p0, Lcom/melodix/music/PreviewPanelIcon;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v6, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto/16 :goto_0

    .line 36
    :cond_6
    iget v0, p0, Lcom/melodix/music/PreviewPanelIcon;->kind:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_7

    const/high16 v0, 0x41600000    # 14.0f

    const/high16 v1, 0x40a00000    # 5.0f

    invoke-virtual {v6, v0, v1}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v0, 0x41980000    # 19.0f

    const/high16 v1, 0x40800000    # 4.0f

    invoke-virtual {v6, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v0, 0x41980000    # 19.0f

    const/high16 v1, 0x41700000    # 15.0f

    invoke-virtual {v6, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v0, 0x41600000    # 14.0f

    const/high16 v1, 0x40a00000    # 5.0f

    invoke-virtual {v6, v0, v1}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v0, 0x41600000    # 14.0f

    const/high16 v1, 0x41880000    # 17.0f

    invoke-virtual {v6, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPanelIcon;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v6, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    const/high16 v1, 0x41000000    # 8.0f

    const/high16 v2, 0x41700000    # 15.0f

    const/high16 v3, 0x41600000    # 14.0f

    const/high16 v4, 0x41980000    # 19.0f

    iget-object v5, p0, Lcom/melodix/music/PreviewPanelIcon;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawOval(FFFFLandroid/graphics/Paint;)V

    const/high16 v1, 0x41500000    # 13.0f

    const/high16 v2, 0x41500000    # 13.0f

    const/high16 v3, 0x41980000    # 19.0f

    const/high16 v4, 0x41880000    # 17.0f

    iget-object v5, p0, Lcom/melodix/music/PreviewPanelIcon;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawOval(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_0

    .line 37
    :cond_7
    iget v0, p0, Lcom/melodix/music/PreviewPanelIcon;->kind:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_1

    const/high16 v1, 0x40400000    # 3.0f

    const/high16 v2, 0x40a00000    # 5.0f

    const/high16 v3, 0x41800000    # 16.0f

    const/high16 v4, 0x41700000    # 15.0f

    const/high16 v5, 0x40000000    # 2.0f

    const/high16 v6, 0x40000000    # 2.0f

    iget-object v7, p0, Lcom/melodix/music/PreviewPanelIcon;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    const/high16 v1, 0x40c00000    # 6.0f

    const/high16 v2, 0x41900000    # 18.0f

    const/high16 v3, 0x41500000    # 13.0f

    const/high16 v4, 0x41900000    # 18.0f

    iget-object v5, p0, Lcom/melodix/music/PreviewPanelIcon;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v1, 0x41180000    # 9.5f

    const/high16 v2, 0x41700000    # 15.0f

    const/high16 v3, 0x41180000    # 9.5f

    const/high16 v4, 0x41900000    # 18.0f

    iget-object v5, p0, Lcom/melodix/music/PreviewPanelIcon;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    const/high16 v1, 0x41880000    # 17.0f

    const/high16 v2, 0x41100000    # 9.0f

    const/high16 v3, 0x41a80000    # 21.0f

    const/high16 v4, 0x41980000    # 19.0f

    const/high16 v5, 0x3f800000    # 1.0f

    const/high16 v6, 0x3f800000    # 1.0f

    iget-object v7, p0, Lcom/melodix/music/PreviewPanelIcon;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    goto/16 :goto_0
.end method

.method public getIntrinsicHeight()I
    .locals 1

    .prologue
    .line 23
    iget v0, p0, Lcom/melodix/music/PreviewPanelIcon;->size:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .locals 1

    .prologue
    .line 22
    iget v0, p0, Lcom/melodix/music/PreviewPanelIcon;->size:I

    return v0
.end method

.method public getOpacity()I
    .locals 1

    .prologue
    .line 42
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .locals 0

    .prologue
    .line 40
    iput p1, p0, Lcom/melodix/music/PreviewPanelIcon;->alpha:I

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPanelIcon;->invalidateSelf()V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/melodix/music/PreviewPanelIcon;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPanelIcon;->invalidateSelf()V

    return-void
.end method
