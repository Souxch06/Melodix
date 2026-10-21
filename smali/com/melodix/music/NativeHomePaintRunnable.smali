.class final Lcom/melodix/music/NativeHomePaintRunnable;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

.field private final activity:Lcom/melodix/music/MainActivity;
.field private final json:Ljava/lang/String;

.method public constructor <init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/NativeHomePaintRunnable;->activity:Lcom/melodix/music/MainActivity;
    iput-object p2, p0, Lcom/melodix/music/NativeHomePaintRunnable;->json:Ljava/lang/String;
    return-void
.end method

.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/melodix/music/NativeHomePaintRunnable;->activity:Lcom/melodix/music/MainActivity;
    if-eqz v0, :done
    iget-object v1, p0, Lcom/melodix/music/NativeHomePaintRunnable;->json:Ljava/lang/String;
    if-eqz v1, :done
    const-string v2, "home"
    invoke-virtual {v0, v2, v1}, Lcom/melodix/music/MainActivity;->applyNativeUiData(Ljava/lang/String;Ljava/lang/String;)V

    :done
    return-void
.end method
