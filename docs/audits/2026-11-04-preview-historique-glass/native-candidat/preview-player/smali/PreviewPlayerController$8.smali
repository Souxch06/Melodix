.class Lcom/melodix/music/PreviewPlayerController$8;
.super Ljava/lang/Object;
.source "PreviewPlayerController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/melodix/music/PreviewPlayerController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 874
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 875
    const-wide/16 v0, -0x1

    sput-wide v0, Lcom/melodix/music/PreviewPlayerController;->sleepAt:J

    sget-object v0, Lcom/melodix/music/PreviewPlayerController;->live:Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move-object v0, v1

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/melodix/music/PreviewPlayerController;->live:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/melodix/music/PreviewPlayerController;

    :goto_0
    if-nez v0, :cond_1

    goto :goto_1

    :cond_1
    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerController;->access$1800(Lcom/melodix/music/PreviewPlayerController;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Landroid/app/Activity;

    .line 876
    :goto_1
    if-eqz v1, :cond_2

    sget-boolean v0, Lcom/melodix/music/PreviewPlayerController;->playingNow:Z

    if-eqz v0, :cond_2

    invoke-static {v1}, Lcom/melodix/music/PreviewPlayerController;->togglePlayback(Landroid/app/Activity;)V

    :cond_2
    return-void
.end method
