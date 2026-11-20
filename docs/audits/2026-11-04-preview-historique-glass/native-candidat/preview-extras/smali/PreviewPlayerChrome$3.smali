.class Lcom/melodix/music/PreviewPlayerChrome$3;
.super Ljava/lang/Object;
.source "PreviewPlayerChrome.java"

# interfaces
.implements Landroid/view/PixelCopy$OnPixelCopyFinishedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerChrome;->captureBeforeExpand(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$real:Landroid/graphics/Bitmap;

.field final synthetic val$target:Lcom/melodix/music/PreviewPlayerChrome;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerChrome;Landroid/graphics/Bitmap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 126
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->val$target:Lcom/melodix/music/PreviewPlayerChrome;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->val$real:Landroid/graphics/Bitmap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPixelCopyFinished(I)V
    .locals 1

    .line 127
    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->val$target:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerChrome;->access$1200(Lcom/melodix/music/PreviewPlayerChrome;)Landroid/graphics/Bitmap;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->val$target:Lcom/melodix/music/PreviewPlayerChrome;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->val$real:Landroid/graphics/Bitmap;

    invoke-static {p1, v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$1300(Lcom/melodix/music/PreviewPlayerChrome;Landroid/graphics/Bitmap;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->val$real:Landroid/graphics/Bitmap;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    :goto_0
    return-void
.end method
