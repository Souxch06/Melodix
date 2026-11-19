.class Lcom/melodix/music/PreviewUiRestyle$2;
.super Landroid/graphics/drawable/Drawable;
.source "PreviewUiRestyle.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewUiRestyle;->likedTile(Landroid/widget/ImageView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final p:Landroid/graphics/Paint;


# direct methods
.method constructor <init>()V
    .locals 2

    .line 67
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 68
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/melodix/music/PreviewUiRestyle$2;->p:Landroid/graphics/Paint;

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 11

    .line 70
    invoke-virtual {p0}, Lcom/melodix/music/PreviewUiRestyle$2;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    int-to-float v1, v1

    const v2, 0x3ecccccd    # 0.4f

    mul-float/2addr v1, v2

    const/high16 v2, 0x41c00000    # 24.0f

    div-float/2addr v1, v2

    .line 71
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v2

    const/high16 v3, 0x41400000    # 12.0f

    mul-float v4, v1, v3

    sub-float/2addr v2, v4

    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v0

    sub-float/2addr v0, v4

    invoke-virtual {p1, v2, v0}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {p1, v1, v1}, Landroid/graphics/Canvas;->scale(FF)V

    .line 72
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    const/high16 v1, 0x41a80000    # 21.0f

    invoke-virtual {v0, v3, v1}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v9, 0x40400000    # 3.0f

    const v10, 0x41166666    # 9.4f

    const/high16 v5, 0x41280000    # 10.5f

    const v6, 0x419d999a    # 19.7f

    const/high16 v7, 0x40400000    # 3.0f

    const v8, 0x416b3333    # 14.7f

    move-object v4, v0

    invoke-virtual/range {v4 .. v10}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 73
    const/high16 v9, 0x41400000    # 12.0f

    const/high16 v10, 0x40e00000    # 7.0f

    const/high16 v5, 0x40400000    # 3.0f

    const/high16 v6, 0x40900000    # 4.5f

    const v7, 0x4109999a    # 8.6f

    const v8, 0x402ccccd    # 2.7f

    invoke-virtual/range {v4 .. v10}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    const/high16 v9, 0x41a80000    # 21.0f

    const v10, 0x41166666    # 9.4f

    const v5, 0x41766666    # 15.4f

    const v6, 0x402ccccd    # 2.7f

    const/high16 v7, 0x41a80000    # 21.0f

    const/high16 v8, 0x40900000    # 4.5f

    invoke-virtual/range {v4 .. v10}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    const/high16 v9, 0x41400000    # 12.0f

    const/high16 v10, 0x41a80000    # 21.0f

    const/high16 v5, 0x41a80000    # 21.0f

    const v6, 0x416b3333    # 14.7f

    const/high16 v7, 0x41580000    # 13.5f

    const v8, 0x419d999a    # 19.7f

    invoke-virtual/range {v4 .. v10}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 74
    iget-object v1, p0, Lcom/melodix/music/PreviewUiRestyle$2;->p:Landroid/graphics/Paint;

    const v2, -0xa0a09

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, p0, Lcom/melodix/music/PreviewUiRestyle$2;->p:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 75
    return-void
.end method

.method public getOpacity()I
    .locals 1

    .line 78
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .locals 0

    .line 76
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 77
    return-void
.end method
