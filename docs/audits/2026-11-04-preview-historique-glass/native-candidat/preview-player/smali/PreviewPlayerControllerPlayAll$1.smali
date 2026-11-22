.class Lcom/melodix/music/PreviewPlayerControllerPlayAll$1;
.super Ljava/lang/Object;
.source "PreviewPlayerControllerPlayAll.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerControllerPlayAll;->add(Landroid/app/Activity;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$root:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 36
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$1;->val$root:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 38
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0xbb8

    add-long/2addr v0, v2

    sput-wide v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->loadingUntil:J

    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    .line 39
    new-instance v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$1$1;

    invoke-direct {v0, p0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll$1$1;-><init>(Lcom/melodix/music/PreviewPlayerControllerPlayAll$1;Landroid/view/View;)V

    const-wide/16 v1, 0xbea

    invoke-virtual {p1, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 40
    sget-boolean p1, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->shuffleOn:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$1;->val$root:Landroid/view/View;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->random(Landroid/view/View;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$1;->val$root:Landroid/view/View;

    const-string v0, "1"

    invoke-static {p1, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->tap(Landroid/view/View;Ljava/lang/String;)V

    .line 41
    :goto_0
    return-void
.end method
