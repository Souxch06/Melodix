.class Lcom/melodix/music/PreviewUiRestyle$3;
.super Landroid/view/ViewOutlineProvider;
.source "PreviewUiRestyle.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewUiRestyle;->round(Landroid/view/View;F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewUiRestyle;

.field final synthetic val$radius:F


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewUiRestyle;F)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 108
    iput-object p1, p0, Lcom/melodix/music/PreviewUiRestyle$3;->this$0:Lcom/melodix/music/PreviewUiRestyle;

    iput p2, p0, Lcom/melodix/music/PreviewUiRestyle$3;->val$radius:F

    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 6

    .line 109
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v3

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v4

    iget v5, p0, Lcom/melodix/music/PreviewUiRestyle$3;->val$radius:F

    const/4 v1, 0x0

    const/4 v2, 0x0

    move-object v0, p2

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Outline;->setRoundRect(IIIIF)V

    return-void
.end method
