.class Lcom/melodix/music/PreviewPlayerControllerPlayAll$1;
.super Landroid/view/View;
.source "PreviewPlayerControllerPlayAll.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerControllerPlayAll;->add(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final p:Landroid/graphics/Paint;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 22
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 23
    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$1;->p:Landroid/graphics/Paint;

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 6

    .line 25
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$1;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$1;->getHeight()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$1;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v2, v1

    .line 26
    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$1;->p:Landroid/graphics/Paint;

    const v3, -0xe128a0

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$1;->p:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, v0, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 27
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    .line 28
    const v3, 0x3e8f5c29    # 0.28f

    mul-float/2addr v3, v0

    sub-float v3, v0, v3

    const v4, 0x3ec28f5c    # 0.38f

    mul-float/2addr v4, v0

    sub-float v5, v2, v4

    invoke-virtual {v1, v3, v5}, Landroid/graphics/Path;->moveTo(FF)V

    const v5, 0x3ed70a3d    # 0.42f

    mul-float/2addr v5, v0

    add-float/2addr v0, v5

    invoke-virtual {v1, v0, v2}, Landroid/graphics/Path;->lineTo(FF)V

    add-float/2addr v2, v4

    invoke-virtual {v1, v3, v2}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v1}, Landroid/graphics/Path;->close()V

    .line 29
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$1;->p:Landroid/graphics/Paint;

    const/high16 v2, -0x1000000

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$1;->p:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 30
    return-void
.end method
