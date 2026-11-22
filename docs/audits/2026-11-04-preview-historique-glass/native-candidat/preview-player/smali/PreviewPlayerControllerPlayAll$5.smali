.class Lcom/melodix/music/PreviewPlayerControllerPlayAll$5;
.super Landroid/view/View;
.source "PreviewPlayerControllerPlayAll.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerControllerPlayAll;->addMenus(Landroid/app/Activity;Landroid/view/View;Lorg/json/JSONArray;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final p:Landroid/graphics/Paint;

.field final synthetic val$d:F


# direct methods
.method constructor <init>(Landroid/content/Context;F)V
    .locals 0

    .line 114
    iput p2, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$5;->val$d:F

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 115
    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$5;->p:Landroid/graphics/Paint;

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 6

    .line 116
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$5;->p:Landroid/graphics/Paint;

    const v1, -0x4c4c4d

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$5;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    invoke-virtual {p0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$5;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v2, v1

    .line 117
    const/4 v1, -0x1

    :goto_0
    const/4 v3, 0x1

    if-gt v1, v3, :cond_0

    mul-int/lit8 v3, v1, 0x6

    int-to-float v3, v3

    iget v4, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$5;->val$d:F

    mul-float/2addr v3, v4

    add-float/2addr v3, v2

    const v4, 0x3fe66666    # 1.8f

    iget v5, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$5;->val$d:F

    mul-float/2addr v5, v4

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$5;->p:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v3, v5, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
