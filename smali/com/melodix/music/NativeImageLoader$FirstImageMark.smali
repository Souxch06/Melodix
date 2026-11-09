.class public final Lcom/melodix/music/NativeImageLoader$FirstImageMark;
.super Ljava/lang/Object;
.implements Lcom/squareup/picasso/Callback;


.field public static reported:Z
.field private view:Ljava/lang/ref/WeakReference;
.field private identity:Ljava/lang/String;
.field private started:J


# The first cover loaded into its ImageView is the moment the screen stops showing empty
# squares. Only ONE mark is emitted per measurement interval, so a shelf of 24 cards cannot
# flood the journal, and a slow image can never overwrite an earlier (better)
# measurement.
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method


.method public final onSuccess()V
    .locals 4
    iget-object v0, p0, Lcom/melodix/music/NativeImageLoader$FirstImageMark;->view:Ljava/lang/ref/WeakReference;
    if-eqz v0, :success_mark
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/widget/ImageView;
    iget-object v1, p0, Lcom/melodix/music/NativeImageLoader$FirstImageMark;->identity:Ljava/lang/String;
    invoke-static {v0, v1}, Lcom/melodix/music/NativeImageTrace;->display(Landroid/widget/ImageView;Ljava/lang/String;)V
    iget-wide v2, p0, Lcom/melodix/music/NativeImageLoader$FirstImageMark;->started:J
    const-string v0, "loaded"
    invoke-static {v1, v0, v2, v3}, Lcom/melodix/music/NativeImageTrace;->result(Ljava/lang/String;Ljava/lang/String;J)V
    :success_mark
    const/4 v0, 0x1
    invoke-static {v0}, Lcom/melodix/music/NativeSessionTrace;->image(Z)V

    sget-boolean v0, Lcom/melodix/music/NativeImageLoader$FirstImageMark;->reported:Z

    if-nez v0, :done

    const/4 v0, 0x1

    sput-boolean v0, Lcom/melodix/music/NativeImageLoader$FirstImageMark;->reported:Z

    const-string v0, "home-first-image"

    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->perfMark(Ljava/lang/String;)V

    :done
    return-void
.end method


.method public final onError(Ljava/lang/Exception;)V
    .locals 4
    invoke-static {p1}, Lcom/melodix/music/NativeImageTrace;->failure(Ljava/lang/Exception;)Ljava/lang/String;
    move-result-object v0
    iget-object v1, p0, Lcom/melodix/music/NativeImageLoader$FirstImageMark;->identity:Ljava/lang/String;
    iget-wide v2, p0, Lcom/melodix/music/NativeImageLoader$FirstImageMark;->started:J
    invoke-static {v1, v0, v2, v3}, Lcom/melodix/music/NativeImageTrace;->result(Ljava/lang/String;Ljava/lang/String;J)V

    const/4 v0, 0x0
    invoke-static {v0}, Lcom/melodix/music/NativeSessionTrace;->image(Z)V

    # A failed image is not "displayed": report nothing rather than a fake mark.
    return-void
.end method

.method public final bind(Landroid/widget/ImageView;Ljava/lang/String;)V
    .locals 2
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/melodix/music/NativeImageLoader$FirstImageMark;->view:Ljava/lang/ref/WeakReference;
    invoke-static {p2}, Lcom/melodix/music/NativeImageTrace;->identity(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    iput-object v0, p0, Lcom/melodix/music/NativeImageLoader$FirstImageMark;->identity:Ljava/lang/String;
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J
    move-result-wide v0
    iput-wide v0, p0, Lcom/melodix/music/NativeImageLoader$FirstImageMark;->started:J
    return-void
.end method
