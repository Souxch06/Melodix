.class public final Lcom/melodix/music/NativeSettingsTimeoutRunnable;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

.field private final activity:Lcom/melodix/music/MainActivity;
.field private final generation:I

.method public constructor <init>(Lcom/melodix/music/MainActivity;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/NativeSettingsTimeoutRunnable;->activity:Lcom/melodix/music/MainActivity;
    iput p2, p0, Lcom/melodix/music/NativeSettingsTimeoutRunnable;->generation:I
    return-void
.end method

.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/melodix/music/NativeSettingsTimeoutRunnable;->activity:Lcom/melodix/music/MainActivity;
    iget v1, p0, Lcom/melodix/music/NativeSettingsTimeoutRunnable;->generation:I
    invoke-virtual {v0, v1}, Lcom/melodix/music/MainActivity;->onNativeSettingsTimeout(I)V
    return-void
.end method
