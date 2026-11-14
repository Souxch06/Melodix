.class public final Lcom/melodix/music/NativeSessionTimeout;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.field private final activity:Ljava/lang/ref/WeakReference;
.field private final started:J

.method public constructor <init>(Lcom/melodix/music/MainActivity;J)V
    .locals 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/melodix/music/NativeSessionTimeout;->activity:Ljava/lang/ref/WeakReference;
    iput-wide p2, p0, Lcom/melodix/music/NativeSessionTimeout;->started:J
    return-void
.end method

.method public final run()V
    .locals 0
    # NativeSessionGate owns the non-destructive presentation deadline.
    return-void
.end method
