.class Lcom/melodix/music/PreviewPlayerTiles$13;
.super Landroid/widget/TextView;
.source "PreviewPlayerTiles.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles;->lyricsControls(Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/app/Dialog;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final p:Landroid/graphics/Paint;

.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerTiles;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 318
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-direct {p0, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 319
    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->p:Landroid/graphics/Paint;

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 13

    .line 321
    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles$13;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerTiles$13;->getHeight()I

    move-result v1

    int-to-float v1, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v2

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    div-float/2addr v0, v3

    div-float/2addr v1, v3

    .line 322
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->p:Landroid/graphics/Paint;

    const/4 v4, -0x1

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->p:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->p:Landroid/graphics/Paint;

    const v4, -0xeeeeec

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 323
    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$3400(Lcom/melodix/music/PreviewPlayerTiles;)Z

    move-result v3

    const v4, 0x3eb851ec    # 0.36f

    if-eqz v3, :cond_0

    const v3, 0x3e23d70a    # 0.16f

    mul-float/2addr v3, v2

    mul-float/2addr v4, v2

    const v5, 0x3e75c28f    # 0.24f

    mul-float/2addr v2, v5

    sub-float v6, v0, v2

    sub-float v11, v1, v4

    add-float v8, v6, v3

    add-float/2addr v1, v4

    iget-object v10, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->p:Landroid/graphics/Paint;

    move-object v5, p1

    move v7, v11

    move v9, v1

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    add-float v10, v0, v2

    sub-float v8, v10, v3

    iget-object v12, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->p:Landroid/graphics/Paint;

    move-object v7, p1

    move v9, v11

    move v11, v1

    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto :goto_0

    .line 324
    :cond_0
    new-instance v3, Landroid/graphics/Path;

    invoke-direct {v3}, Landroid/graphics/Path;-><init>()V

    const v5, 0x3e6147ae    # 0.22f

    mul-float/2addr v5, v2

    sub-float v5, v0, v5

    mul-float/2addr v4, v2

    sub-float v6, v1, v4

    invoke-virtual {v3, v5, v6}, Landroid/graphics/Path;->moveTo(FF)V

    const v6, 0x3ecccccd    # 0.4f

    mul-float/2addr v2, v6

    add-float/2addr v0, v2

    invoke-virtual {v3, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    add-float/2addr v1, v4

    invoke-virtual {v3, v5, v1}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v3}, Landroid/graphics/Path;->close()V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->p:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 325
    :goto_0
    return-void
.end method
