.class final Lcom/melodix/music/NativeUiUpdateRunnable;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

.field private final activity:Lcom/melodix/music/MainActivity;
.field private final screen:Ljava/lang/String;
.field private final data:Ljava/lang/String;
.field private final action:I

.method public constructor <init>(Lcom/melodix/music/MainActivity;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->activity:Lcom/melodix/music/MainActivity;
    iput-object p2, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->screen:Ljava/lang/String;
    iput-object p3, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->data:Ljava/lang/String;
    iput p4, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->action:I
    return-void
.end method

.method public final run()V
    .locals 5

    :try_start_0
    iget-object v0, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->activity:Lcom/melodix/music/MainActivity;
    iget v1, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->action:I

    if-eqz v1, :not_ready
    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->showNativeUi()V
    return-void

    :not_ready
    const/4 v2, 0x1
    if-ne v1, v2, :not_data
    iget-object v1, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->screen:Ljava/lang/String;
    iget-object v2, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->data:Ljava/lang/String;

    if-eqz v1, :apply
    if-eqz v2, :apply

    const-string v3, "list-text"
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :try_home
    invoke-virtual {v0, v2}, Lcom/melodix/music/MainActivity;->applyNativeListText(Ljava/lang/String;)V
    goto :apply

    :try_home
    const-string v3, "home"
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :apply
    invoke-static {v2}, Lcom/melodix/music/NativeRowList;->titlesFromJson(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    if-eqz v3, :apply
    invoke-virtual {v0, v3}, Lcom/melodix/music/MainActivity;->applyNativeListText(Ljava/lang/String;)V

    :apply
    invoke-virtual {v0, v1, v2}, Lcom/melodix/music/MainActivity;->applyNativeUiData(Ljava/lang/String;Ljava/lang/String;)V
    return-void

    :not_data
    iget-object v1, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->screen:Ljava/lang/String;
    invoke-virtual {v0, v1}, Lcom/melodix/music/MainActivity;->setNativeScreen(Ljava/lang/String;)V
    return-void
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->record(Ljava/lang/Throwable;)V
    return-void
.end method
