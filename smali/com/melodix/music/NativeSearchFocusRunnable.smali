.class final Lcom/melodix/music/NativeSearchFocusRunnable;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;

.field private final activity:Lcom/melodix/music/MainActivity;
.field private final target:Landroid/view/View;

.method public constructor <init>(Lcom/melodix/music/MainActivity;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/melodix/music/NativeSearchFocusRunnable;->activity:Lcom/melodix/music/MainActivity;
    iput-object p2, p0, Lcom/melodix/music/NativeSearchFocusRunnable;->target:Landroid/view/View;
    return-void
.end method

.method public final run()V
    .locals 3

    const-string v1, "MDXTRACE"
    const-string v2, "ime-focus-runnable"
    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    iget-object v0, p0, Lcom/melodix/music/NativeSearchFocusRunnable;->target:Landroid/view/View;
    if-eqz v0, :focus_done
    invoke-virtual {v0}, Landroid/view/View;->isShown()Z
    move-result v1
    if-eqz v1, :focus_done
    # The keyboard only belongs to the search screen: a runnable that lands
    # after a screen change must never raise it over another screen.
    iget-object v1, p0, Lcom/melodix/music/NativeSearchFocusRunnable;->activity:Lcom/melodix/music/MainActivity;
    if-eqz v1, :focus_done
    iget-object v1, v1, Lcom/melodix/music/MainActivity;->nativeCurrentScreen:Ljava/lang/String;
    if-eqz v1, :focus_done
    const-string v2, "search"
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :focus_done
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z
    iget-object v1, p0, Lcom/melodix/music/NativeSearchFocusRunnable;->activity:Lcom/melodix/music/MainActivity;
    if-eqz v1, :focus_done
    const-string v2, "input_method"
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroid/view/inputmethod/InputMethodManager;
    if-eqz v1, :focus_done
    const/4 v2, 0x1
    invoke-virtual {v1, v0, v2}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :focus_done
    return-void

    :catch_0
    move-exception v0
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->record(Ljava/lang/Throwable;)V
    return-void
.end method
