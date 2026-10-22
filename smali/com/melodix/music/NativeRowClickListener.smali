.class final Lcom/melodix/music/NativeRowClickListener;
.super Ljava/lang/Object;
.implements Landroid/view/View$OnClickListener;

.field private final activity:Lcom/melodix/music/MainActivity;
.field private final uri:Ljava/lang/String;
.field private final title:Ljava/lang/String;

.method public constructor <init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/NativeRowClickListener;->activity:Lcom/melodix/music/MainActivity;
    iput-object p2, p0, Lcom/melodix/music/NativeRowClickListener;->uri:Ljava/lang/String;
    iput-object p3, p0, Lcom/melodix/music/NativeRowClickListener;->title:Ljava/lang/String;
    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lcom/melodix/music/NativeRowClickListener;->activity:Lcom/melodix/music/MainActivity;
    iget-object v1, p0, Lcom/melodix/music/NativeRowClickListener;->uri:Ljava/lang/String;
    iget-object v2, p0, Lcom/melodix/music/NativeRowClickListener;->title:Ljava/lang/String;
    new-instance p0, Lcom/melodix/music/NativeOpenRowRunnable;
    invoke-direct {p0, v0, v1, v2}, Lcom/melodix/music/NativeOpenRowRunnable;-><init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;)V
    invoke-virtual {v0, p0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    return-void

    :catch_0
    move-exception v0
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->record(Ljava/lang/Throwable;)V
    return-void
.end method
