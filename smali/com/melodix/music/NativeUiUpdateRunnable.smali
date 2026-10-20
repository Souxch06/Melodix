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
    .locals 3

    iget-object v0, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->activity:Lcom/melodix/music/MainActivity;
    iget v1, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->action:I
    if-eqz v1, :show_native_shell
    const/4 v2, 0x2
    if-ne v1, v2, :apply_data

    iget-object v1, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->screen:Ljava/lang/String;
    const-string v2, "library"
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :set_native_route
    const/4 v2, 0x0
    invoke-virtual {v0, v2}, Lcom/melodix/music/MainActivity;->onNativeLibraryClick(Landroid/view/View;)V
    return-void

    :set_native_route
    invoke-virtual {v0, v1}, Lcom/melodix/music/MainActivity;->setNativeScreen(Ljava/lang/String;)V
    return-void

    :show_native_shell
    invoke-virtual {v0}, Lcom/melodix/music/MainActivity;->showNativeUi()V
    return-void

    :apply_data
    iget-object v1, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->screen:Ljava/lang/String;
    iget-object v2, p0, Lcom/melodix/music/NativeUiUpdateRunnable;->data:Ljava/lang/String;
    invoke-virtual {v0, v1, v2}, Lcom/melodix/music/MainActivity;->applyNativeUiData(Ljava/lang/String;Ljava/lang/String;)V
    return-void
.end method
